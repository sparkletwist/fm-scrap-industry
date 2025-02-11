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
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 3.2,
    ingredients = {{type="item", name="iron-scrap", amount=2}},
    results = {{type="item", name="iron-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "copper-scrap-smelting",
    icons = {
      {icon="__scrap-industry__/graphics/icons/copper-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/copper-plate.png"}
    },
    category = "smelting",
    subgroup = "production-scrap",
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 3.2,
    ingredients = {{type="item", name="copper-scrap", amount=2}},
    results = {{type="item", name="copper-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "steel-scrap-smelting",
    icons = {
      {icon="__scrap-industry__/graphics/icons/steel-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/steel-plate.png"}
    },
    category = "smelting",
    subgroup = "production-scrap",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 16,
    ingredients = {{type="item", name="steel-scrap", amount=5}},
    results = {{type="item", name="steel-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "electronic-circuit-from-scrap",
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/electronic-circuit.png"}
    },
    category = mods["space-age"] and "electronics" or "crafting",
    subgroup = "production-scrap",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    ingredients = {
      {type="item", name="circuit-scrap", amount=2},
      {type="item", name="copper-cable", amount=1}
    },
    results = {{type="item", name="electronic-circuit", amount=2}}
  },
})
