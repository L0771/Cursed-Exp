module("onbuiltentity", package.seeall)

function main(event, changeItems)
	if event.createdentity.name == "cursed-drill-1" then
		local player = game.getplayer(event.playerindex)
		local mine = glob.cursed[player.name].mines
		local talents = glob.cursed[player.name].talents
		local entity = event.createdentity
		local rebuild = glob.cursed[player.name].aux.rebuild
		if rebuild and rebuild.name == "mines" and rebuild.id ~= nil and mine[rebuild.id] ~= nil then
			local gui = glob.cursed[player.name].gui
			local position = entity.position
			local direction = entity.direction
			entity.destroy()
			mine[rebuild.id].entity = game.createentity{name = "cursed-drill-" .. mine[rebuild.id].level,position=position, direction = direction, force=player.force}
			mine[rebuild.id].entity.active = mine[rebuild.id].active
			game.createentity({name="flying-text", position=position, text=mine[rebuild.id].nick})
			if gui ~= nil and gui.tableBuilds1S then
				if tonumber(gui.tableBuilds1ID.builds1c11.caption) == rebuild.id then
					gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mine[rebuild.id].entity.health),175 + mine[rebuild.id].level * 25}
					gui.tableBuilds1.builds1c9.value = mine[rebuild.id].entity.health / (175 + mine[rebuild.id].level * 25)
					if gui.tableBuilds1.builds1c12 then
						gui.tableBuilds1.builds1c12.destroy()
					end
					if gui.tableBuilds1.builds1c13 then
						gui.tableBuilds1.builds1c13.destroy()
					end
				end
			end
			glob.cursed[player.name].aux.rebuild = nil
		elseif #mine < talents[3][1].now then
			mine[#mine + 1] = {entity = entity, nick = "Mine {" .. entity.position.x .. "," .. entity.position.y .. "}", exp = 0, level = 1, next = 1.375, active = true, active2 = true}
			glob.cursed[player.name].aux.rebuild = nil
		elseif rebuild and rebuild.name == "mines" and (mine[rebuild.id] == nil or rebuild.id == nil) then
			rebuild = nil
			if player.cursorstack == nil then
				player.cursorstack = {name = "cursed-drill-1", count = 1}
			else
				player.cursorstack =  {name = "cursed-drill-1", count = player.cursorstack.count + 1}
			end
			entity.destroy()
		else
			if player.cursorstack == nil then
				player.cursorstack = {name = "cursed-drill-1", count = 1}
			else
				player.cursorstack =  {name = "cursed-drill-1", count = player.cursorstack.count + 1}
			end
			entity.destroy()
		end
	elseif event.createdentity.name == "cursed-turret-1" then
		local player = game.getplayer(event.playerindex)
		local turrets = glob.cursed[player.name].turrets
		local talents = glob.cursed[player.name].talents
		if #turrets < talents[3][3].now then
			for i = 1, #turrets do
				if not turrets[i].entity.valid then
					turrets[i] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 1.375, active = true, active2 = true}	
					return
				end
			end
			turrets[#turrets + 1] = {entity = event.createdentity, nick = "Turret {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 1.375, active = true, active2 = true}	
		else
			if player.cursorstack == nil then
				player.cursorstack = {name = "cursed-turret-1", count = 1}
			else
				player.cursorstack =  {name = "cursed-turret-1", count = player.cursorstack.count + 1}
			end
			event.createdentity.destroy()
		end
	elseif event.createdentity.name == "cursed-fisher-1" then
		local player = game.getplayer(event.playerindex)
		local fishers = glob.cursed[player.name].fishers
		local talents = glob.cursed[player.name].talents
		local entity = event.createdentity
		if #fishers < talents[3][7].now then
			fishers[#fishers + 1] = {entity = entity, nick = "Fisher {" .. entity.position.x .. "," .. entity.position.y .. "}", exp = 0, level = 1, next = 2.750, active = true, active2 = true}
		else
			if player.cursorstack == nil then
				player.cursorstack = {name = "cursed-fisher-1", count = 1}
			else
				player.cursorstack =  {name = "cursed-fisher-1", count = player.cursorstack.count + 1}
			end
			entity.destroy()
		end
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
			local cant = 1
			if player.cursorstack ~= nil then
				cant = cant + player.cursorstack.count
				player.cursorstack = nil
			end
			if tank.fluidbox[1] == nil or tank.fluidbox[1].type ~= "blood" then
				tank.fluidbox[1] = {type = "blood", amount = 2.5 * cant, temperature = 5}
			else
				tank.fluidbox[1] = {type = "blood", amount = tank.fluidbox[1].amount + 2.5 * cant, temperature = 5}
			end
		else
			player.insert{name="cursed-donation",count=1}
		end
	elseif string.sub(event.createdentity.name,1,12) == "cursed-vault" then
		local player = game.getplayer(event.playerindex)
		local talents = glob.cursed[player.name].talents
		local vaultentity = glob.cursed[player.name].aux.vaultentity
		vaultentity = game.createentity {name="cursed-vault-" .. talents[5][7].now,position=event.createdentity.position, force=player.force}
		vaultentity.destructible = false
		local vault = glob.cursed[player.name].aux.vault
		if vault ~= nil then
			for i = 1, #vault do
				if pcall(function()
					if changeItems[vault[i].name] and changeItems[vault[i].name].count > 0 and vault[i].count <= changeItems[vault[i].name].max then
						vaultentity.insert({name = changeItems[vault[i].name].name, count = changeItems[vault[i].name].count * vault[i].count})
					elseif changeItems[vault[i].name] and changeItems[vault[i].name].count == 0 then
					else
						vaultentity.insert(vault[i])
					end
				end) then
				end
			end
		end
		event.createdentity.destroy()
		glob.cursed[player.name].aux.vaultentity = vaultentity
	elseif event.createdentity.name == "cursed-generator-0" then
		local player = game.getplayer(event.playerindex)
		local generators = glob.cursed.others.generators
		event.createdentity.destructible = false
		for i = 1, #generators do
			if not generators[i].accumulator.valid then
				local chest = game.createentity {name="cursed-generator", position={ x = event.createdentity.position.x, y = event.createdentity.position.y }, force=player.force}
				generators[i] = {accumulator = event.createdentity, chest = chest, rank = 0}
				return
			end
		end
		local chest = game.createentity {name="cursed-generator", position={ x = event.createdentity.position.x, y = event.createdentity.position.y }, force=player.force}
		generators[#generators + 1] = {accumulator = event.createdentity, chest = chest, rank = 0}
	elseif string.sub(event.createdentity.name,1,16) == "cursed-wall-base" then
		local player = game.getplayer(event.playerindex)
		local walls = glob.cursed[player.name].walls
		local talents = glob.cursed[player.name].talents
		local chest = event.createdentity
		if #walls < talents[3][5].now then
			local storage = game.createentity {name="cursed-wall-i1111-1", position={ x = event.createdentity.position.x, y = event.createdentity.position.y }, force=player.force}
			storage.destructible = false
			local position = { x = storage.position.x + 1, y = storage.position.y }
			local xp = game.createentity {name="cursed-wall-i0101",position= position, force=player.force}
			xp.destructible = false
			xp.active = false
			local position = { x = storage.position.x - 1, y = storage.position.y }
			local xn = game.createentity {name="cursed-wall-i0101",position=position, force=player.force}
			xn.destructible = false
			xn.active = false
			local position = { x = storage.position.x, y = storage.position.y - 1 }
			local yp = game.createentity {name="cursed-wall-i1010",position=position, force=player.force}
			yp.destructible = false
			yp.active = false
			local position = { x = storage.position.x, y = storage.position.y + 1 }
			local yn = game.createentity {name="cursed-wall-i1010",position=position, force=player.force}
			yn.destructible = false
			yn.active = false
			storage.fluidbox[1] =  {type = "living-mass", amount = 100, temperature = 40}
			walls[#walls + 1] = {chest = chest, storage = storage, sides = { wallxp = {}, wallxn = {}, wallyp = {}, wallyn = {} }, invi = { xp = xp, xn = xn, yp = yp, yn = yn }, maxmass = (10+1*5) * 10, nick = "Wall {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 1.375, active = true, active2 = true, lasthp = chest.health, gate = { xp = false, xn = false, yp = false, yn = false }}
			
			local pipesyp = game.findentitiesfiltered{area = {{math.floor(walls[#walls].storage.position.x),math.floor(walls[#walls].storage.position.y) - 2},{math.ceil(walls[#walls].storage.position.x),math.ceil(walls[#walls].storage.position.y) - 2}},type = "pipe"}
			local pipesxp = game.findentitiesfiltered{area = {{math.floor(walls[#walls].storage.position.x) + 2,math.floor(walls[#walls].storage.position.y)},{math.ceil(walls[#walls].storage.position.x) + 2,math.ceil(walls[#walls].storage.position.y)}},type = "pipe"}
			local pipesyn = game.findentitiesfiltered{area = {{math.floor(walls[#walls].storage.position.x),math.floor(walls[#walls].storage.position.y) + 2},{math.ceil(walls[#walls].storage.position.x),math.ceil(walls[#walls].storage.position.y) + 2}},type = "pipe"}
			local pipesxn = game.findentitiesfiltered{area = {{math.floor(walls[#walls].storage.position.x) - 2,math.floor(walls[#walls].storage.position.y)},{math.ceil(walls[#walls].storage.position.x) - 2,math.ceil(walls[#walls].storage.position.y)}},type = "pipe"}
			
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
						if string.sub(pipeid,13,13) == "0" then
							oldpipe.destroy()
							newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,12) .. "1" .. string.sub(pipeid,14,16),position=position, force=player.force}
						end
						newpipe[pipe[4]].health = oldhp
						if fluid > 0 then
							newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
						end
						walls[#walls].invi.yp.active = true
					elseif string.sub(pipesyp[i].name,13,17) == "i1010" then
						for j = 1, #walls do
							if pipesyp[i].equals(walls[j].invi.yn) then
								local invi = walls[j].invi.yn
								invi.active = true
								walls[#walls].invi.yp.active = true
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
						if string.sub(pipeid,14,14) == "0" then
							oldpipe.destroy()
							newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,13) .. "1" .. string.sub(pipeid,15,16),position=position, force=player.force}
						end
						newpipe[pipe[4]].health = oldhp
						if fluid > 0 then
							newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
						end
						walls[#walls].invi.xp.active = true
					elseif string.sub(pipesxp[i].name,13,17) == "i0101" then
						for j = 1, #walls do
							if pipesxp[i].equals(walls[j].invi.xn) then
								local invi = walls[j].invi.xn
								invi.active = true
								walls[#walls].invi.xp.active = true
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
						if string.sub(pipeid,15,15) == "0" then
							oldpipe.destroy()
							newpipe[pipe[4]] = game.createentity{name=string.sub(pipeid,1,14) .. "1" .. string.sub(pipeid,16,16),position=position, force=player.force}
						end
						newpipe[pipe[4]].health = oldhp
						if fluid > 0 then
							newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
						end
						walls[#walls].invi.yn.active = true
					elseif string.sub(pipesyn[i].name,13,17) == "i1010" then
						for j = 1, #walls do
							if pipesyn[i].equals(walls[j].invi.yp) then
								local invi = walls[j].invi.yp
								invi.active = true
								walls[#walls].invi.yn.active = true
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
						walls[#walls].invi.xn.active = true
					elseif string.sub(pipesxn[i].name,13,17) == "i0101" then
						for j = 1, #walls do
							if pipesxn[i].equals(walls[j].invi.xp) then
								local invi = walls[j].invi.xp
								invi.active = true
								walls[#walls].invi.xn.active = true
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
		else
			if player.cursorstack == nil then
				player.cursorstack = {name = "cursed-wall-base", count = 1}
			else
				player.cursorstack =  {name = "cursed-wall-base", count = player.cursorstack.count + 1}
			end
			chest.destroy()
		end
	end
end