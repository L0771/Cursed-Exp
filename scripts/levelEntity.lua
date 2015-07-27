module("levelEntity", package.seeall)
require("mix")

function mines(minecalled,player)
	local mine = glob.cursed[player.name].mines[minecalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (mine.exp >= mine.next) and (mine.level < talents[3][2].now + 2) then
		mine.level = mine.level + 1
		mine.exp = mix.round(mine.exp - mine.next,3)
		mine.next =(mine.level^2)*1.375
		local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
		mine.entity.destroy()	
		mine.entity = game.createentity {name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui ~= nil and gui.tableBuilds1S then
			if tonumber(gui.tableBuilds1ID.builds1c11.caption) == minecalled then
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
			mine.next = (mine.level^2)*1.375
			mine.exp = mix.round(mine.next + mine.exp,3)
			local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
			mine.entity.destroy()
			mine.entity = game.createentity {name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui ~= nil and gui.tableBuilds1S then
				if tonumber(gui.tableBuilds1ID.builds1c11.caption) == minecalled then
					gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mine.level}
				end
			end
			player.print({"msg.cursed",{"msg.regressed",mine.nick}})
		end
	end
end

function turrets(turretcalled,player)
	local turret = glob.cursed[player.name].turrets[turretcalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (turret.exp >= turret.next) and (turret.level < talents[3][4].now + 2) then
		turret.level = turret.level + 1
		turret.exp = mix.round(turret.exp - turret.next,3)
		turret.next = (turret.level^2)*1.375
		local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
		turret.entity.destroy()	
		turret.entity = game.createentity {name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
		if gui ~= nil and gui.tableBuilds2S then
			if tonumber(gui.tableBuilds2ID.builds2c11.caption) == turretcalled then
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
			turret.next = (turret.level^2)*1.375
			turret.exp = mix.round(turret.next + turret.exp,3)
			local temp ={ x = turret.entity.position.x .. "", y = turret.entity.position.y .. "", direction = turret.entity.direction .. ""}
			turret.entity.destroy()
			turret.entity = game.createentity {name="cursed-turret-"..turret.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if gui ~= nil and gui.tableBuilds2S then
				if tonumber(gui.tableBuilds2ID.builds2c11.caption) == turretcalled then
					gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets.level}
				end
			end
			player.print({"msg.cursed",{"msg.regressed",turret.nick}})
		end
	end
end

function walls(wallcalled,player)
	local wall = glob.cursed[player.name].walls[wallcalled]
	local talents = glob.cursed[player.name].talents
	local gui = glob.cursed[player.name].gui
	if (wall.exp >= wall.next) and (wall.level < talents[3][6].now + 2) then
		local fluid = 0
		if wall.storage.fluidbox[1] ~= nil and wall.storage.fluidbox[1].type == "living-mass" then
			fluid = wall.storage.fluidbox[1].amount
		end
		wall.level = wall.level + 1
		wall.exp = mix.round(wall.exp - wall.next,3)
		wall.next =  (wall.level^2)*1.375
		wall.maxmass = (10 + wall.level * 5) * 10
		local temp ={ x = wall.chest.position.x .. "", y = wall.chest.position.y .. ""}
		wall.chest.destroy()	
		wall.chest = game.createentity {name="cursed-wall-base-"..wall.level, position = { temp.x, temp.y }, force=player.force}
		temp ={ x = wall.storage.position.x .. "", y = wall.storage.position.y .. ""}
		wall.storage.destroy()
		wall.storage = game.createentity {name="cursed-wall-i1111-"..wall.level, position = { temp.x, temp.y }, force=player.force}
		if fluid > 0 then
			wall.storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
		end
		if gui ~= nil and gui.tableBuilds5S then
			if tonumber(gui.tableBuilds5ID.builds5c5.caption) == wallcalled then
				gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",wall.level}
			end
		end
		player.print({"msg.cursed",{"msg.evolved",wall.nick}})
	elseif (wall.exp < 0) and (wall.level > 1) then
		if math.abs(wall.exp) > (wall.next * 0.3) then
			down = (math.abs(wall.exp) * 10) / (wall.next * 0.3)
		else
			down = 10 + math.floor((math.abs(wall.exp) * 90) / wall.next)
			if down > 100 then down = 100 end
		end
		if math.random(100) <= down then
			local fluid = 0
			if wall.storage.fluidbox[1] ~= nil and wall.storage.fluidbox[1].type == "living-mass" then
				fluid = wall.storage.fluidbox[1].amount
			end
			wall.level = wall.level - 1
			wall.next = (wall.level^2)*1.375
			wall.maxmass = (10 + wall.level * 5) * 10
			wall.exp = mix.round(wall.next + wall.exp,3)
			local temp ={ x = wall.chest.position.x .. "", y = wall.chest.position.y .. ""}
			wall.chest.destroy()	
			wall.chest = game.createentity {name="cursed-wall-base-"..wall.level, position = { temp.x, temp.y }, force=player.force}
			temp ={ x = wall.storage.position.x .. "", y = wall.storage.position.y .. ""}
			wall.storage.destroy()	
			wall.storage = game.createentity {name="cursed-wall-i1111-"..wall.level, position = { temp.x, temp.y }, force=player.force}
			if fluid > 0 then
				wall.storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
			end
			if gui ~= nil and gui.tableBuilds5S then
				if tonumber(gui.tableBuilds5ID.builds5c5.caption) == wallcalled then
					gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",wall.level}
				end
			end
			player.print({"msg.cursed",{"msg.regressed",wall.nick}})
		end
	end
end