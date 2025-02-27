for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if mods["Rocs-Rusting-Iron"] and technologies["sulfur-processing"].researched then
    local base_game = not mods["aai-industry"]
    recipes["rocs-rusting-iron-iron-scrap-chemical-derusting"].enabled = true
    recipes["rocs-rusting-iron-iron-plate-chemical-derusting"].enabled = true
    recipes["rocs-rusting-iron-iron-gear-wheel-chemical-derusting"].enabled = true
    recipes["rocs-rusting-iron-iron-stick-chemical-derusting"].enabled = true
    recipes[base_game and "rocs-rusting-iron-engine-unit-chemical-derusting" or "rocs-rusting-iron-motor-chemical-derusting"].enabled = true
  end
end
