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
    name = "scrap-industry-handcraft",
    setting_type = "startup",
    default_value = true,
    order = "m[misc]-a[handcraft]"
  },
  {
    type = "bool-setting",
    name = "scrap-industry-no-mercy",
    setting_type = "startup",
    default_value = false,
    order = "m[misc]-z[no-mercy]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-byproduct-scale",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.1,
    maximum_value = 2,
    order = "m[misc]-b[byproduct-scale]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-failrate-scale",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.1,
    maximum_value = 5,
    order = "m[misc]-c[failrate-scale]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-failrate-min",
    setting_type = "startup",
    default_value = 0.01,
    minimum_value = 0,
    maximum_value = 0.2,
    order = "m[misc]-d[failrate-min]"
  },
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
      name = "scrap-industry-lithium",
      setting_type = "startup",
      default_value = true,
      order = "b[space-age]-d[lithium]"
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
