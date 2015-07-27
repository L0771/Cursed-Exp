function sunken_stand()
  return
  {
		layers=
		{
			{
				width = 96,
				height = 80,
				frame_count = 4,
				axially_symmetrical = false,
				direction_count = 1,
				shift = {-0.3, -0.4},
				scale = 1.25,
				animation_speed = 0.3,
				stripes =
				{
					{
						filename = "__Cursed-Exp__/graphics/entities/turret/cursed-turret-normal-1.png",
						width_in_frames = 4,
						height_in_frames = 1,
					}
				}
			}
		}
	}
end
function sunken_attack(run_mode)
	return
	{
		layers=
		{
			{
				width = 96,
				height = 80,
				frame_count = 10,
				axially_symmetrical = false,
				direction_count = 8,
				shift = {-0.3, -0.4},
				scale = 1.25,
				run_mode = run_mode,
				stripes =
				{
					{
						filename = "__Cursed-Exp__/graphics/entities/turret/cursed-turret-attack-1.png",
						width_in_frames = 10,
						height_in_frames = 8,
					}
				}
			}
		}
	}
end


data:extend(
{
  {
    type = "explosion",
    name = "sunken_spike",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__Cursed-Exp__/graphics/entities/turret/cursed-turret-spike-1.png",
        priority = "extra-high",
        width = 26,
        height = 36,
        frame_count = 12,
        animation_speed = 0.6,
        shift = {0, 0.5},
		scale = 1.5
      }
    },
  },
  {
    type = "turret",
    name = "cursed-turret-1",
    icon = "__Cursed-Exp__/graphics/icons/turret/cursed-turret-1.jpg",
    flags = {"placeable-player", "not-repairable", "breaths-air"},
    order="b-b-d",
    max_health = 200,
    subgroup="cursed-build",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    shooting_cursor_size = 5,
    corpse = "small-worm-corpse",
    dying_explosion = "blood-explosion-big",
	minable = {mining_time = 5, result = "cursed-turret-1"},
    folded_speed = 0.01,
    folded_animation = sunken_stand(),
    starting_attack_speed = 0.03,
    starting_attack_animation = sunken_attack("forward"),
    starting_attack_sound =
    {
      {
        filename = "__base__/sound/creatures/worm-roar-short-1.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/worm-roar-short-2.ogg",
        volume = 0.7
      },
      {
        filename = "__base__/sound/creatures/worm-roar-short-3.ogg",
        volume = 0.7
      }
    },
    ending_attack_speed = 0.03,
    ending_attack_animation = sunken_attack("backward"),
    attack_parameters =
    {
      ammo_category = "bullet",
      cooldown = 15,
      range = 17,
    ammo_type =
    {
      category = "bullet",
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "sunken_spike"
                },
                {
                  type = "damage",
                  damage = { amount = 8 , type = "physical"}
                }
              }
            }
          }
        }
      }
    },
    }
  },
}
)
