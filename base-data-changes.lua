local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("steel-processing", "steel-scrap-smelting")
ftech.add_unlock("electronics", "electronic-circuit-from-scrap")
ftech.add_unlock("advanced-circuit", "advanced-circuit-from-scrap")

if mods["space-age"] then
  ftech.add_unlock("tungsten-carbide", "tungsten-carbide-from-scrap")
  ftech.add_unlock("tungsten-steel", "tungsten-plate-from-scrap")
  ftech.add_unlock("holmium-processing", "holmium-solution-from-scrap")
end

if mods["bzlead"] then
  local needs_research = mods["aai-industry"] and mods["wood-industry"] and settings.startup["wood-industry-lead"].value
  if needs_research then
    ftech.add_unlock("wood-pyrolysis", "lead-scrap-smelting")
  end
end
