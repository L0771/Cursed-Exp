module("ontick", package.seeall)
require("mix")

function main(event,wallExp)
	if remover.item ~= nil and remover.player ~= nil then
		local player = mix.getplayerbyname(remover.player)
		player.removeitem(remover.item)
		remover.item = nil
		remover.player = nil
	end
	if event.tick % 120==0 then
		for _,v in ipairs(game.players) do
			local gui = glob.cursed[v.name].gui
			if gui ~= nil and gui.tableBuilds4S then
				local num = tonumber(gui.tableBuilds4ID.builds4c8.caption)
				local bodies = glob.cursed[v.name].aux.bodies
				gui.tableBuilds4.builds4c4.caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}
				gui.tableBuilds4.builds4c5.value = bodies[num].entity.health / bodies[num].maxhealth
			end
			if v.character then
				local talents = glob.cursed[v.name].talents
				local pos = glob.cursed[v.name].aux.pos
				local distance = (util.distance(pos,v.position) / 48)
				if distance > 0 then
					if v.getitemcount("cursed-vault") > 0 and not (v.cursorstack and v.cursorstack.name == "cursed-vault") then
						v.removeitem({name="cursed-vault", count=v.getitemcount("cursed-vault")})
					end
					local tomb = glob.cursed[v.name].aux.tomb
					if tomb ~= nil and util.distance(tomb.entity.position,v.position) < 5 then
						if tomb.items ~= {} then
							local n = 1
							for i = 1, #tomb.items do
								if v.caninsert({name="cursed-stack-main",count=1}) then
									v.insert(tomb.items[n])
									table.remove(tomb.items,n)
								else
									n = n + 1
								end
							end
							if n == 1 then
								tomb.entity.destroy()
								glob.cursed[v.name].aux.tomb = nil
							else
								v.print({"msg.cursed",{"msg.mininventory"}})
							end
						else
							tomb.entity.destroy()
							glob.cursed[v.name].aux.tomb = nil
						end
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
					if #game.findentitiesfiltered({area = {{x = math.floor(v.position.x), y = math.floor(v.position.y)}, {x = math.ceil(v.position.x), y = math.ceil(v.position.y)}}, type = "transport-belt"}) == 0 then
						local stats = glob.cursed[v.name].stats
						stats.explore.exp = mix.round(stats.explore.exp + (distance * (1 + talents[1][8].now / 40 + stats.general.level*datos.resGeneral)),3)
						glob.cursed[v.name].aux.pos = v.position
						if stats.explore.exp >= stats.explore.next then
							skillUp.main(stats.explore,(((stats.explore.level + 1) * (stats.explore.level + 1)) * 0.8 + 10 ),v)
						end
						if gui ~= nil and gui.tableStats5S then
							gui.tableStats5.stat5c2.caption = {"gui.stat5c2",stats.explore.exp,stats.explore.next,100 * (talents[1][8].now / 40 + stats.general.level*datos.resGeneral)}
							gui.tableStats5.stat5c3.value = stats.explore.exp / stats.explore.next
						end
					end
					if gui ~= nil and gui.tableBuilds3S then
						local base = glob.cursed[v.name].aux.base
						local A1 = {x = base.position.x - v.character.position.x , y = base.position.y - v.character.position.y}
						local A2 = {x = 1, y = 0}
						gui.tableBuilds3.builds3c3.caption = {"gui.builds3c3", math.floor(v.character.position.x), math.floor(v.character.position.y)}
						local coseno = (A1.x * A2.x + A1.y * A2.y) / (math.sqrt(math.pow(A1.x,2) + math.pow(A1.y,2)) * math.sqrt(math.pow(A2.x,2) + math.pow(A2.y,2)))
						local seno
						if A1.y > 0 then
							seno = math.sqrt(1 - math.pow(coseno,2))
						else
							seno = -1 * math.sqrt(1 - math.pow(coseno,2))
						end
						gui.tableBuilds3CP.style.leftpadding = 94 + (coseno * 66)
						gui.tableBuilds3CP.style.toppadding = 94 + (seno * 66)
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
				local maxhealth = glob.cursed[v.name].aux.maxhealth
				local healthless = maxhealth - v.character.health
				if healthless > 0 then
					if v.getinventory(defines.inventory.playerarmor)[1] ~= nil and (string.sub(v.getinventory(defines.inventory.playerarmor)[1].name,1, 13)) == "cursed-armor-" then
						local lasthp = glob.cursed[v.name].aux.lasthp
						if lasthp > v.character.health then
							local stats = glob.cursed[v.name].stats
							local talents = glob.cursed[v.name].talents
							local gui = glob.cursed[v.name].gui
							stats.defence.exp = mix.round(stats.defence.exp + ((lasthp - v.character.health) * 0.1 * (1 + talents[1][9].now / 40 + stats.general.level*datos.resGeneral)),3)
							if stats.defence.exp >= stats.defence.next then
								skillUp.main(stats.defence,(((stats.defence.level + 1) * (stats.defence.level + 1)) * 0.8 + 10 ),v)
							end
							if gui ~= nil and gui.tableStats6S then
								gui.tableStats6.stat6c2.caption = {"gui.stat6c2",stats.defence.exp,stats.defence.next,100 * (talents[1][10].now / 40 + stats.general.level*datos.resGeneral)}
								gui.tableStats6.stat6c3.value = stats.defence.exp / stats.defence.next
							end
						end
					end
					local talents = glob.cursed[v.name].talents
					local stats = glob.cursed[v.name].stats
					local regen = math.floor( talents[5][4].now / 200 + stats.defence.level / 100 / datos.resDefence) * 3
					v.character.health = v.character.health + regen
				end
				glob.cursed[v.name].aux.lasthp = v.character.health or maxhealth
			end
		end
		for k,v in pairs(glob.cursed) do
			if k ~= "others" then
				local walls = glob.cursed[k].walls
				for i = 1, #walls do
					local inside = walls[i].chest.getinventory(defines.inventory.chest)
					local total = 0
					for j = 1, #inside do
						if inside[j] ~= nil and wallExp[inside[j].name] then
							total = total + inside[j].count * wallExp[inside[j].name]
						elseif inside[j] ~= nil then
							total = total + inside[j].count * 1
						end
					end
					walls[i].chest.getinventory(defines.inventory.chest).clear()
					
					local fluid = 0
					local massless = (10+walls[i].level*5) * 10
					
					if walls[i].storage.fluidbox[1] ~= nil and walls[i].storage.fluidbox[1].type == "living-mass" then
						massless = massless - walls[i].storage.fluidbox[1].amount
						fluid = walls[i].storage.fluidbox[1].amount
					end
					if fluid > 0 or total > 0 then
						walls[i].storage.fluidbox[1] = {type = "living-mass", amount = fluid + math.min(total,massless), temperature = 30}
					end
					local player = mix.getplayerbyname(k)
					if walls[i].active2 == true then
						local gui = glob.cursed[player.name].gui
						local talents = glob.cursed[player.name].talents
						
						local expe = mix.round((total - massless) / 10,3)
						if expe > 0 and (walls[i].level < talents[3][6].now + 2 or walls[i].exp<= walls[i].next * 1.2) then
							walls[i].exp = walls[i].exp + expe
							if walls[i].level < talents[3][6].now + 2 and walls[i].exp >= walls[i].next then
								levelEntity.walls(i,player)
							end
						end
						if gui ~= nil and gui.tableBuilds5S then
							if tonumber(gui.tableBuilds5ID.builds5c5.caption) == i then
								gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",walls[i].exp,walls[i].next}
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
							end
						end
					end
					
					local hp = walls[i].chest.health
					local healthless = ((150+walls[i].level*50) - hp)
					if healthless > 0 and walls[i].storage.fluidbox[1] ~= nil and walls[i].storage.fluidbox[1].type == "living-mass" then
						local expe = mix.round((walls[i].lasthp - hp) / 5,3)
						if expe > 0 and (walls[i].level > 1 or walls[i].exp > 0) then
							walls[i].exp = walls[i].exp - expe
							if walls[i].level > 1 and walls[i].exp <= 0 then
								levelEntity.walls(i,player)
							elseif walls[i].level == 1 and walls[i].exp < 0 then
								walls[i].exp = 0
							end
						end
					
						if healthless > walls[i].storage.fluidbox[1].amount then
							walls[i].chest.health = walls[i].chest.health + walls[i].storage.fluidbox[1].amount
							walls[i].storage.fluidbox[1] = nil
						else
							walls[i].storage.fluidbox[1] = {type = "living-mass", amount = walls[i].storage.fluidbox[1].amount - healthless, temperature = 30}
							walls[i].chest.health = (150+walls[i].level*50)
						end
						walls[i].lasthp = walls[i].chest.health
					end
					
					for pos,sides in pairs(walls[i].sides) do
						for j = 1, #sides do
							local hp = sides[j].health
							local healthless = (100 - hp)
							if healthless > 0 and sides[j].fluidbox[1] ~= nil and sides[j].fluidbox[1].type == "living-mass" then
							
								if healthless > sides[j].fluidbox[1].amount then
									sides[j].health = sides[j].health + sides[j].fluidbox[1].amount
									sides[j].fluidbox[1] = nil
								else
									sides[j].fluidbox[1] = {type = "living-mass", amount = sides[j].fluidbox[1].amount - healthless, temperature = 30}
									sides[j].health = 100
								end
							end
						end
					end
				end
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
			local steam = game.findentitiesfiltered{area = {{tanks[i].entity.position.x-32, tanks[i].entity.position.y-32}, {tanks[i].entity.position.x+32, tanks[i].entity.position.y+32}}, name="cursed-blood-steam"}
			for i=1, #steam do puddle[#puddle+1] = steam[i] end
			for _,j in ipairs(puddle) do
				for k = #blood,1 , -1 do
					if blood[k] ~= nil and blood[k].entity ~= nil and blood[k].entity.valid and j ~= nil and j.valid and j.equals(blood[k].entity) then
						blood[k].entity.setcommand({type=defines.command.gotolocation, destination = tanks[i].entity.position, distraction=defines.distraction.none })
						if util.distance(j.position,tanks[i].entity.position) < 5 then
							if tanks[i].entity.fluidbox[1] == nil then
								tanks[i].entity.fluidbox[1] = {type = "blood", amount = blood[k].total, temperature = 5}
							else
								tanks[i].entity.fluidbox[1] = {type = "blood", amount = tanks[i].entity.fluidbox[1].amount + blood[k].total, temperature = 5}
							end
							if blood[k] and blood[k].entity and blood[k].entity.valid then
								blood[k].entity.destroy()
							end
							table.remove(blood,k)
						end
					elseif blood[k] == nil or blood[k].entity == nil or not (blood[k].entity.valid) then
						if blood[k] and blood[k].entity and blood[k].entity.valid then
							blood[k].entity.destroy()
						end
						table.remove(blood,k)
					end
				end
			end
		end
		for _,v in ipairs(game.players) do
			local mines = glob.cursed[v.name].mines
			local talents = glob.cursed[v.name].talents
			local stats = glob.cursed[v.name].stats
			local gui = glob.cursed[v.name].gui
			for i = 1, #mines do
				if mines[i].active2 == true and mines[i].entity and mines[i].entity.valid then
					if mines[i].level <= talents[3][2].now + 2 and game.getpollution(mines[i].entity.position) >= mines[i].level * 5 + 15 and mines[i].entity.energy > 0 then
						if not (mines[i].level == talents[3][2].now + 2 and mines[i].exp >= mines[i].next * 1.2) then
							mines[i].exp = mix.round(mines[i].exp + 0.05 * (1 + talents[3][2].now * 0.4 + (stats.mining.level * 0.02) ),3)
							if mines[i].exp >= mines[i].next then
								levelEntity.mines(i,v)
							end
							if gui ~= nil and gui.tableBuilds1S then
								if tonumber(gui.tableBuilds1ID.builds1c11.caption) == i then
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
							mines[i].exp = mix.round(mines[i].exp - 0.1 * (1 + (talents[3][2].now * 0.4) + (stats.mining.level * 0.02) ),3)
							if mines[i].exp < 0 and mines[i].level ~= 1 then
								levelEntity.mines(i,v)
							end
							if gui ~= nil and gui.tableBuilds1S then
								if tonumber(gui.tableBuilds1ID.builds1c11.caption) == i then
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
					if mines[i].entity and mines[i].entity.valid then
						local healthless = ((mines[i].level * 25) + 175) - (mines[i].entity.health)
						if healthless > 0 then
							local regen = 3 * mines[i].level
							mines[i].entity.health = mines[i].entity.health + regen
							if gui ~= nil and gui.tableBuilds1S then
								if tonumber(gui.tableBuilds1ID.builds1c11.caption) == i then
									gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mines[i].entity.health),175 + mines[i].level * 25}
									gui.tableBuilds1.builds1c9.value = mines[i].entity.health / (175 + mines[i].level * 25)
								end
							end
						end
					end
				end
				local turrets = glob.cursed[k].turrets
				for i = 1, #turrets do
					local healthless = ((turrets[i].level * 25) + 175) - (turrets[i].entity.health)
					if healthless > 0 then
						local regen = 3 * turrets[i].level
						turrets[i].entity.health = turrets[i].entity.health + regen
						if gui ~= nil and gui.tableBuilds2S then
							if tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
								gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",math.ceil(turrets[i].entity.health),175 + turrets[i].level * 25}
								gui.tableBuilds2.builds2c9.value = turrets[i].entity.health / (175 + turrets[i].level * 25)
							end
						end
					end
				end
			end
		end
	end
	if event.tick % 900 == 0 then 
		local blood = glob.cursed.others.blood
		for i = #blood, 1, -1 do
			if blood[i] and blood[i].entity then
				if blood[i].time <= 0 then
					if blood[i].entity and blood[i].entity.valid then
						if blood[i].entity.name	and blood[i].entity.name == "cursed-blood" then -- tira error
							local pos = blood[i].entity.position
							blood[i].entity.destroy()
							blood[i].entity = game.createentity {name="cursed-blood-steam",position=pos, force=game.forces.neutral}
							blood[i].entity.destructible = false
							blood[i].total = blood[i].total * 0.75
							blood[i].time = 1
						else
							if blood[i] and blood[i].entity and blood[i].entity.valid then
								blood[i].entity.destroy()
							end
							table.remove(blood,i)
						end
					else
						if blood[i] and blood[i].entity and blood[i].entity.valid then
							blood[i].entity.destroy()
						end
						table.remove(blood,i)
					end
				else
					blood[i].time = blood[i].time - 1
				end
			else
				if blood[i] and blood[i].entity and blood[i].entity.valid then
					blood[i].entity.destroy()
				end
				table.remove(blood,i)
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
						turrets[i].exp = mix.round(turrets[i].exp - (turrets[i].next / 10),3)
						if turrets[i].exp < 0 and turrets[i].level ~= 1 then
							levelEntity.turrets(i,v)
						end
						if gui ~= nil and gui.tableBuilds2S then
							if tonumber(gui.tableBuilds2ID.builds2c11.caption) == i then
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
			local tomb = glob.cursed[v.name].aux.tomb
			if tomb ~= nil then
				if tomb.time == 0 or tomb.items == {} then
					if tomb.entity then
						if tomb.time == 0 then
							v.print({"msg.cursed",{"msg.tomb-destroyed"}})
						end
						tomb.entity.destroy()
					end
					glob.cursed[v.name].aux.tomb = nil
				else
					tomb.time = tomb.time - 1
					glob.cursed[v.name].aux.tomb = tomb
					v.print({"msg.cursed",{"msg.tomb-time",tomb.time + 1}})
				end
			end
		end
	end
	if event.tick % 12500 == 0 and #game.players > 0 then
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