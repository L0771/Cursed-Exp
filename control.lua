require("defines")
require("util")
require("scripts/changeVersion")
require("scripts/closeGui")
require("scripts/encrypt")
require("scripts/files")
require("scripts/functions_classes")
require("scripts/functions_pollution")
require("scripts/gui")
require("scripts/interface")
require("scripts/levelEntity")
require("scripts/mix")
require("scripts/onbuiltentity")
require("scripts/onentitydied")
require("scripts/oninit")
require("scripts/onload")
require("scripts/onplayercrafteditem")
require("scripts/onplayercreated")
require("scripts/onplayermineditem")
require("scripts/onpreplayermineditem")
require("scripts/onrobotbuiltentity")
require("scripts/ontick")
require("scripts/refreshRecipes")
require("scripts/refreshResources")
require("scripts/refreshTrees")
require("scripts/removeItems")
require("scripts/resetall")
require("scripts/resetgui")
require("scripts/resetstats")
require("scripts/resettalents")
require("scripts/setBase")
require("scripts/skillUp")

	datos =
	{
		["currentVersion"] = 000304,
		["maxRange"] = 1000,
		["maxTool"] = 600,
		["maxArmor"] = 250,
		["maxWeapon1"] = 250,
		["maxMine"] = 100,
		["maxTurret"] = 100,
		["maxWall"] = 100,
		["maxFisher"] = 100,
		["maxGenerator"] = 64,
		["maxVault"] = 600,
		["maxWinTalent"] = 200,
		["resGeneral"] = 0.1,
		["resMining"] = 1,
		["resFarming"] = 2,
		["resCrafting"] = 0.4,
		["resExplore"] = 3.125,
		["resDefence"] = 1,
		["resRange"] = 0.5,
	}
	
	local wallExp =
	{
		["iron-ore"] = 1,
		["stone"] = 1,
		["copper-ore"] = 1,
		["raw-wood"] = 1,
		["coal"] = 1,
		["wood"] = 1,
		["iron-plate"] = 1,
		["copper-plate"] = 1,
		["iron-stick"] = 1,
		["iron-gear-wheel"] = 1,
		["copper-cable"] = 1,
		["electronic-circuit"] = 1,
		["stone-brick"] = 1,
		["steel-plate"] = 1,
		["science-pack-resource"] = 1, -- "iron-ore", 1 - "copper-ore", 1																					[0]
		["science-pack-nature"] = 1, -- "wood", 1 - "stone", 1																								[0]
		["science-pack-industrial"] = 1, -- "electronic-circuit", 1 - "basic-transport-belt", 1 - "pipe", 1											[1]
		["science-pack-fluid"] = 1, -- "dirty-water" 15 - "heavy-oil", 5 - "light-oil", 2																	[2]
		["science-pack-tech"] = 1, -- "advanced-circuit", 1 - "smart-inserter", 1 - "plastic-bar", 2 - "rubber", 2								[3]
		["science-pack-war"] = 1, -- "shotgun-shell", 4 - "rocket", 1 - "piercing-bullet-magazine", 4 - "flame-thrower-ammo", 4		[4]
		["science-pack-biter"] = 1, --  "alien-artifact", 1																											[5]
		["science-pack-advanced"] = 1, -- "processing-unit", 2																								[6]
		["science-pack-nuclear"] = 1, -- "solid-fuel", 5																											[7]
		["science-pack-highly-advanced"] = 1, -- "advanced-processing-unit", 3																		[8]
		["cursed-drill-1"] = 0,
		["cursed-turret-1"] = 0,
		["cursed-fisher-1"] = 0,
		["cursed-wall-base"] = 0,
	}
	
	local noCraftExp =
	{
		["cursed-donation"] = 1,
		["cursed-ammo1"] = 1,
		["cursed-talent-part-1"] = 1,
		["cursed-talent-part-2"] = 1,
		["cursed-talent-part-3"] = 1,
		["cursed-talent-part-4"] = 1,
		["cursed-talent-part-5"] = 1,
		["cursed-talent-part-6"] = 1,
		["cursed-talent-part-7"] = 1,
		["cursed-talent-part-8"] = 1,
		["cursed-talent-part-9"] = 1,
		["cursed-talent-part-10"] = 1,
		["battery-mk3-equipment-horizontal"] = 1,
		["battery-mk4-equipment-horizontal"] = 1,
		["battery-mk5-equipment-horizontal"] = 1,
		["battery-mk6-equipment-horizontal"] = 1,
		["battery-mk7-equipment-horizontal"] = 1
	}
	
	local noModule =
	{
		["RW_limestone"] = 1,
	}
	
	remover =
	{
		["player"] = nil,
		["item"] = nil
	}
	
	insertar =
	{
		["tree"] = nil,
		["resource"] = nil
	}
	
	local changeItems =
	{
		["cursed-talent-part-7"] = {name = "cursed-heart", count = 4, max = 125},
		["cursed-talent-part-8"] = {name = "cursed-heart", count = 4, max = 125},
		["cursed-talent-part-9"] = {name = "cursed-heart", count = 4, max = 125},
		["cursed-talent-part-10"] = {name = "cursed-heart", count = 4, max = 125},
		["cursed-drill-1"] = {name = "cursed-drill-1", count = 0, max = 1},
		["cursed-turret-1"] = {name = "cursed-turret-1", count = 0, max = 1},
		["cursed-fisher-1"] = {name = "cursed-fisher-1", count = 0, max = 1},
		["cursed-wall-base"] = {name = "cursed-wall-base", count = 0, max = 1},
	}

game.oninit(function()
	oninit.main(noModule)
end)

game.onload(function()
	onload.main(noModule)
end)

game.onevent(defines.events.onplayercreated, function(event)
	onplayercreated.main(event,noModule)
end)

game.onevent(defines.events.onplayercrafteditem, function(event)
	onplayercrafteditem.main(event,noCraftExp)
end)

game.onevent(defines.events.onbuiltentity, function(event)
	onbuiltentity.main(event,changeItems)
end)

game.onevent(defines.events.onentitydied, function(event)
	onentitydied.main(event)
end)

game.onevent(defines.events.onpreplayermineditem, function(event)
	onpreplayermineditem.main(event)
end)

game.onevent(defines.events.onplayermineditem, function(event)
	onplayermineditem.main(event)
end)

game.onevent(defines.events.ontick, function(event)
	if (event.tick % 60 == 0 or event.tick % 200 == 0 or event.tick % 12500 == 0) then-- and #game.players > 0 then
		ontick.main(event,wallExp)
	end
end)

game.onevent(defines.events.onguiclick, function(event)
	local resetg = clickgui(event)
	if resetg ~= nil then
		local player = game.getplayer(event.playerindex)
		resetgui.main(player)
	end
end)

if remote.interfaces["cursed-classes-event"] and remote.interfaces["cursed-classes-event"].getonclasschoosen then
	game.onevent(remote.call('cursed-classes-event', 'getonclasschoosen'), function(event)
		functions_classes.classSelected(event)
	end)
end

game.onevent(defines.events.onrobotbuiltentity, function(event)
	onrobotbuiltentity.main(event)
end)