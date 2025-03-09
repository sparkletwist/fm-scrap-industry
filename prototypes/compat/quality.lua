if mods["quality"] then
  ScrapIndustry.categories["recycling"] = {ignore=true}

  ScrapIndustry.items["quality-module"] = {scrap="circuit-scrap", scale=ScrapIndustry.EXPENSIVE, failrate=-0.01}
  ScrapIndustry.items["quality-module-2"] = {scrap="circuit-scrap", scale=ScrapIndustry.EPIC, failrate=-0.02}
  ScrapIndustry.items["quality-module-3"] = {scrap="circuit-scrap", scale=ScrapIndustry.LEGENDARY, failrate=-0.03}
end
