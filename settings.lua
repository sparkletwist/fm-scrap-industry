data:extend({
  {
    type = "bool-setting",
    name = "scrap-industry-plastic",
    setting_type = "startup",
    default_value = true,
    order = "a[base]-a[plastic]"
  }
})

if mods["space-age"] then
  data:extend({
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
