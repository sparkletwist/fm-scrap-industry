local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  {
    type = "item",
    name = "iron-scrap",
    icon = "__scrap-industry__/graphics/icons/iron-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-a[iron]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "copper-scrap",
    icon = "__scrap-industry__/graphics/icons/copper-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-b[copper]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "steel-scrap",
    icon = "__scrap-industry__/graphics/icons/steel-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-c[steel]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "circuit-scrap",
    icon = "__scrap-industry__/graphics/icons/circuit-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-3.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "c[product]-a[circuit]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  }
})

if mods["space-age"] then
  data:extend({
    {
      type = "item",
      name = "tungsten-scrap",
      icon = "__scrap-industry__/graphics/icons/tungsten-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "vulcanus-processes",
      order = "c[tungsten]b-a[tungsten-scrap]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2*kg
    },
    {
      type = "item",
      name = "holmium-scrap",
      icon = "__scrap-industry__/graphics/icons/holmium-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "fulgora-processes",
      order = "b[holmium]b-a[holmium-scrap]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2*kg
    },
  })
end

if mods["bzlead"] then
  data:extend({
    {
      type = "item",
      name = "lead-scrap",
      icon = "__scrap-industry__/graphics/icons/lead-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/lead-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/lead-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/lead-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "production-scrap",
      order = "a[material]-d[lead]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2*kg
    }
  })
end
