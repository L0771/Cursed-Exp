
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-player"
obj.icon = "__Cursed-Exp__/graphics/icons/player/cursed-player.png"
obj.flags = {}
obj.subgroup = "cursed-item"
obj.place_result = nil
obj.stack_size = 500
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-player",
		-- icon = "__Cursed-Exp__/graphics/icons/player/cursed-player.png",
		-- flags = {},
		-- subgroup = "cursed-item",
		-- order = "c[splitter]-a[basic-splitter]",
		-- stack_size = 500
	-- },
-- }
-- )
