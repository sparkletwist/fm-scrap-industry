require("prototypes.recipe-updates")

-- temporary for passing this over to thesixthroc since RRI is not uploaded to source control yet
if mods["Rocs-Rusting-Iron"] and not data.raw.item["rocs-rusting-iron-iron-scrap-rusty"] then
  local derusting_material = mods["aai-industry"] and "sand" or "stone"
  local base_game = not mods["aai-industry"]
  local item_sounds = require("__base__.prototypes.item_sounds")
  local item_tints = require("__base__.prototypes.item-tints")
  data.raw.item["iron-scrap"].spoil_ticks = 0.5 * minute * settings.startup["rocs-rusting-iron-time-minutes"].value
  data.raw.item["iron-scrap"].spoil_result = "rocs-rusting-iron-iron-scrap-rusty"
  data:extend({
    {
      type = "item",
      name = "rocs-rusting-iron-iron-scrap-rusty",
      localised_name = {"item-name.rocs-rusting-iron-rusty", {"item-name.iron-scrap"}},
      icon = "__scrap-industry__/graphics/icons/iron-scrap-rusty.png",
      icon_size = 64,
      subgroup = "production-scrap",
      order = "a[material]-a[iron]b",
      inventory_move_sound = item_sounds.metal_small_inventory_move,
      pick_sound = item_sounds.metal_small_inventory_pickup,
      drop_sound = item_sounds.metal_small_inventory_move,
      stack_size = 100,
      random_tint_color = item_tints.iron_rust,
      spoil_level = 1,
    },
    {
      type = "recipe",
      name = "rocs-rusting-iron-iron-scrap-derusting",
      localised_name = {"recipe-name.rocs-rusting-iron-derust", {"item-name.iron-scrap"}},
      icon = "__scrap-industry__/graphics/icons/iron-scrap-derust.png",
      icon_size = 64,
      order = "e[derusting]-A[derust-iron-scrap]",
      enabled = true,
      subgroup = "derusting",
      category = "crafting",
      energy_required = 1 / 4,
      ingredients = {{
          type = "item",
          name = "rocs-rusting-iron-iron-scrap-rusty",
          amount = 1,
          ignored_by_stats = 1
      }, {
          type = "item",
          name = derusting_material,
          amount = 1
      }},
      results = {{
          type = "item",
          name = "iron-scrap",
          amount = 1,
          ignored_by_productivity = 1,
          ignored_by_stats = 1
      }},
      allow_quality = false,
      result_is_always_fresh = true,
      allow_decomposition = false,
      allow_as_intermediate = false,
      always_show_made_in = true,
      auto_recycle = false
    },
    {
      type = "recipe",
      name = "rocs-rusting-iron-iron-scrap-chemical-derusting",
      localised_name = {"recipe-name.rocs-rusting-iron-chemical-derusting", {"item-name.iron-scrap"}},
      icons = {{
          icon = "__scrap-industry__/graphics/icons/iron-scrap-derust.png",
          icon_size = 64,
          scale = 0.65,
          shift = {2, 2},
          draw_background = true
      }, {
          icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
          icon_size = 64,
          scale = 0.45,
          shift = {-11, -11},
          draw_background = true
      }},
      order = "e[derusting]-A[chemical-derust-iron-scrap]",
      enabled = true,
      subgroup = "derusting",
      category = "chemistry",
      energy_required = 1 / 4,
      ingredients = {{
          type = "item",
          name = "rocs-rusting-iron-iron-scrap-rusty",
          amount = 1,
          ignored_by_stats = 1
      }, {
          type = "fluid",
          name = "sulfuric-acid",
          amount = 10
      }, {
          type = "fluid",
          name = "water",
          amount = 30
      }},
      results = {{
          type = "item",
          name = "iron-scrap",
          amount = 1,
          ignored_by_productivity = 1,
          ignored_by_stats = 1
      }},
      crafting_machine_tint = {
          primary = {
              r = 0.7,
              g = 0.7,
              b = 0.1
          },
          secondary = {
              r = 0.8,
              g = 0.8,
              b = 0.1
          },
          tertiary = {
              r = 0.7,
              g = 0.7,
              b = 0.1
          }
      },
      allow_quality = false,
      result_is_always_fresh = true,
      allow_decomposition = false,
      allow_as_intermediate = false,
      always_show_made_in = true,
      auto_recycle = false
    },
  })

  local ftech = require("__fdsl__.lib.technology")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-scrap-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-plate-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-gear-wheel-chemical-derusting")
  ftech.add_unlock("sulfur-processing", "rocs-rusting-iron-iron-stick-chemical-derusting")
  ftech.add_unlock("sulfur-processing", base_game and "rocs-rusting-iron-engine-unit-chemical-derusting" or "rocs-rusting-iron-motor-chemical-derusting")

  ScrapIndustry.items["rocs-rusting-iron-iron-plate-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=0.04, failrate=0.02, recycle=2}
  ScrapIndustry.items["rocs-rusting-iron-iron-gear-rusty"] = {scrap="rocs-rusting-iron-iron-scrap-rusty", scale=0.06, failrate=0.04}
  ScrapIndustry.items["rocs-rusting-iron-iron-stick-rusty"] = {scrap="rocs-rusting-iron-iron-stick-rusty", scale=0.06, failrate=0.04}
  ScrapIndustry.items["rocs-rusting-iron-engine-unit"] = {scrap={"rocs-rusting-iron-iron-scrap", "steel-scrap"}, scale=0.08, failrate=0.08}
  ScrapIndustry.items["rocs-rusting-iron-motor"] = {scrap="rocs-rusting-iron-iron-scrap", scale=0.08, failrate=0.08}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-scrap-chemical-derusting"] = {failrate=0.99}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-plate-chemical-derusting"] = {failrate=0.99}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-gear-chemical-derusting"] = {failrate=0.98}
  ScrapIndustry.recipes["rocs-rusting-iron-iron-stick-chemical-derusting"] = {failrate=0.98}
  ScrapIndustry.recipes["rocs-rusting-iron-engine-unit-chemical-derusting"] = {failrate=0.98}
  ScrapIndustry.recipes["rocs-rusting-iron-motor-chemical-derusting"] = {failrate=0.98}
end
