
data:extend(
{
	{
		type = "fluid",
		name = "blood",
		default_temperature = 5,
		max_temperature = 20,
		heat_capacity = "0.001J",
		base_color = {r=0.75, g=0, b=0},
		flow_color = {r=0.75, g=0, b=0},
		icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-fluid.png",
		order = "a[fluid]-a[water]",
		subgroup = "cursed-item",
		pressure_to_speed_ratio = 0.05,
		flow_to_energy_ratio = 0.001,
	}
})
