require("defines")
require("util")
require("scripts/files")

	local maxRange = 300
	local maxMiningBonus = 200
	local maxFarmingBonus = 200
	local maxCraftingBonus = 200
	local maxExploreBonus = 200
	local maxAttackBonus = 200
	local maxDefenseBonus = 200
	local maxTool = 300
	local maxArmor = 110
	local maxWeapon1 = 110
	local maxAmmo1 = 110
	local maxBoots = 0
	local maxMine = 50
	local maxTurret = 50
	local maxWalls = 0
	local maxGenerator = 0
	local maxTalentPart = 150
	local maxRegen = 200
	local maxDmgAura = 200
	local maxWinTalent = 200
	
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
	glob.cursed = {}
	glob.cursed.blood = {}
	glob.cursed.tanks = {}
	glob.cursed.runday = true
	
--player.print(serpent.block(cursed.stats))
--player.clearconsole()
end)
game.onload(function()
	if game.players[1].name == "" or game.players[1].name == "SP" then
		single = true
		game.players[1].name = "SP"
	else
		single = false
	end
	local cursed = glob.cursed
	local player = game.players[1]
	if cursed == nil or cursed[player.name] == nil then
		cursed[player.name] = {}
		glob.cursed[player.name].aux = {}
		glob.cursed[player.name].aux.pos = player.position
		glob.cursed[player.name].aux.iscrafting = false
		glob.cursed[player.name].aux.lasthp = player.character.health
		glob.cursed[player.name].aux.donations = 1
		glob.cursed[player.name].aux.arrows = 1
		resetstats(player)
	-- importstats
		resettalents(player)
	-- importtalents
		resetgui(player)
		glob.cursed = cursed
	end
end)
game.onsave(function()
end)


game.onevent(defines.events.onplayercreated, function(event)
local player = game.getplayer(event.playerindex)
	if player.name == "" then
		single = true
		player.name = "SP"
	else
		single = false
	end
	
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
	
	glob.cursed[player.name] = {}
	glob.cursed[player.name].aux = {}
	glob.cursed[player.name].aux.pos = player.position
	glob.cursed[player.name].aux.iscrafting = false
	glob.cursed[player.name].aux.lasthp = player.character.health
	glob.cursed[player.name].aux.donations = 0
	glob.cursed[player.name].aux.arrows = 0
	
	resetstats(player)
	-- importstats
	resettalents(player)
	-- importtalents
	resetgui(player)
	
end)

game.onevent(defines.events.onplayercrafteditem, function(event)
	if event.itemstack.name == "cursed-donation" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local donations = glob.cursed[player.name].aux.donations
		if donations > 0 then
			if player.character.health > 50 then
				local lasthp = glob.cursed[player.name].aux.lasthp
				player.character.health = player.character.health - 50
				lasthp = player.character.health
				donations = donations - 1
				glob.cursed[player.name].aux.donations = donations
				glob.cursed[player.name].aux.lasthp = lasthp
			else
				player.removeitem(event.itemstack)
				player.print("Need 50 health for make a blood donation")
			end
		else
			player.removeitem(event.itemstack)
			player.print("You can't donate more blood today")
		end
	elseif event.itemstack.name == "cursed-ammo1-1" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local arrows = glob.cursed[player.name].aux.arrows
		if arrows > 0 then
			if player.character.health > 25 then
				local lasthp = glob.cursed[player.name].aux.lasthp
				player.character.health = player.character.health - 25
				lasthp = player.character.health
				arrows = arrows - 1
				glob.cursed[player.name].aux.arrows = arrows
				glob.cursed[player.name].aux.lasthp = lasthp
			else
				player.removeitem(event.itemstack)
				player.print("Need 25 health for make arrows")
			end
		else
			player.removeitem(event.itemstack)
			player.print("You can't craft more arrows today")
		end
	end
end)

