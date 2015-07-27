
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-exchange"
obj.icon = nil
obj.category = nil
obj.enabled = "true"
obj.energy_required = 15
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "steel-plate"
obj.ingredients[1].amount = 5
obj.ingredients[2] = {}
obj.ingredients[2].type = "item"
obj.ingredients[2].name = "assembling-machine-2"
obj.ingredients[2].amount = 1
obj.ingredients[3] = {}
obj.ingredients[3].type = "item"
obj.ingredients[3].name = "steel-chest"
obj.ingredients[3].amount = 1
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-exchange"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-exchange",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {"steel-plate", 5},
			-- {"assembling-machine-2", 1},
			-- {"steel-chest", 1},
		-- },
		-- result = "cursed-exchange"
	-- },
-- }
-- )