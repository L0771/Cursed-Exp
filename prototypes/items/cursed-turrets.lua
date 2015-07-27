
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-turret-1"
obj.icon = "__Cursed-Exp__/graphics/icons/turret/cursed-turret-1.jpg"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-turret-1"
obj.stack_size = 50
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-turret-1",
		-- icon = "__Cursed-Exp__/graphics/icons/turret/cursed-turret-1.jpg",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "defensive-structure",
		-- order = "b-m-d", 
		-- place_result = "cursed-turret-1",
		-- stack_size = 50
	-- },
-- }
-- )