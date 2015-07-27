
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-wall-base"
obj.icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-wall-base-1"
obj.stack_size = 50
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-wall-base",
		-- icon = "__Cursed-Exp__/graphics/icons/wall/cursed-wall-base.png",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "cursed-build",
		-- order = "g[lab]-a[module]",
		-- place_result = "cursed-wall-base-1",
		-- stack_size = 50
	-- },
-- }
-- )