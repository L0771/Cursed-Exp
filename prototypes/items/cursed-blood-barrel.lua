
local barrel = util.table.deepcopy(data.raw["item"]["crude-oil-barrel"])
barrel.name = "blood-barrel"
barrel.icon = "__Cursed-Exp__/graphics/icons/barrel/blood-barrel.png"
barrel.flags = {}
barrel.stack_size = 100
barrel.subgroup = "cursed-item"
data.raw[barrel.type][barrel.name] = barrel

-- data:extend(
-- {
	-- {
	-- type = "item",
	-- name = "blood-barrel",
	-- icon = "__Cursed-Exp__/graphics/icons/barrel/blood-barrel.png",
	-- flags = {},
	-- subgroup = "cursed-item",
	-- order = "b[barrel]",
	-- stack_size = 100
	-- },
-- })
