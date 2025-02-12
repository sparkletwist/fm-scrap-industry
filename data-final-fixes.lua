local function get_ingredient_scrap(ingredient, out)
  if ingredient.type == "item" then
    local item_metadata = ScrapIndustry.items[ingredient.name]
    if item_metadata then
      -- TODO: better assert messages here
      local amount = item_metadata.scale * (ingredient.amount or ((ingredient.amount_min + ingredient.amount_max)/2))
      out.results[item_metadata.scrap] = (out.results[item_metadata.scrap] or 0) + amount
      if item_metadata.failrate then
        out.success_penalty = (out.success_penalty or 0) + item_metadata.failrate
      end
    end
  end
end

local function can_modify_recipe(recipe)
  if not recipe.results or recipe.results == 0 then
    return false
  end

  local recipe_metadata = ScrapIndustry.recipes[recipe.name]
  if recipe_metadata and recipe_metadata.ignore then
    return false
  end

  if recipe.category then
    local category_metadata = ScrapIndustry[recipe.category]
    if category_metadata and category_metadata.ignore then
      return false
    end
  end
  
  return true
end

for _,recipe in pairs(data.raw.recipe) do
  if can_modify_recipe(recipe) then
    local out = {
      results = {},
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
  
    if out.success_penalty > 0 then
      for _,result in pairs(recipe.results) do
        result.probability = (result.probability or 1) - out.success_penalty
      end
    end

    if out.results ~= {} then
      if not recipe.main_product then
        local main_product = util.get_recipe_main_product(recipe)
        if main_product then
          recipe.main_product = main_product.name
        end
      end
      for scrap_name,scrap_amount in pairs(out.results) do
        if scrap_amount > 0 then
          table.insert(recipe.results, {type="item", name=scrap_name, amount=1, probability=math.min(1, scrap_amount)})
        end
      end
    end
  end
end
