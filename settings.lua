data:extend({
	{
		type = "bool-setting",
		name = "scrap-industry-plastic",
		setting_type = "startup",
		default_value = true,
		order = "a[base]-b[plastic]"
	},
	{
		type = "bool-setting",
		name = "scrap-industry-mech",
		setting_type = "startup",
		default_value = true,
		order = "a[base]-c[mech]"
	},
	{
		type = "int-setting",
		name = "scrap-industry-mech-cost",
		setting_type = "startup",
		default_value = mods["Expensive-Mode"] and 20 or 10,
		minimum_value = 1,
		order = "a[base]-c[mech]-c[cost]"
	},
	{
		type = "bool-setting",
		name = "scrap-industry-unhide-recipe-signals",
		setting_type = "startup",
		default_value = false,
		order = "c[compat]-a[signals]"
	},
	{
		type = "bool-setting",
		name = "scrap-industry-no-scrap-scrap",
		setting_type = "startup",
		default_value = false,
		order = "m[misc]-b[no-scrap-scrap]"
	},
	{
		type = "bool-setting",
		name = "scrap-industry-red-circuit-plastic",
		setting_type = "startup",
		default_value = false,
		order = "m[misc]-c[red-circuit-plastic]"
	},
	{
		type = "bool-setting",
		name = "scrap-industry-no-mercy",
		setting_type = "startup",
		default_value = false,
		order = "m[misc]-z[no-mercy]"
	}
})

if mods["space-age"] then
	data:extend({
		{
			type = "bool-setting",
			name = "scrap-industry-metallurgy",
			setting_type = "startup",
			default_value = true,
			order = "b[space-age]-a[metallurgy]"
		},
		{
			type = "bool-setting",
			name = "scrap-industry-volatile-lithium",
			setting_type = "startup",
			default_value = true,
			order = "b[space-age]-d[lithium]-b[volatile]"
		}
	})
end

if mods["Rocs-Rusting-Iron"] then
	data:extend({
		{
			type = "bool-setting",
			name = "scrap-industry-rust",
			setting_type = "startup",
			default_value = true,
			order = "c[mods]-a[rust]"
		}
	})
end
