
local donation = util.table.deepcopy(data.raw["decorative"]["brown-asterisk"])
donation.name = "cursed-donation"
donation.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-drop.png"
donation.collision_mask = {}
donation.subgroup = "cursed-item"
donation.order = "b-b"
donation.selectable_in_game = false
donation.render_layer = "radius-visualization"
donation.autoplace = nil
donation.pictures =
	{
		{
			filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood-drop.png",
			width = 32,
			height = 54,
		}
	}
data.raw[donation.type][donation.name] = donation

-- data:extend(
-- {
	-- {
		-- type = "decorative",
		-- name = "cursed-donation",
		-- flags = {"not-on-map", "placeable-off-grid"},
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-drop.png",
		-- collision_mask = {},
		-- subgroup = "cursed-item",
		-- order = "b[decorative]-b[planning-tool]",
		-- selectable_in_game = false,
		-- render_layer = "radius-visualization",
		-- pictures =
		-- {
			-- {
				-- filename = "__Cursed-Exp__/graphics/entities/blood/cursed-blood-drop.png",
				-- width = 32,
				-- height = 54,
			-- }
		-- }
	-- },
-- }
-- )