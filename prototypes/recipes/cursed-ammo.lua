
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-arrow-1"
obj.icon = nil
obj.category = "cursed-nocraftmachine"
obj.enabled = "true"
obj.energy_required = 5
obj.ingredients = {}
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-arrow"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj

local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-arrow"
obj.icon = nil
obj.category = "advanced-crafting"
obj.enabled = "true"
obj.energy_required = 5
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "fluid"
obj.ingredients[1].name = "blood"
obj.ingredients[1].amount = 2.5
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-arrow"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-arrow-1",
		-- enabled = "true",
		-- category = "cursed-nocraftmachine",
		-- energy_required = 5,
		-- ingredients =
		-- {
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-arrow", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-arrow",
		-- enabled = "true",
		-- category = "advanced-crafting",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {type="fluid", name="blood", amount=5},
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-arrow", amount=1},
		-- },
	-- },
-- }
-- )
