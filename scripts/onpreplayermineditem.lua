module("onpreplayermineditem", package.seeall)
require("mix")
require("refreshTrees")


function main(event)
	local player = game.getplayer(event.playerindex)
	local talents = glob.cursed[player.name].talents
	local stats = glob.cursed[player.name].stats
	local gui = glob.cursed[player.name].gui
	if event.entity.type == "tree" and player.character and player.getinventory(defines.inventory.playertools)[1] ~= nil and (player.getinventory(defines.inventory.playertools).getitemcount("cursed-axe-" .. talents[2][1].now) >= 1) then
		local trees = glob.cursed.others.trees
		if not trees[event.entity.name] then
			refreshTrees.main()
		end
		local percent
		if trees[event.entity.name].state == 0 then
			percent = 1
		elseif trees[event.entity.name].state == -1 then
			percent = 0.1
		else
			percent = (trees[event.entity.name].state - 1) / (trees[event.entity.name].total - 1)
		end
		local cant = 0
		if percent == 1 then
			cant = math.floor(stats.farming.level / 100/datos.resFarming)
			if math.random(100/datos.resFarming) <= stats.farming.level - (cant * 100/datos.resFarming) then
				cant = cant + 1
			end
		end
		stats.farming.exp = mix.round(stats.farming.exp + (1 * (1 + talents[1][6].now / 40 + stats.general.level*datos.resGeneral)) * percent,3) -- (mining_time * hardness)
		if cant > 0 then
			stats.farming.exp = mix.round(stats.farming.exp + (cant * 1 * (1 + talents[1][6].now / 40 + stats.general.level*datos.resGeneral)) * percent,3) 
			insertitemtree = cant
		end
		if stats.farming.exp >= stats.farming.next then
			skillUp.main(stats.farming,(((stats.farming.level + 1) * (stats.farming.level + 1)) * 0.8 + 10 ),player)
		end
		if gui ~= nil and gui.tableStats3S then
			gui.tableStats3.stat3c2.caption = {"gui.stat3c2",stats.farming.exp,stats.farming.next,100 * (talents[1][6].now / 40 + stats.general.level*datos.resGeneral)}
			gui.tableStats3.stat3c3.value = stats.farming.exp / stats.farming.next
		end
	elseif event.entity.type == "resource" and player.character and player.getinventory(defines.inventory.playertools)[1] ~= nil and (player.getinventory(defines.inventory.playertools).getitemcount("cursed-axe-" .. talents[2][1].now) >= 1) then
		local cant = math.floor(stats.mining.level / 100/datos.resMining)
		if math.random(100/datos.resMining) <= stats.mining.level - (cant * 100/datos.resMining) then
			cant = cant + 1
		end
		stats.mining.exp = mix.round(stats.mining.exp + (0.75 * (1 + talents[1][5].now / 40 + stats.general.level*datos.resGeneral)),3)-- (mining_time * hardness)
		if cant > 0 then
			stats.mining.exp = mix.round(stats.mining.exp + (cant * 0.75 * (1 + talents[1][5].now / 40 + stats.general.level*datos.resGeneral)),3)
			insertitemresource = cant
		end
		if stats.mining.exp >= stats.mining.next then
			skillUp.main(stats.mining,(((stats.mining.level + 1) * (stats.mining.level + 1)) * 0.8 + 10 ),player)
		end
		if gui ~= nil and gui.tableStats2S then
			gui.tableStats2.stat2c2.caption = {"gui.stat2c2",stats.mining.exp,stats.mining.next,100 * (talents[1][5].now / 40 + stats.general.level*datos.resGeneral)}
			gui.tableStats2.stat2c3.value = stats.mining.exp / stats.mining.next
		end
	elseif event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,13)) == "cursed-drill-" then
		local owner = mix.getowner(event.entity,"drill")
		local mines = glob.cursed[owner].mines
		for i=1, #mines do
			if mines[i] and mines[i].entity and mines[i].entity.valid and event.entity.equals(mines[i].entity) then
				if player.name == owner then
					local totalexp = 0
					for j = 0, mines[i].level do
						totalexp = totalexp + (j^2)*1.375
					end
					mines[i].exp = mines[i].exp - (totalexp + mines[i].exp) * 0.15
					if mines[i].exp < 0 then
						for j = 0,math.floor(mines[i].level * 0.15) + 1 do
							if (mines[i].exp < 0 and mines[i].level > 1) then
								mines[i].level = mines[i].level - 1
								mines[i].next = (mines[i].level^2)*1.375
								mines[i].exp = mix.round(mines[i].next + mines[i].exp,3)
							end
						end
					end
					if gui ~= nil and gui.tableBuilds1S then
						if tonumber(gui.tableBuilds1ID.builds1c11.caption) == i then
							gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mines[i].level}
							gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",mines[i].exp,mines[i].next}
							gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8","∞","∞"}
							gui.tableBuilds1.builds1c9.value = 0
							gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12"}, style = "cursed-buttonInside2" })
							gui.tableBuilds1.add({ type="button", name="builds1c13", caption = {"gui.builds1c13"}, style = "cursed-buttonInside2" })
							-- guiFlipFlop("buildsMain1",player)
						-- elseif tonumber(gui.tableBuilds1ID.builds1c11.caption) > i then
							-- gui.tableBuilds1ID.builds1c11.caption = tonumber(gui.tableBuilds1ID.builds1c11.caption) - 1
						end
					end
					-- table.remove(mines,i)
				else
					mines[i].entity = game.createentity {name="cursed-drill-" .. mines[i].level, position = event.entity.position, direction = event.entity.direction, force=game.forces.player}
					mines[i].entity.active = mines[i].active
					player.print({"msg.aliedmine"})
				end
				-- remover.item = true
			end
		end
	elseif event.entity.type == "turret" and (string.sub(event.entity.name,1,14)) == "cursed-turret-" then
		local owner = mix.getowner(event.entity,"turret")
		local turrets = glob.cursed[owner].turrets
		for i=1, #turrets do
			if turrets[i] ~= nil and turrets[i].entity ~= nil and event.entity.equals(turrets[i].entity) then
				if player.name == owner then
					if gui ~= nil and gui.tableBuilds2S then
						if tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
							guiFlipFlop("buildsMain2",player)
						elseif tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
							gui.tableBuilds2ID.builds2c11.caption = tonumber(gui.tableBuilds2ID.builds2c11.caption) - 1
						end
					end
					table.remove(turrets,i)
				else
					turrets[i].entity = game.createentity {name="cursed-turret-" .. turrets[i].level, position = event.entity.position, direction = event.entity.direction, force=game.forces.player}
					turrets[i].entity.active = turrets[i].active
					remover.item = true
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
	elseif string.sub(event.entity.name,1,16) == "cursed-wall-base" then
		local owner = mix.getowner(event.entity,"wall")
		local walls = glob.cursed[owner].walls
		for i = 1, #walls do
			if walls[i] ~= nil and walls[i].chest ~= nil and event.entity.equals(walls[i].chest) then
				if player.name == owner then
					if gui ~= nil and gui.tableBuilds5S then
						if tonumber(gui.tableBuilds5ID.builds5c5.caption) == i then
							guiFlipFlop("buildsMain5",player)
						elseif tonumber(gui.tableBuilds5ID.builds5c5.caption) > i then
							gui.tableBuilds5ID.builds5c5.caption = tonumber(gui.tableBuilds5ID.builds5c5.caption) - 1
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
					walls[i].storage.destroy()
					table.remove(walls,i)
					return
				else
					walls[i].chest = game.createentity {name="cursed-wall-base-" .. walls[i].level, position = event.entity.position, direction = event.entity.direction, force=game.forces.player}
					walls[i].chest.active = walls[i].active
					remover.item = true
					player.print = {"msg.aliedwall"}
				end
			end
		end
	end
	if player.character and player.getinventory(defines.inventory.playertools)[1] ~= nil and player.getinventory(defines.inventory.playertools)[1].name ~= "cursed-axe-" .. talents[2][1].now then
		removeItems.axes(player)
		player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
	end
end