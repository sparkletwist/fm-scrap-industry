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
    order = "b[smelting]-a[iron]",
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
    order = "b[smelting]-b[copper]",
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
    order = "b[smelting]-c[steel]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 16,
    ingredients = {{type="item", name="steel-scrap", amount=mods["Expensive-Mode"] and 10 or 5}},
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
    order = "d[crafting]-a[electronic-circuit]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1.5,
    ingredients = {
      {type="item", name="circuit-scrap", amount=2},
      {type="item", name="copper-cable", amount=mods["Expensive-Mode"] and 3 or 1}
    },
    results = {{type="item", name="electronic-circuit", amount=1}}
  },
  {
    type = "recipe",
    name = "advanced-circuit-from-scrap",
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/advanced-circuit.png"}
    },
    category = mods["space-age"] and "electronics" or "crafting",
    subgroup = "production-scrap",
    order = "d[crafting]-b[advanced-circuit]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 9,
    ingredients = {
      {type="item", name="circuit-scrap", amount=3},
      {type="item", name="copper-cable", amount=mods["Expensive-Mode"] and 5 or 2},
      {type="item", name="plastic-bar", amount=mods["Expensive-Mode"] and 2 or 1}
    },
    results = {{type="item", name="advanced-circuit", amount=1}}
  }
})

if mods["space-age"] then
  data:extend({
    {
      type = "recipe",
      name = "tungsten-carbide-from-scrap",
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-carbide.png"}
      },
      category = mods["wood-industry"] and "kiln-smelting" or nil,
      subgroup = "vulcanus-processes",
      order = "c[tungsten]b-d[tungsten-carbide-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 3.2,
      ingredients = {
        {type="item", name="tungsten-scrap", amount=mods["Expensive-Mode"] and 5 or 3},
        {type="item", name="carbon", amount=1},
        {type="fluid", name="sulfuric-acid", amount=10}
      },
      results = {{type="item", name="tungsten-carbide", amount=2}}
    },
    {
      type = "recipe",
      name = "tungsten-plate-from-scrap",
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-plate.png"}
      },
      category = "metallurgy",
      subgroup = "vulcanus-processes",
      order = "c[tungsten]b-e[tungsten-plate-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 15,
      ingredients = {
        {type="item", name="tungsten-scrap", amount=mods["Expensive-Mode"] and 8 or 4},
        {type="fluid", name="molten-iron", amount=10}
      },
      results = {{type="item", name="tungsten-plate", amount=1}}
    },
    {
      type = "recipe",
      name = "holmium-solution-from-scrap",
      icons = {
        {icon="__scrap-industry__/graphics/icons/holmium-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/fluid/holmium-solution.png"}
      },
      category = "chemistry",
      subgroup = "fulgora-processes",
      order = "b[holmium]b-a[holmium-solution-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {
        {type="item", name="holmium-scrap", amount=mods["Expensive-Mode"] and 5 or 3},
        {type="item", name=mods["aai-industry"] and "sand" or "stone", amount=1}
      },
      results = {{type="fluid", name="holmium-solution", amount=mods["aai-industry"] and 100 or 150}}
    },
  })
end

if mods["bzlead"] then
  local needs_research = mods["aai-industry"] and mods["wood-industry"] and settings.startup["wood-industry-lead"].value
  data:extend({
    {
      type = "recipe",
      name = "lead-scrap-smelting",
      icons = {
        {icon="__scrap-industry__/graphics/icons/lead-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__bzlead__/graphics/icons/lead-plate.png"}
      },
      category = "smelting",
      subgroup = "production-scrap",
      order = "b[smelting]-d[lead]",
      enabled = not needs_research,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {{type="item", name="lead-scrap", amount=3}},
      results = {{type="item", name="lead-plate", amount=2}}
    },
  })
end
