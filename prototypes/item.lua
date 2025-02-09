local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  {
    type = "item",
    name = "copper-scrap",
    icon = "__scrap-industry__/graphics/icons/copper-scrap.png",
    subgroup = "production-scrap",
    order = "b[material]-a[]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg,
    random_tint_color = item_tints.yellowing_coal
  }
})
