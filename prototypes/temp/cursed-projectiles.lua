data:extend(
{
	{
		type = "projectile",
		name = "arrow-projectile-1",
		flags = {"not-on-map"},
		collision_box = {{-0.05, -1.1}, {0.05, 1.1}},
		acceleration = 0.005,
		piercing_damage = 300,
		animation =
		{
			filename = "__Cursed-Exp__/graphics/entities/arrow/arrow-projectile-1.png",
			frame_count = 1,
			width = 5,
			height = 28,
			priority = "high"
		},
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = { amount = 5 , type = "physical"}
					},
					{
						type = "damage",
						damage = { amount = 3.5 , type = "impact"}
					}
				}
			}
		}
	},
}
)
