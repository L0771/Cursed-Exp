module("functions_classes", package.seeall)


function loadClasses()
	local base =
	{
		["name"] = "cursed",
		["maxGeneral"] = 0,
		["startGeneral"] = 1,
		["multGeneral"] = 1,
		["maxMining"] = 0,
		["startMining"] = 1,
		["multMining"] = 1,
		["maxFarming"] = 0,
		["startFarming"] = 1,
		["multFarming"] = 1,
		["maxCrafting"] = 0,
		["startCrafting"] = 1,
		["multCrafting"] = 1,
		["maxExplore"] = 0,
		["startExplore"] = 1,
		["multExplore"] = 1,
		["maxDefence"] = 0,
		["startDefence"] = 1,
		["multDefence"] = 1,
		["maxBow"] = 0,
		["startBow"] = 1,
		["multBow"] = 1,
		["maxSword"] = 0,
		["startSword"] = 1,
		["multSword"] = 1
	}
	local er = remote.call("cursed-classes","createclassbase",base)
	if er == "This base already added" then
		er = remote.call("cursed-classes","updateclassbase",base)
	end
	if er ~= true then
		error(er)
	end
		
	local miner = 
	{
		["name"] = "miner",
		["base"] = "cursed",
		["multMining"] = 2,
	}
	er = remote.call("cursed-classes","createclass",miner)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",miner,"cursed")
	end
	if er ~= true then
		error(er)
	end
	
	local farmer = 
	{
		["name"] = "farmer",
		["base"] = "cursed",
		["multFarming"] = 2,
	}
	er = remote.call("cursed-classes","createclass",farmer)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",farmer,base.name)
	end
	if er ~= true then
		error(er)
	end
	
	local crafter = 
	{
		["name"] = "crafter",
		["base"] = "cursed",
		["multCrafting"] = 2,
	}
	er = remote.call("cursed-classes","createclass",crafter)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",crafter,base.name)
	end
	if er ~= true then
		error(er)
	end
	
	local explorer = 
	{
		["name"] = "explorer",
		["base"] = "cursed",
		["multExplore"] = 2,
	}
	er = remote.call("cursed-classes","createclass",explorer)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",explorer,base.name)
	end
	if er ~= true then
		error(er)
	end
	
	local tank = 
	{
		["name"] = "tank",
		["base"] = "cursed",
		["multDefence"] = 2,
	}
	er = remote.call("cursed-classes","createclass",tank)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",tank,base.name)
	end
	if er ~= true then
		error(er)
	end
	
	local archer = 
	{
		["name"] = "archer",
		["base"] = "cursed",
		["multBow"] = 2,
	}
	er = remote.call("cursed-classes","createclass",archer)
	if er == "This class already added" then
		er = remote.call("cursed-classes","updateclass",archer,base.name)
	end
	if er ~= true then
		error(er)
	end
	
	-- local warrior = 
	-- {
		-- ["name"] = "warrior",
		-- ["base"] = "cursed",
		-- ["multSword"] = 2
	-- }
	-- er = remote.call("cursed-classes","createclass",warrior)
	-- if er == "This class already added" then
		-- er = remote.call("cursed-classes","updateclass",warrior,base.name)
	-- end
	-- if er ~= true then
		-- error(er)
	-- end
	
end

