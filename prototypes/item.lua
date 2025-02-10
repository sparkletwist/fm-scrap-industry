local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  {
    type = "item",
    name = "iron-scrap",
    icon = "__scrap-industry__/graphics/icons/iron-scrap.png",
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
    subgroup = "production-scrap",
    order = "b[product]-a[circuit]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  }
})
