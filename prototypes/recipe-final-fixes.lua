local ftech = require("__fdsl__.lib.technology")

local function get_ingredient_scrap(ingredient, out)
  if ingredient.type == "item" then
    local item_metadata = ScrapIndustry.items[ingredient.name]
    if item_metadata then
      -- TODO: better assert messages here
      local amount = item_metadata.scale * (ingredient.amount or ((ingredient.amount_min + ingredient.amount_max)/2))
      if type(item_metadata.scrap) == "string" then
        out.results[item_metadata.scrap] = (out.results[item_metadata.scrap] or 0) + amount
        out.total_scrap = out.total_scrap + amount
      else
        for _,scrap_name in pairs(item_metadata.scrap) do
          out.results[scrap_name] = (out.results[scrap_name] or 0) + amount
          out.total_scrap = out.total_scrap + amount
        end
      end
      if item_metadata.failrate then
        out.success_penalty = (out.success_penalty or 0) + item_metadata.failrate
      end
    end
  end
end

local function can_modify_recipe(recipe)
  if not recipe.results or #recipe.results == 0 then
    return false
  end

  local recipe_metadata = ScrapIndustry.recipes[recipe.name]
  if recipe_metadata then
    -- ignore=false forces a recipe to be modified, even if the category is ignored
    if type(recipe_metadata.ignore) == "boolean" then
      return not recipe_metadata.ignore
    end

    if recipe_metadata.self_scrap then
      return true
    end
  end

  if recipe.category then
    local category_metadata = ScrapIndustry.categories[recipe.category]
    if category_metadata and category_metadata.ignore then
      return false
    end
  end
  
  for _,result in pairs(recipe.results) do
    if result.type == "item" then
      return true
    end
  end
  return false
end

-- if a recipe has an ingredient whose recipe was modified to have a % failrate, it can't be considered as an intermediate for the hand-crafting queue
-- to resolve this, we create hidden duplicates for these recipes
local handcraft_recipes = {}
local handcraft_categories = {}
local handcraft_recipe_map = {}
if settings.startup["scrap-industry-handcraft"].value then
  for _,category in pairs(data.raw.character.character.crafting_categories) do
    handcraft_categories[category] = true
  end
end

local function should_duplicate_for_hand_crafting(recipe, recipe_metadata, out)
  if not settings.startup["scrap-industry-handcraft"].value then
    return false
  end
  if recipe.allow_as_intermediate == false then
    return false
  end
  if recipe_metadata and type(recipe_metadata.force_handcraft) == "boolean" then
    return recipe_metadata.force_handcraft
  end
  if out.success_penalty == 0 then
    return false
  end
  local category = recipe.category or "crafting"
  return handcraft_categories[category] == true
end

-- copied from recycling.lua
local function get_prototype(base_type, name)
  for type_name in pairs(defines.prototypes[base_type]) do
    local prototypes = data.raw[type_name]
    if prototypes and prototypes[name] then
      return prototypes[name]
    end
  end
end

local function get_item_localised_name(name)
  local item = get_prototype("item", name)
  if not item then return end
  if item.localised_name then
    return item.localised_name
  end
  local prototype
  local type_name = "item"
  if item.place_result then
    prototype = get_prototype("entity", item.place_result)
    type_name = "entity"
  elseif item.place_as_equipment_result then
    prototype = get_prototype("equipment", item.place_as_equipment_result)
    type_name = "equipment"
  elseif item.place_as_tile then
    -- Tiles with variations don't have a localised name
    local tile_prototype = data.raw.tile[item.place_as_tile.result]
    if tile_prototype and tile_prototype.localised_name then
      prototype = tile_prototype
      type_name = "tile"
    end
  end
  return prototype and prototype.localised_name or {type_name.."-name."..name}
end

