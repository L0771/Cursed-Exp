require("prototypes.groups")
require("prototypes.styles")

for _,v in pairs(data.raw.player) do
   v.crafting_categories[#v.crafting_categories + 1] = "cursed-nocraftmachine"
end

		--[[Entities]]--
require("prototypes.entities.cursed-blood")
require("prototypes.entities.cursed-blood-tank")
require("prototypes.entities.cursed-donation")
require("prototypes.entities.cursed-drills")
require("prototypes.entities.cursed-exchanges")
require("prototypes.entities.cursed-minions")
require("prototypes.entities.cursed-trees")
require("prototypes.entities.cursed-turrets")
require("prototypes.entities.cursed-vault")

		--[[Items]]--
require("prototypes.items.cursed-ammo")
require("prototypes.items.cursed-armors")
require("prototypes.items.cursed-axes")
require("prototypes.items.cursed-blood-fluid")
require("prototypes.items.cursed-blood-potion")
require("prototypes.items.cursed-blood-tank")
require("prototypes.items.cursed-bows")
require("prototypes.items.cursed-donation")
require("prototypes.items.cursed-drill")
require("prototypes.items.cursed-exchanges")
require("prototypes.items.cursed-heart")
require("prototypes.items.cursed-talents")
require("prototypes.items.cursed-talents-parts")
require("prototypes.items.cursed-tree")
require("prototypes.items.cursed-turrets")
require("prototypes.items.cursed-vault")

		--[[Recipes]]--
require("prototypes.recipes.cursed-ammo")
require("prototypes.recipes.cursed-blood")
require("prototypes.recipes.cursed-blood-potion")
require("prototypes.recipes.cursed-blood-tank")
require("prototypes.recipes.cursed-donation")
require("prototypes.recipes.cursed-exchanges")
require("prototypes.recipes.cursed-heart")
require("prototypes.recipes.cursed-talents")
require("prototypes.recipes.cursed-talents-parts")
require("prototypes.recipes.cursed-tree")

		--[[Technologies]]--