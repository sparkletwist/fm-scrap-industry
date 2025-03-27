if mods["bzlead"] then
  ScrapIndustry.products["lead-scrap"] = {priority=0.8}
  ScrapIndustry.items["lead-plate"] = {scrap="lead-scrap", scale=ScrapIndustry.COMMON, failrate=0.02, recycle=2}
  ScrapIndustry.items["lead-expansion-bolt"] = {scrap={"lead-scrap", "iron-scrap"}, scale=ScrapIndustry.COMMON, failrate=-0.01}
  
  if mods["space-age"] then
    ScrapIndustry.items["lead-lithium-eutectic"] = {scrap={"lead-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.01}
    table.insert(ScrapIndustry.items["lead-lithium-eutectic"].scrap, "lithium-dust")
  end
end

if mods["bztitanium"] then
  ScrapIndustry.products["titanium-scrap"] = {priority=3}
  ScrapIndustry.items["titanium-plate"] = {scrap="titanium-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.01, recycle=5}
  ScrapIndustry.recipes["titanium-sublimation"] = {ignore=true}
  table.insert(ScrapIndustry.items["low-density-structure"].scrap, "titanium-scrap")
end
