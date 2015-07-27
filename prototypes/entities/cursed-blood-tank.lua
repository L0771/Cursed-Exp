
local tank = util.table.deepcopy(data.raw["storage-tank"]["storage-tank"])
tank.name = "cursed-blood-tank"
tank.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-tank.png"
tank.minable.result = tank.name
tank.fluid_box["pipe_connections"] =
	{
		{ position = {0, -2} },
		{ position = {0, 2} },
		{ position = {-2, 0} },
		{ position = {2, 0} },
	}
tank.picture =
	{
		sheet =
		{
			filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank.png",
			-- priority = "extra-high",
			frames = 1,
			width = 112,
			height = 112,
			shift = {0.4, 0.35},
			scale = 1.1
		}
	}
data.raw[tank.type][tank.name] = tank

		
-- data:extend(
-- {
	-- {
		-- type = "storage-tank",
		-- name = "cursed-blood-tank",
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-tank.png",
		-- flags = {"placeable-player", "player-creation"},
		-- minable = {hardness = 0.2, mining_time = 3, result = "cursed-blood-tank"},
		-- max_health = 200,
		-- corpse = "medium-remnants",
		-- collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		-- selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		-- fluid_box =
		-- {
			-- base_area = 250,
			-- pipe_covers = pipecoverspictures(),
			-- pipe_connections =
			-- {
				-- { position = {0, -2} },
				-- { position = {0, 2} },
				-- { position = {-2, 0} },
				-- { position = {2, 0} },
			-- },
		-- },
		-- picture =
		-- {
			-- sheet =
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood-tank/cursed-tank.png",
				-- priority = "extra-high",
				-- frames = 1,
				-- width = 112,
				-- height = 112,
				-- shift = {0.4, 0.35},
				-- scale = 1.1
			-- }
		-- },
	-- },
-- }
-- )