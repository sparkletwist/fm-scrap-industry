for _,force in pairs(game.forces) do
	if settings.startup["scrap-industry-mech"].value then
		force.recipes["engine-unit-from-scrap"].enabled = force.technologies["engine"].researched
		force.recipes["electric-engine-unit-from-scrap"].enabled = force.technologies["electric-engine"].researched
	end
end
