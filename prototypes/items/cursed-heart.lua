
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-heart"
obj.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-heart.png"
obj.flags = {}
obj.subgroup = "cursed-item"
obj.stack_size = 500
obj.place_result = nil
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-heart",
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-heart.png",
		-- flags = {},
		-- subgroup = "cursed-item",
		-- order = "g[lab]-a[module]",
		-- stack_size = 500
	-- },
-- }
-- )
