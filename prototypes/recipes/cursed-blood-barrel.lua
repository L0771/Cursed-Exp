
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "fill-blood-barrel"
obj.icon = "__Cursed-Exp__/graphics/icons/barrel/fill-blood-barrel.png"
obj.category = "crafting-with-fluid"
obj.enabled = "true"
obj.energy_required = 1
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "empty-barrel"
obj.ingredients[1].amount = 1
obj.ingredients[2] = {}
obj.ingredients[2].type = "fluid"
obj.ingredients[2].name = "blood"
obj.ingredients[2].amount = 25
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "blood-barrel"
obj.results[1].amount = 1
obj.subgroup = "barrel"
obj.order = nil
data.raw[obj.type][obj.name] = obj

local objn = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
objn.name = "empty-blood-barrel"
objn.icon = "__Cursed-Exp__/graphics/icons/barrel/empty-blood-barrel.png"
objn.category = "crafting-with-fluid"
objn.enabled = "true"
objn.energy_required = 1
objn.ingredients = {}
objn.ingredients[1] = {}
objn.ingredients[1].type = "item"
objn.ingredients[1].name = "blood-barrel"
objn.ingredients[1].amount = 1
objn.results = {}
objn.results[1] = {}
objn.results[1].type = "item"
objn.results[1].name = "empty-barrel"
objn.results[1].amount = 1
objn.results[2] = {}
objn.results[2].type = "fluid"
objn.results[2].name = "blood"
objn.results[2].amount = 25
objn.subgroup = "barrel"
objn.order = nil
data.raw[objn.type][objn.name] = objn


-- data:extend(
-- {
	-- {
	-- type = "recipe",
	-- name = "fill-blood-barrel",
	-- category = "crafting-with-fluid",
	-- energy_required = 1,
	-- subgroup = "barrel",
	-- order = "b[fill-barrel]",
	-- icon = "__Cursed-Exp__/graphics/icons/barrel/fill-blood-barrel.png",
	-- ingredients =
		-- {
			-- {type="fluid", name= "blood", amount=25},
			-- {type="item", name="empty-barrel", amount=1},
		-- },
	-- results=
		-- {
			-- {type="item", name= "blood-barrel", amount=1}
		-- }
	-- },
	-- {
	-- type = "recipe",
	-- name = "empty-blood-barrel",
	-- category = "crafting-with-fluid",
	-- energy_required = 1,
	-- subgroup = "barrel",
	-- order = "c[empty-barrel]",
	-- icon = "__Cursed-Exp__/graphics/icons/barrel/empty-blood-barrel.png",
	-- ingredients =
		-- {
			-- {type="item", name= "blood-barrel", amount=1}
		-- },
	-- results=
		-- {
			-- {type="fluid", name= "blood", amount=25},
			-- {type="item", name="empty-barrel", amount=1}
		-- }
		-- },
-- }
-- )
