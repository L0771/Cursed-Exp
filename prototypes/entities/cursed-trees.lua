data:extend(
{
	{
		type = "tree",
		name = "cursed-tree-00",
		icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		order = "b-b-g",
		flags = {"placeable-neutral"},
		minable =
		{
			mining_particle = "wooden-particle",
			mining_time = 1,
			--mining_time = 2.5,
			result = "cursed-tree-00",
			count = 1
		},
		emissions_per_tick = 0.0005,
		max_health = 50,
		collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
		selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
		drawing_box = {{0.0, 0.0}, {1.0, 1.0}},
		pictures =
		{
			{
				filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-00.png",
				priority = "extra-high",
				width = 32,
				height = 32,
				scale = 0.5,
				shift = {0.0, 0.0}
			}
		} 
	},
	{
	type = "tree",
	name = "cursed-tree-01",
	icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
	flags = {"placeable-neutral", "placeable-off-grid"},
	minable =
	{
		mining_particle = "wooden-particle",
		mining_time = 2,
		--mining_time = 3.75,
		result = "cursed-tree-00",
		count = 1
	},
	emissions_per_tick = 0.001,
	max_health = 75,
	collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
	subgroup = "trees",
	order = "a[tree]-d[cursed-tree]",
	pictures =
	{
		{
		filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-01.png",
		width = 300,
		height= 150,
		scale = 0.6,
		shift = {2.2, -0.9}
		}
	}
	},
	{
		type = "tree",
		name = "cursed-tree-02",
		icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		minable =
		{
			mining_particle = "wooden-particle",
			mining_time = 3,
			--mining_time = 5,
			result = "cursed-tree-00",
			count = 1
		},
		emissions_per_tick = 0.005,
		max_health = 100,
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		subgroup = "trees",
		order = "a[tree]-d[cursed-tree]",
		pictures =
		{
			{
				filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-02.png",
				width = 300,
				height= 150,
				scale = 0.7,
				shift = {1.8, -1.3}
			}
		}
	},
	{
		type = "tree",
		name = "cursed-tree-03",
		icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		minable =
		{
			mining_particle = "wooden-particle",
			mining_time = 4,
			--mining_time = 6.25,
			result = "cursed-tree-00",
			count = 1
		},
		emissions_per_tick = 0.01,
		max_health = 150,
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		subgroup = "trees",
		order = "a[tree]-d[cursed-tree]",
		pictures =
		{
			{
				filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-03.png",
				width = 300,
				height= 200,
				scale = 0.7,
				shift = {1.9, -0.45}
			}
		}
	},
	{
		type = "tree",
		name = "cursed-tree-04",
		icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		flags = {"placeable-neutral", "placeable-off-grid"},
		minable =
		{
			mining_particle = "wooden-particle",
			mining_time = 5,
			--mining_time = 7.5,
			result = "cursed-heart",
			count = 1
		},
		emissions_per_tick = 0,
		max_health = 200,
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		subgroup = "trees",
		order = "a[tree]-d[cursed-tree]",
		autoplace =
		{
			order = "b[tree]-a[random]",
			peaks =
			{
				{
				influence = 0.0005
				},
			{
			influence = 0.002,
			min_influence = 0,
			max_influence = 0.0015,
			-- noise_layer = "trees",
			noise_persistence = 0.75,--0.5,
			}
			}
		},
		pictures =
		{
			{
				filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-04.png",
				width = 300,
				height= 200,
				scale = 0.9,
				shift = {2.5, -1}
			}
		}
	},
})
