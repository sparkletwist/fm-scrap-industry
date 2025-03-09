local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("steel-processing", "steel-plate-from-scrap")
ftech.add_unlock("electronics", "electronic-circuit-from-scrap")
ftech.add_unlock("advanced-circuit", "advanced-circuit-from-scrap")

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

if mods["bztitanium"] then
  ftech.add_unlock("titanium-processing", "titanium-plate-from-scrap")
end
