for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  recipes["steel-plate-from-scrap"].enabled = technologies["steel-processing"].researched
  recipes["electronic-circuit-from-scrap"].enabled = technologies["electronics"].researched
  recipes["advanced-circuit-from-scrap"].enabled = technologies["advanced-circuit"].researched
  recipes["processing-unit-from-scrap"].enabled = technologies["processing-unit"].researched

  if settings.startup["scrap-industry-plastic"].value then
    recipes["plastic-bar-from-bits"].enabled = technologies["plastics"].researched
    if mods["space-age"] then
      recipes["bioplastic-from-bits"].enabled = technologies["bioflux-processing"].researched
    end
  end

  if mods["space-age"] then
    recipes["tungsten-carbide-from-scrap"].enabled = technologies["tungsten-carbide"].researched
    recipes["tungsten-plate-from-scrap"].enabled = technologies["tungsten-steel"].researched
    recipes["holmium-solution-from-scrap"].enabled = technologies["holmium-processing"].researched
    recipes["lithium-plate-from-powder"].enabled = technologies["lithium-processing"].researched
    if settings.startup["scrap-industry-metallurgy"].value then
      recipes["molten-iron-from-scrap"].enabled = technologies["foundry"].researched
      recipes["molten-copper-from-scrap"].enabled = technologies["foundry"].researched
      recipes["molten-iron-from-steel-scrap"].enabled = technologies["foundry"].researched
    end
  end

  if mods["bzlead"] then
    local needs_research = mods["alloy-smelting"]
    recipes["lead-plate-from-scrap"].enabled = not needs_research or technologies["kiln-smelting"].researched
    if mods["space-age"] and settings.startup["scrap-industry-metallurgy"].value then
      recipes["molten-lead-from-scrap"].enabled = technologies["foundry"].researched
    end
  end

  if mods["bztitanium"] then
    recipes["titanium-plate-from-scrap"].enabled = technologies["titanium-processing"].researched
  end
end
