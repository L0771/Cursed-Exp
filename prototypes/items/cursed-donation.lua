
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-donation"
obj.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-drop.png"
obj.subgroup = "cursed-item"
obj.place_result = "cursed-donation"
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-donation",
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-drop.png",
		-- flags = {"goes-to-quickbar"},
		-- damage_radius = 5,
		-- subgroup = "cursed-item",
		-- order = "b[planning-tool]",
		-- place_result = "cursed-donation",
		-- stack_size = 500
	-- },
-- }
-- )