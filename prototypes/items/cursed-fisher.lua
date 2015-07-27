
local obj = util.table.deepcopy(data.raw["item"]["storage-tank"])
obj.name = "cursed-fisher-1"
obj.icon = "__Cursed-Exp__/graphics/icons/fisher/cursed-fisher.png"
obj.subgroup = "cursed-build"
obj.place_result = "cursed-fisher-1"
obj.stack_size = 50
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "item",
		-- name = "cursed-fisher-1",
		-- icon = "__Cursed-Exp__/graphics/icons/fisher/cursed-fisher.png",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "cursed-item",
		-- order = "g[lab]-a[module]",
		-- place_result = "cursed-fisher-1",
		-- stack_size = 50
	-- },
-- }
-- )