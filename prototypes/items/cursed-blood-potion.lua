
local potion = util.table.deepcopy(data.raw["capsule"]["raw-fish"])
potion.name = "cursed-blood-potion"
potion.icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-potion.png"
potion.subgroup = "cursed-item"
potion.capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage.amount = -50
data.raw[potion.type][potion.name] = potion


-- data:extend(
-- {
	-- {
		-- type = "capsule",
		-- name = "cursed-blood-potion",
		-- icon = "__Cursed-Exp__/graphics/icons/blood/cursed-blood-potion.png",
		-- flags = {"goes-to-quickbar"},
		-- subgroup = "cursed-item",
		-- capsule_action =
		-- {
			-- type = "use-on-self",
			-- attack_parameters =
			-- {
				-- ammo_category = "capsule",
				-- cooldown = 5*60,
				-- range = 0,
				-- ammo_type =
				-- {
					-- category = "capsule",
					-- target_type = "position",
					-- action =
					-- {
						-- type = "direct",
						-- action_delivery =
						-- {
							-- type = "instant",
							-- target_effects = 
							-- {
								-- type = "damage",
								-- damage = {type = "physical", amount = -20}
							-- }
						-- }
					-- }
				-- }
			-- }
		-- },
		-- order = "f-e-a",
		-- stack_size = 100
	-- },
-- }
-- )
