require("defines")
require("util")
require("scripts/files")
require("gui")

	local currentVersion = 000011
	local maxRange = 300
	local maxTool = 300
	local maxArmor = 110
	local maxWeapon1 = 110
	local maxAmmo1 = 110
	local maxMine = 50
	local maxTurret = 50
	local maxWalls = 0
	local maxGenerator = 0
	local maxWinTalent = 200
	
	local someonejoined = false
	local tiempo = 2
	
game.oninit(function()
local allInOne = {
	["name"] = "cursed-tree",
	["states"] = { "cursed-tree-00", "cursed-tree-01", "cursed-tree-02", "cursed-tree-03", "cursed-tree-04" },
	["output"] = {"cursed-heart", 1},
	["efficiency"] = { ["grass"] = 0.50, ["grass-medium"] = 0.50, ["grass-dry"] = 0.45, ["dirt"] = 0.35, ["dirt-dark"] = 0.55, ["hills"] = 0.25, ["sand"] = 0.75, ["sand-dark"] = 0.75, ["other"] = 0 },
	["basicGrowingTime"] = 6250,
	["randomGrowingTime"] = 12500,
	["fertilizerBoost"] = 1,
	}
	if game.itemprototypes.charcoal then
		if (remote.interfaces.treefarm) and (remote.interfaces.treefarm.addSeed) then
			remote.call("treefarm", "addSeed", allInOne)
		end
	end
	if not glob.cursed then
		glob.cursed = {}
	end
	local cursed = glob.cursed
	for k,v in pairs(game.players) do
		if cursed[v.name] == nil then
			resetall(v)
		end
	end
	glob.cursed.others = {}
	glob.cursed.others.blood = {}
	glob.cursed.others.tanks = {}
	glob.cursed.others.runday = true
end)
game.onload(function()
	local cursed = glob.cursed
	for _,v in ipairs(game.players) do
		if cursed[v.name] == nil then
			resetall(v)
		else
			if cursed[v.name].aux.version ~= nil and cursed[v.name].aux.version ~= currentVersion then
				changeVersion(v)
			end
			local mines = cursed[v.name].mines
			for i = 1, #mines do
				mines[i].entity.active =  mines[i].active
				mines[i].active2 = true
			end
			local turrets = cursed[v.name].turrets
			for i = 1, #turrets do
				turrets[i].entity.active =  turrets[i].active
				turrets[i].active2 = true
			end
		end
	end
	for k,j in ipairs(cursed) do
		if getplayerbyname(k) == nil then
			b = 1
			local mines = cursed[v.name].mines
			for i = 1, #mines do
				mines[i].entity.active =  false
				mines[i].active2 = false
			end
			local turrets = cursed[v.name].turrets
			for i = 1, #turrets do
				turrets[i].entity.active =  true
				turrets[i].active2 = false
			end
		end
	end
	if tiempo > 0 then
		resetgui(false,true)
	end
	someonejoined = true
	tiempo = 2
end)
game.onsave(function()
	-- local cursed = glob.cursed
	-- for _,v in ipairs(game.players) do
		-- local mines = cursed[v.name].mines
		-- for i = 1, #mines do
			-- mines[i].entity.active =  false
		-- end
		-- local turrets = cursed[v.name].turrets
		-- for i = 1, #turrets do
			-- turrets[i].entity.active =  false
		-- end
	-- end
end)

game.onevent(defines.events.onplayercreated, function(event)
local player = game.getplayer(event.playerindex)
	local cursed = glob.cursed
	if cursed[player.name] == nil then
			resetall(player)
	else
		if cursed[player.name].aux.version ~= nil and cursed[player.name].aux.version ~= currentVersion then
			changeVersion(player)
		end
		local mines = cursed[player.name].mines
		for i = 1, #mines do
			mines[i].entity.active =  mines[i].active
			 mines[i].active2 = true
		end
		local turrets = cursed[player.name].turrets
		for i = 1, #turrets do
			turrets[i].entity.active =  turrets[i].active
			turrets[i].active2 = true
		end
		-- player.character.health = cursed[player.name].aux.lasthp
		-- local position = game.findnoncollidingposition("player", cursed[player.name].aux.pos, 20, 1)
		-- if position ~= nil then player.teleport(position) end
	end
	resetgui(false,true)
	someonejoined = true
	tiempo = 2
end)

game.onevent(defines.events.onplayercrafteditem, function(event)
	if event.itemstack.name == "cursed-donation" then
		local player = game.getplayer(event.playerindex)
		local donations = glob.cursed[player.name].aux.donations
		if donations > 0 then
			if player.character.health > 50 then
				local lasthp = glob.cursed[player.name].aux.lasthp
				player.character.health = player.character.health - 50
				lasthp = player.character.health
				donations = donations - 1
				glob.cursed[player.name].aux.donations = donations
				glob.cursed[player.name].aux.lasthp = lasthp
				local stats = glob.cursed[player.name].stats
				local cant = math.floor(stats.explore.level / 32)
				if math.random(32) <= stats.explore.level - (cant * 32) then
					cant = cant + 1
				end
				if cant > 0 then
					player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
					if glob.cursed[player.name].opt[4] == true then
						player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
					end
				end
			else
				removeitem = event.itemstack
				playerremove = player.name
				player.print({"msg.cursed", {"msg.mindonation"}})
			end
		else
			removeitem = event.itemstack
			playerremove = player.name
			player.print({"msg.cursed", {"msg.maxdonation"}})
		end
	elseif event.itemstack.name == "cursed-ammo1" then
		local player = game.getplayer(event.playerindex)
		removeitem = event.itemstack
		playerremove = player.name
		local arrows = glob.cursed[player.name].aux.arrows
		if arrows > 0 then
			if player.character.health > 25 then
				local lasthp = glob.cursed[player.name].aux.lasthp
				player.character.health = player.character.health - 25
				lasthp = player.character.health
				arrows = arrows - 1
				glob.cursed[player.name].aux.arrows = arrows
				glob.cursed[player.name].aux.lasthp = lasthp
				local stats = glob.cursed[player.name].stats
				player.insert({name="cursed-ammo1-"..stats.range.level,count=event.itemstack.count})
				local cant = math.floor(stats.explore.level / 32)
				if math.random(32) <= stats.explore.level - (cant * 32) then
					cant = cant + 1
				end
				if cant > 0 then
					player.insert{name="cursed-ammo1-"..stats.range.level,count=(event.itemstack.count * cant)}
					if glob.cursed[player.name].opt[4] == true then
						player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname("cursed-ammo1-" .. stats.range.level)}})
					end
				end
			else
				player.print({"msg.cursed", {"msg.minarrow"}})
			end
		else
			player.print({"msg.cursed", {"msg.maxarrow"}})
		end
	elseif string.sub(event.itemstack.name,1,19) == "cursed-talent-part-" then
		local num = (tonumber(string.sub(event.itemstack.name,20,21)))
		local player = game.getplayer(event.playerindex)
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
		local cant = math.floor(talents[4][num].now / 10)
		if math.random(10) <= talents[4][num].now - (cant * 10) then
			cant = cant + 1
		end
		if cant > 0 then
			player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
			if glob.cursed[player.name].opt[6] == true then
				player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
			end
		end
	else
		local player = game.getplayer(event.playerindex)
		local stats = glob.cursed[player.name].stats
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
		stats.crafting.exp = round(stats.crafting.exp + ( 0.1 * (1 + talents[1][7].now / 40 + stats.general.level / 40)),3)
		local cant = math.floor(stats.crafting.level / 250)
		if math.random(250) <= stats.crafting.level - (cant * 250) then
			cant = cant + 1
		end
		if cant > 0 then
			player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
			if glob.cursed[player.name].opt[3] == true then
				player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
			end
			stats.crafting.exp = round(stats.crafting.exp + ( cant * 0.1 * (1 + talents[1][7].now / 40 + stats.general.level / 40)),3)
		end
		if stats.crafting.exp >= stats.crafting.next then
			skillUp(stats.crafting,(((stats.crafting.level + 1) * (stats.crafting.level + 1)) * 0.8 + 10 ),player)
		end
		if gui ~= nil and gui.tableStats4S then
			gui.tableStats4.stat4c2.caption = {"gui.stat4c2",stats.crafting.exp,stats.crafting.next,100 * (talents[1][7].now / 40 + stats.general.level / 40)}
			gui.tableStats4.stat4c3.value = stats.crafting.exp / stats.crafting.next
		end
	end
