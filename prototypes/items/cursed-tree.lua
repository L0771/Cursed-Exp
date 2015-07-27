
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-tree-00"
obj.icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png"
obj.subgroup = "cursed-item"
obj.fuel_value = "1J"
obj.place_result = "cursed-tree-00"
obj.stack_size = 50
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-tree-00",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "cursed-item",
		-- fuel_value = "1J",
		-- order = "c[splitter]-a[basic-splitter]",
		-- place_result = "cursed-tree-00",
		-- stack_size = 50
	-- },
-- }
-- )
