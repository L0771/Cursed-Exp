data:extend(
{
	{
		type = "ammo",
		name = "cursed-ammo1-1",
		icon = "__Cursed-Exp__/graphics/icons/arrow/cursed-ammo1-1.jpg",
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			category = "arrow",
			target_type = "direction",
			source_effects =
			{
				type = "create-entity",
				entity_name = "explosion-gunshot"
				},
					action =
					{
						type = "direct",
						action_delivery =
					{
					type = "projectile",
					projectile = "arrow-projectile-1",
					starting_speed = 0.2,
					direction_deviation = 0,
					range_deviation = 0,
					max_range = 30
				}
			},
		},
		magazine_size = 10,
		subgroup = "cursed-item",
		order = "c[ammo]",
		stack_size = 500
	},
}
)
