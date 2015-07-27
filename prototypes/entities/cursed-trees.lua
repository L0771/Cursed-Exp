
for i = 0, datos.maxtrees do
	local tree = util.table.deepcopy(data.raw["tree"]["dry-tree"])
	tree.name = "cursed-tree-0" .. i
	tree.icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png"
	tree.order = "b-b-g"
	tree.flags = {"placeable-neutral"}
	tree.minable.mining_time = (i + 1)
	tree.minable.result = "cursed-tree-00"
	if i == 4 then
		tree.minable.result = "cursed-heart"
	end
	tree.minable.count = 1
	tree.emissions_per_tick = 0.0005 * (5 * (i + 1))
	if i == 4 then
		tree.emissions_per_tick = 0
	end
	tree.max_health = 25 * (i + 1)
	tree.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
	tree.selection_box = {{-0.5, -1.5}, {0.5, 0.5}}
	if i == 0 then
		tree.collision_box = {{-0.01, -0.01}, {0.01, 0.01}}
		tree.selection_box = {{-0.1, -0.1}, {0.1, 0.1}}
	end
	tree.pictures = {}
	tree.pictures[1] = {}
	tree.pictures[1].filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-0" .. i .. ".png"
	if i == 0 then
		tree.pictures[1].width = 32
		tree.pictures[1].height = 32
		tree.pictures[1].scale = 0.5
		tree.pictures[1].shift = {0.0, 0.0}
	elseif i == 1 then
		tree.pictures[1].width = 300
		tree.pictures[1].height = 150
		tree.pictures[1].scale = 0.6
		tree.pictures[1].shift = {2.2, -0.9}
	elseif i == 2 then
		tree.pictures[1].width = 300
		tree.pictures[1].height= 150
		tree.pictures[1].scale = 0.7
		tree.pictures[1].shift = {1.8, -1.3}
	elseif i == 3 then
		tree.pictures[1].width = 300
		tree.pictures[1].height= 200
		tree.pictures[1].scale = 0.7
		tree.pictures[1].shift = {1.9, -0.45}
	elseif i == 4 then
		tree.pictures[1].width = 300
		tree.pictures[1].height= 200
		tree.pictures[1].scale = 0.9
		tree.pictures[1].shift = {2.5, -1}
	end
	if i == 4 then
		tree.autoplace =
			{
				order = "b-a",
				peaks =
				{
					{
					influence = 0.0005
					},
				{
				influence = 0.002,
				min_influence = 0,
				max_influence = 0.0015,
				noise_persistence = 0.75,
				}
				}
			}
	else
		tree.autoplace = nil
	end
	data.raw[tree.type][tree.name] = tree
end


-- data:extend(
-- {
	-- {
		-- type = "tree",
		-- name = "cursed-tree-00",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- order = "b-b-g",
		-- flags = {"placeable-neutral"},
		-- minable =
		-- {
			-- mining_particle = "wooden-particle",
			-- mining_time = 1,
			-- --mining_time = 2.5,
			-- result = "cursed-tree-00",
			-- count = 1
		-- },
		-- emissions_per_tick = 0.0005,
		-- max_health = 50,
		-- collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
		-- selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
		-- drawing_box = {{0.0, 0.0}, {1.0, 1.0}},
		-- pictures =
		-- {
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-00.png",
				-- priority = "extra-high",
				-- width = 32,
				-- height = 32,
				-- scale = 0.5,
				-- shift = {0.0, 0.0}
			-- }
		-- } 
	-- },
	-- {
	-- type = "tree",
	-- name = "cursed-tree-01",
	-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
	-- flags = {"placeable-neutral", "placeable-off-grid"},
	-- minable =
	-- {
		-- mining_particle = "wooden-particle",
		-- mining_time = 2,
		-- --mining_time = 3.75,
		-- result = "cursed-tree-00",
		-- count = 1
	-- },
	-- emissions_per_tick = 0.001,
	-- max_health = 75,
	-- collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	-- selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
	-- subgroup = "trees",
	-- order = "a[tree]-d[cursed-tree]",
	-- pictures =
	-- {
		-- {
		-- filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-01.png",
		-- width = 300,
		-- height= 150,
		-- scale = 0.6,
		-- shift = {2.2, -0.9}
		-- }
	-- }
	-- },
	-- {
		-- type = "tree",
		-- name = "cursed-tree-02",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- flags = {"placeable-neutral", "placeable-off-grid"},
		-- minable =
		-- {
			-- mining_particle = "wooden-particle",
			-- mining_time = 3,
			-- --mining_time = 5,
			-- result = "cursed-tree-00",
			-- count = 1
		-- },
		-- emissions_per_tick = 0.005,
		-- max_health = 100,
		-- collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		-- selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		-- subgroup = "trees",
		-- order = "a[tree]-d[cursed-tree]",
		-- pictures =
		-- {
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-02.png",
				-- width = 300,
				-- height= 150,
				-- scale = 0.7,
				-- shift = {1.8, -1.3}
			-- }
		-- }
	-- },
	-- {
		-- type = "tree",
		-- name = "cursed-tree-03",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- flags = {"placeable-neutral", "placeable-off-grid"},
		-- minable =
		-- {
			-- mining_particle = "wooden-particle",
			-- mining_time = 4,
			-- --mining_time = 6.25,
			-- result = "cursed-tree-00",
			-- count = 1
		-- },
		-- emissions_per_tick = 0.01,
		-- max_health = 150,
		-- collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		-- selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		-- subgroup = "trees",
		-- order = "a[tree]-d[cursed-tree]",
		-- pictures =
		-- {
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-03.png",
				-- width = 300,
				-- height= 200,
				-- scale = 0.7,
				-- shift = {1.9, -0.45}
			-- }
		-- }
	-- },
	-- {
		-- type = "tree",
		-- name = "cursed-tree-04",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- flags = {"placeable-neutral", "placeable-off-grid"},
		-- minable =
		-- {
			-- mining_particle = "wooden-particle",
			-- mining_time = 5,
			-- --mining_time = 7.5,
			-- result = "cursed-heart",
			-- count = 1
		-- },
		-- emissions_per_tick = 0,
		-- max_health = 200,
		-- collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		-- selection_box = {{-0.5, -1.5}, {0.5, 0.5}},
		-- subgroup = "trees",
		-- order = "a[tree]-d[cursed-tree]",
		-- autoplace =
		-- {
			-- order = "b[tree]-a[random]",
			-- peaks =
			-- {
				-- {
				-- influence = 0.0005
				-- },
			-- {
			-- influence = 0.002,
			-- min_influence = 0,
			-- max_influence = 0.0015,
			-- -- noise_layer = "trees",
			-- noise_persistence = 0.75,--0.5,
			-- }
			-- }
		-- },
		-- pictures =
		-- {
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/tree/cursed-tree-04.png",
				-- width = 300,
				-- height= 200,
				-- scale = 0.9,
				-- shift = {2.5, -1}
			-- }
		-- }
	-- },
-- })