end)

game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "cursed-drill-1" then
		local player = game.getplayer(event.playerindex)
		local mine = glob.cursed[player.name].mines
		for i = 1, #mine do
			if not mine[i].entity.valid then
				mine[i] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2, active = true, active2 = true}	
				return
			end
		end
		mine[#mine + 1] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2, active = true, active2 = true}	
	elseif event.createdentity.name == "cursed-turret-1" then
		local player = game.getplayer(event.playerindex)
		local turrets = glob.cursed[player.name].turrets
		for i = 1, #turrets do
			if not turrets[i].entity.valid then
				turrets[i] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2, active = true, active2 = true}	
				return
			end
		end
		turrets[#turrets + 1] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2, active = true, active2 = true}	
	elseif event.createdentity.name == "cursed-blood-tank-1" then
		local tanks = glob.cursed.others.tanks
		for i = 1, #tanks do
			if not tanks[i].entity.valid then
				tanks[i] = {entity = event.createdentity}	
				return
			end
		end
		tanks[#tanks + 1] = {entity = event.createdentity}
	elseif event.createdentity.name == "cursed-donation" then
		event.createdentity.destroy()
		local player = game.getplayer(event.playerindex)
		local tank = player.selected
		if tank ~= nil and tank.name == "cursed-blood-tank-1" then
			if tank.fluidbox[1] == nil or tank.fluidbox[1].type ~= "blood" then
				tank.fluidbox[1] = {type = "blood", amount = 2.5, temperature = 5}
			else
				tank.fluidbox[1] = {type = "blood", amount = tank.fluidbox[1].amount + 2.5, temperature = 5}
			end
		else
			player.insert{name="cursed-donation",count=1}
		end
	elseif string.sub(event.createdentity.name,1,12) == "cursed-vault" then
		local player = game.getplayer(event.playerindex)
		local talents = glob.cursed[player.name].talents
		local vaultentity = glob.cursed[player.name].aux.vaultentity
		vaultentity = game.createentity{name="cursed-vault-" .. talents[5][7].now,position=event.createdentity.position, force=player.force}
		local vault = glob.cursed[player.name].aux.vault
		if vault ~= nil then
			for i = 1, #vault do
				vaultentity.insert(vault[i])
			end
		end
		event.createdentity.destroy()
		glob.cursed[player.name].aux.vaultentity = vaultentity
	end
end)

game.onevent(defines.events.onentitydied, function(event)
	if event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,13)) == "cursed-drill-" then
		local owner = getowner(event.entity,"drill")
		local mines = glob.cursed[owner].mines
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = getplayerbyname(owner)
		for i = 1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				talents[3][1].now = talents[3][1].now - 1
				if player ~= nil then
					if gui ~= nil and gui.tableBuilds1S then
						if gui.tableMine.builds1c2.caption == mines[i].nick then
							guiFlipFlop("buildsMain1",player)
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",mines[i].nick}})
					if gui ~= nil and gui.tableTalents3S then
						gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
					end
				end
				table.remove(mines,i)
			end
		end
	elseif event.entity.type == "turret" and string.sub(event.entity.name,1,14) == "cursed-turret-" then
		local owner = getowner(event.entity,"turret")
		local turrets = glob.cursed[owner].turrets
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = getplayerbyname(owner)
		for i = 1, #turrets do
			if turrets[i] ~= nil and turrets[i].entity ~= nil and event.entity.equals(turrets[i].entity) then
				talents[3][3].now = talents[3][3].now - 1
				if player ~= nil then
					if gui ~= nil and gui.tableBuilds2S then
						if gui.tableTurret.builds2c2.caption == turrets[i].nick then
							guiFlipFlop("buildsMain2",player)
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",turrets[i].nick}})
					if gui ~= nil and gui.tableTalents3S then
						gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
					end
				end
				table.remove(turrets,i)
			end
		end
	-- elseif event.entity.type == "player" then
		-- local player
		-- for _,v in ipairs(game.players) do
			-- if v.character == nil and glob.cursed[v.name].aux.tomb == nil then
				-- player = v
			-- end
		-- end
		-- if player ~= nil then
			-- local items = glob.cursed[player.name].aux.inventory
			-- if items ~= nil then
				-- local tomb = {}
				-- local position = game.findnoncollidingposition("cursed-tomb", event.entity.position, 5, 1)
				-- tomb.entity = game.createentity{name="cursed-tomb", position=position, force=game.forces.neutral}
				-- tomb.time = 2
				-- tomb.items = items
				-- glob.cursed[player.name].aux.tomb = tomb
			-- end
		-- end
	elseif event.entity.force.name == "enemy" then
		if --[[player.force.ischunkcharted(event.entity.position) == true and]] #game.findentitiesfiltered{area = {{event.entity.position.x-16, event.entity.position.y-16}, {event.entity.position.x+16, event.entity.position.y+16}}, name="cursed-blood"} < 15 then
			local blood = glob.cursed.others.blood
			for i = 1, #blood do
				if blood[i] == nil or blood[i].entity == nil then
					blood[i] = {}
					blood[i].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
					blood[i].total = event.entity.prototype.maxhealth / 20
					blood[i].time = 3
					return
				end
			end
			blood[#blood + 1] = {}
			blood[#blood].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
			blood[#blood].total = event.entity.prototype.maxhealth / 20
			blood[#blood].time = 5
		end
		game.pollute(event.entity.position,(event.entity.prototype.maxhealth * 0.1))
		
		local nearplayer = game.findentitiesfiltered{area ={{event.entity.position.x - 20,event.entity.position.y - 20},{event.entity.position.x + 20,event.entity.position.y + 20}},type="player"}
		local players = {}
		for  i = 1, #nearplayer do
			for j = 1, #game.players do
				if nearplayer[i].equals(game.players[j].character) then
					table.insert(players,game.players[j])
				end
			end
		end
		local lowerchance = 0
		for i = 1, #players do
			local player = players[i]
			local chance = glob.cursed[player.name].talents[5][8].now
			if chance < lowerchance then
				lowerchance = chance
			end
		end
		for i = 1, #players do
		local player = players[i]
			local talents = glob.cursed[player.name].talents
			if talents[5][8].now > 0 then
				local cant = math.floor(((talents[5][8].now + lowerchance) / 2)/250)
				if math.random(250) <= ((talents[5][8].now + lowerchance) / 2) - (cant * 250) then
					cant = cant + 1
				end
				if cant > 0 then
					player.insert({name="cursed-talent-1",count=cant})
					player.print({"msg.cursed",{"msg.item-bonus",cant , game.getlocaliseditemname("cursed-talent-1")}})
				end
			end
			if player.getinventory(defines.inventory.playerguns)[player.character.selectedgunindex] ~= nil and (string.sub(player.getinventory(defines.inventory.playerguns)[player.character.selectedgunindex].name,1, 15)) == "cursed-weapon1-" then 
				local stats = glob.cursed[player.name].stats
				local gui = glob.cursed[player.name].gui
				stats.range.exp = round(stats.range.exp + (event.entity.prototype.maxhealth * 0.1 * (1 + talents[1][9].now / 40 + stats.general.level / 40)) / #players,3)
				if stats.range.exp >= stats.range.next then
					skillUp(stats.range,(((stats.range.level + 1) * (stats.range.level + 1)) * 0.8 + 10 ),player)
				end
				if gui ~= nil and gui.tableStats7S then
					gui.tableStats7.stat7c2.caption = {"gui.stat7c2",stats.range.exp,stats.range.next,100 * (talents[1][9].now / 40 + stats.general.level / 40)}
					gui.tableStats7.stat7c3.value = stats.range.exp / stats.range.next
				end
			end
		end
		local nearturret = game.findentitiesfiltered{area ={{event.entity.position.x - 30,event.entity.position.y - 30},{event.entity.position.x + 30,event.entity.position.y + 30}},type="turret"}
		local num = 0
		for i = 1, #nearturret do
			if num == 0 and string.sub(nearturret[i].name,1,14) == "cursed-turret-" and util.distance(nearturret[i].position,event.entity.position) < 5 + (tonumber(string.sub(nearturret[i].name,15,16))) / 2 then
				local owner = getowner(nearturret[i],"turret")
				if owner ~= nil then
					local player = getplayerbyname(owner)
					if player ~= nil then
						local turrets = glob.cursed[player.name].turrets
						for j = 1, #turrets do
							if nearturret[i].equals(turrets[j].entity) and turrets[j].active2 == true then
								num = i
							end
						end
					end
				end
			end
		end
		if num ~= 0 then
			local owner = getowner(nearturret[num],"turret")
			if owner ~= nil then
				local player = getplayerbyname(owner)
				local talents = glob.cursed[player.name].talents
				local turrets = glob.cursed[player.name].turrets
				local gui = glob.cursed[player.name].gui
				for i = 1, #turrets do
					if nearturret[num].equals(turrets[i].entity) and turrets[i].level <= talents[3][4].now + 2 then
						if not (turrets[i].level == talents[3][4].now + 2 and turrets[i].exp >= turrets[i].next * 1.2) then
							turrets[i].exp = round(turrets[i].exp + event.entity.prototype.maxhealth * 0.1,3)
							if turrets[i].exp >= turrets[i].next then
								levelturrets(i,player)
							end
							if gui ~= nil and gui.tableBuilds2S then
								if gui.tableTurret.builds2c2.caption == turrets[i].nick then
									gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",turrets[i].exp,turrets[i].next}
									if turrets[i].exp > 0 then
										gui.tableBuilds2.builds2c6.value = turrets[i].exp / turrets[i].next
									else
										gui.tableBuilds2.builds2c6.value = 0
									end
								end
							end
						end
					end
				end
			end
		end
	elseif event.entity.name == "cursed-blood" then
		local blood = glob.cursed.others.blood
		for i = 1, #blood do
			if blood[i] ~= nil and blood[i].entity ~= nil and event.entity.equals(blood[i].entity) then
				table.remove(blood,i)
			end
		end
	elseif event.entity.name == "cursed-blood-tank-1" then
		local tanks = glob.cursed.others.tanks
		for i=1, #tanks do
			if tanks[i] ~= nil and tanks[i].entity ~= nil and event.entity.equals(tanks[i].entity) then
				table.remove(tanks,i)
			end
		end
	end
end)

game.onevent(defines.events.onpreplayermineditem, function(event)
	if event.entity.type == "tree" or event.entity.type == "resource" then
		local player = game.getplayer(event.playerindex)
		local talents = glob.cursed[player.name].talents
		if player.getinventory(defines.inventory.playertools)[1] ~= nil and (player.getinventory(defines.inventory.playertools).getitemcount("cursed-axe-" .. talents[2][1].now) >= 1)  then
			local stats = glob.cursed[player.name].stats
			local gui = glob.cursed[player.name].gui
			if event.entity.type == "tree" then
				local cant = math.floor(stats.mining.level / 50)
				if math.random(50) <= stats.mining.level - (cant * 50) then
					cant = cant + 1
				end
				stats.farming.exp = round(stats.farming.exp + (1 * (1 + talents[1][6].now / 40 + stats.general.level / 40)),3) -- (mining_time * hardness)
				if cant > 0 then
					stats.farming.exp = round(stats.farming.exp + (cant * 1 * (1 + talents[1][6].now / 40 + stats.general.level / 40)),3) 
					insertitemtree = cant
				end
				if stats.farming.exp >= stats.farming.next then
					skillUp(stats.farming,(((stats.farming.level + 1) * (stats.farming.level + 1)) * 0.8 + 10 ),player)
				end
				if gui ~= nil and gui.tableStats3S then
					gui.tableStats3.stat3c2.caption = {"gui.stat3c2",stats.farming.exp,stats.farming.next,100 * (talents[1][6].now / 40 + stats.general.level / 40)}
					gui.tableStats3.stat3c3.value = stats.farming.exp / stats.farming.next
				end
			elseif event.entity.type == "resource" then
				local cant = math.floor(stats.mining.level / 100)
				if math.random(100) <= stats.mining.level - (cant * 100) then
					cant = cant + 1
				end
				stats.mining.exp = round(stats.mining.exp + (0.75 * (1 + talents[1][5].now / 40 + stats.general.level / 40)),3)-- (mining_time * hardness)
				if cant > 0 then
					stats.mining.exp = round(stats.mining.exp + (cant * 0.75 * (1 + talents[1][5].now / 40 + stats.general.level / 40)),3)
					insertitemresource = cant
				end
				if stats.mining.exp >= stats.mining.next then
					skillUp(stats.mining,(((stats.mining.level + 1) * (stats.mining.level + 1)) * 0.8 + 10 ),player)
				end
				if gui ~= nil and gui.tableStats2S then
					gui.tableStats2.stat2c2.caption = {"gui.stat2c2",stats.mining.exp,stats.mining.next,100 * (talents[1][5].now / 40 + stats.general.level / 40)}
					gui.tableStats2.stat2c3.value = stats.mining.exp / stats.mining.next
				end
			end
		end
	elseif event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,13)) == "cursed-drill-" then
		local player = game.getplayer(event.playerindex)
		local owner = getowner(event.entity,"drill")
		local gui = glob.cursed[owner].gui
		local mines = glob.cursed[owner].mines
		for i=1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				if player.name == owner then
					if gui ~= nil and gui.tableBuilds1S then
						if gui.tableMine.builds1c2.caption == mines[i].nick then
							guiFlipFlop("buildsMain1",player)
						end
					end
					table.remove(mines,i)
				else
					mines[i].entity = game.createentity{name="cursed-drill-" .. mines[i].level, position = event.entity.position, direction = event.entity.direction, force=game.forces.player}
					mines[i].entity.active = mines[i].active
					removeitem = true
					player.print = {"msg.aliedmine"}
				end
			end
		end
	elseif event.entity.type == "turret" and (string.sub(event.entity.name,1,14)) == "cursed-turret-" then
		local player = game.getplayer(event.playerindex)
		local owner = getowner(event.entity,"turret")
		local gui = glob.cursed[owner].gui
		local turrets = glob.cursed[owner].turrets
		for i=1, #turrets do
			if turrets[i] ~= nil and turrets[i].entity ~= nil and event.entity.equals(turrets[i].entity) then
				if player.name == owner then
					if gui ~= nil and gui.tableBuilds2S then
						if gui ~= nil and gui.tableMine.builds2c2.caption == turrets[i].nick then
							guiFlipFlop("buildsMain2",player)
						end
					end
					table.remove(turrets,i)
				else
					turrets[i].entity = game.createentity{name="cursed-turret-" .. turrets[i].level, position = event.entity.position, direction = event.entity.direction, force=game.forces.player}
					turrets[i].entity.active = turrets[i].active
					removeitem = true
					player.print = {"msg.aliedturret"}
				end
			end
		end
	elseif event.entity.name == "cursed-blood-tank-1" then
		local tanks = glob.cursed.others.tanks
		for i=1, #tanks do
			if tanks[i] ~= nil and tanks[i].entity ~= nil and event.entity.equals(tanks[i].entity) then
				table.remove(tanks,i)
			end
		end
	elseif event.entity.type == "container" and (string.sub(event.entity.name,1,13)) == "cursed-vault-" then
		local owner = getowner(event.entity,"container")
		local vaultentity = glob.cursed[owner].aux.vaultentity
		local player = getplayerbyname(owner)
		if player ~= nil then
			if player.getitemcount("cursed-vault") > 0 then
				player.removeitem({name="cursed-vault", count=player.getitemcount("cursed-vault")})
			end
			if vaultentity ~= nil then
				local vault = {}
				local inside = vaultentity.getinventory(defines.inventory.chest)
				local n = 1
				for i = 1, #inside do
					if inside[i] ~= nil then
						vault[n] = {name = inside[i].name, count = inside[i].count}
						n = n + 1
					end
				end
				glob.cursed[v.name].aux.vault = vault
			end
		end
		vaultentity.destroy()
		vaultentity = nil
	end
	local player = game.getplayer(event.playerindex)
	local talents = glob.cursed[player.name].talents
	if player.getinventory(defines.inventory.playertools)[1] ~= nil and player.getinventory(defines.inventory.playertools)[1].name ~= "cursed-axe-" .. talents[2][1].now then
		removeAxes(player)
		player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
	end
end)

game.onevent(defines.events.onplayermineditem, function(event)
	if removeitem and removeitem == true then
		local player = game.getplayer(event.playerindex)
		player.removeitem(event.itemstack)
		removeitem = nil
	elseif insertitemtree then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertitemtree)}
		if glob.cursed[player.name].opt[2] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertitemtree , game.getlocaliseditemname(event.itemstack.name)}})
		end
		insertitemtree = nil
	elseif insertitemresource then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertitemresource)}
		if glob.cursed[player.name].opt[1] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertitemresource , game.getlocaliseditemname(event.itemstack.name)}})
		end
		insertitemresource = nil
	end
