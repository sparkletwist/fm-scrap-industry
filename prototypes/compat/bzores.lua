local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Tin

if mods["bztin"] then
  frep.modify_ingredient("electronic-circuit-from-scrap", "circuit-scrap", {amount=3})
  frep.modify_ingredient("electronic-circuit-from-scrap", "copper-cable", {amount=2})
  frep.scale_result("electronic-circuit-from-scrap", "electronic-circuit", {amount=2})
  frep.add_ingredient("electronic-circuit-from-scrap", {type="item", name="solder", amount=1})
  
  frep.modify_ingredient("advanced-circuit-from-scrap", "circuit-scrap", {amount=5})
  frep.modify_ingredient("advanced-circuit-from-scrap", "copper-cable", {amount=3})
  frep.modify_ingredient("advanced-circuit-from-scrap", "plastic-bar", {amount=2})
  frep.scale_result("advanced-circuit-from-scrap", "advanced-circuit", {amount=2})
  frep.add_ingredient("advanced-circuit-from-scrap", {type="item", name="solder", amount=1})
end

if mods["bzlead"] then
  ScrapIndustry.products["lead-scrap"] = {priority=0.8}
  ScrapIndustry.items["lead-plate"] = {scrap="lead-scrap", scale=ScrapIndustry.COMMON, failrate=0.02, recycle=2}
  ScrapIndustry.items["lead-expansion-bolt"] = {scrap={"lead-scrap", "iron-scrap"}, scale=ScrapIndustry.COMMON, failrate=-0.01}
  ScrapIndustry.items["lead-lithium-eutectic"] = {scrap={"lead-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.01}

  local needs_research = mods["aai-industry"] and mods["wood-industry"] and settings.startup["wood-industry-lead"].value
  if needs_research then
    ftech.add_unlock("wood-pyrolysis", "lead-plate-from-scrap")
  end
  if mods["space-age"] and settings.startup["scrap-industry-metallurgy"].value then
    ftech.add_unlock("foundry", "molten-lead-from-scrap")
  end
  
  if mods["space-age"] and settings.startup["scrap-industry-lithium"].value then
    table.insert(ScrapIndustry.items["lead-lithium-eutectic"].scrap, "lithium-dust")
  end
end

ScrapIndustry.products["titanium-scrap"] = {priority=3}
ScrapIndustry.items["titanium-plate"] = {scrap="titanium-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.01, recycle=5}
if mods["bztitanium"] then
  table.insert(ScrapIndustry.items["low-density-structure"].scrap, "titanium-scrap")
  ScrapIndustry.items["express-transport-belt"] = {scrap="titanium-scrap", scale=ScrapIndustry.UNCOMMON}
end
