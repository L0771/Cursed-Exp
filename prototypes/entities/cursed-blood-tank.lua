data:extend(
{
	{
		type = "storage-tank",
		name = "cursed-blood-tank-1",
		icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-tank.jpg",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 3, result = "cursed-blood-tank-1"},
		max_health = 200,
		corpse = "medium-remnants",
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fluid_box =
		{
			base_area = 250,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, -2}, },
				{ position = {0, 2}, },
				{ position = {-2, 0}, },
				{ position = {2, 0}, },
			},
		},
		picture =
		{
			sheet =
			{
				filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank.png",
				priority = "extra-high",
				frames = 1,
				width = 116,
				height = 93,
				shift = {0.35, 0},
				scale = 1.1
			}
			  -- north =
			  -- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank-north.png",
				-- frame_count = 1,
				-- line_length = 1,
				-- priority = "extra-high",
				-- width = 44,
				-- height = 81,
				-- shift = {-0.5, 0}
			  -- },
			  -- east =
			  -- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank-east.png",
				-- frame_count = 1,
				-- line_length = 1,
				-- priority = "extra-high",
				-- width = 81,
				-- height = 44,
				-- shift = {0, 0.}
			  -- },
			  -- south =
			  -- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank-south.png",
				-- frame_count = 1,
				-- line_length = 1,
				-- priority = "extra-high",
				-- width = 44,
				-- height = 81,
				-- shift = {0, 0.5}
			  -- },
			  -- west =
			  -- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank-west.png",
				-- frame_count = 1,
				-- line_length = 1,
				-- priority = "extra-high",
				-- width = 81,
				-- height = 44,
				-- shift = {0, 0.03}
			  -- },
		},
	},
}
)