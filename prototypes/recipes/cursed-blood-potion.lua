
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-blood-potion"
obj.icon = nil
obj.category = "crafting"
obj.enabled = "true"
obj.energy_required = 10
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "cursed-heart"
obj.ingredients[1].amount = 1
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-blood-potion"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-blood-potion",
		-- category = "crafting",
		-- enabled = "true",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {type="item", name="cursed-heart", amount=1}
		-- },
		-- results =
		-- {
			-- {type="item", name="cursed-blood-potion", amount=1}
		-- },
	-- },
-- }
-- )
