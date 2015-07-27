
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-tree-00"
obj.icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png"
obj.category = "advanced-crafting"
obj.enabled = "true"
obj.energy_required = 5
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "item"
obj.ingredients[1].name = "tf-germling"
obj.ingredients[1].amount = 1
obj.ingredients[2] = {}
obj.ingredients[2].type = "fluid"
obj.ingredients[2].name = "blood"
obj.ingredients[2].amount = 1
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-tree-00"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj

-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-tree-00",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- category = "advanced-crafting",
		-- enabled = "true",
		-- energy_required = 15,
		-- ingredients =
		-- {
			-- {type="item", name= "tf-germling", amount=1},
			-- {type="fluid", name="blood", amount=1},
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-tree-00", amount=1}
		-- },
	-- },
-- }
-- )
