require("prototypes.groups")
require("prototypes.style")

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











-- local exclude =
-- {
	-- ["pumpjack"] = 0.9
	-- ["burner-mining-drill"] = 0.2
-- }
-- for _,v in pairs(data.raw["mining-drill"]) do
	-- if exclude[v.name] then
		-- v.mining_speed = v.mining_speed * exclude[v.name]
		-- v.energy_usage = (tonumber(string.sub(v.energy_usage, 1, -3))) * exclude[v.name] .. " kW"
	-- else
		-- v.mining_speed = v.mining_speed * 0.1
		-- v.energy_usage = (tonumber(string.sub(v.energy_usage, 1, -3))) * 0.1 .. " kW"
	-- end
-- end
-- local exclude =
-- {
	-- ["pumpjack"] = 1
-- }
-- for _,v in pairs(data.raw["mining-drill"]) do
	-- if not exclude[v.name] then
		-- v.mining_speed = v.mining_speed * 0.1
		-- v.energy_usage = (tonumber(string.sub(v.energy_usage, 1, -3))) * 0.1 .. " kW"
	-- end
-- end