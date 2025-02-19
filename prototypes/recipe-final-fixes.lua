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
    if recipe_metadata.ignore then
      return false
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
end

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
          table.insert(recipe.results, {type="item", name=scrap_name, amount=final_amount, probability=probability})
        end
      end
    end
  end
end
