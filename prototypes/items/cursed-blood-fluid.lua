
local blood = util.table.deepcopy(data.raw["fluid"]["crude-oil"])
blood.name = "blood"
blood.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-fluid.png"
blood.default_temperature = 5
blood.max_temperature = 40
blood.heat_capacity = "0.001J"
blood.base_color = {r=0.75, g=0, b=0}
blood.flow_color = {r=0.75, g=0, b=0}
blood.order = "a[fluid]-a[water]"
blood.subgroup = "cursed-item"
blood.flow_to_energy_ratio = 0.001
data.raw[blood.type][blood.name] = blood

-- data:extend(
-- {
	-- {
		-- type = "fluid",
		-- name = "blood",
		-- default_temperature = 5,
		-- max_temperature = 20,
		-- heat_capacity = "0.001J",
		-- base_color = {r=0.75, g=0, b=0},
		-- flow_color = {r=0.75, g=0, b=0},
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-fluid.png",
		-- order = "a[fluid]-a[water]",
		-- subgroup = "cursed-item",
		-- pressure_to_speed_ratio = 0.5,
		-- flow_to_energy_ratio = 0.001,
	-- }
-- })
