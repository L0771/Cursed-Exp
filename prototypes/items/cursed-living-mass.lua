
local obj = util.table.deepcopy(data.raw["fluid"]["crude-oil"])
obj.name = "living-mass"
obj.icon = "__Cursed-Exp__/graphics/icons/living-mass/living-mass-fluid.png"
obj.subgroup = "cursed-item"
obj.default_temperature = 5
obj.heat_capacity = "0.001J"
obj.base_color = {r=0.25, g=0.25, b=0.25}
obj.flow_color = {r=0.25, g=0.25, b=0.25}
obj.max_temperature = 20
obj.pressure_to_speed_ratio = 10
obj.flow_to_energy_ratio = 0.001
data.raw[obj.type][obj.name] = obj


-- data:extend(
-- {
	-- {
		-- type = "fluid",
		-- name = "living-mass",
		-- default_temperature = 5,
		-- max_temperature = 20,
		-- heat_capacity = "0.001J",
		-- base_color = {r=0.25, g=0.25, b=0.25},
		-- flow_color = {r=0.25, g=0.25, b=0.25},
		-- icon = "__Cursed-Exp__/graphics/icons/living-mass/living-mass-fluid.png",
		-- order = "a[fluid]-a[water]",
		-- subgroup = "cursed-item",
		-- pressure_to_speed_ratio = 10,
		-- flow_to_energy_ratio = 0.001,
	-- }
-- })
