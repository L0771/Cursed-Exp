
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-blood"
obj.icon = nil
obj.category = "crafting-with-fluid"
obj.enabled = "true"
obj.energy_required = 5
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "cursed-heart"
obj.ingredients[1].amount = 1
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "fluid"
obj.results[1].name = "blood"
obj.results[1].amount = 2.5
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-blood",
		-- category = "crafting-with-fluid",
		-- enabled = "true",
		-- energy_required = 5,
		-- ingredients =
		-- {
			-- {type="item", name="cursed-heart", amount=1}
		-- },
		-- results =
		-- {
			-- {type="fluid", name="blood", amount=2}
		-- },
	-- },
-- }
-- )
