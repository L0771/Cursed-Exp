
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-player"
obj.icon = nil
obj.category = "cursed-body"
obj.enabled = "true"
obj.energy_required = 180
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "cursed-heart"
obj.ingredients[1].amount = 1
obj.ingredients[2] = {}
obj.ingredients[2].type = "fluid"
obj.ingredients[2].name = "blood"
obj.ingredients[2].amount = 5000
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-player"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj

-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-player",
		-- category = "cursed-body",
		-- enabled = "true",
		-- energy_required = 90,
		-- ingredients =
		-- {
			-- {type="fluid", name="blood", amount=15000},
			-- {type="item", name="cursed-heart", amount=1},
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-player", amount=1}
		-- },
	-- },
-- }
-- )