game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "cursed-drill-1" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local mine = glob.cursed[player.name].mines
		for i = 1, #mine do
			if not mine[i].entity.valid then
				mine[i] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
				return
			end
		end
		mine[#mine + 1] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
	elseif event.createdentity.name == "cursed-turret-1" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local turrets = cursed[player.name].turrets
		for i = 1, #turrets do
			if not turrets[i].entity.valid then
				turrets[i] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
				return
			end
		end
		turrets[#turrets + 1] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
	elseif event.createdentity.name == "cursed-blood-tank-1" then
		local tanks = cursed.tanks
		for i = 1, #tanks do
			if not tanks[i].entity.valid then
				tanks[i] = {entity = event.createdentity, nick = "Tank {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}"}	
				return
			end
		end
		tanks[#tanks + 1] = {entity = event.createdentity, nick = "Tank {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}"}
	elseif event.createdentity.name == "cursed-donation" then
		event.createdentity.destroy()
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
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
	end
end)

game.onevent(defines.events.onentitydied, function(event)
	if event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,13)) == "cursed-drill-" then
		local player = getowner(event.entity,"drill")
		local mines = glob.cursed[player.name].mines
		local gui = glob.cursed[player.name].gui
		local talents = glob.cursed[player.name].talents
		for i = 1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				if gui.tableBuilds1S then
					if gui.tableMine.builds1c2.caption == mines[i].nick then
						guiFlipFlop("buildsMain1",player)
					end
				end
				player.print(mines[i].nick .. " has been destroyed")
				table.remove(mines,i)
				talents[3][1].now = talents[3][1].now - 1
				if gui.tableTalents3S then
					gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
				end
			end
		end
	elseif event.entity.type == "turret" and string.sub(event.entity.name,1,14) == "cursed-turret-" then
		local player = getowner(event.entity,"turret")
		local turrets = glob.cursed[player.name].turrets
		local gui = glob.cursed[player.name].gui
		local talents = glob.cursed[player.name].talents
		for i = 1, #turrets do
			if turrets[i] ~= nil and turrets[i].entity ~= nil and event.entity.equals(turrets[i].entity) then
				if gui.tableBuilds2S then
					if gui.tableTurret.builds2c2.caption == turrets[i].nick then
						guiFlipFlop("buildsMain2",player)
					end
				end
				player.print(turrets[i].nick .. " has been destroyed")
				table.remove(turrets,i)
				talents[3][3].now = talents[3][3].now - 1
				if gui.tableTalents3S then
					gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
				end
			end
		end
	elseif event.entity.force.name == "enemy" then
		if --[[player.force.ischunkcharted(event.entity.position) == true and]] #game.findentitiesfiltered{area = {{event.entity.position.x-16, event.entity.position.y-16}, {event.entity.position.x+16, event.entity.position.y+16}}, name="cursed-blood"} < 15 then
			local blood = glob.cursed.blood
			for i = 1, #blood do
				if blood[i] == nil or blood[i].entity == nil then
					blood[i] = {}
					blood[i].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
					blood[i].total = game.entityprototypes[event.entity.name].maxhealth / 20
					blood[i].time = 3
					return
				end
			end
			blood[#blood + 1] = {}
			blood[#blood].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
			blood[#blood].total = game.entityprototypes[event.entity.name].maxhealth / 20
			blood[#blood].time = 5
		end
		game.pollute(event.entity.position,(game.entityprototypes[event.entity.name].maxhealth * 0.1))
		
		local nearplayer = game.findentitiesfiltered{area ={{event.entity.position.x - 20,event.entity.position.y - 20},{event.entity.position.x + 20,event.entity.position.y + 20}},type="player"}
		local players = {}
		for  i = 1, #nearplayer do
			for j = 1, #game.players do
				if nearplayer[i].equals(game.players[j].character) then
					table.insert(players,game.players[j])
					if single == true then
						players[#players].name = "SP"
					end
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
				if math.random(100) <= ((talents[5][8].now + lowerchance) / 2) * 0.375 then
					player.insert({name="cursed-talent-1",count=1})
				end
			end
			if player.getinventory(defines.inventory.playerguns)[1] ~= nil and (string.sub(player.getinventory(defines.inventory.playerguns)[1].name,1, 15)) == "cursed-weapon1-" then 
				local stats = glob.cursed[player.name].stats
				local gui = glob.cursed[player.name].gui
				stats.range.exp = stats.range.exp + (game.entityprototypes[event.entity.name].maxhealth * 0.01 * (1 + talents[1][9].now / 40 + stats.general.level / 40)) / #players
				if stats.range.exp >= stats.range.next then
					skillUp(stats.range,(((stats.range.level + 1) * (stats.range.level + 1)) * 0.8 + 10 ),player)
				end
				if gui.tableStats7S then
					gui.tableStats7.stat7c2.caption = "Experience: " .. stats.range.exp .. " / " .. stats.range.next .. " (+" .. 100 * (talents[1][9].now / 40 + stats.general.level / 40) .. "%)"
					gui.tableStats7.stat7c3.value = stats.range.exp / stats.range.next
				end
			end
		end
		local nearturret = game.findentitiesfiltered{area ={{event.entity.position.x - 30,event.entity.position.y - 30},{event.entity.position.x + 30,event.entity.position.y + 30}},type="turret"}
		local num = 0
		for i = 1, #nearturret do
			if string.sub(nearturret[i].name,1,14) == "cursed-turret-" and util.distance(nearturret[i].position,event.entity.position) < 5 + (tonumber(string.sub(nearturret[i].name,15,16))) / 2 and num == 0 then
				num = i
			end
		end
		if num ~= 0 then
			local player = getowner(nearturret[num],"turret")
			local talents = glob.cursed[player.name].talents
			local turrets = cursed[player.name].turrets
			local gui = glob.cursed[player.name].gui
			for i = 1, #turrets do
				if nearturret[num].equals(turrets[i].entity) and turrets[i].level <= talents[3][4].now + 2 then
					if not (turrets[i].level == talents[3][4].now + 2 and turrets[i].exp >= turrets[i].next * 1.2) then
						turrets[i].exp = turrets[i].exp + game.entityprototypes[event.entity.name].maxhealth * 0.1
						if turrets[i].exp >= turrets[i].next then
							levelturrets(i,player)
						end
						if gui.tableBuilds2S then
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
		end
	elseif event.entity.name == "cursed-blood" then
		local blood = glob.cursed.blood
		for i = 1, #blood do
			if blood[i] ~= nil and event.entity.equals(blood[i].entity) then
				table.remove(blood,i)
			end
		end
	end
end)

game.onevent(defines.events.onpreplayermineditem, function(event)
	if event.entity.type == "tree" or "resource" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local talents = glob.cursed[player.name].talents
		if (player.getinventory(defines.inventory.playertools).getitemcount("cursed-axe-" .. talents[2][1].now) >= 1)  then
			local stats = glob.cursed[player.name].stats
			local gui = glob.cursed[player.name].gui
			if event.entity.type == "tree" then
				stats.farming.exp = stats.farming.exp + (1 * (1 + talents[1][6].now / 40 + stats.general.level / 40)) -- (mining_time * hardness)
				if stats.farming.exp >= stats.farming.next then
					skillUp(stats.farming,(((stats.farming.level + 1) * (stats.farming.level + 1)) * 0.8 + 10 ),player)
				end
				if gui.tableStats3S then
					gui.tableStats3.stat3c2.caption = "Experience: " .. stats.farming.exp .. " / " .. stats.farming.next .. " (+" .. 100 * (talents[1][6].now / 40 + stats.general.level / 40) .. "%)"
					gui.tableStats3.stat3c3.value = stats.farming.exp / stats.farming.next
				end
			elseif event.entity.type == "resource" then
				stats.mining.exp = stats.mining.exp + (0.75 * (1 + talents[1][5].now / 40 + stats.general.level / 40))-- (mining_time * hardness)
				if stats.mining.exp >= stats.mining.next then
					skillUp(stats.mining,(((stats.mining.level + 1) * (stats.mining.level + 1)) * 0.8 + 10 ),player)
				end
				if gui.tableStats2S then
					gui.tableStats2.stat2c2.caption = "Experience: " .. stats.mining.exp .. " / " .. stats.mining.next .. " (+" .. 100 * (talents[1][5].now / 40 + stats.general.level / 40) .. "%)"
					gui.tableStats2.stat2c3.value = stats.mining.exp / stats.mining.next
				end
			end
		end
	end
	if event.entity.type == "mining-drill" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local gui = glob.cursed[player.name].gui
		local mines = cursed[player.name].mines
		for i=1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				if gui.tableBuilds1S then
					if gui.tableMine.builds1c2.caption == mines[i].nick then
						guiFlipFlop("buildsMain1",player)
					end
				end
				table.remove(mines,i)
			end
		end
	elseif event.entity.name == "cursed-blood-tank-1" then
		local player = game.getplayer(event.playerindex)
		if single == true then
			player.name = "SP"
		end
		local tanks = cursed[player.name].tanks
		for i=1, #tanks do
			if tanks[i].entity.valid and event.entity.equals(tanks[i].entity) then
				table.remove(tanks,i)
			end
		end
	end
end)

game.onevent(defines.events.ontick, function(event)
	if #game.players >= 1 then
		if game.tick%30==0 then
			for _,v in ipairs(game.players) do
				if single == true then
					v.name = "SP"
				end
				if v.selected ~= nil and (v.selected.type == "resource" or v.selected.type == "tree") then
					local stats = glob.cursed[v.name].stats
					if v.selected.type == "resource" then
						v.force.manualminingspeedmodifier = 1 + (stats.mining.level / 16)
					elseif v.selected.type == "tree" then
						v.force.manualminingspeedmodifier = 1 + (stats.farming.level / 8)
					end
				else
					v.force.manualminingspeedmodifier = 1
				end
				local healthless = (game.entityprototypes[v.character.name].maxhealth - v.character.health)
				if healthless > 0 then
					if (string.sub(v.getinventory(defines.inventory.playerarmor)[1].name,1, 13)) == "cursed-armor-" then
						local lasthp = glob.cursed[v.name].aux.lasthp
						if lasthp > v.character.health then
							local stats = glob.cursed[v.name].stats
							local talents = glob.cursed[v.name].talents
							local gui = glob.cursed[v.name].gui
							stats.defense.exp = stats.defense.exp + ((lasthp - v.character.health) * 0.1 * (1 + talents[1][9].now / 40 + stats.general.level / 40))
							if stats.defense.exp >= stats.defense.next then
								skillUp(stats.defense,(((stats.defense.level + 1) * (stats.defense.level + 1)) * 0.8 + 10 ),v)
							end
							if gui.tableStats6S then
								gui.tableStats6.stat6c2.caption = "Experience: " .. stats.defense.exp .. " / " .. stats.defense.next .. " (+" .. 100 * (talents[1][10].now / 40 + stats.general.level / 40) .. "%)"
								gui.tableStats6.stat6c3.value = stats.defense.exp / stats.defense.next
							end
						end
					end
					local talents = glob.cursed[v.name].talents
					local regen = 0.005 * talents[5][4].now
					if healthless <= regen then
						v.character.health = v.character.health + healthless
					else
						v.character.health = v.character.health + regen
					end
				end
				glob.cursed[v.name].aux.lasthp = v.character.health
			end
		end
		if event.tick%60==0 then
			for _,v in ipairs(game.players) do
				if single == true then
					v.name = "SP"
				end
				local stats = glob.cursed[v.name].stats
				local talents = glob.cursed[v.name].talents
				local gui = glob.cursed[v.name].gui
				local pos = glob.cursed[v.name].aux.pos
				local distance = (util.distance(pos,v.position) / 48)
				if distance > 0 then
					stats.explore.exp = stats.explore.exp + (distance * (1 + talents[1][8].now / 40 + stats.general.level / 40))
					glob.cursed[v.name].aux.pos = v.position
					if stats.explore.exp >= stats.explore.next then
						skillUp(stats.explore,(((stats.explore.level + 1) * (stats.explore.level + 1)) * 0.8 + 10 ),v)
					end
					if gui.tableStats5S then
						gui.tableStats5.stat5c2.caption = "Experience: " .. stats.explore.exp .. " / " .. stats.explore.next .. " (+" .. 100 * (talents[1][8].now / 40 + stats.general.level / 40) .. "%)"
						gui.tableStats5.stat5c3.value = stats.explore.exp / stats.explore.next
					end
				end
				local iscrafting = glob.cursed[v.name].aux.iscrafting
				if v.craftingqueuesize == 0 then
					iscrafting = false
				end
				if iscrafting then
					stats.crafting.exp = stats.crafting.exp + ( 0.1 * (1 + talents[1][7].now / 40 + stats.general.level / 40))
					if stats.crafting.exp >= stats.crafting.next then
						skillUp(stats.crafting,(((stats.crafting.level + 1) * (stats.crafting.level + 1)) * 0.8 + 10 ),v)
					end
					if gui.tableStats4S then
						gui.tableStats4.stat4c2.caption = "Experience: " .. stats.crafting.exp .. " / " .. stats.crafting.next .. " (+" .. 100 * (talents[1][7].now / 40 + stats.general.level / 40) .. "%)"
						gui.tableStats4.stat4c3.value = stats.crafting.exp / stats.crafting.next
					end
				end
				if v.craftingqueuesize > 0 then
					iscrafting = true
				end
				glob.cursed[v.name].aux.iscrafting = iscrafting
				for _,v in ipairs(game.findenemyunits(v.character.position, talents[5][6].now * 0.125 + 7)) do
					v.damage(talents[5][6].now * 0.025, v.force )
				end
			end
		end
		if game.tick%300 == 0 then
			local tanks = glob.cursed.tanks
			for i = 1, #tanks do
				if tanks[i].entity.fluidbox[1] ~= nil and tanks[i].entity.fluidbox[1].type ~= "blood" then
					tanks[i].entity.fluidbox[1] = nil
				end
				local blood = glob.cursed.blood
				for _,j in ipairs(game.findentitiesfiltered{area = {{tanks[i].entity.position.x-32, tanks[i].entity.position.y-32}, {tanks[i].entity.position.x+32, tanks[i].entity.position.y+32}}, name="cursed-blood"}) do
					for k = 1, #blood do
						if blood[k] ~= nil and blood[k].entity ~= nil and j.equals(blood[k].entity) then
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
						end
					end
				end
			end
			for _,v in ipairs(game.players) do
				local mines = glob.cursed[v.name].mines
				local talents = glob.cursed[v.name].talents
				local gui = glob.cursed[v.name].gui
				for i = 1, #mines do
					if mines[i].level <= talents[3][2].now + 2 and game.getpollution(mines[i].entity.position) >= mines[i].level * 5 + 15 and mines[i].entity.energy > 0 then
						if not (mines[i].level == talents[3][2].now + 2 and mines[i].exp >= mines[i].next * 1.2) then
							mines[i].exp = mines[i].exp + 0.05
							if mines[i].exp >= mines[i].next then
								levelmines(i,v)
							end
							if gui.tableBuilds1S then
								if gui.tableMine.builds1c2.caption == mines[i].nick then
									gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[i].exp .. "/" .. mines[i].next
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
							mines[i].exp = mines[i].exp - 0.1
							if mines[i].exp < 0 and mines[i].level ~= 1 then
								levelmines(i,v)
							end
							if gui.tableBuilds1S then
								if gui.tableMine.builds1c2.caption == mines[i].nick then
									gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[i].exp .. "/" .. mines[i].next
									if mines[i].exp > 0 then 
										gui.tableBuilds1.builds1c6.value = mines[i].exp / mines[i].next
									else
										gui.tableBuilds1.builds1c6.value = 0
									end
								end
							end
						end
					end
					local healthless = ((mines[i].level * 25) + 175) - (mines[i].entity.health)
					if healthless > 0 then
						local regen = 3 * mines[i].level
						if (healthless <= regen) then
							mines[i].entity.health = mines[i].entity.health + healthless
						else
							mines[i].entity.health = mines[i].entity.health + regen
						end
					end
				end
				local turrets = glob.cursed[v.name].turrets
				for i = 1, #turrets do
					local healthless = ((turrets[i].level * 25) + 175) - (turrets[i].entity.health)
					if healthless > 0 then
						local regen = 3 * turrets[i].level
						if (healthless <= regen) then
							turrets[i].entity.health = turrets[i].entity.health + healthless
						else
							turrets[i].entity.health = turrets[i].entity.health + regen
						end
					end
				end
			end
		end
		if event.tick%3600 == 0 then
			for _,v in ipairs(game.players) do
				if single == true then
					v.name = "SP"
				end
				local turrets = glob.cursed[v.name].turrets
				local gui = glob.cursed[v.name].gui
				for i=1,#turrets do
					if not (turrets[i].level == 1 and turrets[i].exp <= 0) then
						turrets[i].exp = turrets[i].exp - (turrets[i].next / 10)
						if turrets[i].exp < 0 and turrets[i].level ~= 1 then
							levelturrets(i,v)
						end
						if gui.tableBuilds2S then
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
			local blood = glob.cursed.blood
			for i = 1, #blood do
				if blood[i] ~= nil and blood[i].entity ~= nil then
					if blood[i].time == 0 then
						blood[i].entity.destroy()
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
		if event.tick%12500 == 0 then
			for _,v in ipairs(game.players) do
				if single == true then
					v.name = "SP"
				end
				local donations = glob.cursed[v.name].aux.donations
				if donations < 4 then
					donations = donations + 1
					glob.cursed[v.name].aux.donations = donations
				end
				local arrows = glob.cursed[v.name].aux.arrows
				if arrows < 4 then
					arrows = arrows + 1
					glob.cursed[v.name].aux.arrows = arrows
				end
			end
			local player = game.players[1]
			local talents = glob.cursed[player.name].talents
			if glob.cursed.runday == true then
				if (game.darkness <= 0.01) and (talents[1][1].now >= 1) then
					game.freezedaytime(true)
					glob.cursed.runday = false
					globalPrint("Cursed: 24hs day has started")
					for _,v in ipairs(game.players) do
						local gui = glob.cursed[v.name].gui
						talents = glob.cursed[v.name].talents
						talents[1][1].now = talents[1][1].now - 1
						if talents[1][1].now == 0 then
							talents[1][2].max = 7
						end
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
							gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
						end
					end
				elseif (game.darkness > 0.85) and (talents[1][2].now >= 1) then
					game.freezedaytime(true)
					glob.cursed.runday = false
					globalPrint("Cursed: 24hs night has started")
					for _,v in ipairs(game.players) do
						local gui = glob.cursed[v.name].gui
						talents = glob.cursed[v.name].talents
						talents[1][2].now = talents[1][2].now - 1
						if talents[1][2].now == 0 then
							talents[1][1].max = 7
						end
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
							gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
						end
					end
				else
					game.freezedaytime(false)
				end
			else
				glob.cursed.runday = true
			end
		end
	end
end)

function resetgui(player)
	local gui = glob.cursed[player.name].gui
	if gui and gui.tableMain ~= nil then
		closeAllTalents(-1,player)
		closeAllStats(-1,player)
		closeAllBuilds(-1,player)
		closeAllMain(-1,player)
		if gui.frameTalentsS then
			gui.frameTalents.destroy()
			gui.frameTalentsS = false
		end
		gui.tableMain.destroy()
	else
		gui = {}
	end
	gui.tableMain = player.gui.left.add{ type="flow", name="tableMain", direction="horizontal" }
	gui.tableMainS = true
	local frameTalentsMain = gui.tableMain.add{ type="frame", name="frameTalentsMain", direction = "vertical" }
	local tableTalentsMain = frameTalentsMain.add{ type="flow", name="tableTalentsMain",direction="vertical" }
	tableTalentsMain.add({ type="label", name="main", caption = "cursed", style = "recipe_tooltip_cannot_craft_label_style" })
	tableTalentsMain.add({ type="button", name="talentsMain", caption = "Talents", style = "dialog_button_style" })
	tableTalentsMain.add({ type="button", name="statsMain", caption = "Stats", style = "dialog_button_style" })
	tableTalentsMain.add({ type="button", name="buildsMain", caption = "Builds", style = "dialog_button_style" })
	tableTalentsMain.add({ type="button", name="activesMain", caption = "Activables", style = "dialog_button_style" })
	glob.cursed[player.name].gui = gui
	player.print("Gui reseted")
end

game.onevent(defines.events.onguiclick, function(event)
	local player = game.getplayer(event.element.playerindex)
	if single == true then
		player.name = "SP" 
	end
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if gui.changeNick1S and string.sub(event.element.name,1,11) ~= "changeNick1" and event.element.name ~= "builds1c2" then
		changeNick("mine",player)
	end
	if gui.changeNick2S and string.sub(event.element.name,1,11) ~= "changeNick2" and event.element.name ~= "builds2c2" then
		changeNick("turret",player)
	end
	if event.element.name == "talentsMain" then
		guiFlipFlop("talentsMain",player)
	elseif event.element.name == "statsMain" then
		guiFlipFlop("statsMain",player)
	elseif event.element.name == "buildsMain" then
		guiFlipFlop("buildsMain",player)
	elseif event.element.name == "talentsMain1" then
		guiFlipFlop("talentsMain1",player)
	elseif event.element.name == "talentsMain2" then
		guiFlipFlop("talentsMain2",player)
	elseif event.element.name == "talentsMain3" then
		guiFlipFlop("talentsMain3",player)
	elseif event.element.name == "talentsMain4" then
		guiFlipFlop("talentsMain4",player)
	elseif event.element.name == "talentsMain5" then
		guiFlipFlop("talentsMain5",player)
	elseif event.element.name == "talentsMain6" then
		guiFlipFlop("talentsMain6",player)
	elseif event.element.name == "statsMain1" then
		guiFlipFlop("statsMain1",player)
	elseif event.element.name == "statsMain2" then
		guiFlipFlop("statsMain2",player)
	elseif event.element.name == "statsMain3" then
		guiFlipFlop("statsMain3",player)
	elseif event.element.name == "statsMain4" then
		guiFlipFlop("statsMain4",player)
	elseif event.element.name == "statsMain5" then
		guiFlipFlop("statsMain5",player)
	elseif event.element.name == "statsMain6" then
		guiFlipFlop("statsMain6",player)
	elseif event.element.name == "statsMain7" then
		guiFlipFlop("statsMain7",player)
	elseif event.element.name == "statsMain8" then
		guiFlipFlop("statsMain8",player)
	elseif event.element.name == "buildsMain1" then
		local mines = glob.cursed[player.name].mines
		if #mines ~= 0 or gui.tableBuilds1S then
			local num = 0
			for i = 1, #mines do
				if mines[i] ~= nil and mines[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			if num ~= 0 or gui.tableBuilds1S then
				guiFlipFlop("buildsMain1",player)
			else
				player.print("Need minimum one mine")
			end
		else
			player.print("Need minimum one mine")
		end
	elseif event.element.name == "buildsMain2" then
		local turrets = glob.cursed[player.name].turrets
		if #turrets ~= 0 or gui.tableBuilds2S then
			local num = 0
			for i = 1, #turrets do
				if turrets[i] ~= nil and turrets[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			if num ~= 0 or gui.tableBuilds2S then
				guiFlipFlop("buildsMain2",player)
			else
				player.print("Need minimum one turret")
			end
		else
			player.print("Need minimum one turret")
		end
	elseif event.element.name == "talent1c1" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][1].now < talents[1][1].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				for _,v in ipairs(game.players) do
					talents = glob.cursed[player.name].talents
					talents[1][1].now = talents[1][1].now + 1
					talents[1][2].max = 0
				end
				gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
				gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
				if single == false then
					globalPrint(player.name .. " has bought 24hs day")
				end
			end
		end
	elseif event.element.name == "talent1c2" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][2].now < talents[1][2].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				for _,v in ipairs(game.players) do
					talents = glob.cursed[player.name].talents
					talents[1][2].now = talents[1][2].now + 1
					talents[1][1].max = 0
				end
				gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
				gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
				if single == false then
					globalPrint(player.name .. " has bought 24hs night")
				end
			end
		end
	elseif event.element.name == "talent1c5" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][5].now < talents[1][5].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][5].now = talents[1][5].now + 1
				gui.tableTalents1.talent1c5.caption = "Mining bonus (" .. talents[1][5].now .. "/" .. talents[1][5].max .. ")"
			end
		end
	elseif event.element.name == "talent1c6" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][6].now < talents[1][6].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][6].now = talents[1][6].now + 1
				gui.tableTalents1.talent1c6.caption = "Farming bonus (" .. talents[1][6].now .. "/" .. talents[1][6].max .. ")"
			end
		end
	elseif event.element.name == "talent1c7" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][7].now < talents[1][7].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][7].now = talents[1][7].now + 1
				gui.tableTalents1.talent1c7.caption = "Crafting bonus (" .. talents[1][7].now .. "/" .. talents[1][7].max .. ")"
			end
		end
	elseif event.element.name == "talent1c8" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][8].now < talents[1][8].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][8].now = talents[1][8].now + 1
				gui.tableTalents1.talent1c8.caption = "Explore bonus (" .. talents[1][8].now .. "/" .. talents[1][8].max .. ")"
			end
		end
	elseif event.element.name == "talent1c9" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][9].now < talents[1][9].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][9].now = talents[1][9].now + 1
				gui.tableTalents1.talent1c9.caption = "Attack bonus (" .. talents[1][9].now .. "/" .. talents[1][9].max .. ")"
			end
		end
	elseif event.element.name == "talent1c10" then
		if (player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][10].now < talents[1][10].max) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				talents[1][10].now = talents[1][10].now + 1
				gui.tableTalents1.talent1c10.caption = "Defense bonus (" .. talents[1][10].now .. "/" .. talents[1][10].max .. ")"
			end
		end
	elseif event.element.name == "talent2c1" then
		if (player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][1].now < talents[2][1].max) then
				player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
				talents[2][1].now = talents[2][1].now + 1
				removeAxes(player)
				player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
				gui.tableTalents2.talent2c1.caption = "Update tool (" .. talents[2][1].now .. "/" .. talents[2][1].max .. ")"
			end
		end
	elseif event.element.name == "talent2c2" then
		if (player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][2].now < talents[2][2].max) then
				player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
				talents[2][2].now = talents[2][2].now + 1
				removeArmors(player)
				player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
				gui.tableTalents2.talent2c2.caption = "Update armor (" .. talents[2][2].now .. "/" .. talents[2][2].max .. ")"
			end
		end
	elseif event.element.name == "talent2c3" then
		if (player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][3].now < talents[2][3].max) then
				player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
				talents[2][3].now = talents[2][3].now + 1
				removeBows(player)
				player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
				gui.tableTalents2.talent2c3.caption = "Update bow (" .. talents[2][3].now .. "/" .. talents[2][3].max .. ")"
			end
		end
	-- elseif event.element.name == "talent2c4" then
		-- if (player.getitemcount("cursed-talent-2") >= 1) then
			-- if (talents[2][4].now < talents[2][4].max) then
				-- player.removeitem({name="cursed-talent-2", count=1})
				-- gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
				-- talents[2][4].now = talents[2][4].now + 1
				-- player.force.technologies["arrow-speed-" .. stats.range.level].researched = true
				-- player.force.technologies["arrow-speed-" .. stats.range.level + 1].enabled = false
				-- gui.tableTalents2.talent2c4.caption = "Update arrows (" .. talents[2][4].now .. "/" .. talents[2][4].max .. ")"
			-- end
		-- end
	elseif event.element.name == "talent3c1" then
		if (player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][1].now < talents[3][1].max) then
				player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
				player.character.insert({name="cursed-drill-1",count=1})
				talents[3][1].now = talents[3][1].now + 1
				gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
			end
		end
	elseif event.element.name == "talent3c2" then
		if (player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][2].now < talents[3][2].max) then
				player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
				talents[3][2].now = talents[3][2].now + 1
				talents[3][1].max = math.floor(talents[3][2].now / 5) + 2
				gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
				gui.tableTalents3.talent3c2.caption = "Update mines (" .. talents[3][2].now .. "/" .. talents[3][2].max .. ")"
			end
		end
	elseif event.element.name == "talent3c3" then
		if (player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][3].now < talents[3][3].max) then
				player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
				player.character.insert({name="cursed-turret-1",count=1})
				talents[3][3].now = talents[3][3].now + 1
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
			end
		end
	elseif event.element.name == "talent3c4" then
		if (player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][4].now < talents[3][4].max) then
				player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
				talents[3][4].now = talents[3][4].now + 1
				talents[3][3].max = math.floor(talents[3][4].now / 5) + 2
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
				gui.tableTalents3.talent3c4.caption = "Update turrets (" .. talents[3][4].now .. "/" .. talents[3][4].max .. ")"
			end
		end
	elseif event.element.name == "talent4c1" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][1].now < talents[4][1].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-1-" .. math.floor(talents[4][1].now / 3) + 1].enabled = false
				talents[4][1].now = talents[4][1].now + 1
				player.force.recipes["cursed-talent-part-1-" .. math.floor(talents[4][1].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c1.caption = "Upgrade part 1 (" .. talents[4][1].now .. "/" .. talents[4][1].max .. ")"
			end
		end
	elseif event.element.name == "talent4c2" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][2].now < talents[4][2].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-2-" .. math.floor(talents[4][2].now / 3) + 1].enabled = false
				talents[4][2].now = talents[4][2].now + 1
				player.force.recipes["cursed-talent-part-2-" .. math.floor(talents[4][2].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c2.caption = "Upgrade part 2 (" .. talents[4][2].now .. "/" .. talents[4][2].max .. ")"
			end
		end
	elseif event.element.name == "talent4c3" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][3].now < talents[4][3].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-3-" .. math.floor(talents[4][3].now / 3) + 1].enabled = false
				talents[4][3].now = talents[4][3].now + 1
				player.force.recipes["cursed-talent-part-3-" .. math.floor(talents[4][3].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c3.caption = "Upgrade part 3 (" .. talents[4][3].now .. "/" .. talents[4][3].max .. ")"
			end
		end
	elseif event.element.name == "talent4c4" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][4].now < talents[4][4].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-4-" .. math.floor(talents[4][4].now / 3) + 1].enabled = false
				talents[4][4].now = talents[4][4].now + 1
				player.force.recipes["cursed-talent-part-4-" .. math.floor(talents[4][4].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c4.caption = "Upgrade part 4 (" .. talents[4][4].now .. "/" .. talents[4][4].max .. ")"
			end
		end
	elseif event.element.name == "talent4c5" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][5].now < talents[4][5].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-5-" .. math.floor(talents[4][5].now / 3) + 1].enabled = false
				talents[4][5].now = talents[4][5].now + 1
				player.force.recipes["cursed-talent-part-5-" .. math.floor(talents[4][5].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c5.caption = "Upgrade part 5 (" .. talents[4][5].now .. "/" .. talents[4][5].max .. ")"
			end
		end
	elseif event.element.name == "talent4c6" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][6].now < talents[4][6].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-6-" .. math.floor(talents[4][6].now / 3) + 1].enabled = false
				talents[4][6].now = talents[4][6].now + 1
				player.force.recipes["cursed-talent-part-6-" .. math.floor(talents[4][6].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c6.caption = "Upgrade part 6 (" .. talents[4][6].now .. "/" .. talents[4][6].max .. ")"
			end
		end
	elseif event.element.name == "talent4c7" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][7].now < talents[4][7].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-7-" .. math.floor(talents[4][7].now / 3) + 1].enabled = false
				talents[4][7].now = talents[4][7].now + 1
				player.force.recipes["cursed-talent-part-7-" .. math.floor(talents[4][7].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c7.caption = "Upgrade part 7 (" .. talents[4][7].now .. "/" .. talents[4][7].max .. ")"
			end
		end
	elseif event.element.name == "talent4c8" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][8].now < talents[4][8].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-8-" .. math.floor(talents[4][8].now / 3) + 1].enabled = false
				talents[4][8].now = talents[4][8].now + 1
				player.force.recipes["cursed-talent-part-8-" .. math.floor(talents[4][8].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c8.caption = "Upgrade part 8 (" .. talents[4][8].now .. "/" .. talents[4][8].max .. ")"
			end
		end
	elseif event.element.name == "talent4c9" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][9].now < talents[4][9].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-9-" .. math.floor(talents[4][9].now / 3) + 1].enabled = false
				talents[4][9].now = talents[4][9].now + 1
				player.force.recipes["cursed-talent-part-9-" .. math.floor(talents[4][9].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c9.caption = "Upgrade part 9 (" .. talents[4][9].now .. "/" .. talents[4][9].max .. ")"
			end
		end
	elseif event.element.name == "talent4c10" then
		if (player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][10].now < talents[4][10].max) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				player.force.recipes["cursed-talent-part-10-" .. math.floor(talents[4][10].now / 3) + 1].enabled = false
				talents[4][10].now = talents[4][10].now + 1
				player.force.recipes["cursed-talent-part-10-" .. math.floor(talents[4][10].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c10.caption = "Upgrade part 10 (" .. talents[4][10].now .. "/" .. talents[4][10].max .. ")"
			end
		end
	elseif event.element.name == "talent5c4" then
		if (player.getitemcount("cursed-talent-5") >= 1) then
			if (talents[5][4].now < talents[5][4].max) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Talents 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				talents[5][4].now = talents[5][4].now + 1
				gui.tableTalents5.talent5c4.caption = "HP regen (" .. talents[5][4].now .. "/" .. talents[5][4].max .. ")"
			end
		end
	elseif event.element.name == "talent5c6" then
		if (player.getitemcount("cursed-talent-5") >= 1) then
			if (talents[5][6].now < talents[5][6].max) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Talents 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				talents[5][6].now = talents[5][6].now + 1
				gui.tableTalents5.talent5c6.caption = "Damage aura (" .. talents[5][6].now .. "/" .. talents[5][6].max .. ")"
			end
		end
	elseif event.element.name == "talent5c8" then
		if (player.getitemcount("cursed-talent-5") >= 1) then
			if (talents[5][8].now < talents[5][8].max) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Talents 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				talents[5][8].now = talents[5][8].now + 1
				gui.tableTalents5.talent5c8.caption = "Win talents killing (" .. talents[5][8].now .. "/" .. talents[5][8].max .. ")"
			end
		end
	elseif event.element.name == "builds1c1" then
		local mines = glob.cursed[player.name].mines
		local num = 0
		for i = 1, #mines do
			if num == 0 and gui.tableMine.builds1c2.caption == mines[i].nick then
				num = i
			end
		end
		if num == 1 then num = #mines else num = num - 1 end
		gui.tableMine.builds1c2.caption = mines[num].nick
		gui.tableBuilds1.builds1c4.caption = "Level " .. mines[num].level
		gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
		if mines[num].exp > 0 then
			gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
		else
			gui.tableBuilds1.builds1c6.value = 0
		end
	elseif event.element.name == "builds1c3" then
		local mines = glob.cursed[player.name].mines
		local num = 0
		for i = 1, #mines do
			if num == 0 and gui.tableMine.builds1c2.caption == mines[i].nick then
				num = i
			end
		end
		if num == #mines then num = 1 else num = num + 1 end
		gui.tableMine.builds1c2.caption = mines[num].nick
		gui.tableBuilds1.builds1c4.caption = "Level " .. mines[num].level
		gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
		if mines[num].exp > 0 then
			gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
		else
			gui.tableBuilds1.builds1c6.value = 0
		end
	elseif event.element.name == "builds1c2" then
		changeNick("mine",player)
	elseif event.element.name == "changeNick1b2" then
		changeNick("mine",player)
	elseif event.element.name == "changeNick1b1" then
		local mines = cursed[player.name].mines
		local num = 0
		for i = 1, #mines do
			if num == 0 and gui.tableMine.builds1c2.caption == mines[i].nick then
				num = i
			end
		end
		mines[num].nick = gui.changeNick1t.text
		gui.tableMine.builds1c2.caption = mines[num].nick
		changeNick("mine",player)
	elseif event.element.name == "builds2c1" then
		local turrets = glob.cursed[player.name].turrets
		local num = 0
		for i = 1, #turrets do
			if num == 0 and gui.tableTurret.builds2c2.caption == turrets[i].nick then
				num = i
			end
		end
		if num == 1 then num = #turrets else num = num - 1 end
		gui.tableTurret.builds2c2.caption = turrets[num].nick
		gui.tableBuilds2.builds2c4.caption = "Level " .. turrets[num].level
		gui.tableBuilds2.builds2c5.caption = "Experience " .. turrets[num].exp .. "/" .. turrets[num].next
		if turrets[num].exp > 0 then
			gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
		else
			gui.tableBuilds2.builds2c6.value = 0
		end
	elseif event.element.name == "builds2c3" then
		local turrets = glob.cursed[player.name].turrets
		local num = 0
		for i = 1, #turrets do
			if num == 0 and gui.tableTurret.builds2c2.caption == turrets[i].nick then
				num = i
			end
		end
		if num == #turrets then num = 1 else num = num + 1 end
		gui.tableTurret.builds2c2.caption = turrets[num].nick
		gui.tableBuilds2.builds2c4.caption = "Level " .. turrets[num].level
		gui.tableBuilds2.builds2c5.caption = "Experience " .. turrets[num].exp .. "/" .. turrets[num].next
		if turrets[num].exp > 0 then
			gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
		else
			gui.tableBuilds2.builds2c6.value = 0
		end
	elseif event.element.name == "builds2c2" then
		changeNick("turret",player)
	elseif event.element.name == "changeNick2b2" then
		changeNick("turret",player)
	elseif event.element.name == "changeNick2b1" then
		local turrets = glob.cursed[player.name].turrets
		local num = 0
		for i = 1, #turrets do
			if num == 0 and gui.tableTurret.builds2c2.caption == turrets[i].nick then
				num = i
			end
		end
		turrets[num].nick = gui.changeNick2t.text
		gui.tableTurret.builds2c2.caption = turrets[num].nick
		changeNick("turret",player)
	end
end)


function getowner(build,type)
	if type == "drill" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if v.mines then
				for i = 1, #v.mines do
					if v.mines[i] ~= nil and v.mines[i].entity ~= nil and build.equals(v.mines[i].entity) then
						for i = 1, #game.players do
							if game.players[i].name == k then
								return game.players[i]
							end
						end
					end
				end
			end
		end
	elseif type == "turret" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if v.turrets then
				for i = 1, #v.turrets do
					if v.turrets[i] ~= nil and v.turrets[i].entity ~= nil and build.equals(v.turrets[i].entity) then
						return getplayerbyname(k)
					end
				end
			end
		end
	end
end

function getplayerbyname(name)
	for i = 1, #game.players do
		if game.players[i] == name then
			return game.players[i]
		end
	end
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

function guiFlipFlop(name,player)
	local gui = glob.cursed[player.name].gui
	local talents = glob.cursed[player.name].talents
	if name == "talentsMain" then
		closeAllMain(1,player)
		if gui.frameTalentsS then
			gui.frameTalents.destroy()
			gui.frameTalentsS = false
			closeAllTalents(-1,player)
		else
			gui.frameTalents = gui.tableMain.add{ type="flow", name="frameTalents", direction = "horizontal", style = "" }
			gui.frameTalentsS = true
			local tableTalents = gui.frameTalents.add{ type="flow", name="tableTalents", direction = "horizontal", style = "" }
			gui.frameTalentsDet1 = tableTalents.add{ type="frame", name="frameTalents1", direction = "vertical" }
			gui.frameTalentsDet1.add({ type="button", name="talentsMain1", caption = "Talents 1 (" .. player.getitemcount("cursed-talent-1") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet2 = tableTalents.add{ type="frame", name="frameTalents2", direction = "vertical" }
			gui.frameTalentsDet2.add({ type="button", name="talentsMain2", caption = "Talents 2 (" .. player.getitemcount("cursed-talent-2") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet3 = tableTalents.add{ type="frame", name="frameTalents3", direction = "vertical" }
			gui.frameTalentsDet3.add({ type="button", name="talentsMain3", caption = "Talents 3 (" .. player.getitemcount("cursed-talent-3") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet4 = tableTalents.add{ type="frame", name="frameTalents4", direction = "vertical" }
			gui.frameTalentsDet4.add({ type="button", name="talentsMain4", caption = "Talents 4 (" .. player.getitemcount("cursed-talent-4") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet5 = tableTalents.add{ type="frame", name="frameTalents5", direction = "vertical" }
			gui.frameTalentsDet5.add({ type="button", name="talentsMain5", caption = "Talents 5 (" .. player.getitemcount("cursed-talent-5") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet6 = tableTalents.add{ type="frame", name="frameTalents6", direction = "vertical" }
			gui.frameTalentsDet6.add({ type="button", name="talentsMain6", caption = "Talents 6 (" .. player.getitemcount("cursed-talent-6") .. ")", style = "talents_bar_button1" })
		end
	elseif name == "statsMain" then
		closeAllMain(2,player)
		if gui.frameStatsS then
			gui.frameStats.destroy()
			gui.frameStatsS = false
			closeAllStats(-1,player)
		else
			gui.frameStats = gui.tableMain.add{ type="flow", name="frameStats", direction = "horizontal", style = "" }
			gui.frameStatsS = true
			local tableStats = gui.frameStats.add{ type="flow", name="tableStats", direction = "horizontal", style = "" }
			gui.frameStatsDet1 = tableStats.add{ type="frame", name="frameStats1", direction = "vertical" }
			gui.frameStatsDet1.add({ type="button", name="statsMain1", caption = "General", style = "" })
			gui.frameStatsDet2 = tableStats.add{ type="frame", name="frameStats2", direction = "vertical" }
			gui.frameStatsDet2.add({ type="button", name="statsMain2", caption = "Mining", style = "" })
			gui.frameStatsDet3 = tableStats.add{ type="frame", name="frameStats3", direction = "vertical" }
			gui.frameStatsDet3.add({ type="button", name="statsMain3", caption = "Farming", style = "" })
			gui.frameStatsDet4 = tableStats.add{ type="frame", name="frameStats4", direction = "vertical" }
			gui.frameStatsDet4.add({ type="button", name="statsMain4", caption = "Crafting", style = "" })
			gui.frameStatsDet5 = tableStats.add{ type="frame", name="frameStats5", direction = "vertical" }
			gui.frameStatsDet5.add({ type="button", name="statsMain5", caption = "Explore", style = "" })
			gui.frameStatsDet6 = tableStats.add{ type="frame", name="frameStats6", direction = "vertical" }
			gui.frameStatsDet6.add({ type="button", name="statsMain6", caption = "Defense", style = "" })
			gui.frameStatsDet7 = tableStats.add{ type="frame", name="frameStats7", direction = "vertical" }
			gui.frameStatsDet7.add({ type="button", name="statsMain7", caption = "Bow", style = "" })
			gui.frameStatsDet8 = tableStats.add{ type="frame", name="frameStats8", direction = "vertical" }
			gui.frameStatsDet8.add({ type="button", name="statsMain8", caption = "Sword", style = "" })
		end
	elseif name == "buildsMain" then
		closeAllMain(3,player)
		if gui.frameBuildsS then
			gui.frameBuilds.destroy()
			gui.frameBuildsS = false
			closeAllBuilds(-1,player)
		else
			gui.frameBuilds = gui.tableMain.add{ type="flow", name="frameBuilds", direction = "horizontal", style = "" }
			gui.frameBuildsS = true
			local tableBuilds = gui.frameBuilds.add{ type="flow", name="tableBuilds", direction = "horizontal", style = "" }
			gui.frameBuildsDet1 = tableBuilds.add{ type="frame", name="frameBuilds1", direction = "vertical" }
			gui.frameBuildsDet1.add({ type="button", name="buildsMain1", caption = "Mines", style = "" })
			gui.frameBuildsDet2 = tableBuilds.add{ type="frame", name="frameBuilds2", direction = "vertical" }
			gui.frameBuildsDet2.add({ type="button", name="buildsMain2", caption = "Turrets", style = "" })
		end
	elseif name == "talentsMain1" then
	closeAllTalents(1,player)
		if gui.tableTalents1S then
			gui.tableTalents1.destroy()
			gui.tableTalents1S = false
		else
			gui.tableTalents1 = gui.frameTalentsDet1.add{ type="flow", name="tableTalents1", direction = "vertical" }
			gui.tableTalents1S = true
			gui.tableTalents1.add({ type="button", name="talent1c1", caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c2", caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c3", caption = "24hs easy (" .. talents[1][3].now .. "/" .. talents[1][3].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents1.add({ type="button", name="talent1c4", caption = "24hs hard (" .. talents[1][4].now .. "/" .. talents[1][4].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents1.add({ type="button", name="talent1c5", caption = "Mining bonus (" .. talents[1][5].now .. "/" .. talents[1][5].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c6", caption = "Farming bonus (" .. talents[1][6].now .. "/" .. talents[1][6].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c7", caption = "Crafting bonus (" .. talents[1][7].now .. "/" .. talents[1][7].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c8", caption = "Explore bonus (" .. talents[1][8].now .. "/" .. talents[1][8].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c9", caption = "Attack bonus (" .. talents[1][9].now .. "/" .. talents[1][9].max .. ")", style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c10", caption = "Defense bonus (" .. talents[1][10].now .. "/" .. talents[1][10].max .. ")", style = "" })
		end
	elseif name == "talentsMain2" then
	closeAllTalents(2,player)
		if gui.tableTalents2S then
			gui.tableTalents2.destroy()
			gui.tableTalents2S = false
		else
			gui.tableTalents2 = gui.frameTalentsDet2.add{ type="flow", name="tableTalents2", direction = "vertical" }
			gui.tableTalents2S = true
			gui.tableTalents2.add({ type="button", name="talent2c1", caption = "Upgrade tool (".. talents[2][1].now.."/"..talents[2][1].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c2", caption = "Upgrade armor (".. talents[2][2].now.."/"..talents[2][2].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c3", caption = "Upgrade bow (".. talents[2][3].now.."/"..talents[2][3].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c4", caption = "Upgrade arrows (".. talents[2][4].now.."/"..talents[2][4].max..")", style = "fake_disabled_button_style" })
			gui.tableTalents2.add({ type="button", name="talent2c5", caption = "Upgrade sword (".. talents[2][5].now.."/"..talents[2][5].max..")", style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain3" then
	closeAllTalents(3,player)
		if gui.tableTalents3S then
			gui.tableTalents3.destroy()
			gui.tableTalents3S = false
		else
			gui.tableTalents3 = gui.frameTalentsDet3.add{ type="flow", name="tableTalents3", direction = "vertical" }
			gui.tableTalents3S = true
			gui.tableTalents3.add({ type="button", name="talent3c1", caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c2", caption = "Update mines (" .. talents[3][2].now .. "/" .. talents[3][2].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c3", caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c4", caption = "Update turrets (" .. talents[3][4].now .. "/" .. talents[3][4].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c5", caption = "Buy walls (" .. talents[3][5].now .. "/" .. talents[3][5].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c6", caption = "Update walls (" .. talents[3][6].now .. "/" .. talents[3][6].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c7", caption = "Buy generator (" .. talents[3][7].now .. "/" .. talents[3][7].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c8", caption = "Update generators (" .. talents[3][8].now .. "/" .. talents[3][8].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c9", caption = "Buy assembler (" .. talents[3][9].now .. "/" .. talents[3][9].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c10", caption = "Update assembler (" .. talents[3][10].now .. "/" .. talents[3][10].max .. ")", style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain4" then
	closeAllTalents(4,player)
		if gui.tableTalents4S then
			gui.tableTalents4.destroy()
			gui.tableTalents4S = false
		else
			gui.tableTalents4 = gui.frameTalentsDet4.add{ type="flow", name="tableTalents4", direction = "vertical" }
			gui.tableTalents4S = true
			gui.tableTalents4.add({ type="button", name="talent4c1", caption = "Easy talent part 1 (" .. talents[4][1].now .. "/" .. talents[4][1].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c2", caption = "Easy talent part 2 (" .. talents[4][2].now .. "/" .. talents[4][2].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c3", caption = "Easy talent part 3 (" .. talents[4][3].now .. "/" .. talents[4][3].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c4", caption = "Easy talent part 4 (" .. talents[4][4].now .. "/" .. talents[4][4].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c5", caption = "Easy talent part 5 (" .. talents[4][5].now .. "/" .. talents[4][5].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c6", caption = "Easy talent part 6 (" .. talents[4][6].now .. "/" .. talents[4][6].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c7", caption = "Easy talent part 7 (" .. talents[4][7].now .. "/" .. talents[4][7].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c8", caption = "Easy talent part 8 (" .. talents[4][8].now .. "/" .. talents[4][8].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c9", caption = "Easy talent part 9 (" .. talents[4][9].now .. "/" .. talents[4][9].max .. ")", style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c10", caption = "Easy talent part 10 (" .. talents[4][10].now .. "/" .. talents[4][10].max .. ")", style = "" })
		end
	elseif name == "talentsMain5" then
	closeAllTalents(5,player)
		if gui.tableTalents5S then
			gui.tableTalents5.destroy()
			gui.tableTalents5S = false
		else
			gui.tableTalents5 = gui.frameTalentsDet5.add{ type="flow", name="tableTalents5", direction = "vertical" }
			gui.tableTalents5S = true
			gui.tableTalents5.add({ type="button", name="talent5c1", caption = "Wind walk (" .. talents[5][1].now .. "/" .. talents[5][1].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c2", caption = "Defensor  (" .. talents[5][2].now .. "/" .. talents[5][2].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c3", caption = "Explosive rockets (" .. talents[5][3].now .. "/" .. talents[5][3].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c4", caption = "HP regen (" .. talents[5][4].now .. "/" .. talents[5][4].max .. ")", style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c5", caption = "Defensor bot (" .. talents[5][5].now .. "/" .. talents[5][5].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c6", caption = "Damage aura (" .. talents[5][6].now .. "/" .. talents[5][6].max .. ")", style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c7", caption = "Bigger inventory  (" .. talents[5][7].now .. "/" .. talents[5][7].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c8", caption = "Win talents killing (" .. talents[5][8].now .. "/" .. talents[5][8].max .. ")", style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c9", caption = "Lifesteal (" .. talents[5][9].now .. "/" .. talents[5][9].max .. ")", style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain6" then
		closeAllTalents(6,player)
		if gui.tableTalents6S then
			gui.tableTalents6.destroy()
			gui.tableTalents6S = false
		else
			gui.tableTalents6 = gui.frameTalentsDet6.add{ type="flow", name="tableTalents5", direction = "vertical" }
			gui.tableTalents6S = true
			gui.tableTalents6.add({ type="button", name="talent6c1", caption = "Heal (" .. talents[6][1].now .. "/" .. talents[6][1].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c2", caption = "Phisical damage (" .. talents[6][2].now .. "/" .. talents[6][2].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c3", caption = "Poison damage (" .. talents[6][3].now .. "/" .. talents[6][3].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c4", caption = "Fire damage (" .. talents[6][4].now .. "/" .. talents[6][4].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c5", caption = "Laser damage (" .. talents[6][5].now .. "/" .. talents[6][5].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c6", caption = "Acid damage (" .. talents[6][6].now .. "/" .. talents[6][6].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c7", caption = "Stun AoE (" .. talents[6][7].now .. "/" .. talents[6][7].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c8", caption = "Invisible (" .. talents[6][8].now .. "/" .. talents[6][8].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents6.add({ type="button", name="talent6c9", caption = "Soul steal (" .. talents[6][9].now .. "/" .. talents[6][9].max .. ")", style = "fake_disabled_button_style" })
		end
	elseif name == "statsMain1" then
		closeAllStats(1,player)
		if gui.tableStats1S then
			gui.tableStats1.destroy()
			gui.tableStats1S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats1 = gui.frameStatsDet1.add{ type="flow", name="tableStats1", direction = "vertical" }
			gui.tableStats1S = true
			gui.tableStats1.add({ type="label", name="stat1c1", caption = "General - Level " .. stats.general.level, style = "" })
			gui.tableStats1.add({ type="label", name="stat1c2", caption = "Experience: " .. stats.general.exp .. " / " .. stats.general.next, style = "" })
			gui.tableStats1.add({type="progressbar", name="stat1c3", size=100}).value = stats.general.exp / stats.general.next
			gui.tableStats1.add({ type="label", name="stat1c4", caption = "Bonus: " .. stats.general.level / 40 .. "%", style = "" })
			gui.tableStats1.add({ type="label", name="stat1c5", caption = "Experience in all others stats", style = "" })
		end
	elseif name == "statsMain2" then
		closeAllStats(2,player)
		if gui.tableStats2S then
			gui.tableStats2.destroy()
			gui.tableStats2S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats2 = gui.frameStatsDet2.add{ type="flow", name="tableStats2", direction = "vertical" }
			gui.tableStats2S = true
			gui.tableStats2.add({ type="label", name="stat2c1", caption = "Mining - Level " .. stats.mining.level, style = "" })
			gui.tableStats2.add({ type="label", name="stat2c2", caption = "Experience: " .. stats.mining.exp .. " / " .. stats.mining.next .. " (+" .. 100 * (talents[1][5].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats2.add({type="progressbar", name="stat2c3", size=100}).value = stats.mining.exp / stats.mining.next
			gui.tableStats2.add({ type="label", name="stat2c4", caption = "Bonus: " .. stats.mining.level / 16 .. "%", style = "" })
			gui.tableStats2.add({ type="label", name="stat2c5", caption = "Mining speed", style = "" })
		end
	elseif name == "statsMain3" then
		closeAllStats(3,player)
		if gui.tableStats3S then
			gui.tableStats3.destroy()
			gui.tableStats3S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats3 = gui.frameStatsDet3.add{ type="flow", name="tableStats3", direction = "vertical" }
			gui.tableStats3S = true
			gui.tableStats3.add({ type="label", name="stat3c1", caption = "Farming - Level " .. stats.farming.level, style = "" })
			gui.tableStats3.add({ type="label", name="stat3c2", caption = "Experience: " .. stats.farming.exp .. " / " .. stats.farming.next .. " (+" .. 100 * (talents[1][6].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats3.add({type="progressbar", name="stat3c3", size=100}).value = stats.farming.exp / stats.farming.next
			gui.tableStats3.add({ type="label", name="stat3c4", caption = "Bonus: " .. stats.farming.level / 8 .. "%", style = "" })
			gui.tableStats3.add({ type="label", name="stat3c5", caption = "Woodcutting speed", style = "" })
		end
	elseif name == "statsMain4" then
		closeAllStats(4,player)
		if gui.tableStats4S then
			gui.tableStats4.destroy()
			gui.tableStats4S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats4 = gui.frameStatsDet4.add{ type="flow", name="tableStats4", direction = "vertical" }
			gui.tableStats4S = true
			gui.tableStats4.add({ type="label", name="stat4c1", caption = "Crafting - Level " .. stats.crafting.level, style = "" })
			gui.tableStats4.add({ type="label", name="stat4c2", caption = "Experience: " .. stats.crafting.exp .. " / " .. stats.crafting.next .. " (+" .. 100 * (talents[1][7].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats4.add({type="progressbar", name="stat4c3", size=100}).value = stats.crafting.exp / stats.crafting.next
			gui.tableStats4.add({ type="label", name="stat4c4", caption = "Bonus: " .. stats.crafting.level / 24 .. "%", style = "" })
			gui.tableStats4.add({ type="label", name="stat4c5", caption = "Crafting speed", style = "" })
		end
	elseif name == "statsMain5" then
		closeAllStats(5,player)
		if gui.tableStats5S then
			gui.tableStats5.destroy()
			gui.tableStats5S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats5 = gui.frameStatsDet5.add{ type="flow", name="tableStats5", direction = "vertical" }
			gui.tableStats5S = true
			gui.tableStats5.add({ type="label", name="stat5c1", caption = "Explore - Level " .. stats.explore.level, style = "" })
			gui.tableStats5.add({ type="label", name="stat5c2", caption = "Experience: " .. stats.explore.exp .. " / " .. stats.explore.next .. " (+" .. 100 * (talents[1][8].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats5.add({type="progressbar", name="stat5c3", size=100}).value = stats.explore.exp / stats.explore.next
			gui.tableStats5.add({ type="label", name="stat5c4", caption = "Bonus: " .. stats.explore.level / 32 .. "%", style = "" })
			gui.tableStats5.add({ type="label", name="stat5c5", caption = "Movement speed - Not implemented", style = "" })
		end
	elseif name == "statsMain6" then
		closeAllStats(6,player)
		if gui.tableStats6S then
			gui.tableStats6.destroy()
			gui.tableStats6S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats6 = gui.frameStatsDet6.add{ type="flow", name="tableStats6", direction = "vertical" }
			gui.tableStats6S = true
			gui.tableStats6.add({ type="label", name="stat6c1", caption = "Defense - Level " .. stats.defense.level, style = "" })
			gui.tableStats6.add({ type="label", name="stat6c2", caption = "Experience: " .. stats.defense.exp .. " / " .. stats.defense.next .. " (+" .. 100 * (talents[1][10].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats6.add({type="progressbar", name="stat6c3", size=100}).value = stats.defense.exp / stats.defense.next
			gui.tableStats6.add({ type="label", name="stat6c4", caption = "Bonus: " .. stats.defense.level * 2 .. "%", style = "" })
			gui.tableStats6.add({ type="label", name="stat6c5", caption = "Health points - Not implemented", style = "" })
		end
	elseif name == "statsMain7" then
		closeAllStats(7,player)
		if gui.tableStats7S then
			gui.tableStats7.destroy()
			gui.tableStats7S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats7 = gui.frameStatsDet7.add{ type="flow", name="tableStats7", direction = "vertical" }
			gui.tableStats7S = true
			gui.tableStats7.add({ type="label", name="stat7c1", caption = "Bow - Level " .. stats.range.level, style = "" })
			gui.tableStats7.add({ type="label", name="stat7c2", caption = "Experience: " .. stats.range.exp .. " / " .. stats.range.next .. " (+" .. 100 * (talents[1][9].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats7.add({type="progressbar", name="stat7c3", size=100}).value = stats.range.exp / stats.range.next
			gui.tableStats7.add({ type="label", name="stat7c4", caption = "Bonus: " .. stats.range.level * 10 .. "%", style = "" })
			gui.tableStats7.add({ type="label", name="stat7c5", caption = "Bow damage", style = "" })
		end
	elseif name == "statsMain8" then
		closeAllStats(8,player)
		if gui.tableStats8S then
			gui.tableStats8.destroy()
			gui.tableStats8S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats8 = gui.frameStatsDet8.add{ type="flow", name="tableStats8", direction = "vertical" }
			gui.tableStats8S = true
			gui.tableStats8.add({ type="label", name="stat8c1", caption = "Sword - Level " .. stats.melee.level, style = "" })
			gui.tableStats8.add({ type="label", name="stat8c2", caption = "Experience: " .. stats.melee.exp .. " / " .. stats.melee.next .. " (+" .. 100 * (talents[1][9].now / 40 + stats.general.level / 40) .. "%)", style = "" })
			gui.tableStats8.add({type="progressbar", name="stat8c3", size=100}).value = stats.melee.exp / stats.melee.next
			gui.tableStats8.add({ type="label", name="stat8c4", caption = "Bonus: " .. stats.melee.level * 0 .. "%", style = "" })
			gui.tableStats8.add({ type="label", name="stat8c5", caption = "Sword damage - Sword not found :3", style = "" })
		end
	elseif name == "buildsMain1" then
		closeAllBuilds(1,player)
		if gui.tableBuilds1S then
			gui.tableBuilds1.destroy()
			gui.tableBuilds1S = false
		else
			local mines = glob.cursed[player.name].mines
			local num = 0
			local nick
			for i = 1, #mines do
				if mines[i] ~= nil and mines[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			gui.tableBuilds1 = gui.frameBuildsDet1.add{ type="flow", name="tableBuilds1", direction = "vertical" }
			gui.tableBuilds1S = true
			gui.tableMine = gui.tableBuilds1.add({ type="flow", name="tableMine", direction = "horizontal" })
			gui.tableMine.add({ type="button", name="builds1c1", caption = "<", style = "" })
			gui.tableMine.add({ type="button", name="builds1c2", caption = mines[num].nick, style = "" })
			gui.tableMine.add({ type="button", name="builds1c3", caption = ">", style = "" })
			gui.tableBuilds1.add({ type="label", name="builds1c4", caption = "Level " .. mines[num].level, style = "" })
			gui.tableBuilds1.add({ type="label", name="builds1c5", caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next, style = "" })
			if mines[num].exp > 0 then
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100}).value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100}).value = 0
			end
		end
	elseif name == "buildsMain2" then
		closeAllBuilds(2,player)
		if gui.tableBuilds2S then
			gui.tableBuilds2.destroy()
			gui.tableBuilds2S = false
		else
			local turrets = glob.cursed[player.name].turrets
			local num = 0
			local nick
			for i = 1, #turrets do
				if turrets[i] ~= nil and turrets[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			gui.tableBuilds2 = gui.frameBuildsDet2.add{ type="flow", name="tableBuilds2", direction = "vertical" }
			gui.tableBuilds2S = true
			gui.tableTurret = gui.tableBuilds2.add({ type="flow", name="tableTurret", direction = "horizontal" })
			gui.tableTurret.add({ type="button", name="builds2c1", caption = "<", style = "" })
			gui.tableTurret.add({ type="button", name="builds2c2", caption = turrets[num].nick, style = "" })
			gui.tableTurret.add({ type="button", name="builds2c3", caption = ">", style = "" })
			gui.tableBuilds2.add({ type="label", name="builds2c4", caption = "Level " .. turrets[num].level, style = "" })
			gui.tableBuilds2.add({ type="label", name="builds2c5", caption = "Experience " .. turrets[num].exp .. "/" .. turrets[num].next, style = "" })
			if turrets[num].exp > 0 then
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100}).value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100}).value = 0
			end
		end
	end
end

function changeNick(build,player)
	local gui = glob.cursed[player.name].gui
	if build == "mine" then
		if gui.changeNick1S then
			gui.changeNick1.destroy()
			gui.changeNick1S = false
		else
			gui.changeNick1 = player.gui.center.add{ type="flow", name="changeNick1", direction="vertical" }
			gui.changeNick1S = true
			local framechangeNick1 = gui.changeNick1.add{ type="frame", name="changeNick1f1", direction = "vertical" }
			gui.changeNick1t = framechangeNick1.add{ type="textfield", name="changeNick1t", text=""}
			local framechangeNick1Buttons = framechangeNick1.add{ type="flow", name="changeNick1Buttons",direction="horizontal" }
			framechangeNick1Buttons.add({ type="button", name="changeNick1b1", caption = "Accept", style = "" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b2", caption = "Cancel", style = "" })
		end
	elseif build == "turret" then
		if gui.changeNick2S then
			gui.changeNick2.destroy()
			gui.changeNick2S = false
		else
			gui.changeNick2 = player.gui.center.add{ type="flow", name="changeNick2", direction="vertical" }
			gui.changeNick2S = true
			local framechangeNick2 = gui.changeNick2.add{ type="frame", name="changeNick2f1", direction = "vertical" }
			gui.changeNick2t = framechangeNick2.add{ type="textfield", name="changeNick2t", text=""}
			local framechangeNick2Buttons = framechangeNick2.add{ type="flow", name="changeNick2Buttons",direction="horizontal" }
			framechangeNick2Buttons.add({ type="button", name="changeNick2b1", caption = "Accept", style = "" })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b2", caption = "Cancel", style = "" })
		end
	end
end
function closeAllMain(num,player)
	local gui = glob.cursed[player.name].gui
	closeAllTalents(-1,player)
	closeAllStats(-1,player)
	closeAllBuilds(-1,player)
	if num == -1 then
		gui.frameTalentsS = false
		gui.frameStatsS = false
		gui.frameBuildsS = false 
	end
	if gui.frameTalentsS and num ~= 1 then
		gui.frameTalents.destroy()
		gui.frameTalentsS = false
	end
	if gui.frameStatsS and num ~= 2 then
		gui.frameStats.destroy()
		gui.frameStatsS = false 
	end
	if gui.frameBuildsS and num ~= 3 then
		gui.frameBuilds.destroy()
		gui.frameBuildsS = false 
	end
end
function closeAllTalents(num,player)
	local gui = glob.cursed[player.name].gui
	if num == -1 then
		gui.tableTalents1S = false
		gui.tableTalents2S = false
		gui.tableTalents3S = false
		gui.tableTalents4S = false
		gui.tableTalents5S = false
		gui.tableTalents6S = false
	end
	if gui.tableTalents1S and num ~= 1 then
		gui.tableTalents1.destroy()
		gui.tableTalents1S = false
	end
	if gui.tableTalents2S and num ~= 2 then
		gui.tableTalents2.destroy()
		gui.tableTalents2S = false
	end
	if gui.tableTalents3S and num ~= 3 then
		gui.tableTalents3.destroy()
		gui.tableTalents3S = false
	end
	if gui.tableTalents4S and num ~= 4 then
		gui.tableTalents4.destroy()
		gui.tableTalents4S = false
	end
	if gui.tableTalents5S and num ~= 5 then
		gui.tableTalents5.destroy()
		gui.tableTalents5S = false
	end
	if gui.tableTalents6S and num ~= 6 then
		gui.tableTalents6.destroy()
		gui.tableTalents6S = false
	end
end
function closeAllStats(num,player)
	local gui = glob.cursed[player.name].gui
	if num == -1 then
		gui.tableStats1S = false
		gui.tableStats2S = false
		gui.tableStats3S = false
		gui.tableStats4S = false
		gui.tableStats5S = false
		gui.tableStats6S = false
		gui.tableStats7S = false
		gui.tableStats8S = false
	end
	if gui.tableStats1S and num ~= 1 then
		gui.tableStats1.destroy()
		gui.tableStats1S = false
	end
	if gui.tableStats2S and num ~= 2 then
		gui.tableStats2.destroy()
		gui.tableStats2S = false
	end
	if gui.tableStats3S and num ~= 3 then
		gui.tableStats3.destroy()
		gui.tableStats3S = false
	end
	if gui.tableStats4S and num ~= 4 then
		gui.tableStats4.destroy()
		gui.tableStats4S = false
	end
	if gui.tableStats5S and num ~= 5 then
		gui.tableStats5.destroy()
		gui.tableStats5S = false
	end
	if gui.tableStats6S and num ~= 6 then
		gui.tableStats6.destroy()
		gui.tableStats6S = false
	end
	if gui.tableStats7S and num ~= 7 then
		gui.tableStats7.destroy()
		gui.tableStats7S = false
	end
	if gui.tableStats8S and num ~= 8 then
		gui.tableStats8.destroy()
		gui.tableStats8S = false
	end
end
function closeAllBuilds(num,player)
	local gui = glob.cursed[player.name].gui
	if num == -1 then
		gui.tableBuilds1S = false
		gui.tableBuilds2S = false
	end
	if gui.tableBuilds1S and num ~= 1 then
		gui.tableBuilds1.destroy()
		gui.tableBuilds1S = false
	end
	if gui.tableBuilds2S and num ~= 2 then
		gui.table.Builds2.destroy()
		gui.tableBuilds2S = false
	end
end

function levelmines(minecalled,player)
	local mine = glob.cursed[player.name].mines[minecalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (mine.exp >= mine.next) and (mine.level < talents[3][2].now + 2) then
		mine.level = mine.level + 1
		mine.exp = mine.exp - mine.next
		mine.next = mine.level * mine.level * 2
		local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
		mine.entity.destroy()	
		mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui.tableBuilds1S then
			if gui.tableMine.builds1c2.caption == mine.nick then
				gui.tableBuilds1.builds1c4.caption = "Level " .. mine.level
			end
		end
		player.print("Cursed: ".. mine.nick .." has evolved")
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
			mine.exp = mine.next + mine.exp
			local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
			mine.entity.destroy()
			mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui.tableBuilds1S then
				if gui.tableMine.builds1c2.caption == mine.nick then
					gui.tableBuilds1.builds1c4.caption = "Level " .. mine.level
				end
			end
			player.print("Cursed: " .. mine.nick .. " has regressed")
		end
	end
end
function levelturrets(turretcalled,player)
	local turret = glob.cursed[player.name].turrets[turretcalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (turret.exp >= turret.next) and (turret.level < talents[3][4].now + 2) then
		turret.level = turret.level + 1
		turret.exp = turret.exp - turret.next
		turret.next = turret.level * turret.level * 2
		local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
		turret.entity.destroy()	
		turret.entity = game.createentity{name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui.tableBuilds2S then
			if gui.tableTurret.builds2c2.caption == turret.nick then
				gui.tableBuilds2.builds2c4.caption = "Level " .. turret.level
			end
		end
		player.print("Cursed: " .. turret.nick .. " has evolved")
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
			turret.exp = turret.next + turret.exp
			local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
			turret.entity.destroy()
			turret.entity = game.createentity{name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui.tableBuilds2S then
				if gui.tableTurret.builds2c2.caption == turret.nick then
					gui.tableBuilds2.builds2c4.caption = "Level " .. turret.level
				end
			end
			player.print("Cursed: " .. turret.nick .. " drill has regressed")
		end
	end
end


function skillUp(statcalled,newnext,player)
	if statcalled.exp >= statcalled.next then
		statcalled.level = statcalled.level + 1
		statcalled.exp = statcalled.exp - statcalled.next
		statcalled.next = newnext
		local stats = glob.cursed[player.name].stats
		local gui = glob.cursed[player.name].gui
		if (statcalled == stats.general) then
			player.character.insert({name="cursed-talent-1",count=1})
		elseif statcalled == stats.mining then
			if gui.tableStats2S then
				gui.tableStats2.stat2c1.caption = "Mining - Level " .. statcalled.level
				gui.tableStats2.stat2c4.caption = "Bonus: " .. statcalled.level / 16 .. "%"
			end
		elseif statcalled == stats.farming then
			if gui.tableStats3S then
				gui.tableStats3.stat3c1.caption = "Farming - Level " .. statcalled.level
				gui.tableStats3.stat3c4.caption = "Bonus: " .. statcalled.level / 8 .. "%"
			end
		elseif statcalled == stats.crafting then
			player.force.manualcraftingspeedmodifier = 1 + ((statcalled.level) / 24)
			if gui.tableStats4S then
				gui.tableStats4.stat4c1.caption = "Crafting - Level " .. statcalled.level
				gui.tableStats4.stat4c4.caption = "Bonus: " .. statcalled.level / 24 .. "%"
			end
		elseif statcalled == stats.explore	then
			if gui.tableStats5S then
				gui.tableStats5.stat5c1.caption = "Explore - Level " .. statcalled.level
				gui.tableStats5.stat5c4.caption = "Bonus: " .. statcalled.level / 32 .. "%"
			end
		elseif statcalled == stats.defense then
			if gui.tableStats6S then
				gui.tableStats6.stat6c1.caption = "Defense - Level " .. statcalled.level
				gui.tableStats6.stat6c4.caption = "Bonus: " .. statcalled.level * 2 .. "%"
			end
		elseif statcalled == stats.range and statcalled.level <= maxRange then
			player.force.technologies["arrow-damage-" .. statcalled.level].researched = true
			if statcalled.level < maxRange then
				player.force.technologies["arrow-damage-" .. statcalled.level + 1].enabled = false
			end
			if gui.tableStats7S then
				gui.tableStats7.stat7c1.caption = "Bow - Level " .. statcalled.level
				if statcalled.level < maxRange then
					gui.tableStats7.stat7c4.caption = "Bonus: " .. statcalled.level * 10 .. "%"
				end
			end
		end
		if statcalled ~= stats.general then
			stats.general.exp = stats.general.exp + 1
			if stats.general.exp >=  stats.general.next then
				skillUp(stats.general,(((stats.general.level + 1) * 1.5) + 0.5 ),player)
			end
		end
		player.print(statcalled.name .. " level " .. statcalled.level .. " - Next level: " .. statcalled.next)
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
	n = {"general","mining","farming","crafting","explore","range","melee","defense"}
	for i = 1, #n do
		stats[n[i]] = {}
		stats[n[i]].name = n[i]
		stats[n[i]].level = 1
		stats[n[i]].exp = 0
		stats[n[i]].next = ((stats[n[i]].level * stats[n[i]].level) * 0.8 + 10 )
	end
	stats.general.next = ((stats.general.level * 1.5) + 0.5 )
	for i = 1, maxRange do
		if i <= stats.range.level then
			player.force.technologies["arrow-damage-" .. i].researched = true
		else
			player.force.technologies["arrow-damage-" .. i].researched = false
		end
	end
	if stats.range.level < maxRange then
		player.force.technologies["arrow-damage-" .. stats.range.level + 1].enabled = false
	end
	glob.cursed[player.name].stats = stats
end

function resettalents(player)
	local mines = glob.cursed[player.name].mines
	if mines ~= nil then
		for i = 1, #mines do
			mines[i].entity.destroy()
			mines[i] = nil
		end
	end
	mines = {}
	glob.cursed[player.name].mines = mines
	local turrets = glob.cursed[player.name].turrets
	if turrets ~= nil then
		for i = 1, #turrets do
			turrets[i].entity.destroy()
			turrets[i] = nil
		end
	end
	turrets = {}
	glob.cursed[player.name].turrets = turrets
	local talents = {}
	for i=1, 6 do
		talents[i] = {}
		for j=1, 10 do
			talents[i][j] = {now,max}
			talents[i][j].now = 0
			talents[i][j].max = 0
		end
	end
	talents[1][1].max = 7
	talents[1][2].max = 7
	talents[1][5].max = maxMiningBonus
	talents[1][6].max = maxFarmingBonus
	talents[1][7].max = maxCraftingBonus
	talents[1][8].max = maxExploreBonus
	talents[1][9].max = maxAttackBonus
	talents[1][10].max = maxDefenseBonus
	talents[2][1].now = 1
	talents[2][1].max = maxTool
	talents[2][2].now = 1
	talents[2][2].max = maxArmor
	talents[2][3].now = 1
	talents[2][3].max = maxWeapon1
	talents[2][4].now = 1 - 1
	talents[2][4].max = maxAmmo1 - maxAmmo1
	talents[3][1].max = math.floor(talents[3][2].now / 5) + 2
	talents[3][2].max = maxMine - 2
	talents[3][3].max = math.floor(talents[3][4].now / 5) + 2
	talents[3][4].max = maxTurret
	talents[3][5].max = talents[3][6].now + 2
	talents[3][6].max = maxWalls
	talents[3][7].max = talents[3][8].now + 2
	talents[3][8].max = maxGenerator
	talents[4][1].max = maxTalentPart - 3
	talents[4][2].max = maxTalentPart - 3
	talents[4][3].max = maxTalentPart - 3
	talents[4][4].max = maxTalentPart - 3
	talents[4][5].max = maxTalentPart - 3
	talents[4][6].max = maxTalentPart - 3
	talents[4][7].max = maxTalentPart - 3
	talents[4][8].max = maxTalentPart - 3
	talents[4][9].max = maxTalentPart - 3
	talents[4][10].max = maxTalentPart - 3
	talents[5][4].now = 0
	talents[5][4].max = maxRegen
	talents[5][6].now = 0
	talents[5][6].max = maxDmgAura
	talents[5][8].now = 0
	talents[5][8].max = maxWinTalent
	for i = 1, talents[2][4].max do
		if i <= talents[2][4].now then
			player.force.technologies["arrow-speed-" .. i].researched = true
		else
			player.force.technologies["arrow-speed-" .. i].researched = false
		end
	end
	if talents[2][4].now < talents[2][4].max then
		player.force.technologies["arrow-speed-" .. talents[2][4].now + 1].enabled = false
	end
	glob.cursed[player.name].talents = talents
	removeAxes(player)
	player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
	removeArmors(player)
	player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
	removeBows(player)
	player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
	player.insert({name="cursed-ammo1-1",count=10})
	player.insert({name="cursed-talent-1",count=10})
	player.print("Talents reseted")
end

remote.addinterface("cursed",
{
prueba = function()
	player.print(serpent.block(glob.cursed["SP"]))
end,
	debugtime = function()
		game.daytime = ((game.tick%25000)/25000)
		--game.player.print("Time: " .. util.formattime(game.tick))
	end,
	-- debugblood = function()
		-- local blood = glob.cursed.blood
		-- for _,v in ipairs(game.findentitiesfiltered{area = {{game.player.position.x-2, game.player.position.y-2}, {game.player.position.x+2, game.player.position.y+2}}, name="cursed-blood"}) do
				-- for k = 1, #blood do
					-- if blood[k] ~= nil and blood[k].entity ~= nil and v.equals(blood[k].entity) then
						-- blood[k].entity.destroy()
						-- table.remove(blood,k)
						-- return
					-- end
				-- end
			-- v.destroy()
		-- end
	-- end,
	resetstats = function(sure)
	
	end,
	exportstats = function()
		if files.exportSkills(cursed[game.player.name].skills) then
			game.player.print("Stats saved")
		else
			game.player.print("Error saving")
		end
	end,
	importstats = function()
		cursed[game.player.name].skills = files.importSkills()
		game.player.print("Skills loaded")
	end,
	
})
