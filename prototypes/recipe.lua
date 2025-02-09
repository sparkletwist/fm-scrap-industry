data:extend({
  {
    type = "recipe",
    name = "iron-scrap-smelting",
    icons = {
      {icon="__scrap-industry__/graphics/icons/iron-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/iron-plate.png"}
    },
    category = "smelting",
    subgroup = "production-scrap",
    allow_productivity = false,
    auto_recycle = false,
    energy_required = 3.2,
    ingredients = {{type="item", name="trash", amount=1}},
    results = {{type="item", name="iron-plate", amount=1}}
  }
})
