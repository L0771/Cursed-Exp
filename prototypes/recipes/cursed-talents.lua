
for i = 1, 6 do
	for j = 1, 6 do
		if i ~= j then
			local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
			obj.name = "cursed-talent-" .. i .. "-to-" .. j
			obj.icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-" .. i .. "-to-" .. j .. ".png"
			obj.category = "cursed-talent"
			obj.enabled = "true"
			obj.energy_required = 10
			obj.ingredients = {}
			obj.ingredients[1] = {}
			obj.ingredients[1].type = "item"
			obj.ingredients[1].name = "cursed-talent-" .. i
			if i < j then
				obj.ingredients[1].amount = 5 * (2 ^ ((j - i) - 1) )
			elseif i > j then
				obj.ingredients[1].amount = 1
			end
			obj.results = {}
			obj.results[1] = {}
			obj.results[1].type = "item"
			obj.results[1].name = "cursed-talent-" .. j
			if i < j then
				obj.results[1].amount = 1
			elseif i > j then
				obj.results[1].amount = 2 * ( 2 ^ (( i - j) - 1) )
			end
			if i < j then
				obj.subgroup = "cursed-talent-upgrade"
			else
				obj.subgroup = "cursed-talent-downgrade"
			end
			obj.order = "t" .. i  .. "- ".. j
			data.raw[obj.type][obj.name] = obj
		end
	end
end

local obj = util.table.deepcopy(data.raw["recipe"]["basic-oil-processing"])
obj.name = "cursed-talent-create-1"
obj.icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-r.png"
obj.category = "cursed-talent"
obj.enabled = "true"
obj.energy_required = 10
obj.ingredients = {}
for i = 1, 6 do
	obj.ingredients[i] = {}
	obj.ingredients[i].type = "item"
	obj.ingredients[i].name = "cursed-talent-part-" .. i
	obj.ingredients[i].amount = 1
end
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-talent-1"
obj.results[1].amount = 1
obj.subgroup = "cursed-talent-1"
data.raw[obj.type][obj.name] = obj

local obj = util.table.deepcopy(data.raw["recipe"]["cursed-talent-create-1"])
obj.name = "cursed-talent-create-2"
obj.icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-r.png"
obj.ingredients = {}
obj.ingredients[1] = {}
obj.ingredients[1].type = "fluid"
obj.ingredients[1].name = "blood"
obj.ingredients[1].amount = 50
obj.results = {}
obj.results[1] = {}
obj.results[1].type = "item"
obj.results[1].name = "cursed-talent-1"
obj.results[1].amount = 1
data.raw[obj.type][obj.name] = obj
	
	
-- data:extend(
-- {
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-1-to-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-to-2.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-1-2]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-1", 5},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-2", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-1-to-3",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-to-3.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-1-3]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-1", 10},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-3", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-1-to-4",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-to-4.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-1-4]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-1", 20},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-4", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-1-to-5",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-to-5.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-1-5]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-1", 40},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-5", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-1-to-6",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1-to-6.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-1-6]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-1", 80},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-6", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-2-to-3",
			-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2-to-3.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-2-3]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-2", 5},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-3", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-2-to-4",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2-to-4.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-2-4]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-2", 10},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-4", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-2-to-5",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2-to-5.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-2-5]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-2", 20},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-5", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-2-to-6",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2-to-6.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-2-6]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-2", 40},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-6", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-3-to-4",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3-to-4.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-3-4]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-3", 5},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-4", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-3-to-5",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3-to-5.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-3-5]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-3", 10},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-5", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-3-to-6",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3-to-6.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-3-6]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-3", 20},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-6", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-4-to-5",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4-to-5.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-4-5]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-4", 5},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-5", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-4-to-6",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4-to-6.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-4-6]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-4", 10},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-6", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-5-to-6",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5-to-6.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-5-6]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-5", 5},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-6", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-6-to-5",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6-to-5.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-6-5]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-6", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-5", amount=2},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-6-to-4",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6-to-4.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-6-4",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-6", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-4", amount=4},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-6-to-3",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6-to-3.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-6-3]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-6", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-3", amount=8},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-6-to-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6-to-2.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-6-2]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-6", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-2", amount=16},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-6-to-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-6-to-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-6-1]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-6", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=32},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-5-to-4",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5-to-4.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-5-4]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-5", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-4", amount=2},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-5-to-3",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5-to-3.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-5-3]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-5", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-3", amount=4},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-5-to-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5-to-2.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-5-2]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-5", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-2", amount=8},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-5-to-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-5-to-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-5-1]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-5", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=16},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-4-to-3",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4-to-3.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-4-3]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-4", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-3", amount=2},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-4-to-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4-to-2.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-4-2]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-4", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-2", amount=4},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-4-to-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-4-to-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-4-1]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-4", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=8},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-3-to-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3-to-2.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-3-2]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-3", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-2", amount=2},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-3-to-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-3-to-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-3-1]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-3", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=4},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-2-to-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-2-to-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-2-1]",
		-- energy_required = 10,
		-- ingredients =
		-- {
			-- {"cursed-talent-2", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=2},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-create-1",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-9]",
		-- energy_required = 1,
		-- ingredients =
		-- {
			-- {"cursed-talent-part-1", 1},
			-- {"cursed-talent-part-2", 1},
			-- {"cursed-talent-part-3", 1},
			-- {"cursed-talent-part-4", 1},
			-- {"cursed-talent-part-5", 1},
			-- {"cursed-talent-part-6", 1},
			-- -- {"cursed-talent-part-7", 1},
			-- -- {"cursed-talent-part-8", 1},
			-- -- {"cursed-talent-part-9", 1},
			-- -- {"cursed-talent-part-10", 1},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=1},
		-- },
	-- },
	-- {
		-- type = "recipe",
		-- name = "cursed-talent-create-2",
		-- icon = "__Cursed-Exp__/graphics/icons/talents/cursed-talent-1.png",
		-- enabled = "true",
		-- category = "cursed-talent",
		-- order = "a[cursed-talent-9]",
		-- energy_required = 1,
		-- ingredients =
		-- {
			-- {type="fluid", name="blood", amount=100},
		-- },
		-- results=
		-- {
			-- {type="item", name="cursed-talent-1", amount=1},
		-- },
	-- },
-- }
-- )