end)

game.onevent(defines.events.ontick, function(event)
	-- if tiempo == 0 then game.removeofflineplayers() end
	-- local counter = 0
	-- for	_,v in ipairs(game.players) do
		-- if v.character ~= nil then
			-- counter = counter + 1
		-- end
	-- end
	-- if counter ~= playernumberold then
		-- local playersremoved = {}
		-- if not playerlistold then playerlistold = {} end
		-- for i = 1, #playerlistold do
			-- local b = false
			-- for j = 1, #game.players do
				-- if game.players[j].character ~= nil and game.players[j].name == playerlistold[i] then
					-- b = true
				-- end
			-- end
			-- if b == false then
				-- table.insert(playersremoved,playerlistold[i])
			-- end
		-- end
		-- playerlistold = {}
		-- for	_,v in ipairs(game.players) do
			-- if v.character ~= nil then
				-- table.insert(playerlistold,v.name)
			-- end
		-- end
		-- for i = 1, #playersremoved do
			-- local mines = glob.cursed[playersremoved[i]].mines
			-- for j = 1, #mines do
				-- mines[j].entity.active = false
				-- mines[j].active2 = false
			-- end
			-- local turrets = glob.cursed[playersremoved[i]].turrets
			-- for j = 1, #turrets do
				-- turrets[j].active2 = false
			-- end
		-- end
		-- tiempo = 2
		-- someonejoined = true
		-- playernumberold = counter
	-- end
	
	if #game.players >= 1 then
		if removeitem ~= nil and playerremove ~= nil then
			local player = getplayerbyname(playerremove)
			player.removeitem(removeitem)
			removeitem = nil
			playerremove = nil
		end
		if event.tick % 30==0 then
			if someonejoined == true and tiempo == 0 then
				someonejoined = false
				for _,v in ipairs(game.players) do
					if not v.gui.left.tableMain then
						resetgui(v)
					end
				end
			end
			-- for _,v in ipairs(game.players) do
				-- local healthless = (v.character.prototype.maxhealth - v.character.health)
				-- if healthless > 0 then
					-- local talents = glob.cursed[v.name].talents
					-- local stats = glob.cursed[v.name].stats
					-- local regen = 0.005 * talents[5][4].now + stats.defence.level /  100
					-- v.character.health = v.character.health + regen
				-- end
			-- end
		end
		if event.tick%60==0 then
			if tiempo > 0 then tiempo = tiempo - 1 end
			for _,v in ipairs(game.players) do
				if v.character then
					local talents = glob.cursed[v.name].talents
					local pos = glob.cursed[v.name].aux.pos
					local distance = (util.distance(pos,v.position) / 48)
					if distance > 0 then
						if v.cursorstack and v.cursorstack.name ~= "cursed-vault" and v.getitemcount("cursed-vault") > 0 then
							v.removeitem({name="cursed-vault", count=v.getitemcount("cursed-vault")})
						end
						local vaultentity = glob.cursed[v.name].aux.vaultentity
						if vaultentity ~= nil then
							if util.distance(vaultentity.position,v.position) > 6 then
								local vault = {}
								local inside = vaultentity.getinventory(defines.inventory.chest)
								local n = 1
								for i = 1, #inside do
									if inside[i] ~= nil then
										vault[n] = {name = inside[i].name, count = inside[i].count}
										n = n + 1
									end
								end
								glob.cursed[v.name].aux.vault = vault
								vaultentity.destroy()
								vaultentity = nil
								glob.cursed[v.name].aux.vaultentity = vaultentity
							end
						end
						-- local tomb = glob.cursed[v.name].aux.tomb
						-- if tomb ~= nil then
							-- if util.distance(tomb.entity.position,v.position) < 5 then
								-- for k,j in ipairs(tomb.items) do
									-- if v.caninsert(j) then
										-- v.insert(j)
										-- table.remove(tomb.items,k)
									-- end
								-- end
								-- if #tomb.items == 0 then
									-- tomb.entity.destroy()
									-- glob.cursed[v.name].aux.tomb = nil
								-- else
									-- v.print({"msg.cursed",{"msg.mininventory"}})
								-- end
							-- end
						-- end
						local gui = glob.cursed[v.name].gui
						local stats = glob.cursed[v.name].stats
						stats.explore.exp = round(stats.explore.exp + (distance * (1 + talents[1][8].now / 40 + stats.general.level / 40)),3)
						glob.cursed[v.name].aux.pos = v.position
						if stats.explore.exp >= stats.explore.next then
							skillUp(stats.explore,(((stats.explore.level + 1) * (stats.explore.level + 1)) * 0.8 + 10 ),v)
						end
						if gui ~= nil and gui.tableStats5S then
							gui.tableStats5.stat5c2.caption = {"gui.stat5c2",stats.explore.exp,stats.explore.next,100 * (talents[1][8].now / 40 + stats.general.level / 40)}
							gui.tableStats5.stat5c3.value = stats.explore.exp / stats.explore.next
						end
					end
					distance = talents[5][6].now * 0.125 + 7
					if distance > 32 then distance = 32 end
					for _,v in ipairs(game.findenemyunits(v.character.position, distance)) do
						v.damage(talents[5][6].now * 0.025, v.force )
					end
				end
			end
		end
		if event.tick % 180 then
			for _,v in ipairs(game.players) do
				if v.character then
					-- setgettomb(v,"set")
					local maxhealth = glob.cursed[v.name].aux.maxhealth
					local healthless = maxhealth - v.character.health
					if healthless > 0 then
						if v.getinventory(defines.inventory.playerarmor)[1] ~= nil and (string.sub(v.getinventory(defines.inventory.playerarmor)[1].name,1, 13)) == "cursed-armor-" then
							local lasthp = glob.cursed[v.name].aux.lasthp
							if lasthp > v.character.health then
								local stats = glob.cursed[v.name].stats
								local talents = glob.cursed[v.name].talents
								local gui = glob.cursed[v.name].gui
								stats.defence.exp = round(stats.defence.exp + ((lasthp - v.character.health) * 0.1 * (1 + talents[1][9].now / 40 + stats.general.level / 40)),3)
								if stats.defence.exp >= stats.defence.next then
									skillUp(stats.defence,(((stats.defence.level + 1) * (stats.defence.level + 1)) * 0.8 + 10 ),v)
								end
								if gui ~= nil and gui.tableStats6S then
									gui.tableStats6.stat6c2.caption = {"gui.stat6c2",stats.defence.exp,stats.defence.next,100 * (talents[1][10].now / 40 + stats.general.level / 40)}
									gui.tableStats6.stat6c3.value = stats.defence.exp / stats.defence.next
								end
							end
						end
						local talents = glob.cursed[v.name].talents
						local stats = glob.cursed[v.name].stats
						local regen = (0.005 * talents[5][4].now + stats.defence.level /  100) * 3
						v.character.health = v.character.health + regen
					end
					glob.cursed[v.name].aux.lasthp = v.character.health or maxhealth
				end
			end
		end
		if event.tick % 300 == 0 then
			local tanks = glob.cursed.others.tanks
			for i = 1, #tanks do
				if tanks[i].entity.fluidbox[1] ~= nil and tanks[i].entity.fluidbox[1].type ~= "blood" then
					tanks[i].entity.fluidbox[1] = nil
				end
				local blood = glob.cursed.others.blood
				local puddle = game.findentitiesfiltered{area = {{tanks[i].entity.position.x-32, tanks[i].entity.position.y-32}, {tanks[i].entity.position.x+32, tanks[i].entity.position.y+32}}, name="cursed-blood"}
				for _,j in ipairs(puddle) do
					for k = 1, #blood do
						if blood[k] ~= nil and blood[k].entity ~= nil and blood[k].entity.valid and j ~= nil and j.valid and j.equals(blood[k].entity) then
							blood[k].entity.setcommand({type=defines.command.gotolocation, destination = tanks[i].entity.position ,distraction=defines.distraction.none })
							if util.distance(j.position,tanks[i].entity.position) < 5 then
								if tanks[i].entity.fluidbox[1] == nil then
									tanks[i].entity.fluidbox[1] = {type = "blood", amount = blood[k].total, temperature = 5}
								else
									tanks[i].entity.fluidbox[1] = {type = "blood", amount = tanks[i].entity.fluidbox[1].amount + blood[k].total, temperature = 5}
								end
								blood[k].entity.destroy()
								table.remove(blood,k)
							end
						elseif blood[k] == nil or blood[k].entity == nil or not (blood[k].entity.valid) then
							table.remove(blood,k)
						end
					end
				end
			end
			for _,v in ipairs(game.players) do
				local mines = glob.cursed[v.name].mines
				local talents = glob.cursed[v.name].talents
				local gui = glob.cursed[v.name].gui
				for i = 1, #mines do
					if mines[i].active2 == true then
						if mines[i].level <= talents[3][2].now + 2 and game.getpollution(mines[i].entity.position) >= mines[i].level * 5 + 15 and mines[i].entity.energy > 0 then
							if not (mines[i].level == talents[3][2].now + 2 and mines[i].exp >= mines[i].next * 1.2) then
								mines[i].exp = round(mines[i].exp + 0.05,3)
								if mines[i].exp >= mines[i].next then
									levelmines(i,v)
								end
								if gui ~= nil and gui.tableBuilds1S then
									if gui.tableMine.builds1c2.caption == mines[i].nick then
										gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",mines[i].exp,mines[i].next}
										if mines[i].exp > 0 then
											gui.tableBuilds1.builds1c6.value = mines[i].exp / mines[i].next
										else
											gui.tableBuilds1.builds1c6.value = 0
										end
									end
								end
							end
						else
							if not (mines[i].level == 1 and mines[i].exp <= 0) then
								mines[i].exp = round(mines[i].exp - 0.1,3)
								if mines[i].exp < 0 and mines[i].level ~= 1 then
									levelmines(i,v)
								end
								if gui ~= nil and gui.tableBuilds1S then
									if gui.tableMine.builds1c2.caption == mines[i].nick then
											gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",mines[i].exp,mines[i].next}
										if mines[i].exp > 0 then 
											gui.tableBuilds1.builds1c6.value = mines[i].exp / mines[i].next
										else
											gui.tableBuilds1.builds1c6.value = 0
										end
									end
								end
							end
						end
					end
				end
			end
			for k,v in pairs(glob.cursed) do
				if k ~= "others" then
					local mines = glob.cursed[k].mines
					for i = 1, #mines do
						local healthless = ((mines[i].level * 25) + 175) - (mines[i].entity.health)
						if healthless > 0 then
							local regen = 3 * mines[i].level
							mines[i].entity.health = mines[i].entity.health + regen
						end
					end
					local turrets = glob.cursed[k].turrets
					for i = 1, #turrets do
						local healthless = ((turrets[i].level * 25) + 175) - (turrets[i].entity.health)
						if healthless > 0 then
							local regen = 3 * turrets[i].level
							turrets[i].entity.health = turrets[i].entity.health + regen
						end
					end
				end
			end
		end
		if event.tick % 3600 == 0 then
			for _,v in ipairs(game.players) do
				local turrets = glob.cursed[v.name].turrets
				local gui = glob.cursed[v.name].gui
				for i=1,#turrets do
					if turrets[i].active2 == true then
						if not (turrets[i].level == 1 and turrets[i].exp <= 0) then
							turrets[i].exp = round(turrets[i].exp - (turrets[i].next / 10),3)
							if turrets[i].exp < 0 and turrets[i].level ~= 1 then
								levelturrets(i,v)
							end
							if gui ~= nil and gui.tableBuilds2S then
								if gui.tableTurret.builds2c2.caption == turrets[i].nick then
									gui.tableBuilds2.builds2c5.caption = "Experience " .. turrets[i].exp .. "/" .. turrets[i].next
									if turrets[i].exp > 0 then 
										gui.tableBuilds2.builds2c6.value = turrets[i].exp / turrets[i].next
									else
										gui.tableBuilds2.builds2c6.value = 0
									end
								end
							end
						end
					end
				end
				-- local tomb = glob.cursed[v.name].aux.tomb
				-- if tomb ~= nil then
					-- if tomb.time == 0 then
						-- if tomb.entity then
							-- tomb.entity.destroy()
							-- player.print({"msg.cursed",{"msg.tomb-destroyed"}})
						-- end
						-- glob.cursed[player.name].aux.tomb = nil
					-- else
						-- tomb.time = tomb.time - 1
						-- player.print({"msg.cursed",{"msg.tombtime",tomb.time}})
					-- end
				-- end
			end
			local blood = glob.cursed.others.blood
			for i = 1, #blood do
				if blood[i] ~= nil and blood[i].entity ~= nil then
					if blood[i].time == 0 then
						if blood[i].entity.valid then
							blood[i].entity.destroy()
						end
						table.remove(blood,i)
					end
					if blood[i] ~= nil then
						if blood[i].time ~= nil then
							blood[i].time = blood[i].time - 1
						else
							if blood[i].entity ~= nil then
								blood[i].entity.destroy()
							end
							table.remove(blood,i)
						end
					end
				elseif blood[i] ~= nil then
					if blood[i].entity == nil then
						table.remove(blood,i)
					end
				end
			end
		end
		if event.tick % 12500 == 0 then
			for _,v in ipairs(game.players) do
				local talents = glob.cursed[v.name].talents
				local gui = glob.cursed[v.name].gui
				talents[1][3].now = 0
				talents[1][4].now = 0
				if gui ~= nil and gui.tableTalents1S then
					gui.tableTalents1.talent1c3.caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}
					gui.tableTalents1.talent1c4.caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}
				end
				local donations = glob.cursed[v.name].aux.donations
				if donations < 4 then
					donations = donations + 1
					glob.cursed[v.name].aux.donations = donations
				end
				local arrows = glob.cursed[v.name].aux.arrows
				if arrows < 8 then
					arrows = arrows + 2
					glob.cursed[v.name].aux.arrows = arrows
				end
			end
			local player = game.players[1]
			talents = glob.cursed[player.name].talents
			gui = glob.cursed[player.name].gui
			if glob.cursed.others.runday == true then
				if (game.darkness <= 0.01) and (talents[1][1].now >= 1) then
					game.freezedaytime(true)
					glob.cursed.others.runday = false
					globalPrint({"msg.cursed",{"msg.24day"}})
					for k,v in pairs(glob.cursed) do
						if k ~= "others" then
							gui = glob.cursed[k].gui
							talents = glob.cursed[k].talents
							talents[1][1].now = talents[1][1].now - 1
							if talents[1][1].now == 0 then
								talents[1][2].max = 7
							end
							if gui ~= nil and gui.tableTalents1S then
								gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
								gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
							end
						end
					end
				elseif (game.darkness > 0.85) and (talents[1][2].now >= 1) then
					game.freezedaytime(true)
					glob.cursed.others.runday = false
					globalPrint({"msg.cursed",{"msg.24night"}})
					for k,v in pairs(glob.cursed) do
						if k ~= "others" then
							gui = glob.cursed[k].gui
							talents = glob.cursed[k].talents
							talents[1][2].now = talents[1][2].now - 1
							if talents[1][2].now == 0 then
								talents[1][1].max = 7
							end
							if gui ~= nil and gui.tableTalents1S then
								gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
								gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
							end
						end
					end
				else
					game.freezedaytime(false)
				end
			else
				glob.cursed.others.runday = true
			end
		end
	end
