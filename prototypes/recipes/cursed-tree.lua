local tf
if data.raw.item["germling"] then
	tf = "germling"
elseif data.raw.item["tf-germling"] then
	tf = "tf-germling"
else
	tf = "you_needs_a-version_of_TreeFarm_or_your_version_of_factorio_is_lower_than_0.11.13"
end

data:extend(
{
	{
		type = "recipe",
		name = "cursed-tree-00",
		icon = "__Cursed-Exp__/graphics/icons/tree/cursed-tree-seed.png",
		category = "advanced-crafting",
		enabled = "true",
		energy_required = 15,
		ingredients =
		{
			{type="item", name= tf, amount=1},
			{type="fluid", name="blood", amount=1},
		},
		results = 
		{
			{type="item", name="cursed-tree-00", amount=1}
		},
	},
}
)
