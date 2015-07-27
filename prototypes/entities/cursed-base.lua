
local base = util.table.deepcopy(data.raw["lab"]["lab"])
base.name = "cursed-base"
base.icon = "__Cursed-Exp__/graphics/icons/base/cursed-base.jpg"
base.minable = nil
base.corpse = nil
base.dying_explosion = nil
base.on_animation.filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png"
base.on_animation.width = 105
base.on_animation.height = 150
base.on_animation.scale = 1
base.on_animation.frame_count = 1
base.on_animation.shift = {0,-0.75}
base.off_animation.filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png"
base.off_animation.width = 105
base.off_animation.height = 150
base.off_animation.x = nil
base.off_animation.y = nil
base.off_animation.scale = 1
base.off_animation.frame_count = 1
base.off_animation.shift = {0,-0.75}
base.working_sound = nil
base.inputs = { "cursed-player" }
base.order = "b-b-g"
data.raw[base.type][base.name] = base

-- data:extend(
-- {
  -- {
	-- type = "lab",
	-- name = "cursed-base",
    -- icon = "__Cursed-Exp__/graphics/icons/base/cursed-base.jpg",
	-- order = "b-b-g",
	-- flags = {"placeable-neutral"},
	-- max_health = 50,
    -- collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    -- selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    -- on_animation =
    -- {
		-- filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png",
		-- width = 105,
		-- height = 150,
		-- frame_count = 1,
		-- scale = 1.25,
		-- shift = {0.15,-1}
    -- },
    -- off_animation =
    -- {
		-- filename = "__Cursed-Exp__/graphics/entities/base/cursed-base.png",
		-- width = 105,
		-- height = 150,
		-- frame_count = 1,
		-- scale = 1,
		-- shift = {0,-0.75}
    -- },
    -- energy_source =
    -- {
      -- type = "electric",
      -- usage_priority = "secondary-input"
    -- },
    -- energy_usage = "1W",
    -- inputs =
    -- {
      -- "cursed-player"
    -- },
  -- },
-- })