end)

game.onevent(defines.events.onguiclick, function(event)
	local resetg = clickgui(event)
	if resetg ~= nil then
		tiempo = 2
		someonejoined = true
	end
end)

function getowner(build,type)
	if type == "drill" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.mines ~= nil then
				for i = 1, #v.mines do
					if v.mines[i] ~= nil and v.mines[i].entity ~= nil and build.equals(v.mines[i].entity) then
						return k
					end
				end
			end
		end
	elseif type == "turret" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.turrets then
				for i = 1, #v.turrets do
					if v.turrets[i] ~= nil and v.turrets[i].entity ~= nil and build.equals(v.turrets[i].entity) then
						return k
					end
				end
			end
		end
	elseif type == "container" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.turrets then
				if v.aux.vaultentity ~= nil and build.equals(v.aux.vaultentity) then
					return k
				end
			end
		end
	end
end

function getplayerbyname(name)
	return game.getplayer(name)
end

function removeAxes(player)
	for i=1,maxTool do
		if player.getitemcount("cursed-axe-"..i) >=1 then
			player.removeitem({name="cursed-axe-"..i, count=player.getitemcount("cursed-axe-"..i)})
		end
	end
	if (player.getinventory(defines.inventory.playertools)[1] ~= nil) then
		if (string.sub(player.getinventory(defines.inventory.playertools)[1].name,1,11)) == "cursed-axe-"   then
			player.getinventory(defines.inventory.playertools).remove(player.getinventory(defines.inventory.playertools)[1])
		end
	end
