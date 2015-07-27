
local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-donation"
obj.icon = nil
obj.category = "cursed-nocraftmachine"
obj.enabled = "true"
obj.energy_required = 10
obj.ingredients = {}
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-donation"
obj.results[1].amount = 1
obj.subgroup = nil
obj.order = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-donation",
		-- category = "cursed-nocraftmachine",
		-- enabled = "true",
		-- energy_required = 10,
		-- ingredients =
		-- {
			
		-- },
		-- results = 
		-- {
			-- {type="item", name="cursed-donation", amount=1}
		-- },
	-- },
-- }
-- )