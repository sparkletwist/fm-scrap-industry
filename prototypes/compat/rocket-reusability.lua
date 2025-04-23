if mods["rocket-reusability"] then
  ScrapIndustry.items["rocket-chunk"] = {scrap={"processing-unit", "low-density-structure"}, scale=ScrapIndustry.FLAVOR, failrate=0.01}
  ScrapIndustry.recipes["rocket-chunk-processing"] = {
    fake_ingredients = {
      {type="item", name="rocket-chunk", amount=1},
      {type="item", name="processing-unit", amount=1},
      {type="item", name="low-density-structure", amount=1},
    },
    failrate=0
  }
end
