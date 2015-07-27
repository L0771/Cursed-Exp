function runanimation()
  return
  {
    layers=
    {
      {
        width = 64,
        height = 72,
        frame_count = 5,
        axially_symmetrical = false,
        direction_count = 16,
        shift = {0, -1},
        animation_speed = 0.3,
        scale = 1.2,
        stripes =
        {
         {
          filename = "__Cursed-Exp__/graphics/entities/minion/cursed-minion-1.png",
          width_in_frames = 5,
          height_in_frames = 16,
         }
        }
      }
    }
  }
end

data:extend(
{
  {
    type = "unit",
    name = "cursed-minion-1",
    icon = "__base__/graphics/icons/creeper.png",
    flags = {"placeable-player", "placeable-off-grid", "breaths-air"},
    max_health = 15,
    order = "b-b-a",
    subgroup="creatures",
    healing_per_tick = 0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.7, 0.4}},
    attack_parameters =
    {
      range = 0.5,
      cooldown = 35,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(6),
      sound =
      {
        {
          filename = "__base__/sound/creatures/biter-roar-short-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/creatures/biter-roar-short-2.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/creatures/biter-roar-short-3.ogg",
          volume = 0.8
        }
      },
      animation = runanimation()
    },
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.1,
    pollution_to_join_attack = 200,
    distraction_cooldown = 300,
    corpse = "small-biter-corpse",
    dying_explosion = "blood-explosion-small",
    dying_sound =
    {
      {
        filename = "__base__/sound/creatures/creeper-death-1.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/creeper-death-2.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/creeper-death-3.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/creeper-death-4.ogg",
        volume = 0.7
      }
    },
    run_animation = runanimation()
  },
}
)