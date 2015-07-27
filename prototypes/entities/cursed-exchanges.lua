data:extend(
{
  {
    type = "assembling-machine",
    name = "cursed-exchange",
    icon = "__Cursed-Exp__/graphics/icons/exchange/cursed-exchange.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "cursed-exchange"},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "huge-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    fast_replaceable_group = "assembling-machine",
    animation =
    {
      filename = "__Cursed-Exp__/graphics/entities/exchange/cursed-exchange.png",
      priority = "high",
      width = 176,
      height = 160,
      frame_count = 1,
      line_length = 1,
	  scale = 0.60,
      shift = {-0.1, -0.06}
    },
    fluid_boxes =
    {
		{
			production_type = "input",
			pipe_picture = assembler2pipepictures(),
			-- pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = -1,
			pipe_connections = {{ type="input", position = {0, -2} }}
		},
		off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"cursed-talent"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.04 / 2.5
    },
    energy_usage = "150kW",
    ingredient_count = 6,
    module_slots = 0
  },
}
)