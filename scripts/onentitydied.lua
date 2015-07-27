module("onentitydied", package.seeall)

function main(event)
	if event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,13)) == "cursed-drill-" then
		local owner = mix.getowner(event.entity,"drill")
		local mines = glob.cursed[owner].mines
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = mix.getplayerbyname(owner)
		for i = 1, #mines do
			if mines[i] and mines[i].entity and mines[i].entity.valid and event.entity.equals(mines[i].entity) then
				talents[3][1].now = talents[3][1].now - 1
				if player ~= nil then
					if gui ~= nil and gui.tableBuilds1S then
						if tonumber(gui.tableBuilds1ID.builds1c11.caption) == i then
							guiFlipFlop("buildsMain1",player)
						elseif tonumber(gui.tableBuilds1ID.builds1c11.caption) > i then
							gui.tableBuilds1ID.builds1c11.caption = tonumber(gui.tableBuilds1ID.builds1c11.caption) - 1
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",mines[i].nick}})
					if gui ~= nil and gui.tableTalents3S then
						gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
					end
				end
				table.remove(mines,i)
				return
			end
		end
	elseif event.entity.type == "turret" and string.sub(event.entity.name,1,14) == "cursed-turret-" then
		local owner = mix.getowner(event.entity,"turret")
		local turrets = glob.cursed[owner].turrets
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = mix.getplayerbyname(owner)
		for i = 1, #turrets do
			if turrets[i] ~= nil and turrets[i].entity ~= nil and event.entity.equals(turrets[i].entity) then
				talents[3][3].now = talents[3][3].now - 1
				if player ~= nil then
					if gui ~= nil and gui.tableBuilds2S then
						if tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
							guiFlipFlop("buildsMain2",player)
						elseif tonumber(gui.tableBuilds2ID.builds2c11.caption) > i then
							gui.tableBuilds2ID.builds2c11.caption = tonumber(gui.tableBuilds2ID.builds2c11.caption) - 1
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",turrets[i].nick}})
					if gui ~= nil and gui.tableTalents3S then
						gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
					end
				end
				table.remove(turrets,i)
				return
			end
		end
	elseif event.entity.type == "offshore-pump" and string.sub(event.entity.name,1,14) == "cursed-fisher-" then
		local owner = mix.getowner(event.entity,"fisher")
		local fishers = glob.cursed[owner].fishers
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = mix.getplayerbyname(owner)
		for i = 1, #fishers do
			if fishers[i] ~= nil and fishers[i].entity ~= nil and event.entity.equals(fishers[i].entity) then
				talents[3][7].now = talents[3][7].now - 1
				if player ~= nil then
					if gui ~= nil and gui.tableBuilds6S then
						if tonumber(gui.tableBuilds6ID.builds6c11.caption) == i then
							guiFlipFlop("buildsMain6",player)
						elseif tonumber(gui.tableBuilds6ID.builds6c11.caption) > i then
							gui.tableBuilds6ID.builds6c11.caption = tonumber(gui.tableBuilds6ID.builds6c11.caption) - 1
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",fishers[i].nick}})
					if gui ~= nil and gui.tableTalents3S then
						gui.tableTalents3.talent3c7.caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}
					end
				end
				table.remove(fishers,i)
				return
			end
		end
	elseif event.entity.force.name == "enemy" then
		local blood = glob.cursed.others.blood
		for i = 1, #blood do
			if blood[i] == nil or blood[i].entity == nil then
				blood[i] = {}
				blood[i].entity = game.createentity {name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
				blood[i].entity.destructible = false
				blood[i].total = event.entity.prototype.maxhealth / 20
				blood[i].time = 2
				return
			end
		end
		blood[#blood + 1] = {}
		blood[#blood].entity = game.createentity {name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
		blood[#blood].entity.destructible = false
		blood[#blood].total = event.entity.prototype.maxhealth / 5
		blood[#blood].time = 2
		game.pollute(event.entity.position,(event.entity.prototype.maxhealth * 0.1))
		
		local nearplayer = game.findentitiesfiltered{area ={{event.entity.position.x - 20,event.entity.position.y - 20},{event.entity.position.x + 20,event.entity.position.y + 20}},type="player"}
		local players = {}
		for  i = 1, #nearplayer do
			for j = 1, #game.players do
				if game.players[j].character then
					if nearplayer[i].equals(game.players[j].character) then
						local player = game.players[j]
						table.insert(players,player)
						if player.getinventory(defines.inventory.playerguns)[player.character.selectedgunindex] ~= nil and (string.sub(player.getinventory(defines.inventory.playerguns)[player.character.selectedgunindex].name,1, 11)) == "cursed-bow-" then 
							local stats = glob.cursed[player.name].stats
							local gui = glob.cursed[player.name].gui
							local talents = glob.cursed[player.name].talents
							local class = glob.cursed[player.name].class
							if stats.range.exp < stats.range.next * 1.5 then
								stats.range.exp = mix.round(stats.range.exp + (event.entity.prototype.maxhealth * 0.25 * (class.multBow + talents[1][9].now / 40 + stats.general.level*datos.resGeneral)) / #players,3)
							end
							if stats.range.exp >= stats.range.next then
								skillUp.main(stats.range,(((stats.range.level + 1) * (stats.range.level + 1)) * 0.8 + 10 ),player)
							end
							if gui ~= nil and gui.tableStats7S then
								gui.tableStats7.stat7c2.caption = {"gui.stat7c2",stats.range.exp,stats.range.next,100 * (class.multBow + talents[1][9].now / 40 + stats.general.level*datos.resGeneral)}
								gui.tableStats7.stat7c3.value = stats.range.exp / stats.range.next
							end
						end
					end
				end
			end
		end
		local lowerchance = -1
		for i = 1, #players do
			local player = players[i]
			local chance = glob.cursed[player.name].talents[5][8].now
			if chance < lowerchance or (chance ~= 0 and lowerchance  == -1) then
				lowerchance = chance
			end
		end
		
		for i = 1, #players do
			local player = players[i]
			local stats = glob.cursed[player.name].stats
			local newtp = math.floor((stats.range.level * datos.resRange) / 125)
			if math.random(125 / datos.resRange) <= stats.range.level - (newtp * (125 / datos.resRange)) then
				newtp = newtp + 1
			end
			if newtp > 0 then
				local talents = glob.cursed[player.name].talents
				local num = math.random(6)
				local tpmult = 1 + math.floor(talents[4][num].now / 4)
				if math.random(4) <= talents[4][num].now - (tpmult * 4) then
					tpmult = tpmult + 1
				end
				newtp = newtp * tpmult
				functions_talents.insertParts(player,num,newtp)
				if glob.cursed[player.name].opt[6] == true then
					player.print({"msg.cursed",{"msg.item-bonus",newtp, game.getlocaliseditemname("cursed-talent-part-" .. num)}})
					game.createentity({name="flying-text", position=player.position, color = player.color, text={"msg.item-bonus-flying",newtp , game.getlocaliseditemname("cursed-talent-part-" .. num)} })
				end
			end
		end
					
		if lowerchance ~= -1 then
			for i = 1, #players do
				local player = players[i]
				local talents = glob.cursed[player.name].talents
				if talents[5][8].now > 0 then
					local cant = math.floor(((talents[5][8].now + lowerchance) / 2)/250)
					if math.random(250) <= ((talents[5][8].now + lowerchance) / 2) - (cant * 250) then
						cant = cant + 1
					end
					if cant > 0 then
						functions_talents.insertTalents(player,1,cant)
						if glob.cursed[player.name].opt[8] == true then
							player.print({"msg.cursed",{"msg.item-bonus",cant , game.getlocaliseditemname("cursed-talent-1")}})
						end
						game.createentity({name="flying-text", position=player.position, color = player.color, text={"msg.item-bonus-flying", cant , game.getlocaliseditemname("cursed-talent-1")} })
						if gui ~= nil and gui.frameMain1S then
							if gui["tableTalents1S"] then
								gui["frameTalentsDet1"]["talentsMain1"].caption = {"gui.clicked",{"gui.talentsMain1",player.getitemcount("cursed-talent-1") + inv.talents["pt1"]}}
							else
								gui["frameTalentsDet1"]["talentsMain1"].caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1") + inv.talents["pt1"]}
							end
						end
					end
				end
			end
		end	
		local nearturret = game.findentitiesfiltered{area ={{event.entity.position.x - 30,event.entity.position.y - 30},{event.entity.position.x + 30,event.entity.position.y + 30}},type="turret"}
		local num = 0
		for i = 1, #nearturret do
			if num == 0 and string.sub(nearturret[i].name,1,14) == "cursed-turret-" and util.distance(nearturret[i].position,event.entity.position) < 5 + (tonumber(string.sub(nearturret[i].name,15,16))) / 2 then
				local owner = mix.getowner(nearturret[i],"turret")
				if owner ~= nil then
					local player = mix.getplayerbyname(owner)
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
			local owner = mix.getowner(nearturret[num],"turret")
			if owner ~= nil then
				local player = mix.getplayerbyname(owner)
				local talents = glob.cursed[player.name].talents
				local turrets = glob.cursed[player.name].turrets
				local stats = glob.cursed[player.name].stats
				local gui = glob.cursed[player.name].gui
				for i = 1, #turrets do
					if nearturret[num].equals(turrets[i].entity) then
						if turrets[i].exp <= turrets[i].next * 1.2 then
							turrets[i].exp = mix.round(turrets[i].exp + (event.entity.prototype.maxhealth  * 0.1) * (1 + (talents[3][4].now * 0.01) + (stats.range.level * 0.02)),3)
						end
						if turrets[i].level < datos.maxTurret and turrets[i].exp >= turrets[i].next then
							levelEntity.turrets(i,player)
						end
						if gui ~= nil and gui.tableBuilds2S then
							if tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
								gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",math.ceil(turrets[i].exp),math.ceil(turrets[i].next),mix.round(100 * ((talents[3][4].now * 0.01) + (stats.range.level * 0.02)),2)}
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
	elseif event.entity.name == "cursed-blood-tank" then
		local tanks = glob.cursed.others.tanks
		for i=1, #tanks do
			if tanks[i] ~= nil and tanks[i].entity ~= nil and event.entity.equals(tanks[i].entity) then
				table.remove(tanks,i)
			end
		end
	elseif event.entity.name == "cursed-generator" then
		local generators = glob.cursed.others.generators
		for i=1, #generators do
			if generators[i] ~= nil and generators[i].chest ~= nil and event.entity.equals(generators[i].chest) then
				generators[i].accumulator.destroy()
				table.remove(generators,i)
			end
		end
	elseif string.sub(event.entity.name,1,16) == "cursed-wall-base" then
		local owner = mix.getowner(event.entity,"wall")
		local walls = glob.cursed[owner].walls
		local gui = glob.cursed[owner].gui
		local talents = glob.cursed[owner].talents
		local player = mix.getplayerbyname(owner)
		for i = 1, #walls do
			if walls[i] ~= nil and walls[i].chest ~= nil and event.entity.equals(walls[i].chest) then
				if walls[i].storage.fluidbox[1] ~= nil and walls[i].storage.fluidbox[1].type == "living-mass" and walls[i].storage.fluidbox[1].amount > (100 + 50 * walls[i].level) / 10 then
					local fluid = walls[i].storage.fluidbox[1].amount-- - 25
					walls[i].chest = game.createentity {name= event.entity.name, position = event.entity.position, force=game.forces.player}
					walls[i].chest.health = fluid
					expe = mix.round((100 - fluid) / 2,3)
				else
					talents[3][5].now = talents[3][5].now - 1
					if player ~= nil then
						if gui ~= nil and gui.tableBuilds5S then
							if tonumber(gui.tableBuilds5ID.builds5c5.caption) == i then
								guiFlipFlop("buildsMain5",player)
							elseif tonumber(gui.tableBuilds5ID.builds5c5.caption) > i then
								gui.tableBuilds5ID.builds5c5.caption = tonumber(gui.tableBuilds5ID.builds5c5.caption) - 1
							end
						end
						player.print({"msg.cursed", {"msg.destroyed",walls[i].nick}})
						if gui ~= nil and gui.tableTalents3S then
							gui.tableTalents3.talent3c5.caption = {"gui.talent3c1",talents[3][5].now,talents[3][5].max}
						end
					end
					for k,wall in pairs(walls[i].sides) do
						for j = 1, #wall do
							local pipesyp = game.findentitiesfiltered{area = {{math.floor(wall[j].position.x),math.floor(wall[j].position.y) - 1},{math.ceil(wall[j].position.x),math.ceil(wall[j].position.y) - 1}},type = "pipe"}
							local pipesxp = game.findentitiesfiltered{area = {{math.floor(wall[j].position.x) + 1,math.floor(wall[j].position.y)},{math.ceil(wall[j].position.x) + 1,math.ceil(wall[j].position.y)}},type = "pipe"}
							local pipesyn = game.findentitiesfiltered{area = {{math.floor(wall[j].position.x),math.floor(wall[j].position.y) + 1},{math.ceil(wall[j].position.x),math.ceil(wall[j].position.y) + 1}},type = "pipe"}
							local pipesxn = game.findentitiesfiltered{area = {{math.floor(wall[j].position.x) - 1,math.floor(wall[j].position.y)},{math.ceil(wall[j].position.x) - 1,math.ceil(wall[j].position.y)}},type = "pipe"}
							
							for i = 1,#pipesyp do
								if string.sub(pipesyp[i].name,1,12) == "cursed-wall-" then
									local pipe = searchPipe(pipesyp[i])
									if pipe ~= nil then
										local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
										local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
										
										local oldhp = oldpipe.health
										local position = oldpipe.position
										local fluid = 0
										if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
											fluid = oldpipe.fluidbox[1].amount
										end
										local pipeid = oldpipe.name
										if string.sub(pipeid,13,13) == "1" then
											oldpipe.destroy()
											newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,12) .. "0" .. string.sub(pipeid,14,16),position=position, force=player.force}
										end
										newpipe[pipe[4]].health = oldhp
										if fluid > 0 then
											newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
										end
									elseif string.sub(pipesyp[i].name,13,17) == "i1010" then
										for j = 1, #walls do
											if pipesyp[i].equals(walls[j].invi.yn) then
												local invi = walls[j].invi.yn
												invi.active = false
												if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
													if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
													else
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
													end
													invi.fluidbox[1] = nil
												end
											end
										end
									end
								end
							end
			
							for i = 1,#pipesxp do
								if string.sub(pipesxp[i].name,1,12) == "cursed-wall-" then
									local pipe = searchPipe(pipesxp[i])
									if pipe ~= nil then
										local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
										local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
										
										local oldhp = oldpipe.health
										local position = oldpipe.position
										local fluid = 0
										if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
											fluid = oldpipe.fluidbox[1].amount
										end
										local pipeid = oldpipe.name
										if string.sub(pipeid,14,14) == "1" then
											oldpipe.destroy()
											newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,13) .. "0" .. string.sub(pipeid,15,16),position=position, force=player.force}
										end
										newpipe[pipe[4]].health = oldhp
										if fluid > 0 then
											newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
										end
									elseif string.sub(pipesxp[i].name,13,17) == "i0101" then
										for j = 1, #walls do
											if pipesxp[i].equals(walls[j].invi.xn) then
												local invi = walls[j].invi.xn
												invi.active = false
												if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
													if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
													else
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
													end
													invi.fluidbox[1] = nil
												end
											end
										end
									end
								end
							end
							
							for i = 1,#pipesyn do
								if string.sub(pipesyn[i].name,1,12) == "cursed-wall-" then
									local pipe = searchPipe(pipesyn[i])
									if pipe ~= nil then
										local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
										local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
										
										local oldhp = oldpipe.health
										local position = oldpipe.position
										local fluid = 0
										if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
											fluid = oldpipe.fluidbox[1].amount
										end
										local pipeid = oldpipe.name
										if string.sub(pipeid,15,15) == "1" then
											oldpipe.destroy()
											newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,14) .. "0" .. string.sub(pipeid,16,16),position=position, force=player.force}
										end
										newpipe[pipe[4]].health = oldhp
										if fluid > 0 then
											newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
										end
									elseif string.sub(pipesyn[i].name,13,17) == "i1010" then
										for j = 1, #walls do
											if pipesyn[i].equals(walls[j].invi.yp) then
												local invi = walls[j].invi.yp
												invi.active = false
												if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
													if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
													else
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
													end
													invi.fluidbox[1] = nil
												end
											end
										end
									end
								end
							end
							
							for i = 1,#pipesxn do
								if string.sub(pipesxn[i].name,1,12) == "cursed-wall-" then
									local pipe = searchPipe(pipesxn[i])
									if pipe ~= nil then
										local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
										local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
										
										local oldhp = oldpipe.health
										local position = oldpipe.position
										local fluid = 0
										if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
											fluid = oldpipe.fluidbox[1].amount
										end
										local pipeid = oldpipe.name
										if string.sub(pipeid,16,16) == "0" then
											oldpipe.destroy()
											newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,15) .. "1",position=position, force=player.force}
										end
										newpipe[pipe[4]].health = oldhp
										if fluid > 0 then
											newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
										end
									elseif string.sub(pipesxn[i].name,13,17) == "i0101" then
										for j = 1, #walls do
											if pipesxn[i].equals(walls[j].invi.xp) then
												local invi = walls[j].invi.xp
												invi.active = false
												if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
													if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
													else
														walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
													end
													invi.fluidbox[1] = nil
												end
											end
										end
									end
								end
							end
							wall[j].destroy()
						end
					end
					for k,v in pairs(walls[i].invi) do
						v.destroy()
					end
					
					local pipesyp = game.findentitiesfiltered{area = {{math.floor(walls[i].storage.position.x),math.floor(walls[i].storage.position.y) - 2},{math.ceil(walls[i].storage.position.x),math.ceil(walls[i].storage.position.y) - 2}},type = "pipe"}
					local pipesxp = game.findentitiesfiltered{area = {{math.floor(walls[i].storage.position.x) + 2,math.floor(walls[i].storage.position.y)},{math.ceil(walls[i].storage.position.x) + 2,math.ceil(walls[i].storage.position.y)}},type = "pipe"}
					local pipesyn = game.findentitiesfiltered{area = {{math.floor(walls[i].storage.position.x),math.floor(walls[i].storage.position.y) + 2},{math.ceil(walls[i].storage.position.x),math.ceil(walls[i].storage.position.y) + 2}},type = "pipe"}
					local pipesxn = game.findentitiesfiltered{area = {{math.floor(walls[i].storage.position.x) - 2,math.floor(walls[i].storage.position.y)},{math.ceil(walls[i].storage.position.x) - 2,math.ceil(walls[i].storage.position.y)}},type = "pipe"}
					
					for i = 1,#pipesyp do
						if string.sub(pipesyp[i].name,1,12) == "cursed-wall-" then
							local pipe = searchPipe(pipesyp[i])
							if pipe ~= nil then
								local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
								local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
								
								local oldhp = oldpipe.health
								local position = oldpipe.position
								local fluid = 0
								if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
									fluid = oldpipe.fluidbox[1].amount
								end
								local pipeid = oldpipe.name
								if string.sub(pipeid,13,13) == "1" then
									oldpipe.destroy()
									newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,12) .. "0" .. string.sub(pipeid,14,16),position=position, force=player.force}
								end
								newpipe[pipe[4]].health = oldhp
								if fluid > 0 then
									newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
								end
							elseif string.sub(pipesyp[i].name,13,17) == "i1010" then
								for j = 1, #walls do
									if walls[j].invi.yn.valid and pipesyp[i].equals(walls[j].invi.yn) then
										local invi = walls[j].invi.yn
										invi.active = false
										if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
											if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
											else
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
											end
											invi.fluidbox[1] = nil
										end
									end
								end
							end
						end
					end
					
					for i = 1,#pipesxp do
						if string.sub(pipesxp[i].name,1,12) == "cursed-wall-" then
							local pipe = searchPipe(pipesxp[i])
							if pipe ~= nil then
								local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
								local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
								
								local oldhp = oldpipe.health
								local position = oldpipe.position
								local fluid = 0
								if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
									fluid = oldpipe.fluidbox[1].amount
								end
								local pipeid = oldpipe.name
								if string.sub(pipeid,14,14) == "1" then
									oldpipe.destroy()
									newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,13) .. "0" .. string.sub(pipeid,15,16),position=position, force=player.force}
								end
								newpipe[pipe[4]].health = oldhp
								if fluid > 0 then
									newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
								end
							elseif string.sub(pipesxp[i].name,13,17) == "i0101" then
								for j = 1, #walls do
									if walls[j].invi.yn.valid and pipesxp[i].equals(walls[j].invi.xn) then
										local invi = walls[j].invi.xn
										invi.active = false
										if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
											if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
											else
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
											end
											invi.fluidbox[1] = nil
										end
									end
								end
							end
						end
					end
					
					for i = 1,#pipesyn do
						if string.sub(pipesyn[i].name,1,12) == "cursed-wall-" then
							local pipe = searchPipe(pipesyn[i])
							if pipe ~= nil then
								local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
								local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
								
								local oldhp = oldpipe.health
								local position = oldpipe.position
								local fluid = 0
								if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
									fluid = oldpipe.fluidbox[1].amount
								end
								local pipeid = oldpipe.name
								if string.sub(pipeid,15,15) == "1" then
									oldpipe.destroy()
									newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,14) .. "0" .. string.sub(pipeid,16,16),position=position, force=player.force}
								end
								newpipe[pipe[4]].health = oldhp
								if fluid > 0 then
									newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
								end
							elseif string.sub(pipesyn[i].name,13,17) == "i1010" then
								for j = 1, #walls do
									if walls[j].invi.yn.valid and pipesyn[i].equals(walls[j].invi.yp) then
										local invi = walls[j].invi.yp
										invi.active = false
										if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
											if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
											else
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
											end
											invi.fluidbox[1] = nil
										end
									end
								end
							end
						end
					end
					
					for i = 1,#pipesxn do
						if string.sub(pipesxn[i].name,1,12) == "cursed-wall-" then
							local pipe = searchPipe(pipesxn[i])
							if pipe ~= nil then
								local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
								local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
								
								local oldhp = oldpipe.health
								local position = oldpipe.position
								local fluid = 0
								if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
									fluid = oldpipe.fluidbox[1].amount
								end
								local pipeid = oldpipe.name
								if string.sub(pipeid,16,16) == "1" then
									oldpipe.destroy()
									newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,15) .. "0",position=position, force=player.force}
								end
								newpipe[pipe[4]].health = oldhp
								if fluid > 0 then
									newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
								end
							elseif string.sub(pipesxn[i].name,13,17) == "i0101" then
								for j = 1, #walls do
									if walls[j].invi.yn.valid and pipesxn[i].equals(walls[j].invi.xp) then
										local invi = walls[j].invi.xp
										invi.active = false
										if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
											if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
											else
												walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
											end
											invi.fluidbox[1] = nil
										end
									end
								end
							end
						end
					end
					walls[i].storage.destroy()
					table.remove(walls,i)
					return
				end
			end
		end
	elseif event.entity.type == "pipe" and string.sub(event.entity.name,1,12) == "cursed-wall-" then
		local owner = mix.getowner(event.entity,"pipe")
		local player = mix.getplayerbyname(owner)
		local walls = glob.cursed[player.name].walls
		local entity = event.entity
		for i = 1, #walls do
			for k,v in pairs(walls[i].sides) do
				for j = 1, #v do
					if v[j] ~= nil and entity.equals(v[j]) then
						local expe = 0
						if entity.fluidbox[1] ~= nil and entity.fluidbox[1].type == "living-mass" and entity.fluidbox[1].amount > 10 then
							local fluid = entity.fluidbox[1].amount-- - 25
							v[j] = game.createentity {name= entity.name, position = entity.position, force=game.forces.player}
							v[j].health = fluid
							expe = mix.round((100 - fluid) / 2,3)
							-- if (fluid - v[j].health) > 0 then
								-- v[j].fluidbox[1] = {type = "living-mass", amount = fluid - v[j].health, temperature = 30}
							-- end
						else
							for m = j, #v do
								if m == #v then
									local pipesyp = game.findentitiesfiltered{area = {{math.floor(v[m].position.x),math.floor(v[m].position.y) - 1},{math.ceil(v[m].position.x),math.ceil(v[m].position.y) - 1}},type = "pipe"}
									local pipesxp = game.findentitiesfiltered{area = {{math.floor(v[m].position.x) + 1,math.floor(v[m].position.y)},{math.ceil(v[m].position.x) + 1,math.ceil(v[m].position.y)}},type = "pipe"}
									local pipesyn = game.findentitiesfiltered{area = {{math.floor(v[m].position.x),math.floor(v[m].position.y) + 1},{math.ceil(v[m].position.x),math.ceil(v[m].position.y) + 1}},type = "pipe"}
									local pipesxn = game.findentitiesfiltered{area = {{math.floor(v[m].position.x) - 1,math.floor(v[m].position.y)},{math.ceil(v[m].position.x) - 1,math.ceil(v[m].position.y)}},type = "pipe"}
									
									for i = 1,#pipesyp do
										if string.sub(pipesyp[i].name,1,12) == "cursed-wall-" then
											local pipe = searchPipe(pipesyp[i])
											if pipe ~= nil then
												local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
												local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
												
												local oldhp = oldpipe.health
												local position = oldpipe.position
												local fluid = 0
												if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
													fluid = oldpipe.fluidbox[1].amount
												end
												local pipeid = oldpipe.name
												if string.sub(pipeid,13,13) == "1" then
													oldpipe.destroy()
													newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,12) .. "0" .. string.sub(pipeid,14,16),position=position, force=player.force}
												end
												newpipe[pipe[4]].health = oldhp
												if fluid > 0 then
													newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
												end
											elseif string.sub(pipesyp[i].name,13,17) == "i1010" then
												for j = 1, #walls do
													if pipesyp[i].equals(walls[j].invi.yn) then
														local invi = walls[j].invi.yn
														invi.active = false
														if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
															if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
															else
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
															end
															invi.fluidbox[1] = nil
														end
													end
												end
											end
										end
									end
									
									for i = 1,#pipesxp do
										if string.sub(pipesxp[i].name,1,12) == "cursed-wall-" then
											local pipe = searchPipe(pipesxp[i])
											if pipe ~= nil then
												local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
												local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
												
												local oldhp = oldpipe.health
												local position = oldpipe.position
												local fluid = 0
												if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
													fluid = oldpipe.fluidbox[1].amount
												end
												local pipeid = oldpipe.name
												if string.sub(pipeid,14,14) == "1" then
													oldpipe.destroy()
													newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,13) .. "0" .. string.sub(pipeid,15,16),position=position, force=player.force}
												end
												newpipe[pipe[4]].health = oldhp
												if fluid > 0 then
													newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
												end
											elseif string.sub(pipesxp[i].name,13,17) == "i0101" then
												for j = 1, #walls do
													if pipesxp[i].equals(walls[j].invi.xn) then
														local invi = walls[j].invi.xn
														invi.active = false
														if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
															if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
															else
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
															end
															invi.fluidbox[1] = nil
														end
													end
												end
											end
										end
									end
									
									for i = 1,#pipesyn do
										if string.sub(pipesyn[i].name,1,12) == "cursed-wall-" then
											local pipe = searchPipe(pipesyn[i])
											if pipe ~= nil then
												local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
												local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
												
												local oldhp = oldpipe.health
												local position = oldpipe.position
												local fluid = 0
												if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
													fluid = oldpipe.fluidbox[1].amount
												end
												local pipeid = oldpipe.name
												if string.sub(pipeid,15,15) == "1" then
													oldpipe.destroy()
													newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,14) .. "0" .. string.sub(pipeid,16,16),position=position, force=player.force}
												end
												newpipe[pipe[4]].health = oldhp
												if fluid > 0 then
													newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
												end
											elseif string.sub(pipesyn[i].name,13,17) == "i1010" then
												for j = 1, #walls do
													if pipesyn[i].equals(walls[j].invi.yp) then
														local invi = walls[j].invi.yp
														invi.active = false
														if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
															if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
															else
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
															end
															invi.fluidbox[1] = nil
														end
													end
												end
											end
										end
									end
									
									for i = 1,#pipesxn do
										if string.sub(pipesxn[i].name,1,12) == "cursed-wall-" then
											local pipe = searchPipe(pipesxn[i])
											if pipe ~= nil then
												local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
												local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
												
												local oldhp = oldpipe.health
												local position = oldpipe.position
												local fluid = 0
												if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
													fluid = oldpipe.fluidbox[1].amount
												end
												local pipeid = oldpipe.name
												if string.sub(pipeid,16,16) == "1" then
													oldpipe.destroy()
													newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,15) .. "0",position=position, force=player.force}
												end
												newpipe[pipe[4]].health = oldhp
												if fluid > 0 then
													newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
												end
											elseif string.sub(pipesxn[i].name,13,17) == "i0101" then
												for j = 1, #walls do
													if pipesxn[i].equals(walls[j].invi.xp) then
														local invi = walls[j].invi.xp
														invi.active = false
														if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
															if (walls[j].storage.fluidbox[1] == nil or (walls[j].storage.fluidbox[1] ~= nil and walls[j].storage.fluidbox[1].type ~= "living-mass")) then
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
															else
																walls[j].storage.fluidbox[1] = {type = "living-mass", amount = walls[j].storage.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
															end
															invi.fluidbox[1] = nil
														end
													end
												end
											end
										end
									end
									
									v[m].destroy()
									table.remove(v,#v)
									
									expe = mix.round(50,3)
								elseif m == j then
									local oldhp = v[#v].health
									local position = v[m].position
									local fluid = 0
									if v[#v].fluidbox[1] ~= nil and v[#v].fluidbox[1].type == "living-mass" then
										fluid = v[#v].fluidbox[1].amount
									end
									local pipeid = entity.name
									local todelete = v[m]
									v[m] = game.createentity{name=pipeid,position=position, force=player.force}
									todelete.destroy()
									v[m].health = oldhp
									if fluid > 0 then
										v[m].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
									end
								end
							end
						end
						if expe > 0 and (walls[i].level > 1 or walls[i].exp > 0) then
							walls[i].exp = walls[i].exp - expe
							if walls[i].level > 1 and walls[i].exp <= 0 then
								levelEntity.walls(i,player)
							elseif walls[i].level == 1 and walls[i].exp < 0 then
								walls[i].exp = 0
							end
						end
						local gui = glob.cursed[player.name].gui
						local stats = glob.cursed[player.name].stats
						local talents = glob.cursed[player.name].talents
						if gui ~= nil and gui.tableBuilds5S then
							if tonumber(gui.tableBuilds5ID.builds5c5.caption) == i then
								gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",math.ceil(walls[i].exp),math.ceil(walls[i].next),mix.round(100 * (talents[3][6].now * 0.01 + stats.defence.level * 0.02),2)}
								if walls[i].exp > 0 then
									gui.tableBuilds5.builds5c27.value = walls[i].exp / walls[i].next
								else
									gui.tableBuilds5.builds5c27.value = 0
								end
								if walls[i].storage.fluidbox[1] ~= nil and walls[i].storage.fluidbox[1].type == "living-mass" then
									gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",math.ceil(walls[i].storage.fluidbox[1].amount),walls[i].maxmass}
									gui.tableBuilds5.builds5c9.value = walls[i].storage.fluidbox[1].amount / walls[i].maxmass
								else
									gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",0,walls[i].maxmass}
									gui.tableBuilds5.builds5c9.value = 0
								end
								gui.tableWall2.builds5c12.caption = #walls[i].sides.wallxp
								gui.tableWall2.builds5c16.caption = #walls[i].sides.wallxn
								gui.tableWall2.builds5c20.caption = #walls[i].sides.wallyp
								gui.tableWall2.builds5c24.caption = #walls[i].sides.wallyn
							end
						end
					end
				end
			end
		end
	elseif event.entity.type == "player" then
		local player
		for _,v in ipairs(game.players) do
			if event.entity.equals(v.character) and glob.cursed[v.name].aux.tomb == nil then
				player = v
			end
		end
		if player ~= nil then
			local base = glob.cursed[player.name].aux.base
			local talents = glob.cursed[player.name].talents
			if talents[6][1].now >= 1 then
				local bodies = base.getitemcount("cursed-player")
				base.getinventory(defines.inventory.labinput).remove({name="cursed-player",count=1})
				bodies = bodies - base.getitemcount("cursed-player")
				if bodies > 0 then
					talents[6][1].now = talents[6][1].now - 1
					local gui = glob.cursed[player.name].gui
					if gui ~= nil and gui.tableTalents6S then
						gui.tableTalents6.talent6c1.caption = {"gui.talent6c1",talents[6][1].now,"-"}
					end
					game.setgamestate{gamefinished=false, playerwon=false}
					local entity = event.entity
					local positionplayer = game.findnoncollidingposition(entity.name, base.position, 25, 1)
					local nextplayer = game.createentity {name=entity.name, position=positionplayer, force=player.force}
					local bodies = glob.cursed[player.name].aux.bodies
					for i = 1, #bodies do
						if event.entity.equals(bodies[i].entity) then
							bodies[i].position = nextplayer.position
							bodies[i].name = nextplayer.name
							bodies[i].entity = nextplayer
							bodies[i].nick = "Body {" .. math.floor(positionplayer.x) .. "," .. math.floor(positionplayer.y) .. "}"
							glob.cursed[player.name].aux.bodies[i] = bodies[i]
							if gui ~= nil and gui.tableBuilds4S then
								if tonumber(gui.tableBuilds4ID.builds4c8.caption) == i then
									guiFlipFlop("buildsMain4",v)
								end
							end
						end
					end
					local items = {}
					if entity.hasitemsinside() or entity.cursorstack ~= nil then
						local n = 1
						local playerquickbar = entity.getinventory(defines.inventory.playerquickbar)
						for i = 1, #playerquickbar do
							if playerquickbar[i] ~= nil then
								items[n] = {name=playerquickbar[i].name,count=playerquickbar[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playerquickbar).clear()
						local playermain = entity.getinventory(defines.inventory.playermain) 
						for i = 1, #playermain do
							if playermain[i] ~= nil then
								items[n] = {name=playermain[i].name,count=playermain[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playermain).clear()
						local playerguns = entity.getinventory(defines.inventory.playerguns) 
						for i = 1, #playerguns do
							if playerguns[i] ~= nil then
								items[n] = {name=playerguns[i].name,count=playerguns[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playerguns).clear()
						local playertools = entity.getinventory(defines.inventory.playertools) 
						for i = 1, #playertools do
							if playertools[i] ~= nil then
								items[n] = {name=playertools[i].name,count=playertools[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playertools).clear()
						local playerammo = entity.getinventory(defines.inventory.playerammo) 
						for i = 1, #playerammo do
							if playerammo[i] ~= nil then
								items[n] = {name=playerammo[i].name,count=playerammo[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playerammo).clear()
						local playerarmor = entity.getinventory(defines.inventory.playerarmor) 
						for i = 1, #playerarmor do
							if playerarmor[i] ~= nil then
								items[n] = {name=playerarmor[i].name,count=playerarmor[i].count}
								n = n + 1
							end
						end
						entity.getinventory(defines.inventory.playerarmor).clear()
						local cursorstack = entity.cursorstack
						if cursorstack ~= nil then
							items[n] = {name=cursorstack.name,count=cursorstack.count}
							n = n + 1
							cursorstack = nil
						end
					end
					local position = game.findnoncollidingposition("cursed-tomb", entity.position, 25, 1)
					local tomb = {}
					if position ~= nil then
						tomb.entity = game.createentity {name="cursed-tomb", position=position, force=game.forces.neutral}
						tomb.entity.destructible = false
						tomb.time = 2
						tomb.items = items
						glob.cursed[player.name].aux.tomb = tomb
					else
						for i = 1, #items do
							nextplayer.insert(items[i])
						end
					end
					player.setcontroller({type = defines.controllers.character, character = nextplayer})
				else
					resetall.main(player)
				end
			end
			local bodies = glob.cursed[player.name].aux.bodies
			for i = 1, #bodies do
				if bodies[i].entity.valid and event.entity.equals(bodies[i].entity) then
					if glob.cursed[player.name].aux.bodynow > i then
						glob.cursed[player.name].aux.bodynow = glob.cursed[player.name].aux.bodynow - 1
					end
					local gui = glob.cursed[player.name].gui
					if gui ~= nil and gui.tableBuilds4S then
						if tonumber(gui.tableBuilds4ID.builds4c8.caption) == i then
							guiFlipFlop("buildsMain4",player)
						elseif tonumber(gui.tableBuilds4ID.builds4c8.caption) > i then
							gui.tableBuilds4ID.builds4c8.caption = tonumber(gui.tableBuilds4ID.builds4c8.caption) - 1
						end
					end
					player.print({"msg.cursed", {"msg.destroyed",bodies[i].nick}})
					local talents = glob.cursed[player.name].talents
					talents[6][2].now = talents[6][2].now + 1
					table.remove(bodies,i)
					return
				-- else not bodies[i].entity.valid then
					-- table.remove(bodies,i)
				end
			end
		end
	end
end