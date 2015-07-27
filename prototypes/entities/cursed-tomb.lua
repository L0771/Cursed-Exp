
local tomb = util.table.deepcopy(data.raw["container"]["wooden-chest"])
tomb.name = "cursed-tomb"
tomb.icon = "__Cursed-Exp__/graphics/icons/tomb/cursed-tomb.png"
tomb.flags = {}
tomb.minable = nil
tomb.inventory_size = 1
tomb.order = "c-v"
tomb.picture.filename ="__Cursed-Exp__/graphics/entities/tomb/cursed-tomb.png"
tomb.picture.width = 62
tomb.picture.height = 56
tomb.picture.shift = {0, 0}
data.raw[tomb.type][tomb.name] = tomb

-- data:extend(
-- {
	-- { 
	-- type = "container", 
	-- name = "cursed-tomb", 
	-- icon = "__Cursed-Exp__/graphics/icons/tomb/cursed-tomb.png", 
	-- flags = {"placeable-neutral"}, 
	-- max_health = 500, 
	-- corpse = "small-remnants", 
	-- fast_replaceable_group = "container", 
	-- collision_box = {{-0.35, -0.35}, {0.35, 0.35}}, 
	-- selection_box = {{-0.5, -0.5}, {0.5, 0.5}}, 
	-- inventory_size = 1, 
	-- order = "c[cursed]-v[tomb]", 
	-- picture = 
	-- { 
		-- filename = "__Cursed-Exp__/graphics/entities/tomb/cursed-tomb.png", 
		-- priority = "extra-high", 
		-- width = 62, 
		-- height = 56, 
		-- shift = {0, 0} 
	-- } 
	-- },

-- }
-- )