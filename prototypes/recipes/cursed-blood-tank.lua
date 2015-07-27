
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-blood-tank"
obj.icon = nil
obj.category = "crafting"
obj.enabled = "true"
obj.energy_required = 15
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "pipe"
obj.ingredients[1].amount = 16
obj.ingredients[2] = {}
obj.ingredients[2].type = "item"
obj.ingredients[2].name = "iron-plate"
obj.ingredients[2].amount = 15
obj.ingredients[3] = {}
obj.ingredients[3].type = "item"
obj.ingredients[3].name = "electronic-circuit"
obj.ingredients[3].amount = 20
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-blood-tank"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-blood-tank",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {"pipe", 16},
			-- {"iron-plate", 15},
			-- {"electronic-circuit", 20},
		-- },
		-- result = "cursed-blood-tank"
	-- },
-- }
-- )