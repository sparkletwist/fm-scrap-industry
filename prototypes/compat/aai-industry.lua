local frep = require("__fdsl__.lib.recipe")

if mods["aai-industry"] then
	-- overrides the data in prototypes.compat.base
	ScrapIndustry.products["sand"] = {priority=0.5}
	ScrapIndustry.items["stone"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
	ScrapIndustry.items["concrete"] = {scrap="sand", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=4*ScrapIndustry.CHEAP}
	ScrapIndustry.items["glass"] = {scrap="sand", scale=ScrapIndustry.UNCOMMON, failrate=0.04}
	ScrapIndustry.items["landfill"] = {scrap="sand", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.recipes["sand"] = {ignore=true}

	ScrapIndustry.items["motor"] = {scrap="iron-scrap", scale=ScrapIndustry.PRODUCT, failrate=0.02}
	ScrapIndustry.items["electric-motor"] = {scrap={"iron-scrap", "copper-scrap"}, scale=ScrapIndustry.PRODUCT, failrate=0.02}

	if settings.startup["scrap-industry-mech"].value then
		ScrapIndustry.items["motor"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.COMMON, failrate=0.02}
		ScrapIndustry.items["electric-motor"] = {scrap={"mech-scrap", "circuit-scrap"}, scale=ScrapIndustry.COMMON, failrate=0.02}
		ScrapIndustry.items["engine-unit"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}
		ScrapIndustry.items["electric-engine-unit"] = {scrap={"mech-scrap", "circuit-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}

		data:extend({
			{
				type = "recipe",
				name = "motor-from-scrap",
				localised_name = {"recipe-name.item-from-scrap", {"item-name.motor"}},
				icons = {
					{icon="__scrap-industry__/graphics/icons/mech-scrap.png", shift={-12,-12}, scale=0.4},
					{icon="__base__/graphics/icons/engine-unit.png", draw_background=true}
				},
				subgroup = "production-scrap",
				order = "d[crafting]-xa[motor]",
				enabled = false,
				allow_productivity = true,
				auto_recycle = false,
				allow_decomposition = false,
				hide_from_signal_gui = false,
				hide_from_player_crafting = true,
				energy_required = 3,
				ingredients = {
					{type="item", name="mech-scrap", amount=settings.startup["scrap-industry-mech-cost"].value},
				},
				results = {{type="item", name="motor", amount=2}}
			},
			{
				type = "recipe",
				name = "electric-motor-from-scrap",
				localised_name = {"recipe-name.item-from-scrap", {"item-name.electric-motor"}},
				icons = {
					{icon="__scrap-industry__/graphics/icons/mech-scrap.png", shift={-12,-12}, scale=0.4},
					{icon="__base__/graphics/icons/electric-engine-unit.png", draw_background=true}
				},
				subgroup = "production-scrap",
				order = "d[crafting]-xc[electric-motor]",
				enabled = false,
				allow_productivity = true,
				auto_recycle = false,
				allow_decomposition = false,
				hide_from_signal_gui = false,
				hide_from_player_crafting = true,
				energy_required = 4,
				ingredients = {
					{type="item", name="mech-scrap", amount=settings.startup["scrap-industry-mech-cost"].value},
					{type="item", name="copper-scrap", amount=math.ceil(0.5*settings.startup["scrap-industry-mech-cost"].value)},
				},
				results = {{type="item", name="electric-motor", amount=2}}
			}
		})
		if no_scrap_from_scrap then
			ScrapIndustry.recipes["motor-from-scrap"] = {ignore=true}
			ScrapIndustry.recipes["electric-motor-from-scrap"] = {ignore=true}
		else
			ScrapIndustry.recipes["motor-from-scrap"] = {self_scrap=true}
			ScrapIndustry.recipes["electric-motor-from-scrap"] = {self_scrap=true}
		end

		frep.scale_ingredient("engine-unit-from-scrap", "mech-scrap", {amount=2})
		frep.add_ingredient("engine-unit-from-scrap", {type="item", name="steel-plate", amount=1})
		frep.scale_ingredients("electric-engine-unit-from-scrap", {amount=2})
	else
		ScrapIndustry.items["engine-unit"] = {scrap={"iron-scrap", "steel-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}
		ScrapIndustry.items["electric-engine-unit"] = {scrap={"iron-scrap", "steel-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.01}
	end
end
