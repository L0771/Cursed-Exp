data:extend(
{
	{
		type = "unit",
		name = "cursed-blood",
		icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood.png",
		flags = {"not-on-map"},
		max_health = 1,
		order = "b-b-a",
		-- subgroup="creatures",
		collision_mask = { "not-colliding-with-itself", "object-layer"},
		attack_parameters = 
		{
			range = 0,
			cooldown = 35,
			ammo_category = "melee",
			ammo_type = make_unit_melee_ammo_type(0),
			animation =
			{
				filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood.png",
				still_frame = 1,
				width = 150,
				height = 100,
				frame_count = 1,
				direction_count = 1,
				shift = {0, 0},
				axially_symmetrical = false,
				scale = 0.75,
			}
		},
		vision_distance = 0,
		movement_speed = 0.0056, --0.0056,
		distance_per_frame = 0.1,
		pollution_to_join_attack = 0,
		distraction_cooldown = 60,
		corpse = nil,
		run_animation =
		{
			filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood.png",
			still_frame = 1,
			width = 150,
			height = 100,
			frame_count = 1,
			direction_count = 1,
			shift = {0, 0},
			axially_symmetrical = false,
			scale = 0.75,
		}
	},
	{
		type = "unit",
		name = "cursed-blood-steam",
		icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood.png",
		flags = {"placeable-off-grid","not-on-map"},
		max_health = 1,
		order = "b-b-a",
		subgroup="creatures",
		collision_mask = { "not-colliding-with-itself" },
		attack_parameters = 
		{
			range = 0,
			cooldown = 35,
			ammo_category = "melee",
			ammo_type = make_unit_melee_ammo_type(0),
			animation =
			{
				filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood-steam.png",
				still_frame = 1,
			width = 32,
			height = 36,
				frame_count = 1,
				direction_count = 1,
				shift = {0, -1},
				axially_symmetrical = false,
				scale = 1,
			}
		},
		vision_distance = 0,
		movement_speed = 0.014,
		distance_per_frame = 0.1,
		pollution_to_join_attack = 0,
		distraction_cooldown = 60,
		corpse = nil,
		run_animation =
		{
			filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood-steam.png",
			still_frame = 1,
			width = 32,
			height = 36,
			frame_count = 1,
			direction_count = 1,
			shift = {0, -1},
			axially_symmetrical = false,
			scale = 1,
		}
	},
}
)