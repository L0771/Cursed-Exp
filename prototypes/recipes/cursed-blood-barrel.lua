data:extend(
{
	{
	type = "recipe",
	name = "fill-blood-barrel",
	category = "crafting-with-fluid",
	energy_required = 1,
	subgroup = "barrel",
	order = "b[fill-barrel]",
	icon = "__Cursed-Exp__/graphics/icons/barrel/fill-blood-barrel.png",
	ingredients =
		{
			{type="fluid", name= "blood", amount=25},
			{type="item", name="empty-barrel", amount=1},
		},
	results=
		{
			{type="item", name= "blood-barrel", amount=1}
		}
	},
	{
	type = "recipe",
	name = "empty-blood-barrel",
	category = "crafting-with-fluid",
	energy_required = 1,
	subgroup = "barrel",
	order = "c[empty-barrel]",
	icon = "__Cursed-Exp__/graphics/icons/barrel/empty-blood-barrel.png",
	ingredients =
		{
			{type="item", name= "blood-barrel", amount=1}
		},
	results=
		{
			{type="fluid", name= "blood", amount=25},
			{type="item", name="empty-barrel", amount=1}
		}
		},
}
)
