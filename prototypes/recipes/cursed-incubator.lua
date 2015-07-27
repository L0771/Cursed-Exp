
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-incubator"
obj.icon = nil
obj.category = "crafting"
obj.enabled = "true"
obj.energy_required = 15
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "steel-plate"
obj.ingredients[1].amount = 10
obj.ingredients[2] = {}
obj.ingredients[2].type = "item"
obj.ingredients[2].name = "assembling-machine-2"
obj.ingredients[2].amount = 1
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-incubator"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-incubator",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {"steel-plate", 10},
			-- {"assembling-machine-2", 1},
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-incubator", amount=1}
		-- },
	-- },
-- }
-- )