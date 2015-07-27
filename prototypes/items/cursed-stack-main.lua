
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-stack-main"
obj.place_result = nil
obj.stack_size = 1
obj.subgroup = "cursed-item"
obj.flags = {}
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-stack-main",
		-- icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		-- flags = {},
		-- subgroup = "cursed-item",
		-- order = "c[splitter]-a[basic-splitter]",
		-- stack_size = 1
	-- },
-- }
-- )
