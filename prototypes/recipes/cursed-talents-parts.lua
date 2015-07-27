
for i = 1, 6 do
	local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
	obj.name = "cursed-talent-part-" .. i
	obj.icon = nil
	obj.category = "crafting"
	obj.enabled = "true"
	obj.energy_required = 5
	obj.ingredients = {}
	obj.ingredients[1] = {}
	obj.ingredients[1].type = "item"
	obj.ingredients[1].name = "cursed-heart"
	obj.ingredients[1].amount = 4
	obj.results = {}
	obj.results[1] = {}
	obj.results[1].type = "item"
	obj.results[1].name = "cursed-talent-part-" .. i
	obj.results[1].amount = 1
	obj.subgroup = nil
	obj.order = "tp" .. i
	data.raw[obj.type][obj.name] = obj
end


-- data:extend(
-- {
	-- { type = "recipe", name = "cursed-talent-part-1", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-01]", name="cursed-talent-part-1", amount=1}, }, },
	-- { type = "recipe", name = "cursed-talent-part-2", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-02]", name="cursed-talent-part-2", amount=1}, }, },
	-- { type = "recipe", name = "cursed-talent-part-3", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-03]", name="cursed-talent-part-3", amount=1}, }, },
	-- { type = "recipe", name = "cursed-talent-part-4", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-04]", name="cursed-talent-part-4", amount=1}, }, },
	-- { type = "recipe", name = "cursed-talent-part-5", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-05]", name="cursed-talent-part-5", amount=1}, }, },
	-- { type = "recipe", name = "cursed-talent-part-6", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-06]", name="cursed-talent-part-6", amount=1}, }, },
	-- -- { type = "recipe", name = "cursed-talent-part-7", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-07]", name="cursed-talent-part-7", amount=1}, }, },
	-- -- { type = "recipe", name = "cursed-talent-part-8", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-08]", name="cursed-talent-part-8", amount=1}, }, },
	-- -- { type = "recipe", name = "cursed-talent-part-9", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-09]", name="cursed-talent-part-9", amount=1}, }, },
	-- -- { type = "recipe", name = "cursed-talent-part-10", enabled = "true", category = "crafting", energy_required = 5, ingredients = { {type="item", name="cursed-heart", amount=4}, }, results= { {type="item", order = "a[cursed-talent-10]", name="cursed-talent-part-10", amount=1}, }, },

-- }
-- )