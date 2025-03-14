local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("steel-processing", "steel-plate-from-scrap")
ftech.add_unlock("electronics", "electronic-circuit-from-scrap")
ftech.add_unlock("advanced-circuit", "advanced-circuit-from-scrap")
ftech.add_unlock("processing-unit", "processing-unit-from-scrap")

if settings.startup["scrap-industry-plastic"].value then
  ftech.add_unlock("plastics", "plastic-bar-from-bits")
  if mods["space-age"] then
    ftech.add_unlock("bioflux-processing", "bioplastic-from-bits")
  end
end

if mods["space-age"] then
  ftech.add_unlock("tungsten-carbide", "tungsten-carbide-from-scrap")
  ftech.add_unlock("tungsten-steel", "tungsten-plate-from-scrap")
  ftech.add_unlock("holmium-processing", "holmium-solution-from-scrap")
  if settings.startup["scrap-industry-lithium"].value then
    ftech.add_unlock("lithium-processing", "lithium-dust-neutralization")
  end
  if settings.startup["scrap-industry-metallurgy"].value then
    ftech.add_unlock("foundry", "molten-iron-from-scrap")
    ftech.add_unlock("foundry", "molten-copper-from-scrap")
    ftech.add_unlock("foundry", "molten-iron-from-steel-scrap")
  end
end

if mods["bztin"] then
  frep.modify_ingredient("electronic-circuit-from-scrap", "circuit-scrap", {amount=3})
  frep.scale_ingredient("electronic-circuit-from-scrap", "copper-cable", {amount=2})
  frep.scale_result("electronic-circuit-from-scrap", "electronic-circuit", {amount=2})
  frep.add_ingredient("electronic-circuit-from-scrap", {type="item", name="solder", amount=1})
  
  frep.modify_ingredient("advanced-circuit-from-scrap", "circuit-scrap", {amount=5})
  frep.modify_ingredient("advanced-circuit-from-scrap", "copper-cable", {amount=3})
  frep.modify_ingredient("advanced-circuit-from-scrap", "plastic-bar", {amount=2})
  frep.scale_result("advanced-circuit-from-scrap", "advanced-circuit", {amount=2})
  frep.add_ingredient("advanced-circuit-from-scrap", {type="item", name="solder", amount=1})
end

if mods["bzlead"] then
  local needs_research = mods["aai-industry"] and mods["wood-industry"] and settings.startup["wood-industry-lead"].value
  if needs_research then
    ftech.add_unlock("wood-pyrolysis", "lead-plate-from-scrap")
  end
  if mods["space-age"] and settings.startup["scrap-industry-metallurgy"].value then
    ftech.add_unlock("foundry", "molten-lead-from-scrap")
  end
end

if mods["bztitanium"] then
  ftech.add_unlock("titanium-processing", "titanium-plate-from-scrap")
end
