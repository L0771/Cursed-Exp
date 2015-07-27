
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-drill-1"
obj.icon = "__Cursed-Exp__/graphics/icons/drill/cursed-drill.jpg"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-drill-1"
obj.stack_size = 50
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-drill-1",
		-- icon = "__Cursed-Exp__/graphics/icons/drill/cursed-drill.jpg",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "extraction-machine",
		-- order = "b-m-d", 
		-- place_result = "cursed-drill-1",
		-- stack_size = 50
	-- },
-- }
-- )