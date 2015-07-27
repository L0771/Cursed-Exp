
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-heart"
obj.icon = nil
obj.category = "crafting-with-fluid"
obj.enabled = "true"
obj.energy_required = 15
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "fluid"
obj.ingredients[1].name = "blood"
obj.ingredients[1].amount = 2.5
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-heart"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-heart",
		-- category = "crafting-with-fluid",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {type="fluid", name="blood", amount=2.5},
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-heart", amount=1}
		-- },
	-- },
-- }
-- )
