data:extend(
{
	{
		type = "recipe",
		name = "cursed-ammo1-2",
		enabled = "true",
		category = "cursed-nocraftmachine",
		energy_required = 5,
		ingredients =
		{
			--	  {type="item", name="iron-stick", amount=10},
		},
		results = 
		{
			{type="item", name="cursed-ammo1", amount=1},
		},
	},
	{
		type = "recipe",
		name = "cursed-ammo1-1",
		enabled = "true",
		category = "advanced-crafting",
		energy_required = 15,
		ingredients =
		{
			{type="fluid", name="blood", amount=5},
		},
		results = 
		{
			{type="item", name="cursed-ammo1", amount=1},
		},
	},
}
)
