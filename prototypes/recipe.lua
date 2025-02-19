data:extend({
  {
    type = "recipe",
    name = "iron-plate-from-scrap",
    localised_name = {"recipe-name.iron-plate-from-scrap"},
    icons = {
      {icon="__scrap-industry__/graphics/icons/iron-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/iron-plate.png", draw_background=true}
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
    name = "copper-plate-from-scrap",
    localised_name = {"recipe-name.copper-plate-from-scrap"},
    icons = {
      {icon="__scrap-industry__/graphics/icons/copper-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/copper-plate.png", draw_background=true}
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
    name = "steel-plate-from-scrap",
    localised_name = {"recipe-name.steel-plate-from-scrap"},
    icons = {
      {icon="__scrap-industry__/graphics/icons/steel-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/steel-plate.png", draw_background=true}
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
    localised_name = {"recipe-name.electronic-circuit-from-scrap"},
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap-3.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/electronic-circuit.png", draw_background=true}
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
    localised_name = {"recipe-name.advanced-circuit-from-scrap"},
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap-1.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/advanced-circuit.png", draw_background=true}
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

if settings.startup["scrap-industry-plastic"].value then
  data:extend({
    {
      type = "recipe",
      name = "plastic-bar-from-bits",
      localised_name = {"recipe-name.plastic-bar-from-bits"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/plastic-bits.png", shift={-12, -12}, scale=0.4},
        {icon="__base__/graphics/icons/plastic-bar.png", draw_background=true}
      },
      category = mods["space-age"] and "chemistry-or-cryogenics" or "chemistry",
      subgroup = "production-scrap",
      order = "d[crafting]-c[plastic-bar]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 9,
      ingredients = {
        {type="item", name="plastic-bits", amount=3},
        {type="fluid", name="petroleum-gas", amount=10}
      },
      results = {{type="item", name="plastic-bar", amount=2}}
    }
  })
end

if mods["space-age"] then
  data:extend({
    {
      type = "recipe",
      name = "tungsten-carbide-from-scrap",
      localised_name = {"recipe-name.tungsten-carbide-from-scrap"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-carbide.png", draw_background=true}
      },
      category = mods["wood-industry"] and "kiln-smelting" or "crafting-with-fluid",
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
      localised_name = {"recipe-name.tungsten-plate-from-scrap"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-plate.png", draw_background=true}
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
      localised_name = {"recipe-name.holmium-plate-from-scrap"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/holmium-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/fluid/holmium-solution.png", draw_background=true}
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
      name = "lead-plate-from-scrap",
      localised_name = {"recipe-name.lead-plate-from-scrap"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/lead-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__bzlead__/graphics/icons/lead-plate.png", draw_background=true}
      },
      category = "smelting",
      subgroup = "production-scrap",
      order = "b[smelting]-d[lead]",
      enabled = not needs_research,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {{type="item", name="lead-scrap", amount=2}},
      results = {{type="item", name="lead-plate", amount=1}}
    },
  })
end
