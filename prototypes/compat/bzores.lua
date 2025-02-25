ScrapIndustry.products["lead-scrap"] = {priority=0.8}
ScrapIndustry.items["lead-plate"] = {scrap="lead-scrap", scale=0.12, failrate=0.02, recycle=2}
ScrapIndustry.items["lead-expansion-bolt"] = {scrap={"lead-scrap", "iron-scrap"}, scale=0.08, failrate=-0.01}
ScrapIndustry.items["lead-lithium-eutectic"] = {scrap={"lead-scrap"}, scale=0.24, failrate=0.01}
if mods["space-age"] and settings.startup["scrap-industry-lithium"].value then
  table.insert(ScrapIndustry.items["lead-lithium-eutectic"].scrap, "lithium-dust")
end
ScrapIndustry.products["lead-scrap"] = {priority=3}
ScrapIndustry.items["titanium-plate"] = {scrap="titanium-scrap", scale=0.24, failrate=0.01, recycle=5}
if mods["bztitanium"] then
  table.insert(ScrapIndustry.items["low-density-structure"].scrap, "titanium-scrap")
  ScrapIndustry.items["express-transport-belt"] = {scrap="titanium-scrap", scale=0.36}
end