local function duplicate_for_hand_crafting(recipe)
  local duplicate_recipe = util.table.deepcopy(recipe)
  duplicate_recipe.name = "hand-crafted-"..recipe.name
  
  if not duplicate_recipe.localised_name then
    local main_product = util.get_recipe_main_product(recipe)
    if main_product then
      duplicate_recipe.localised_name = get_item_localised_name(main_product.name)
      for _,result in pairs(duplicate_recipe.results) do
        if result.name == main_product.name then
          result.probability = nil
        end
      end
    else
      duplicate_recipe.localised_name = {"recipe-name."..recipe.name}
    end
  end
  duplicate_recipe.localised_name = {"recipe-name.hand-crafted", duplicate_recipe.localised_name}
  duplicate_recipe.category = "hand-crafting"
  duplicate_recipe.hidden = true
  table.insert(handcraft_recipes, duplicate_recipe)
  handcraft_recipe_map[recipe.name] = duplicate_recipe.name
  return duplicate_recipe
end

--------------------------------------------------------------------------------------------------
---
for _,recipe in pairs(data.raw.recipe) do
  if can_modify_recipe(recipe) then
    local out = {
      results = {},
      total_scrap = 0,
      success_penalty = 0
    }
    local recipe_metadata = ScrapIndustry.recipes[recipe.name]
    if recipe_metadata and recipe_metadata.self_scrap then
      for _,result in pairs(recipe.results) do
        get_ingredient_scrap(result, out)
      end
    else
      for _,ingredient in pairs(recipe.ingredients or {}) do
        get_ingredient_scrap(ingredient, out)
      end
    end

    if recipe_metadata and type(recipe_metadata.failrate) == "number" then
      out.success_penalty = recipe_metadata.failrate
    elseif out.total_scrap > 0 then
      local failrate_scale = 1 / (4 * out.total_scrap)
      if failrate_scale < 1 then
        out.success_penalty = math.max(math.ceil(failrate_scale * out.success_penalty * 100) / 100, 0.01)
      end
      out.success_penalty = math.max(out.success_penalty, 0.01)
    end
  
    if out.success_penalty > 0 then
      for _,result in pairs(recipe.results) do
        if result.type == "item" then
          if result.probability then
            result.probability = result.probability * out.success_penalty
          else
            result.probability = 1 - out.success_penalty
          end
        end
      end
    end

    if out.results ~= {} then
      local excluded_result = ""
      if table_size(out.results) > 3 then
        -- if there are a lot of scrap results, get rid of the least important one (biased by scrap amount)
        local lowest_priority = 1
        for scrap_name,scrap_amount in pairs(out.results) do
          local scrap_metadata = ScrapIndustry.products[scrap_name]
          local priority = (scrap_metadata and scrap_metadata.priority or 1) + scrap_amount
          if priority < lowest_priority then
            lowest_priority = priority
            excluded_result = scrap_name
          end
        end
      end
      if not recipe.main_product then
        local main_product = util.get_recipe_main_product(recipe)
        if main_product then
          recipe.main_product = main_product.name
        end
      end
      for scrap_name,scrap_amount in pairs(out.results) do
        if scrap_name ~= excluded_result and scrap_amount > 0 then
          local final_amount = math.ceil(scrap_amount / 0.5)
          local probability = math.floor(100 * scrap_amount / final_amount) / 100
          local result = {type="item", name=scrap_name, amount=final_amount, probability=probability}
          table.insert(recipe.results, result)
        end
      end
    end

    if should_duplicate_for_hand_crafting(recipe, recipe_metadata, out) then
      duplicate_for_hand_crafting(recipe)
    end
  end
end

--------------------------------------------------------------------------------------------------

if table_size(handcraft_recipes) > 0 then
  if not handcraft_categories["hand-crafting"] then
    data:extend({
      {
        type = "recipe-category",
        name = "hand-crafting"
      }
    })
    table.insert(data.raw.character.character.crafting_categories, "hand-crafting")
  end
  for _,tech in pairs(data.raw.technology) do
    for _,effect in pairs(tech.effects or {}) do
      local new_recipe = effect.type == "unlock-recipe" and handcraft_recipe_map[effect.recipe]
      if new_recipe then
        table.insert(tech.effects, {type="unlock-recipe", recipe=new_recipe, hidden=true})
      end
    end
  end
  data:extend(handcraft_recipes)
end