function classSelected(event)
	local player = glob.cursed[event.player.name]
	local oldclass
	if player.class ~= nil then
		oldclass = player.class.name
	end
	if oldclass ~= nil and oldclass ~= "cursed" and event.class ~= nil and oldclass ~= event.class.name then
		local stats = player.stats
		if oldclass == "miner" then
			stats.mining.level = math.ceil(stats.mining.level / 2)
			stats.mining.exp = 0
			stats.mining.next = (((stats.mining.level + 1) * (stats.mining.level + 1)) * 0.8 + 10 )
		elseif oldclass == "farmer" then
			stats.farming.level = math.ceil(stats.farming.level / 2)
			stats.farming.exp = 0
			stats.farming.next = (((stats.farming.level + 1) * (stats.farming.level + 1)) * 0.8 + 10 )
		elseif oldclass == "crafter" then
			stats.crafting.level = math.ceil(stats.crafting.level / 2)
			stats.crafting.exp = 0
			stats.crafting.next = (((stats.crafting.level + 1) * (stats.crafting.level + 1)) * 0.8 + 10 )
		elseif oldclass == "explorer" then
			stats.explore.level = math.ceil(stats.explore.level / 2)
			stats.explore.exp = 0
			stats.explore.next = (((stats.explore.level + 1) * (stats.explore.level + 1)) * 0.8 + 10 )
		elseif oldclass == "tank" then
			stats.defence.level = math.ceil(stats.defence.level / 2)
			stats.defence.exp = 0
			stats.defence.next = (((stats.defence.level + 1) * (stats.defence.level + 1)) * 0.8 + 10 )
		elseif oldclass == "archer" then
			stats.range.level = math.ceil(stats.range.level / 2)
			stats.range.exp = 0
			stats.range.next = (((stats.range.level + 1) * (stats.range.level + 1)) * 0.8 + 10 )
		end
	end
	if event.class == nil then
		player.class = "none"
	else
		player.class = remote.call("cursed-classes","readplayerclassbase",event.player.name,"cursed")
		if player.class.startGeneral > 1 and player.stats.general.level < player.class.startGeneral then
			player.stats.general.level = player.class.startGeneral
			player.stats.general.exp = 0
			player.stats.general.next = 5
		end
		if player.class.startMining > 1 and player.stats.mining.level < player.class.startMining then
			player.stats.mining.level = player.class.startMining
			player.stats.mining.exp = 0
			player.stats.mining.next = (((player.stats.mining.level + 1) * (player.stats.mining.level + 1)) * 0.8 + 10 )
		end
		if player.class.startFarming > 1 and player.stats.farming.level < player.class.startFarming then
			player.stats.farming.level = player.class.startFarming
			player.stats.farming.exp = 0
			player.stats.farming.next = (((player.stats.farming.level + 1) * (player.stats.farming.level + 1)) * 0.8 + 10 )
		end
		if player.class.startCrafting > 1 and player.stats.crafting.level < player.class.startCrafting then
			player.stats.crafting.level = player.class.startCrafting
			player.stats.crafting.exp = 0
			player.stats.crafting.next = (((player.stats.crafting.level + 1) * (player.stats.crafting.level + 1)) * 0.8 + 10 )
		end
		if player.class.startExplore > 1 and player.stats.explore.level < player.class.startExplore then
			player.stats.explore.level = player.class.startExplore
			player.stats.explore.exp = 0
			player.stats.explore.next = (((player.stats.explore.level + 1) * (player.stats.explore.level + 1)) * 0.8 + 10 )
		end
		if player.class.startDefence > 1 and player.stats.defence.level < player.class.startDefence then
			player.stats.defence.level = player.class.startDefence
			player.stats.defence.exp = 0
			player.stats.defence.next = (((player.stats.defence.level + 1) * (player.stats.defence.level + 1)) * 0.8 + 10 )
		end
		if player.class.startBow > 1 and player.stats.range.level < player.class.startBow then
			player.stats.range.level = player.class.startBow
			player.stats.range.exp = 0
			player.stats.range.next = (((player.stats.range.level + 1) * (player.stats.range.level + 1)) * 0.8 + 10 )
		end
		-- if player.class.startSword > 1 and player.stats.range.level < player.class.startSword then
			-- player.stats.range.level = player.class.startSword
			-- player.stats.range.exp = 0
			-- player.stats.range.next = (((player.stats.range.level + 1) * (player.stats.range.level + 1)) * 0.8 + 10 )
		-- end
	end
end

function classBase(playername)
	local player = glob.cursed[playername]
	player.class = 
	{
		["name"] = "cursed",
		["maxGeneral"] = 0,
		["startGeneral"] = 1,
		["multGeneral"] = 1,
		["maxMining"] = 0,
		["startMining"] = 1,
		["multMining"] = 1,
		["maxFarming"] = 0,
		["startFarming"] = 1,
		["multFarming"] = 1,
		["maxCrafting"] = 0,
		["startCrafting"] = 1,
		["multCrafting"] = 1,
		["maxExplore"] = 0,
		["startExplore"] = 1,
		["multExplore"] = 1,
		["maxDefence"] = 0,
		["startDefence"] = 1,
		["multDefence"] = 1,
		["maxBow"] = 0,
		["startBow"] = 1,
		["multBow"] = 1,
		["maxSword"] = 0,
		["startSword"] = 1,
		["multSword"] = 1
	}
end