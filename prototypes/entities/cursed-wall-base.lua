function cursedpipepictures()
  return {
    straight_vertical_single =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 44,
      height = 58
    },
    straight_vertical =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    straight_vertical_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    straight_horizontal =
    {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    corner_up_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 40
    },
    corner_up_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 44,
      height = 44
    },
    corner_down_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 36,
      height = 32
    },
    t_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    t_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 40,
      height = 44
    },
    t_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 40,
      height = 32
    },
    t_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    cross =
    {
      filename = "__base__/graphics/entity/pipe/pipe-cross.png",
      priority = "extra-high",
      width = 40,
      height = 40
    },
    ending_up =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 44,
      height = 42
      },
    ending_down =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    ending_right =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 44
    },
    ending_left =
    {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 58,
      height = 44
    },
    horizontal_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    vertical_window_background =
    {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    fluid_background =
    {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20
    },
    low_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    }
  }
end

function cursedpipepicturesinv()
	local pipes = pipepictures()
	for _,v in pairs(pipes) do
		v = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 1, height = 1 }
	end
	return pipes
end

data:extend(
{
	{
		type = "pipe",
		name = "cursed-wall-i1010",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			-- pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, 1} },
				{ position = {0, -1} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepicturesinv(),
	},
	{
		type = "pipe",
		name = "cursed-wall-i0101",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			-- pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {1, 0} },
				{ position = {-1, 0} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepicturesinv(),
	},
	{
		type = "pipe",
		name = "cursed-wall-0001",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {1, 0} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	{
		type = "pipe",
		name = "cursed-wall-0101",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {1, 0} },
				{ position = {-1, 0} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	{
		type = "pipe",
		name = "cursed-wall-0100",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-1, 0} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	{
		type = "pipe",
		name = "cursed-wall-1000",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, 1} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	{
		type = "pipe",
		name = "cursed-wall-1010",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, 1} },
				{ position = {0, -1} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	{
		type = "pipe",
		name = "cursed-wall-0010",
		icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		flags = {"placeable-player", "player-creation"},
		max_health = 100,
		corpse = "acid-splash-purple",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		order = "a",
		fluid_box =
		{
			base_area = 10,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, -1} },
			},
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		vertical_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.25}},
		pictures = cursedpipepictures(),
	},
	
	{ type = "container", name = "cursed-wall-base-1", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 200, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-2", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 250, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-3", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 300, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-4", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 350, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-5", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 400, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-6", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 450, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-7", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 500, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-8", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 550, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-9", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 600, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-10", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 650, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-11", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 700, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-12", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 750, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-13", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 800, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-14", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 850, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-15", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 900, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-16", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 950, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-17", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1000, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-18", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1050, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-19", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1100, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-20", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1150, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-21", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1200, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-22", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1250, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-23", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1300, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-24", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1350, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-25", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1400, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-26", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1450, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-27", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1500, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-28", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1550, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-29", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1600, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-30", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1650, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-31", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1700, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-32", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1750, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-33", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1800, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-34", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1850, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-35", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1900, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-36", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 1950, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-37", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2000, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-38", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2050, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-39", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2100, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-40", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2150, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-41", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2200, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-42", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2250, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-43", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2300, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-44", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2350, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-45", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2400, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-46", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2450, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-47", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2500, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-48", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2550, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-49", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2600, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },
	{ type = "container", name = "cursed-wall-base-50", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, minable = {hardness = 0.5, mining_time = 1.5, result = "cursed-wall-base"}, max_health = 2650, corpse = "acid-splash-purple", collision_box = {{-1.4, -1.4}, {1.4, 1.4}}, selection_box = {{-1.5, -1.5}, {1.5, 1.5}}, order = "a", inventory_size = 6, picture = { filename = "__Cursed-Exp__/graphics/entities/wall/cursed-wall-base.png", priority = "extra-high", width = 128, height = 105, shift = {0, 0} } },

	{ type = "storage-tank", name = "cursed-wall-i1111-1", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 15, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-2", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 20, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-3", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 25, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-4", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 30, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-5", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 35, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-6", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 40, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-7", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 45, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-8", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 50, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-9", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 55, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-10", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 60, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-11", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 65, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-12", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 70, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-13", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 75, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-14", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 80, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-15", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 85, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-16", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 90, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-17", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 95, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-18", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 100, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-19", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 105, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-20", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 110, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-21", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 115, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-22", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 120, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-23", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 125, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-24", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 130, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-25", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 135, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-26", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 140, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-27", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 145, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-28", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 150, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-29", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 155, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-30", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 160, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-31", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 165, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-32", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 170, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-33", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 175, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-34", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 180, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-35", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 185, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-36", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 190, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-37", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 195, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-38", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 200, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-39", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 205, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-40", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 210, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-41", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 215, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-42", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 220, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-43", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 225, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-44", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 230, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-45", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 235, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-46", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 240, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-47", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 245, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-48", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 250, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-49", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 255, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },
	{ type = "storage-tank", name = "cursed-wall-i1111-50", icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png", flags = {"placeable-player", "player-creation"}, max_health = 100, corpse = "acid-splash-purple", collision_box = {{-0.29, -0.29}, {0.29, 0.29}}, order = "a", fluid_box = { base_area = 260, pipe_connections = { { position = {0, -1} }, { position = {1, 0} }, { position = {0, 1} }, { position = {-1, 0} }, }, }, picture = { sheet = { filename = "__Cursed-Exp__/graphics/entities/wall/invisible.png", priority = "extra-high", width = 0, height = 0, shift = {0, 0} } } },

}
)