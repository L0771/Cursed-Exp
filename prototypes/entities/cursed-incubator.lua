
local incubator = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
incubator.name = "cursed-incubator"
incubator.icon = "__Cursed-Exp__/graphics/icons/incubator/cursed-incubator.png"
incubator.minable.result = "cursed-incubator"
-- incubator.fluid_boxes[1].pipe_covers = nil
incubator.fluid_boxes[2] = nil
incubator.animation.filename = "__Cursed-Exp__/graphics/entities/incubator/cursed-incubator.png"
incubator.animation.width = 128
incubator.animation.height = 128
incubator.animation.frame_count = 16
incubator.animation.line_length = 16
incubator.animation.scale = 1.5
incubator.animation.animation_speed = 0.004
incubator.animation.shift = {1.435, -1.7}
incubator.open_sound = nil
incubator.close_sound = nil
incubator.working_sound.sound[1].filename = "__base__/sound/pipe.ogg"
incubator.working_sound.sound[1].volume = 0.6
incubator.working_sound.idle_sound = nil
incubator.working_sound.apparent_volume = nil
incubator.crafting_categories = {"cursed-body"}
incubator.crafting_speed = 1
incubator.energy_usage = "150kW"
incubator.ingredient_count = 1
incubator.module_slots = 0
data.raw[incubator.type][incubator.name] = incubator




-- data:extend(
-- {
  -- {
    -- type = "assembling-machine",
    -- name = "cursed-incubator",
    -- icon = "__Cursed-Exp__/graphics/icons/incubator/cursed-incubator.png",
    -- flags = {"placeable-player", "player-creation"},
    -- minable = {hardness = 0.2, mining_time = 0.5, result = "cursed-incubator"},
    -- max_health = 250,
    -- corpse = "big-remnants",
    -- dying_explosion = "huge-explosion",
    -- resistances =
    -- {
      -- {
        -- type = "fire",
        -- percent = 70
      -- }
    -- },
    -- collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    -- selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    -- fast_replaceable_group = "assembling-machine",
    -- animation =
    -- {
		-- filename = "__Cursed-Exp__/graphics/entities/incubator/cursed-incubator.png",
		-- priority = "high",
		-- width = 128,
		-- height = 128,
		-- frame_count = 16,
		-- line_length = 16,
		-- scale = 1.5,
		-- animation_speed = 0.01,
		-- shift = {1.435, -1.7}
    -- },
    -- open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    -- close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    -- working_sound =
    -- {
      -- sound = {
        -- {
          -- filename = "__base__/sound/assembling-machine-t2-1.ogg",
          -- volume = 0.8
        -- },
        -- {
          -- filename = "__base__/sound/assembling-machine-t2-2.ogg",
          -- volume = 0.8
        -- },
      -- },
      -- idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      -- apparent_volume = 1.5,
    -- },
    -- fluid_boxes =
    -- {
      -- {
        -- production_type = "input",
        -- pipe_picture = assembler2pipepictures(),
        -- pipe_covers = pipecoverspictures(),
        -- base_area = 10,
        -- base_level = -1,
        -- pipe_connections = {{ type="input", position = {0, -2} }}
      -- },
      -- off_when_no_fluid_recipe = true
    -- },
    -- crafting_categories = {"cursed-body"},
    -- crafting_speed = 1,
    -- energy_source =
    -- {
      -- type = "electric",
      -- usage_priority = "secondary-input",
      -- emissions = 0.04 / 2.5
    -- },
    -- energy_usage = "150kW",
    -- ingredient_count = 1,
    -- module_slots = 0
  -- },
-- }
-- )