end
function removeArmors(player)
	for i=1,maxArmor do
		if player.getitemcount("cursed-armor-"..i) >=1 then
			player.removeitem({name="cursed-armor-"..i, count=player.getitemcount("cursed-armor-"..i)})
		end
	end
	if (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
		if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
			player.getinventory(defines.inventory.playerarmor).remove(player.getinventory(defines.inventory.playerarmor)[1])
		end
	end
end
function removeBows(player)
	for i=1,maxWeapon1 do
		if player.getitemcount("cursed-weapon1-"..i) >=1 then
			player.removeitem({name="cursed-weapon1-"..i, count=player.getitemcount("cursed-weapon1-"..i)})
		end
	end
	for i = 1, 3 do
		if player.getinventory(defines.inventory.playerguns)[i] ~= nil then
			if (string.sub(player.getinventory(defines.inventory.playerguns)[i].name,1,15)) == "cursed-weapon1-"   then
				player.getinventory(defines.inventory.playerguns).remove(player.getinventory(defines.inventory.playerguns)[i])
			end
		end
	end
end
function removeArrows(player)
	for i=1,maxRange do
		if player.getitemcount("cursed-ammo1-"..i) >=1 then
			player.removeitem({name="cursed-ammo1-"..i, count=player.getitemcount("cursed-ammo1-"..i)})
		end
	end
	for i = 1, 3 do
		if player.getinventory(defines.inventory.playerammo)[i] ~= nil then
			if (string.sub(player.getinventory(defines.inventory.playerammo)[i].name,1,12)) == "cursed-ammo1"   then
				player.getinventory(defines.inventory.playerammo).remove(player.getinventory(defines.inventory.playerammo)[i])
			end
		end
	end
end

function round(num,dec)
	if dec ~= 0 then
		num = num * (10 ^ dec)
	end
		num = math.floor(num)
	if dec ~= 0 then
		num = num / (10 ^ dec)
	end
	return num
end

function levelmines(minecalled,player)
	local mine = glob.cursed[player.name].mines[minecalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (mine.exp >= mine.next) and (mine.level < talents[3][2].now + 2) then
		mine.level = mine.level + 1
		mine.exp = round(mine.exp - mine.next,3)
		mine.next = mine.level * mine.level * 2
		local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
		mine.entity.destroy()	
		mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui ~= nil and gui.tableBuilds1S then
			if gui.tableMine.builds1c2.caption == mine.nick then
				gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mine.level}
			end
		end
		player.print({"msg.cursed",{"msg.evolved",mine.nick}})
	elseif (mine.exp < 0) and (mine.level > 1) then
		if math.abs(mine.exp) > (mine.next * 0.3) then
			down = (math.abs(mine.exp) * 10) / (mine.next * 0.3)
		else
			down = 10 + math.floor((math.abs(mine.exp) * 90) / mine.next)
			if down > 100 then down = 100 end
		end
		if math.random(100) <= down then
			mine.level = mine.level - 1
			mine.next = mine.level * mine.level * 2
			mine.exp = round(mine.next + mine.exp,3)
			local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
			mine.entity.destroy()
			mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui ~= nil and gui.tableBuilds1S then
				if gui.tableMine.builds1c2.caption == mine.nick then
					gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mine.level}
				end
			end
			player.print({"msg.cursed",{"msg.regressed",mine.nick}})
		end
	end
