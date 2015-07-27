
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-blood-tank"
obj.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-tank.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-blood-tank"
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-blood-tank",
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-tank.png",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "cursed-build",
		-- order = "c[splitter]-a[basic-splitter]",
		-- place_result = "cursed-blood-tank",
		-- stack_size = 10
	-- },
-- }
-- )