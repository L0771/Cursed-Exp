data:extend(
{
  {
	type = "lab",
	name = "cursed-base",
    icon = "__Cursed-Exp__/graphics/icons/base/cursed-base.jpg",
	order = "b-b-g",
	flags = {"placeable-neutral"},
	max_health = 50,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    on_animation =
    {
		filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png",
		width = 105,
		height = 150,
		frame_count = 1,
		scale = 1.25,
		shift = {0.15,-1}
    },
    off_animation =
    {
		filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png",
		width = 105,
		height = 150,
		frame_count = 1,
		scale = 1,
		shift = {0,-0.75}
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "1W",
    inputs =
    {
      "cursed-player"
    },
  },
})
