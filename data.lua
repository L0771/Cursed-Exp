require("prototypes.groups")
-- require("gui.font")
require("gui.style")

for _,v in pairs(data.raw["player"]) do
   v.crafting_categories[#v.crafting_categories + 1] = "cursed-nocraftmachine"
end
for _, animation in ipairs(data.raw["player"]["player"]["animations"]) do
	if animation.armors then
		for _, armor in ipairs(animation.armors) do
			if armor == "basic-armor" then
				for i = 37, 74 do
					animation.armors[#animation.armors + 1] = "cursed-armor-" .. i
				end
			end
			if armor == "basic-modular-armor" then
				for i = 75, 110 do
					animation.armors[#animation.armors + 1] = "cursed-armor-" .. i
				end
			end
		end
	end
end

		--[[Entities]]--
require("prototypes.entities.cursed-base")
require("prototypes.entities.cursed-blood")
require("prototypes.entities.cursed-blood-tank")
require("prototypes.entities.cursed-donation")
require("prototypes.entities.cursed-drills")
require("prototypes.entities.cursed-exchanges")
require("prototypes.entities.cursed-minions")
require("prototypes.entities.cursed-trees")
require("prototypes.entities.cursed-tomb")
require("prototypes.entities.cursed-turrets")
require("prototypes.entities.cursed-vault")
require("prototypes.entities.cursed-wall-base")

		--[[Items]]--
require("prototypes.items.cursed-ammo")
require("prototypes.items.cursed-armors")
require("prototypes.items.cursed-axes")
require("prototypes.items.cursed-blood-barrel")
require("prototypes.items.cursed-blood-fluid")
require("prototypes.items.cursed-blood-potion")
require("prototypes.items.cursed-blood-tank")
require("prototypes.items.cursed-bows")
require("prototypes.items.cursed-donation")
require("prototypes.items.cursed-drill")
require("prototypes.items.cursed-exchanges")
require("prototypes.items.cursed-heart")
require("prototypes.items.cursed-living-mass")
require("prototypes.items.cursed-player")
require("prototypes.items.cursed-stack-main")
require("prototypes.items.cursed-talents")
require("prototypes.items.cursed-talents-parts")
require("prototypes.items.cursed-tree")
require("prototypes.items.cursed-turrets")
require("prototypes.items.cursed-vault")
require("prototypes.items.cursed-wall-base")

		--[[Recipes]]--
require("prototypes.recipes.cursed-ammo")
require("prototypes.recipes.cursed-blood")
require("prototypes.recipes.cursed-blood-barrel")
require("prototypes.recipes.cursed-blood-potion")
require("prototypes.recipes.cursed-blood-tank")
require("prototypes.recipes.cursed-donation")
require("prototypes.recipes.cursed-exchanges")
require("prototypes.recipes.cursed-heart")
require("prototypes.recipes.cursed-player")
require("prototypes.recipes.cursed-talents")
require("prototypes.recipes.cursed-talents-parts")
require("prototypes.recipes.cursed-tree")

		--[[Technologies]]--
		
		
		
		data:extend(
{
  {
    type = "projectile",
    name = "small-biter-p",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-biter",
          },
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/defender-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/combat-robot-capsule/combat-robot-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke,
  },
  {
    type = "capsule",
    name = "small-biter-capsule",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
      type = "throw",
      attack_parameters =
      {
        ammo_category = "capsule",
        cooldown = 15,
        projectile_creation_distance = 0.6,
        range = 20,
        ammo_type =
        {
          category = "capsule",
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "small-biter-p",
              starting_speed = 0.3
            }
          }
        }
      }
    },
   subgroup = "capsule",
    order = "s[small-biter]",
    stack_size = 10
  },
 {
    type = "recipe",
    name = "small-biter",
    enabled = "true",
    ingredients = 
    {
      {"iron-plate",1}
    },
    result = "small-biter-capsule"
  }
}
)

-- function newUnit()
	-- newunit = data.raw["unit"]["small-biter"]
	-- newunit.name = "new-small-biter"
	-- newunit.collision_box = {{0, 0}, {0, 0}}
	-- return newunit
-- end


-- data:extend(
-- {
	-- newUnit()
-- }
-- )