
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-generator-0"
obj.icon = nil
obj.category = nil
obj.enabled = "true"
obj.energy_required = 15
obj.ingredients = {}
for i = 1, 6 do
	obj.ingredients[i] = {}
	obj.ingredients[i].type = "item"
end
obj.ingredients[1].name = "cursed-incubator"
obj.ingredients[1].amount = 4
obj.ingredients[2].name = "steel-plate"
obj.ingredients[2].amount = 25
obj.ingredients[3].name = "iron-plate"
obj.ingredients[3].amount = 50
obj.ingredients[4].name = "copper-plate"
obj.ingredients[4].amount = 50
obj.ingredients[5].name = "basic-accumulator"
obj.ingredients[5].amount = 10
obj.ingredients[6].name = "alien-artifact"
obj.ingredients[6].amount = 20
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-generator-0"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-generator-0",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {"cursed-incubator", 4},
			-- {"steel-plate", 25},
			-- {"iron-plate", 50},
			-- {"copper-plate", 50},
			-- {"basic-accumulator", 10},
			-- {"alien-artifact", 20},
		-- },
		-- result = "cursed-generator-0"
	-- },
-- }
-- )