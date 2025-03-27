local fireutil = require("__base__.prototypes.fire-util")

if mods["space-age"] and settings.startup["scrap-industry-volatile-lithium"].value then

  local function create_lithium_fire_pictures(opts)
    local fire_blend_mode = opts.blend_mode or "normal"
    local fire_animation_speed1 = opts.animation_speed1 or 0.5
    local fire_animation_speed2 = opts.animation_speed2 or 0.9
    local fire_scale1 =  opts.scale1 or 0.55
    local fire_scale2 =  opts.scale2 or 0.35
    local fire_tint = {r=0.9,g=0.9,b=0.9,a=1}
    local fire_flags = nil
    local retval =
    {
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-01.png",
        line_length = 10,
        width = 84,
        height = 130,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed1,
        scale = fire_scale1,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-02.png",
        line_length = 10,
        width = 82,
        height = 106,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed1,
        scale = fire_scale1,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-03.png",
        line_length = 10,
        width = 84,
        height = 124,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed1,
        scale = fire_scale1,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-04.png",
        line_length = 10,
        width = 84,
        height = 94,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed1,
        scale = fire_scale1,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.25 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-01.png",
        line_length = 10,
        width = 84,
        height = 130,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed2,
        scale = fire_scale2,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-02.png",
        line_length = 10,
        width = 82,
        height = 106,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed2,
        scale = fire_scale2,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-03.png",
        line_length = 10,
        width = 84,
        height = 124,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed2,
        scale = fire_scale2,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.7 }
      },
      {
        filename = "__scrap-industry__/graphics/entity/lithium-flame/lithium-flame-04.png",
        line_length = 10,
        width = 84,
        height = 94,
        frame_count = 90,
        blend_mode = fire_blend_mode,
        animation_speed = fire_animation_speed2,
        scale = fire_scale2,
        tint = fire_tint,
        flags = fire_flags,
        shift = { 0, -0.25 }
      }
    }
    retval = fireutil.foreach(retval, function(tab)
      if tab.shift and tab.scale then tab.shift = { tab.shift[1] * tab.scale, tab.shift[2] * tab.scale } end
    end)
    for k, layer in pairs (retval) do
      retval[k] = util.draw_as_glow(layer)
    end
    return retval
  end

  data:extend({
    fireutil.add_basic_fire_graphics_and_effects_definitions{
      type = "fire",
      name = "lithium-flame",
      icon = (mods["base"] >= "2.0.34") and "__base__/graphics/icons/signal/signal-fire.png" or nil,
      flags = {"placeable-off-grid", "not-on-map"},
      hidden = true,
      damage_per_tick = {amount = 26 / 60, type = "fire"},
      maximum_damage_multiplier = 6,
      damage_multiplier_increase_per_added_fuel = 1,
      damage_multiplier_decrease_per_tick = 0.001,
    
      spawn_entity = "fire-flame-on-tree",
      spread_delay = 300,
      spread_delay_deviation = 180,
      maximum_spread_count = 100,
    
      emissions_per_second = { pollution = 0.01 },
    
      initial_lifetime = 480,
      lifetime_increase_by = 150,
      lifetime_increase_cooldown = 4,
      maximum_lifetime = 1800,
      delay_between_initial_flames = 10,

      pictures = create_lithium_fire_pictures({}),
    }
  })
end
