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
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    subgroup = "trees",
    order = "a[tree]-d[cursed-tree]",
       pictures =
    {
      {
        filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-01.png",
        width = 61,
        height= 140,
		scale = 0.6,
		shift = {0, -1.0}
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
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    subgroup = "trees",
    order = "a[tree]-d[cursed-tree]",
       pictures =
    {
      {
        filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-02.png",
        width = 80,
        height= 140,
		scale = 0.7,
		shift = {0, -1.25}
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
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    subgroup = "trees",
    order = "a[tree]-d[cursed-tree]",
       pictures =
    {
      {
        filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-03.png",
        width = 80,
        height= 130,
		scale = 0.7,
		shift = {0, -1.05}
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
    emissions_per_tick = 0.05,
    max_health = 200,
    collision_box = {{-0.4, -0.7}, {0.4, 0.9}},
    selection_box = {{-0.9, -2.2}, {0.9, 0.9}},
    drawing_box = {{-0.7, -2.3}, {2, 0.9}},
    subgroup = "trees",
    order = "a[tree]-d[cursed-tree]",
       pictures =
    {
      {
        filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-04.png",
        width = 100,
        height= 125,
		scale = 0.9,
		shift = {0, -1.3}
      }
    }
  },
})