end

function levelturrets(turretcalled,player)
	local turret = glob.cursed[player.name].turrets[turretcalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (turret.exp >= turret.next) and (turret.level < talents[3][4].now + 2) then
		turret.level = turret.level + 1
		turret.exp = round(turret.exp - turret.next,3)
		turret.next = turret.level * turret.level * 2
		local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
		turret.entity.destroy()	
		turret.entity = game.createentity{name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui ~= nil and gui.tableBuilds2S then
			if gui.tableTurret.builds2c2.caption == turret.nick then
				gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets.level}
			end
		end
		player.print({"msg.cursed",{"msg.evolved",turret.nick}})
	elseif (turret.exp < 0) and (turret.level > 1) then
		if math.abs(turret.exp) > (turret.next * 0.3) then
			down = (math.abs(turret.exp) * 10) / (turret.next * 0.3)
		else
			down = 10 + math.floor((math.abs(turret.exp) * 90) / turret.next)
			if down > 100 then down = 100 end
		end
		if math.random(100) <= down then
			turret.level = turret.level - 1
			turret.next = turret.level * turret.level * 2
			turret.exp = round(turret.next + turret.exp,3)
			local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
			turret.entity.destroy()
			turret.entity = game.createentity{name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui ~= nil and gui.tableBuilds2S then
				if gui.tableTurret.builds2c2.caption == turret.nick then
					gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets.level}
				end
			end
			player.print({"msg.cursed",{"msg.regressed",turret.nick}})
		end
	end
end


function skillUp(statcalled,newnext,player)
	if statcalled.exp >= statcalled.next then
		statcalled.level = statcalled.level + 1
		statcalled.exp = round(statcalled.exp - statcalled.next,3)
		statcalled.next = newnext
		local stats = glob.cursed[player.name].stats
		local gui = glob.cursed[player.name].gui
		if statcalled == stats.general then
			player.character.insert({name="cursed-talent-2",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat1"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats1S then
				gui.tableStats1.stat1c1.caption = {"gui.stat1c1",{"bsc.stat1"},statcalled.level}
				gui.tableStats1.stat1c4.caption = {"gui.stat1c4",statcalled.level / 40}
			end
		elseif statcalled == stats.mining then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat2"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats2S then
				gui.tableStats2.stat2c1.caption = {"gui.stat2c1",{"bsc.stat2"},statcalled.level}
				gui.tableStats2.stat2c4.caption = {"gui.stat2c4",statcalled.level}
			end
		elseif statcalled == stats.farming then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat3"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats3S then
				gui.tableStats3.stat3c1.caption = {"gui.stat3c1",{"bsc.stat3"},statcalled.level}
				gui.tableStats3.stat3c4.caption = {"gui.stat3c4",statcalled.level * 2}
			end
		elseif statcalled == stats.crafting then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat4"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats4S then
				gui.tableStats4.stat4c1.caption = {"gui.stat4c1",{"bsc.stat4"},statcalled.level}
				gui.tableStats4.stat4c4.caption = {"gui.stat4c4",statcalled.level / 2.5}
			end
		elseif statcalled == stats.explore	then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat5"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats5S then
				gui.tableStats5.stat5c1.caption = {"gui.stat5c1",{"bsc.stat5"},statcalled.level}
				gui.tableStats5.stat5c4.caption = {"gui.stat5c4",statcalled.level / 32}
			end
		elseif statcalled == stats.defence then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat6"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats6S then
				gui.tableStats6.stat6c1.caption = {"gui.stat6c1",{"bsc.stat6"},statcalled.level}
				gui.tableStats6.stat6c4.caption = {"gui.stat6c4",statcalled.level / 100}
			end
		elseif statcalled == stats.range then
			player.character.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat7"},statcalled.level,statcalled.next}})
			end
			if statcalled.level <= maxRange then
				local arrows = player.getitemcount("cursed-ammo1-" .. statcalled.level - 1)
				removeArrows(player)
				player.insert({name="cursed-ammo1-"..statcalled.level,count=arrows})
			end
			if gui ~= nil and gui.tableStats7S then
				gui.tableStats7.stat7c1.caption = {"gui.stat7c1",{"bsc.stat7"},statcalled.level}
				if statcalled.level <= maxRange then
					gui.tableStats7.stat7c4.caption = {"gui.stat7c4",6.5 + statcalled.level * 0.5}
				end
			end
		end
		if statcalled ~= stats.general then
			stats.general.exp = stats.general.exp + 1
			if stats.general.exp >=  stats.general.next then
				skillUp(stats.general,(5),player)
			end
			if gui ~= nil and gui.tableStats1S then
			end
		end
	end
end

function globalPrint(text)
	local players = game.players
	for i=1, #players do
		players[i].print(text)
	end
end

function resetstats(player)
	local stats = {}
	n = {"general","mining","farming","crafting","explore","range","melee","defence"}
	for i = 1, #n do
		stats[n[i]] = {}
		stats[n[i]].name = n[i]
		stats[n[i]].level = 1
		stats[n[i]].exp = 0
		stats[n[i]].next = ((stats[n[i]].level * stats[n[i]].level) * 0.8 + 10 )
	end
	stats.general.next = (5)
	glob.cursed[player.name].stats = stats
end

function resettalents(player)
	local mines = glob.cursed[player.name].mines
	if mines ~= nil then
		local n = #mines
		for i = 1, #mines do
			mines[n].entity.destroy()
			table.remove(mines,n)
			n = n - 1
		end
	end
	mines = {}
	glob.cursed[player.name].mines = mines
	local turrets = glob.cursed[player.name].turrets
	if turrets ~= nil then
		local n = #turrets
		for i = 1, #turrets do
			turrets[n].entity.destroy()
			table.remove(turrets,n)
			n = n - 1
		end
	end
	turrets = {}
	glob.cursed[player.name].turrets = turrets
	local talents = {}
	for i=1, 6 do
		talents[i] = {}
		for j=1, 10 do
			talents[i][j] = {now,max}
		end
	end
	talents[1] = {}
	talents[1][1] = {now,max}
	talents[1][1].now = 0
	talents[1][1].max = 7
	talents[1][2] = {now,max}
	talents[1][2].now = 0
	talents[1][2].max = 7
	talents[1][3] = {now,max}
	talents[1][3].now = 0
	talents[1][3].max = 1
	talents[1][4] = {now,max}
	talents[1][4].now = 0
	talents[1][4].max = 1
	talents[1][5] = {now}
	talents[1][5].now = 0
	talents[1][6] = {now}
	talents[1][6].now = 0
	talents[1][7] = {now}
	talents[1][7].now = 0
	talents[1][8] = {now}
	talents[1][8].now = 0
	talents[1][9] = {now}
	talents[1][9].now = 0
	talents[1][10] = {now}
	talents[1][10].now = 0
	talents[2] = {}
	talents[2][1] = {now,max}
	talents[2][1].now = 1
	talents[2][1].max = maxTool
	talents[2][2] = {now,max}
	talents[2][2].now = 1
	talents[2][2].max = maxArmor
	talents[2][3] = {now,max}
	talents[2][3].now = 1
	talents[2][3].max = maxWeapon1
	talents[3] = {}
	talents[3][1] = {now,max}
	talents[3][1].now = 0
	talents[3][1].max = 2
	talents[3][2] = {now,max}
	talents[3][2].now = 0
	talents[3][2].max = maxMine - 2
	talents[3][3] = {now,max}
	talents[3][3].now = 0
	talents[3][3].max = 2
	talents[3][4] = {now,max}
	talents[3][4].now = 0
	talents[3][4].max = maxTurret - 2
	talents[4] = {}
	talents[4][1] = {now}
	talents[4][1].now = 0
	talents[4][2] = {now}
	talents[4][2].now = 0
	talents[4][3] = {now}
	talents[4][3].now = 0
	talents[4][4] = {now}
	talents[4][4].now = 0
	talents[4][5] = {now}
	talents[4][5].now = 0
	talents[4][6] = {now}
	talents[4][6].now = 0
	talents[4][7] = {now}
	talents[4][7].now = 0
	talents[4][8] = {now}
	talents[4][8].now = 0
	talents[4][9] = {now}
	talents[4][9].now = 0
	talents[4][10] = {now}
	talents[4][10].now = 0
	talents[5] = {}
	talents[5][4] = {now}
	talents[5][4].now = 0
	talents[5][6] = {now}
	talents[5][6].now = 0
	talents[5][7] = {now,max}
	talents[5][7].now = 0
	talents[5][7].max = 300
	talents[5][8] = {now}
	talents[5][8].now = 0
	glob.cursed[player.name].talents = talents
	removeAxes(player)
	player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
	removeArmors(player)
	player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
	removeBows(player)
	player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
	player.insert({name="cursed-ammo1-1",count=10})
	player.insert({name="cursed-talent-1",count=10})
end

function resetall(player)
	for i = 1, 3 do
		if player.getinventory(defines.inventory.playerguns)[i] ~= nil then
			player.getinventory(defines.inventory.playerguns).remove(player.getinventory(defines.inventory.playerguns)[i])
		end
	end
	for i = 1, 3 do
		if player.getinventory(defines.inventory.playerammo)[i] ~= nil then
			player.getinventory(defines.inventory.playerammo).remove(player.getinventory(defines.inventory.playerammo)[i])
		end
	end
	cursed = {}
	cursed.aux = {}
	cursed.aux.pos = player.position
	cursed.aux.lasthp = player.character.health
	cursed.aux.maxhealth = player.character.prototype.maxhealth
	cursed.aux.donations = 1
	cursed.aux.arrows = 2
	cursed.aux.vault = nil
	cursed.aux.vaultentity = nil
	-- cursed.aux.tomb = nil
	-- cursed.aux.inventory = {}
	cursed.aux.version = currentVersion
	cursed.opt = {}
	for i = 1, 8 do
		cursed.opt[i] = true
	end
	glob.cursed[player.name] = cursed
	resetstats(player)
-- importstats
	resettalents(player)
-- importtalents
end

function changeVersion(player)
	local version = glob.cursed[player.name].aux.version
	if version < 000009 then
		glob.cursed[player.name].aux.maxhealth = player.character.prototype.maxhealth
	end
	if version < 000010 then
		playerlistold = nil
		glob.cursed.others = {}
		glob.cursed.others.blood = glob.cursed.blood
		glob.cursed.blood = nil
		glob.cursed.others.tanks = glob.cursed.tanks
		glob.cursed.tanks = nil
		glob.cursed.others.runday = glob.cursed.runday
		glob.cursed.runday = nil
		glob.cursed.others.runday = true
	end
	glob.cursed[player.name].aux.version = currentVersion
end

-- function setgettomb(player,action)
	-- if action == "set" then
		-- local inventory = glob.cursed[player.name].aux.inventory
		
		-- if not inventory.playerquickbar then
			-- inventory.playerquickbar = nil
		-- end
		-- local playerquickbar = player.getinventory(defines.inventory.playerquickbar)
		-- if inventory.playerquickbar == nil or util.table.compare(inventory.playerquickbar,playerquickbar) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playerquickbar do
				-- if playerquickbar[i] ~= nil then
					-- copy[n] = {name=playerquickbar[i].name,count=playerquickbar[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playerquickbar = copy
		-- end
		-- if not inventory.playermain then
			-- inventory.playermain = nil
		-- end
		-- local playermain = player.getinventory(defines.inventory.playermain)
		-- if inventory.playermain == nil or util.table.compare(inventory.playermain,playermain) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playermain do
				-- if playermain[i] ~= nil then
					-- copy[n] = {name=playermain[i].name,count=playermain[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playermain = copy
		-- end
		-- if not inventory.playerguns then
			-- inventory.playerguns = nil
		-- end
		-- local playerguns = player.getinventory(defines.inventory.playerguns)
		-- if inventory.playerguns == nil or util.table.compare(inventory.playerguns,playerguns) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playerguns do
				-- if playerguns[i] ~= nil then
					-- copy[n] = {name=playerguns[i].name,count=playerguns[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playerguns = copy
		-- end
		-- if not inventory.playertools then
			-- inventory.playertools = nil
		-- end
		-- local playertools = player.getinventory(defines.inventory.playertools)
		-- if inventory.playertools == nil or util.table.compare(inventory.playertools,playertools) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playertools do
				-- if playertools[i] ~= nil then
					-- copy[n] = {name=playertools[i].name,count=playertools[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playertools = copy
		-- end
		-- if not inventory.playerammo then
			-- inventory.playerammo = nil
		-- end
		-- local playerammo = player.getinventory(defines.inventory.playerammo)
		-- if inventory.playerammo == nil or util.table.compare(inventory.playerammo,playerammo) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playerammo do
				-- if playerammo[i] ~= nil then
					-- copy[n] = {name=playerammo[i].name,count=playerammo[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playerammo = copy
		-- end
		-- if not inventory.playerarmor then
			-- inventory.playerarmor = nil
		-- end
		-- local playerarmor = player.getinventory(defines.inventory.playerarmor)
		-- if inventory.playerarmor == nil or util.table.compare(inventory.playerarmor,playerarmor) == false then
			-- local copy = {}
			-- local n = 1
			-- for i = 1, #playerarmor do
				-- if playerarmor[i] ~= nil then
					-- copy[i] = {name=playerarmor[i].name,count=playerarmor[i].count}
					-- n = n + 1
				-- end
			-- end
			-- inventory.playerarmor = copy
		-- end
		-- if not inventory.cursorstack then
			-- inventory.cursorstack = nil
		-- end
		-- local cursorstack = player.cursorstack
		-- if cursorstack ~= nil and inventory.cursorstack == nil or inventory.cursorstack ~= cursorstack then
			-- local copy = {name=cursorstack.name,count=cursorstack.count}
			-- inventory.cursorstack = copy
		-- end
		-- glob.cursed[player.name].aux.inventory = inventory
	-- elseif action == "get" then
		-- local items = {}
		-- local inventory = glob.cursed[player.name].aux.inventory
		-- if inventory.playerquickbar then
			-- for i = 1, #inventory.playerquickbar do
				-- table.insert(items,inventory.playerquickbar[i])
			-- end
		-- end
		-- if inventory.playermain then
			-- for i = 1, #inventory.playermain do
				-- table.insert(items,inventory.playermain[i])
			-- end
		-- end
		-- if inventory.playerguns then
			-- for i = 1, #inventory.playerguns do
				-- table.insert(items,inventory.playerguns[i])
			-- end
		-- end
		-- if inventory.playertools then
			-- for i = 1, #inventory.playertools do
				-- table.insert(items,inventory.playertools[i])
			-- end
		-- end
		-- if inventory.playerammo then
			-- for i = 1, #inventory.playerammo do
				-- table.insert(items,inventory.playerammo[i])
			-- end
		-- end
		-- if inventory.playerarmor then
			-- for i = 1, #inventory.playerarmor do
				-- table.insert(items,inventory.playerarmor[i])
			-- end
		-- end
		-- if inventory.cursorstack then
			-- table.insert(items,inventory.cursorstack)
		-- end
		-- return items
	-- end
-- end

remote.addinterface("cursed",
{
prueba = function()
local text = ""
for k,v in ipairs(game.players) do
	text = text .. " - " .. v.name
end
game.player.print(text)
end,
})
