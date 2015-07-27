require("defines")
require("util")
require("scripts/files")

--(General)-talent,Mining-picar, Farming-talar, Crafting-crear, Explore-correr, Attack1-bow, attack2-sword, defense-armadura
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
	local maxTurret = 0
	local maxWalls = 0
	local maxGenerator = 0
	local maxTalentPart = 150
	local maxRegen = 200
	local maxDmgAura = 200
	
	local runday
	
	--local cursed
	
--			cursed.skills.mining.bonus = (cursed.skills.mining.level / 8)
--			cursed.skills.farming.bonus = (cursed.skills.farming.level / 8)
--			cursed.skills.crafting.bonus = ((cursed.skills.crafting.level - 1) / 16)
--			cursed.skills.explore.bonus = ((cursed.skills.explore.level - 1) / 32) * 100
--			cursed.skills.range.bonus = (cursed.skills.range.level / 8)
--			cursed.skills.melee.bonus = (cursed.skills.melee.level / 8)
--			cursed.skills.defense.next = ((cursed.skills.defense.level * cursed.skills.defense.level) * 0.8 + 10)
	
game.oninit(function()

local allInOne = {
	["name"] = "cursed-tree",
	["states"] = { "cursed-tree-00", "cursed-tree-01", "cursed-tree-02", "cursed-tree-03", "cursed-tree-04" },
	["output"] = {"cursed-heart", 1},
	["efficiency"] = { ["grass"] = 0.50, ["grass-medium"] = 0.50, ["grass-dry"] = 0.45, ["dirt"] = 0.35, ["dirt-dark"] = 0.55, ["hills"] = 0.25, ["sand"] = 0.75, ["sand-dark"] = 0.75, ["other"] = 0 },
	["basicGrowingTime"] = 12500,
	["randomGrowingTime"] = 25000,
	["fertilizerBoost"] = 1,
	}
	if game.itemprototypes.charcoal then
		if (remote.interfaces.treefarm) and (remote.interfaces.treefarm.addSeed) then
			remote.call("treefarm", "addSeed", allInOne)
		end
	end
	
	cursed = {}
	glob.cursed = {}
	runday = true
	
--game.player.print(serpent.block(cursed.skills))
--game.findenemyunits(game.player.character.position, 100)
--game.player.clearconsole()
--game.player.gui.top.add{name="progressbar", type="progressbar", size=100}
end)
game.onload(function()
	if game.player.name == "" or game.player.name == "SP" then
		single = true
	else
		single = false
	end
	cursed = {}
	for _,v in ipairs(game.players) do
		if v.name == game.player.name or v.name == "SP" then
			cursed[v.name] = {}
			cursed[v.name].skills = glob.cursed[v.name].skills
			cursed[v.name].talents = glob.cursed[v.name].talents
			cursed[v.name].blood = glob.cursed[v.name].blood
			cursed[v.name].tanks = glob.cursed[v.name].tanks
			cursed[v.name].mines = glob.cursed[v.name].mines
			cursed[v.name].aux = {}
			cursed[v.name].aux.pos = game.player.position
			cursed[v.name].aux.iscrafting = false
			if game.player.character then
				cursed[v.name].aux.lasthp = game.player.character.health
			else
				cursed[v.name].aux.lasthp = 0
			end
			cursed[v.name].aux.donations = glob.cursed[v.name].donations
			cursed[v.name].aux.arrows = glob.cursed[v.name].arrows
		end
		glob.cursed[v.name] = {}
	end
	remote.call("cursed","resetgui")
end)
game.onsave(function()
	for i = 1, #game.players do
		glob.cursed[game.players[i].name].skills = cursed[game.players[i].name].skills
		glob.cursed[game.players[i].name].talents = cursed[game.players[i].name].talents
		glob.cursed[game.players[i].name].blood = cursed[game.players[i].name].blood
		glob.cursed[game.players[i].name].tanks = cursed[game.players[i].name].tanks
		glob.cursed[game.players[i].name].mines = cursed[game.players[i].name].mines
		glob.cursed[game.players[i].name].donations = cursed[game.players[i].name].aux.donations
		glob.cursed[game.players[i].name].arrows = cursed[game.players[i].name].aux.arrows
			remote.call("cursed","resetgui","destroy")
	end
end)


game.onevent(defines.events.onplayercreated, function(event)
-- game.player.print("game.onplayercreated")
	if game.player.name == "" then
		single = true
	else
		single = false
	end
	if single == true then
		game.player.name = "SP"
	end	
	
	for i = 1, 3 do
		if game.player.getinventory(defines.inventory.playerguns)[i] ~= nil then
			game.player.getinventory(defines.inventory.playerguns).remove(game.player.getinventory(defines.inventory.playerguns)[i])
		end
	end
	for i = 1, 3 do
		if game.player.getinventory(defines.inventory.playerammo)[i] ~= nil then
			game.player.getinventory(defines.inventory.playerammo).remove(game.player.getinventory(defines.inventory.playerammo)[i])
		end
	end
	game.player.insert({name="cursed-weapon1-1",count=1})
	game.player.insert({name="cursed-ammo1-1",count=10})
	
	glob.cursed[game.player.name] = {}
	cursed[game.player.name] = {}
	cursed[game.player.name].blood = {}
	cursed[game.player.name].tanks = {}
	cursed[game.player.name].aux = {}
	cursed[game.player.name].aux.pos = game.player.position
	cursed[game.player.name].aux.iscrafting = false
	cursed[game.player.name].aux.lasthp = game.player.character.health
	cursed[game.player.name].aux.donations = 1
	cursed[game.player.name].aux.arrows = 1
	
	remote.call("cursed","importstats")
	remote.call("cursed","resettalents")
	remote.call("cursed","resetgui")
	game.player.force.technologies["arrow-damage-1"].researched = true
	game.player.force.technologies["arrow-damage-2"].enabled = false
	
	
	-- game.player.insert{name="raw-wood",count=5}
	-- game.player.insert{name="stone",count=20}
	-- game.player.insert{name="cursed-heart",count=5}
	-- game.player.insert{name="cursed-turret-1",count=5}
	-- game.player.insert{name="cursed-blood-tank-1",count=5}
	-- game.player.insert({name="cursed-drill-1",count=5})
	-- game.player.insert({name="cursed-talent-1",count=10})
	-- game.player.insert({name="cursed-talent-2",count=300})
	-- game.player.insert({name="cursed-talent-3",count=10})
	-- game.player.insert({name="cursed-talent-4",count=100})
	-- game.player.insert({name="cursed-talent-5",count=400})
	-- game.player.insert({name="cursed-talent-6",count=10})
	
end)

game.onevent(defines.events.onentitydied, function(event)
	if single == true then
		game.player.name = "SP"
	end	
	if event.entity.type == "mining-drill" and (string.sub(event.entity.name,1,7)) == "cursed-" then
		local mines = cursed[game.player.name].mines
		for i = 1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				if cursed[game.player.name].gui.tableBuilds1S then
					if cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
						guiFlipFlop("buildsMain1")
					end
				end
				game.player.print(mines[i].nick .. " has been destroyed")
				table.remove(mines,i)
				--mines[i] = nil
				cursed[game.player.name].talents[3][1].now = cursed[game.player.name].talents[3][1].now - 1
				if cursed[game.player.name].gui.tableTalents3S then
					cursed[game.player.name].gui.tableTalents3.talent3c1.caption = "Buy mine (" .. cursed[game.player.name].talents[3][1].now .. "/" .. cursed[game.player.name].talents[3][1].max .. ")"
				end
			end
		end
	elseif event.entity.force.name == "enemy" then
	-- if game.player.force.ischunkcharted(game.player.position) == false then
	-- game.player.print("es false")
	-- end
		if --[[game.player.force.ischunkcharted(event.entity.position) == true and]] #game.findentitiesfiltered{area = {{event.entity.position.x-16, event.entity.position.y-16}, {event.entity.position.x+16, event.entity.position.y+16}}, name="cursed-blood"} < 15 then
	--game.player.print("entra por lo menos")
			local blood = cursed[game.player.name].blood
			for i = 1, #blood do
				if blood[i] == nil or blood[i].entity == nil then
					blood[i] = {}
					blood[i].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
					blood[i].total = game.entityprototypes[event.entity.name].maxhealth / 20
					blood[i].time = 5
					return
				end
			end
			blood[#blood + 1] = {}
			blood[#blood].entity = game.createentity{name="cursed-blood",position=event.entity.position, force=game.forces.neutral}
			blood[#blood].total = game.entityprototypes[event.entity.name].maxhealth / 20
			blood[#blood].time = 5
		end
		for i = 1, 3 do
			if game.player.getinventory(defines.inventory.playerguns)[i] ~= nil then
				local inv = game.player.getinventory(defines.inventory.playerguns)[i]
				if (string.sub(inv.name,1, 15)) == "cursed-weapon1-" then 
					cursed[game.player.name].skills.range.exp = cursed[game.player.name].skills.range.exp + (game.entityprototypes[event.entity.name].maxhealth * 0.01 * (1 + cursed[game.player.name].talents[1][9].now / 40 + cursed[game.player.name].skills.general.level / 40))
					if cursed[game.player.name].skills.range.exp >= cursed[game.player.name].skills.range.next then
						remote.call("cursed","showrange")
					end
					if cursed[game.player.name].gui.tableStats7S then
						cursed[game.player.name].gui.tableStats7.stat7c2.caption = "Experience: " .. cursed[game.player.name].skills.range.exp .. " / " .. cursed[game.player.name].skills.range.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][9].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
						cursed[game.player.name].gui.tableStats7.stat7c3.value = cursed[game.player.name].skills.range.exp / cursed[game.player.name].skills.range.next
					end
				end
			end
		end
	elseif event.entity.name == "cursed-blood" then
		local blood = cursed[game.player.name].blood
		for i = 1, #blood do
			if blood[i] ~= nil and event.entity.equals(blood[i].entity) then
				blood[i] = nil
			end
		end
	end
end)

game.onevent(defines.events.onplayercrafteditem, function(event)
	if event.itemstack.name == "cursed-donation" then
		donations = cursed[game.player.name].aux.donations
		if donations > 0 then
			if game.player.character.health > 50 then
				game.player.character.health = game.player.character.health - 50
				cursed[game.player.name].aux.lasthp = game.player.character.health
				donations = donations - 1
			else
				game.player.removeitem(event.itemstack)
				game.player.print("Need 50 health for make a blood donation")
			end
		else
			game.player.removeitem(event.itemstack)
			game.player.print("You can't donate more blood today")
		end
	elseif event.itemstack.name == "cursed-ammo1-1" then
		arrows = cursed[game.player.name].aux.arrows
		if arrows > 0 then
			if game.player.character.health > 25 then
				game.player.character.health = game.player.character.health - 25
				cursed[game.player.name].aux.lasthp = game.player.character.health
				arrows = arrows - 1
			else
				game.player.removeitem(event.itemstack)
				game.player.print("Need 25 health for make arrows")
			end
		else
			game.player.removeitem(event.itemstack)
			game.player.print("You can't craft more arrows today")
		end
	end
end)

game.onevent(defines.events.onbuiltentity, function(event)
	if single == true then
		game.player.name = "SP"
	end	
	if event.createdentity.name == "cursed-drill-1" then
		local mine = cursed[game.player.name].mines
		for i = 1, #mine do
			if not mine[i].entity.valid then
				mine[i] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
				return
			end
		end
		mine[#mine + 1] = {entity = event.createdentity, nick = "Mine {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}", exp = 0, level = 1, next = 2}	
	elseif event.createdentity.name == "cursed-blood-tank-1" then
		local tanks = cursed[game.player.name].tanks
		for i = 1, #tanks do
			if not tanks[i].entity.valid then
				tanks[i] = {entity = event.createdentity, nick = "Tank {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}"}	
				return
			end
		end
		tanks[#tanks + 1] = {entity = event.createdentity, nick = "Tank {" .. event.createdentity.position.x .. "," .. event.createdentity.position.y .. "}"}
	elseif event.createdentity.name == "cursed-donation" then
		event.createdentity.destroy()
		local tank = game.player.selected
		if tank ~= nil and tank.name == "cursed-blood-tank-1" then
			if tank.fluidbox[1] == nil or tank.fluidbox[1].type ~= "blood" then
				tank.fluidbox[1] = {type = "blood", amount = 2.5, temperature = 5}
			else
				tank.fluidbox[1] = {type = "blood", amount = tank.fluidbox[1].amount + 2.5, temperature = 5}
			end
		else
			game.player.insert{name="cursed-donation",count=1}
		end
	end
end)

game.onevent(defines.events.onpreplayermineditem, function(event)
	if single == true then
		game.player.name = "SP"
	end
	if (game.player.getinventory(defines.inventory.playertools).getitemcount("cursed-axe-"..cursed[game.player.name].talents[2][1].now) >= 1)  then
		if event.entity.type == "tree" then
			cursed[game.player.name].skills.farming.exp = cursed[game.player.name].skills.farming.exp + (1 * (1 + cursed[game.player.name].talents[1][6].now / 40 + cursed[game.player.name].skills.general.level / 40)) -- (mining_time * hardness)
			if cursed[game.player.name].skills.farming.exp >= cursed[game.player.name].skills.farming.next then
				remote.call("cursed","showfarming")
			end
			if cursed[game.player.name].gui.tableStats3S then
				cursed[game.player.name].gui.tableStats3.stat3c2.caption = "Experience: " .. cursed[game.player.name].skills.farming.exp .. " / " .. cursed[game.player.name].skills.farming.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][6].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
				cursed[game.player.name].gui.tableStats3.stat3c3.value = cursed[game.player.name].skills.farming.exp / cursed[game.player.name].skills.farming.next
			end
		elseif event.entity.type == "resource" then
			cursed[game.player.name].skills.mining.exp = cursed[game.player.name].skills.mining.exp + (0.75 * (1 + cursed[game.player.name].talents[1][5].now / 40 + cursed[game.player.name].skills.general.level / 40))-- (mining_time * hardness)
			if cursed[game.player.name].skills.mining.exp >= cursed[game.player.name].skills.mining.next then
				remote.call("cursed","showmining")
			end
			if cursed[game.player.name].gui.tableStats2S then
				cursed[game.player.name].gui.tableStats2.stat2c2.caption = "Experience: " .. cursed[game.player.name].skills.mining.exp .. " / " .. cursed[game.player.name].skills.mining.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][5].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
				cursed[game.player.name].gui.tableStats2.stat2c3.value = cursed[game.player.name].skills.mining.exp / cursed[game.player.name].skills.mining.next
			end
		end
	end
	if event.entity.type == "mining-drill" then
		local mines = cursed[game.player.name].mines
		for i=1, #mines do
			if mines[i] ~= nil and mines[i].entity ~= nil and event.entity.equals(mines[i].entity) then
				if cursed[game.player.name].gui.tableBuilds1S then
					if cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
						guiFlipFlop("buildsMain1")
					end
				end
				table.remove(mines,i)
				--mines[i] = nil
			end
		end
	elseif event.entity.name == "cursed-blood-tank-1" then
		local tanks = cursed[game.player.name].tanks
		for i=1, #tanks do
			if tanks[i].entity.valid and event.entity.equals(tanks[i].entity) then
					tanks[i] = nil
			end
		end
	end
end)

game.onevent(defines.events.ontick, function(event)
	if #game.players >= 1 then
		if game.tick%30==0 then
			if single == true then
				game.player.name = "SP"
			end
			if game.player.selected == nil then
				game.player.force.manualminingspeedmodifier = 1
			else
				if game.player.selected.type == "resource" then
					game.player.force.manualminingspeedmodifier = 1 + (cursed[game.player.name].skills.mining.level / 16)
				elseif game.player.selected.type == "tree" then
					game.player.force.manualminingspeedmodifier = 1 + (cursed[game.player.name].skills.farming.level / 8)
				else
					game.player.force.manualminingspeedmodifier = 1
				end
			end
			local healthless = (game.entityprototypes[game.player.character.name].maxhealth - game.player.character.health)
			if healthless > 0 then
				local regen = 0.005 * cursed[game.player.name].talents[5][4].now
				if healthless <= regen then
					game.player.character.health = game.player.character.health + healthless
				else
					game.player.character.health = game.player.character.health + regen
				end
			end
		end
		if event.tick%60==0 then
			if single == true then
				game.player.name = "SP"
			end
			local distance = (util.distance(cursed[game.player.name].aux.pos,game.player.position) / 48)
			if distance > 0 then
				cursed[game.player.name].skills.explore.exp = cursed[game.player.name].skills.explore.exp + (distance * (1 + cursed[game.player.name].talents[1][8].now / 40 + cursed[game.player.name].skills.general.level / 40))
				cursed[game.player.name].aux.pos = game.player.position
				if cursed[game.player.name].skills.explore.exp >= cursed[game.player.name].skills.explore.next then
					remote.call("cursed","showexplore")
				end
				if cursed[game.player.name].gui.tableStats5S then
					cursed[game.player.name].gui.tableStats5.stat5c2.caption = "Experience: " .. cursed[game.player.name].skills.explore.exp .. " / " .. cursed[game.player.name].skills.explore.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][8].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
					cursed[game.player.name].gui.tableStats5.stat5c3.value = cursed[game.player.name].skills.explore.exp / cursed[game.player.name].skills.explore.next
				end
			end
			
			if game.player.craftingqueuesize == 0 then
				cursed[game.player.name].aux.iscrafting = false
			end
			if cursed[game.player.name].aux.iscrafting then
				cursed[game.player.name].skills.crafting.exp = cursed[game.player.name].skills.crafting.exp + ( 0.1 * (1 + cursed[game.player.name].talents[1][7].now / 40 + cursed[game.player.name].skills.general.level / 40))
				if cursed[game.player.name].skills.crafting.exp >= cursed[game.player.name].skills.crafting.next then
					remote.call("cursed","showcrafting")
				end
				if cursed[game.player.name].gui.tableStats4S then
					cursed[game.player.name].gui.tableStats4.stat4c2.caption = "Experience: " .. cursed[game.player.name].skills.crafting.exp .. " / " .. cursed[game.player.name].skills.crafting.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][7].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
					cursed[game.player.name].gui.tableStats4.stat4c3.value = cursed[game.player.name].skills.crafting.exp / cursed[game.player.name].skills.crafting.next
				end
			end
			if game.player.craftingqueuesize > 0 then
				cursed[game.player.name].aux.iscrafting = true
			end
			if game.player.character.health < cursed[game.player.name].aux.lasthp then
				if (string.sub(game.player.getinventory(defines.inventory.playerarmor)[1].name,1, 13)) == "cursed-armor-" then 			
					cursed[game.player.name].skills.defense.exp = cursed[game.player.name].skills.defense.exp + ((cursed[game.player.name].aux.lasthp - game.player.character.health) * 0.1 * (1 + cursed[game.player.name].talents[1][9].now / 40 + cursed[game.player.name].skills.general.level / 40))
					if cursed[game.player.name].skills.defense.exp >= cursed[game.player.name].skills.defense.next then
						remote.call("cursed","showdefense")
					end
					if cursed[game.player.name].gui.tableStats6S then
						cursed[game.player.name].gui.tableStats6.stat6c2.caption = "Experience: " .. cursed[game.player.name].skills.defense.exp .. " / " .. cursed[game.player.name].skills.defense.next .. " (+" .. 100 * (cursed[game.player.name].talents[1][10].now / 40 + cursed[game.player.name].skills.general.level / 40) .. "%)"
						cursed[game.player.name].gui.tableStats6.stat6c3.value = cursed[game.player.name].skills.defense.exp / cursed[game.player.name].skills.defense.next
					end
				end
			end
			cursed[game.player.name].aux.lasthp = game.player.character.health
			for _,v in ipairs(game.findenemyunits(game.player.character.position, cursed[game.player.name].talents[5][6].now * 0.125 + 7)) do
				v.damage( cursed[game.player.name].talents[5][6].now * 0.025, game.player.force )
			end
		end
		if game.tick%300 == 0 then
			if single == true then
				game.player.name = "SP"
			end	
			local tanks = cursed[game.player.name].tanks
			for i = 1, #tanks do
				if tanks[i].entity.fluidbox[1] ~= nil and tanks[i].entity.fluidbox[1].type ~= "blood" then
					tanks[i].entity.fluidbox[1] = nil
				end
				local blood = cursed[game.player.name].blood
				for _,j in ipairs(game.findentitiesfiltered{area = {{tanks[i].entity.position.x-32, tanks[i].entity.position.y-32}, {tanks[i].entity.position.x+32, tanks[i].entity.position.y+32}}, name="cursed-blood"}) do
					for k = 1, #blood do
						if blood[k] ~= nil and blood[k].entity ~= nil and j.equals(blood[k].entity) then
							blood[k].entity.setcommand({type=defines.command.gotolocation, destination = tanks[i].entity.position ,distraction=defines.distraction.none })
							if util.distance(j.position,tanks[i].entity.position) < 4 then
								if tanks[i].entity.fluidbox[1] == nil then
									tanks[i].entity.fluidbox[1] = {type = "blood", amount = blood[k].total, temperature = 5}
								else
									tanks[i].entity.fluidbox[1] = {type = "blood", amount = tanks[i].entity.fluidbox[1].amount + blood[k].total, temperature = 5}
								end
								blood[k].entity.destroy()
								blood[k] = nil
							end
						end
					end
				end
			end
			local mines = cursed[game.player.name].mines
			for i = 1, #mines do
				if mines[i].level <= cursed[game.player.name].talents[3][2].now + 2 and game.getpollution(mines[i].entity.position) >= mines[i].level * 5 + 15 and mines[i].entity.energy > 0 then
					if not (mines[i].level == cursed[game.player.name].talents[3][2].now + 2 and mines[i].exp >= mines[i].next * 1.2) then
						mines[i].exp = mines[i].exp + 0.05
						if mines[i].exp >= mines[i].next then
							levelmines(i)					
						end
						if cursed[game.player.name].gui.tableBuilds1S then
							if cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
								cursed[game.player.name].gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[i].exp .. "/" .. mines[i].next
								cursed[game.player.name].gui.tableBuilds1.builds1c6.value = mines[i].exp / mines[i].next
							end
						end
					end
				else
					if not (mines[i].level == 1 and mines[i].exp <= 0) then
						mines[i].exp = mines[i].exp - 0.1
						if mines[i].exp < 0 and mines[i].level ~= 1 then
							levelmines(i)
						end
						if cursed[game.player.name].gui.tableBuilds1S then
							if cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
								cursed[game.player.name].gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[i].exp .. "/" .. mines[i].next
								if mines[i].exp > 0 then 
									cursed[game.player.name].gui.tableBuilds1.builds1c6.value = mines[i].exp / mines[i].next
								else
									cursed[game.player.name].gui.tableBuilds1.builds1c6.value = 0
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
		end
		if event.tick%3600 == 0 then
			if single == true then
				game.player.name = "SP"
			end	
			local blood = cursed[game.player.name].blood
			for i = 1, #blood do
				if blood[i] ~= nil then
					if blood[i].time == 0 then
						blood[i].entity.destroy()
						blood[i] = nil
					end
					if blood[i] ~= nil then
						if blood[i].time ~= nil then
							blood[i].time = blood[i].time - 1
						else
							if blood[i].entity ~= nil then
								blood[i].entity.destroy()
							end
							blood[i] = nil
						end
					end
				end
			end
		end
		if event.tick%12500 == 0 then --formattime(ticks)
			if cursed[game.player.name].aux.donations < 4 then
				cursed[game.player.name].aux.donations = cursed[game.player.name].aux.donations + 1
			end
			if cursed[game.player.name].aux.arrows < 4 then
				cursed[game.player.name].aux.arrows = cursed[game.player.name].aux.arrows + 1
			end
			if single == true then
				game.player.name = "SP"
			end	
			if runday then
				if (game.darkness <= 0.01) and (cursed[game.player.name].talents[1][1].now >= 1) then
					game.freezedaytime(true)
					runday = false
					cursed[game.player.name].talents[1][1].now = cursed[game.player.name].talents[1][1].now - 1
					game.player.print("Cursed: 24hs day has started")
					if cursed[game.player.name].talents[1][1].now == 0 then
						cursed[game.player.name].talents[1][2].max = 7
					end
					if cursed[game.player.name].gui.tableTalents1S then
						cursed[game.player.name].gui.tableTalents1.talent1c1.caption = "24hs day (" .. cursed[game.player.name].talents[1][1].now .. "/" .. cursed[game.player.name].talents[1][1].max .. ")"
						cursed[game.player.name].gui.tableTalents1.talent1c2.caption = "24hs night (" .. cursed[game.player.name].talents[1][2].now .. "/" .. cursed[game.player.name].talents[1][2].max .. ")"
					end
				elseif (game.darkness > 0.85) and (cursed[game.player.name].talents[1][2].now >= 1) then
					game.freezedaytime(true)
					runday = false
					cursed[game.player.name].aux.recentfreezedaytime = 50
					cursed[game.player.name].talents[1][2].now = cursed[game.player.name].talents[1][2].now - 1
					game.player.print("Cursed: 24hs night has started")
					if cursed[game.player.name].talents[1][2].now == 0 then
						cursed[game.player.name].talents[1][1].max = 7
					end
					if cursed[game.player.name].gui.tableTalents1S then
						cursed[game.player.name].gui.tableTalents1.talent1c1.caption = "24hs day (" .. cursed[game.player.name].talents[1][1].now .. "/" .. cursed[game.player.name].talents[1][1].max .. ")"
						cursed[game.player.name].gui.tableTalents1.talent1c2.caption = "24hs night (" .. cursed[game.player.name].talents[1][2].now .. "/" .. cursed[game.player.name].talents[1][2].max .. ")"
					end
				else
					game.freezedaytime(false)
				end
			else
				runday = true
			end
		end
	end
end)

game.onevent(defines.events.onguiclick, function(event)
	local talents = cursed[game.player.name].talents
	local gui = cursed[game.player.name].gui
	if single == true then
		game.player.name = "SP"
	end	
	if event.element.name == "talentsMain" then
		guiFlipFlop("talentsMain")
	elseif event.element.name == "statsMain" then
		guiFlipFlop("statsMain")
	elseif event.element.name == "buildsMain" then
		guiFlipFlop("buildsMain")
	elseif event.element.name == "talentsMain1" then
		guiFlipFlop("talentsMain1")
	elseif event.element.name == "talentsMain2" then
		guiFlipFlop("talentsMain2")
	elseif event.element.name == "talentsMain3" then
		guiFlipFlop("talentsMain3")
	elseif event.element.name == "talentsMain4" then
		guiFlipFlop("talentsMain4")
	elseif event.element.name == "talentsMain5" then
		guiFlipFlop("talentsMain5")
	elseif event.element.name == "talentsMain6" then
		guiFlipFlop("talentsMain6")
	elseif event.element.name == "statsMain1" then
		guiFlipFlop("statsMain1")
	elseif event.element.name == "statsMain2" then
		guiFlipFlop("statsMain2")
	elseif event.element.name == "statsMain3" then
		guiFlipFlop("statsMain3")
	elseif event.element.name == "statsMain4" then
		guiFlipFlop("statsMain4")
	elseif event.element.name == "statsMain5" then
		guiFlipFlop("statsMain5")
	elseif event.element.name == "statsMain6" then
		guiFlipFlop("statsMain6")
	elseif event.element.name == "statsMain7" then
		guiFlipFlop("statsMain7")
	elseif event.element.name == "statsMain8" then
		guiFlipFlop("statsMain8")
	elseif event.element.name == "buildsMain1" then
		local mines = cursed[game.player.name].mines
		if #mines ~= 0 or gui.tableBuilds1S then
			local num = 0
			for i = 1, #mines do
				if mines[i] ~= nil and mines[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			if num ~= 0 or gui.tableBuilds1S then
				guiFlipFlop("buildsMain1")
			else
				game.player.print("Need minimum one mine")
			end
		else
			game.player.print("Need minimum one mine")
		end
	elseif event.element.name == "talent1c1" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][1].now < talents[1][1].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][1].now = talents[1][1].now + 1
				talents[1][2].max = 0
				gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
				gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
			end
		end
	elseif event.element.name == "talent1c2" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][2].now < talents[1][2].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][2].now = talents[1][2].now + 1
				talents[1][1].max = 0
				gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
				gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
			end
		end
	elseif event.element.name == "talent1c5" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][5].now < talents[1][5].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][5].now = talents[1][5].now + 1
				gui.tableTalents1.talent1c5.caption = "Mining bonus (" .. talents[1][5].now .. "/" .. talents[1][5].max .. ")"
			end
		end
	elseif event.element.name == "talent1c6" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][6].now < talents[1][6].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][6].now = talents[1][6].now + 1
				gui.tableTalents1.talent1c6.caption = "Farming bonus (" .. talents[1][6].now .. "/" .. talents[1][6].max .. ")"
			end
		end
	elseif event.element.name == "talent1c7" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][7].now < talents[1][7].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][7].now = talents[1][7].now + 1
				gui.tableTalents1.talent1c7.caption = "Crafting bonus (" .. talents[1][7].now .. "/" .. talents[1][7].max .. ")"
			end
		end
	elseif event.element.name == "talent1c8" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][8].now < talents[1][8].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][8].now = talents[1][8].now + 1
				gui.tableTalents1.talent1c8.caption = "Explore bonus (" .. talents[1][8].now .. "/" .. talents[1][8].max .. ")"
			end
		end
	elseif event.element.name == "talent1c9" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][9].now < talents[1][9].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][9].now = talents[1][9].now + 1
				gui.tableTalents1.talent1c9.caption = "Attack bonus (" .. talents[1][9].now .. "/" .. talents[1][9].max .. ")"
			end
		end
	elseif event.element.name == "talent1c10" then
		if (game.player.getitemcount("cursed-talent-1") >= 1) then
			if (talents[1][10].now < talents[1][10].max) then
				game.player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")"
				talents[1][10].now = talents[1][10].now + 1
				gui.tableTalents1.talent1c10.caption = "Defense bonus (" .. talents[1][10].now .. "/" .. talents[1][10].max .. ")"
			end
		end
	elseif event.element.name == "talent2c1" then
		if (game.player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][1].now < talents[2][1].max) then
				game.player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. game.player.getitemcount("cursed-talent-2") .. ")"
				talents[2][1].now = talents[2][1].now + 1
				remote.call("cursed","toolupgrade")
				gui.tableTalents2.talent2c1.caption = "Update tool (" .. talents[2][1].now .. "/" .. talents[2][1].max .. ")"
			end
		end
	elseif event.element.name == "talent2c2" then
		if (game.player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][2].now < talents[2][2].max) then
				game.player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. game.player.getitemcount("cursed-talent-2") .. ")"
				talents[2][2].now = talents[2][2].now + 1
				remote.call("cursed","armorupgrade")
				gui.tableTalents2.talent2c2.caption = "Update armor (" .. talents[2][2].now .. "/" .. talents[2][2].max .. ")"
			end
		end
	elseif event.element.name == "talent2c3" then
		if (game.player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][3].now < talents[2][3].max) then
				game.player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. game.player.getitemcount("cursed-talent-2") .. ")"
				talents[2][3].now = talents[2][3].now + 1
				remote.call("cursed","bowupgrade")
				gui.tableTalents2.talent2c3.caption = "Update bow (" .. talents[2][3].now .. "/" .. talents[2][3].max .. ")"
			end
		end
	elseif event.element.name == "talent2c4" then
		if (game.player.getitemcount("cursed-talent-2") >= 1) then
			if (talents[2][4].now < talents[2][4].max) then
				game.player.removeitem({name="cursed-talent-2", count=1})
				gui.frameTalentsDet2.talentsMain2.caption = "Talents 2 (" .. game.player.getitemcount("cursed-talent-2") .. ")"
				talents[2][4].now = talents[2][4].now + 1
				game.player.force.technologies["arrow-speed-" .. cursed[game.player.name].skills.range.level].researched = true
				game.player.force.technologies["arrow-speed-" .. cursed[game.player.name].skills.range.level + 1].enabled = false
				gui.tableTalents2.talent2c4.caption = "Update arrows (" .. talents[2][4].now .. "/" .. talents[2][4].max .. ")"
			end
		end
	elseif event.element.name == "talent3c1" then
		if (game.player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][1].now < talents[3][1].max) then
				game.player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. game.player.getitemcount("cursed-talent-3") .. ")"
				game.player.character.insert({name="cursed-drill-1",count=1})
				talents[3][1].now = talents[3][1].now + 1
				gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
			end
		end
	elseif event.element.name == "talent3c2" then
		if (game.player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][2].now < talents[3][2].max) then
				game.player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. game.player.getitemcount("cursed-talent-3") .. ")"
				talents[3][2].now = talents[3][2].now + 1
				talents[3][1].max = talents[3][2].now + 2
				gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
				gui.tableTalents3.talent3c2.caption = "Update mines (" .. talents[3][2].now .. "/" .. talents[3][2].max .. ")"
			end
		end
	elseif event.element.name == "talent3c3" then
		if (game.player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][3].now < talents[3][3].max) then
				game.player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. game.player.getitemcount("cursed-talent-3") .. ")"
				game.player.character.insert({name="cursed-turret-1",count=1})
				talents[3][3].now = talents[3][3].now + 1
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
			end
		end
	elseif event.element.name == "talent3c4" then
		if (game.player.getitemcount("cursed-talent-3") >= 1) then
			if (talents[3][4].now < talents[3][4].max) then
				game.player.removeitem({name="cursed-talent-3", count=1})
				gui.frameTalentsDet3.talentsMain3.caption = "Talents 3 (" .. game.player.getitemcount("cursed-talent-3") .. ")"
				talents[3][4].now = talents[3][4].now + 1
				talents[3][3].max = talents[3][4].now + 2
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
				gui.tableTalents3.talent3c4.caption = "Update turrets (" .. talents[3][4].now .. "/" .. talents[3][4].max .. ")"
			end
		end
	elseif event.element.name == "talent4c1" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][1].now < talents[4][1].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-1-" .. math.floor(talents[4][1].now / 3) + 1].enabled = false
				talents[4][1].now = talents[4][1].now + 1
				game.player.force.recipes["cursed-talent-part-1-" .. math.floor(talents[4][1].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c1.caption = "Upgrade part 1 (" .. talents[4][1].now .. "/" .. talents[4][1].max .. ")"
			end
		end
	elseif event.element.name == "talent4c2" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][2].now < talents[4][2].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-2-" .. math.floor(talents[4][2].now / 3) + 1].enabled = false
				talents[4][2].now = talents[4][2].now + 1
				game.player.force.recipes["cursed-talent-part-2-" .. math.floor(talents[4][2].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c2.caption = "Upgrade part 2 (" .. talents[4][2].now .. "/" .. talents[4][2].max .. ")"
			end
		end
	elseif event.element.name == "talent4c3" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][3].now < talents[4][3].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-3-" .. math.floor(talents[4][3].now / 3) + 1].enabled = false
				talents[4][3].now = talents[4][3].now + 1
				game.player.force.recipes["cursed-talent-part-3-" .. math.floor(talents[4][3].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c3.caption = "Upgrade part 3 (" .. talents[4][3].now .. "/" .. talents[4][3].max .. ")"
			end
		end
	elseif event.element.name == "talent4c4" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][4].now < talents[4][4].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-4-" .. math.floor(talents[4][4].now / 3) + 1].enabled = false
				talents[4][4].now = talents[4][4].now + 1
				game.player.force.recipes["cursed-talent-part-4-" .. math.floor(talents[4][4].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c4.caption = "Upgrade part 4 (" .. talents[4][4].now .. "/" .. talents[4][4].max .. ")"
			end
		end
	elseif event.element.name == "talent4c5" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][5].now < talents[4][5].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-5-" .. math.floor(talents[4][5].now / 3) + 1].enabled = false
				talents[4][5].now = talents[4][5].now + 1
				game.player.force.recipes["cursed-talent-part-5-" .. math.floor(talents[4][5].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c5.caption = "Upgrade part 5 (" .. talents[4][5].now .. "/" .. talents[4][5].max .. ")"
			end
		end
	elseif event.element.name == "talent4c6" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][6].now < talents[4][6].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-6-" .. math.floor(talents[4][6].now / 3) + 1].enabled = false
				talents[4][6].now = talents[4][6].now + 1
				game.player.force.recipes["cursed-talent-part-6-" .. math.floor(talents[4][6].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c6.caption = "Upgrade part 6 (" .. talents[4][6].now .. "/" .. talents[4][6].max .. ")"
			end
		end
	elseif event.element.name == "talent4c7" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][7].now < talents[4][7].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-7-" .. math.floor(talents[4][7].now / 3) + 1].enabled = false
				talents[4][7].now = talents[4][7].now + 1
				game.player.force.recipes["cursed-talent-part-7-" .. math.floor(talents[4][7].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c7.caption = "Upgrade part 7 (" .. talents[4][7].now .. "/" .. talents[4][7].max .. ")"
			end
		end
	elseif event.element.name == "talent4c8" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][8].now < talents[4][8].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-8-" .. math.floor(talents[4][8].now / 3) + 1].enabled = false
				talents[4][8].now = talents[4][8].now + 1
				game.player.force.recipes["cursed-talent-part-8-" .. math.floor(talents[4][8].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c8.caption = "Upgrade part 8 (" .. talents[4][8].now .. "/" .. talents[4][8].max .. ")"
			end
		end
	elseif event.element.name == "talent4c9" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][9].now < talents[4][9].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-9-" .. math.floor(talents[4][9].now / 3) + 1].enabled = false
				talents[4][9].now = talents[4][9].now + 1
				game.player.force.recipes["cursed-talent-part-9-" .. math.floor(talents[4][9].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c9.caption = "Upgrade part 9 (" .. talents[4][9].now .. "/" .. talents[4][9].max .. ")"
			end
		end
	elseif event.element.name == "talent4c10" then
		if (game.player.getitemcount("cursed-talent-4") >= 1) then
			if (talents[4][10].now < talents[4][10].max) then
				game.player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")"
				game.player.force.recipes["cursed-talent-part-10-" .. math.floor(talents[4][10].now / 3) + 1].enabled = false
				talents[4][10].now = talents[4][10].now + 1
				game.player.force.recipes["cursed-talent-part-10-" .. math.floor(talents[4][10].now / 3) + 1].enabled = true
				gui.tableTalents4.talent4c10.caption = "Upgrade part 10 (" .. talents[4][10].now .. "/" .. talents[4][10].max .. ")"
			end
		end
	elseif event.element.name == "talent5c4" then
		if (game.player.getitemcount("cursed-talent-5") >= 1) then
			if (talents[5][4].now < talents[5][4].max) then
				game.player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Talents 5 (" .. game.player.getitemcount("cursed-talent-5") .. ")"
				talents[5][4].now = talents[5][4].now + 1
				gui.tableTalents5.talent5c4.caption = "HP regen (" .. talents[5][4].now .. "/" .. talents[5][4].max .. ")"
			end
		end
	elseif event.element.name == "talent5c6" then
		if (game.player.getitemcount("cursed-talent-5") >= 1) then
			if (talents[5][6].now < talents[5][6].max) then
				game.player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Talents 5 (" .. game.player.getitemcount("cursed-talent-5") .. ")"
				talents[5][6].now = talents[5][6].now + 1
				gui.tableTalents5.talent5c6.caption = "Damage aura (" .. talents[5][6].now .. "/" .. talents[5][6].max .. ")"
			end
		end
	elseif event.element.name == "builds1c1" then
		local mines = cursed[game.player.name].mines
		local num = 0
		for i = 1, #mines do
			if num == 0 and cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
				num = i
			end
		end
		if num == 1 then num = #mines else num = num - 1 end
		gui.tableMine.builds1c2.caption = mines[num].nick
		gui.tableBuilds1.builds1c4.caption = "Level " .. mines[num].level
		gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
		gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
	elseif event.element.name == "builds1c3" then
		local mines = cursed[game.player.name].mines
		local num = 0
		for i = 1, #mines do
			if num == 0 and cursed[game.player.name].gui.tableMine.builds1c2.caption == mines[i].nick then
				num = i
			end
		end
		if num == #mines then num = 1 else num = num + 1 end
		gui.tableMine.builds1c2.caption = mines[num].nick
		gui.tableBuilds1.builds1c4.caption = "Level " .. mines[num].level
		gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
		gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
	end
end)

function removeAxes()
	for i=1,maxTool do
		if game.player.getitemcount("cursed-axe-"..i) >=1 then
			game.player.removeitem({name="cursed-axe-"..i, count=game.player.getitemcount("cursed-axe-"..i)})
		end
	end
	if (game.player.getinventory(defines.inventory.playertools)[1] ~= nil) then
		if (string.sub(game.player.getinventory(defines.inventory.playertools)[1].name,1,11)) == "cursed-axe-"   then
			game.player.getinventory(defines.inventory.playertools).remove(game.player.getinventory(defines.inventory.playertools)[1])
		end
	end
end
function removeArmors()
	for i=1,maxArmor do
		if game.player.getitemcount("cursed-armor-"..i) >=1 then
			game.player.removeitem({name="cursed-armor-"..i, count=game.player.getitemcount("cursed-armor-"..i)})
		end
	end
	if (game.player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
		if (string.sub(game.player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
			game.player.getinventory(defines.inventory.playerarmor).remove(game.player.getinventory(defines.inventory.playerarmor)[1])
		end
	end
end
function removeWeapons1()
	for i=1,maxWeapon1 do
		if game.player.getitemcount("cursed-weapon1-"..i) >=1 then
			game.player.removeitem({name="cursed-weapon1-"..i, count=game.player.getitemcount("cursed-weapon1-"..i)})
		end
	end
	for i = 1, 3 do
		if game.player.getinventory(defines.inventory.playerguns)[i] ~= nil then
			if (string.sub(game.player.getinventory(defines.inventory.playerguns)[i].name,1,15)) == "cursed-weapon1-"   then
				game.player.getinventory(defines.inventory.playerguns).remove(game.player.getinventory(defines.inventory.playerguns)[i])
			end
		end
	end
end

function levelmines(mine)
	local mine = cursed[game.player.name].mines[mine]
	if (mine.exp >= mine.next) and (mine.level < cursed[game.player.name].talents[3][2].now + 2) then
			mine.level = mine.level + 1
			mine.exp = mine.exp - mine.next
			mine.next = mine.level * mine.level * 2
			local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
			mine.entity.destroy()	
			mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
			if cursed[game.player.name].gui.tableBuilds1S then
				if cursed[game.player.name].gui.tableMine.builds1c2.caption == mine.nick then
					cursed[game.player.name].gui.tableBuilds1.builds1c4.caption = "Level " .. mine.level
				end
			end
			game.player.print("Cursed: A mining drill has evolved")
	elseif (mine.exp < 0) and (mine.level > 1) then
			if math.abs(mine.exp) > (mine.next * 0.3) then
				down = (math.abs(mine.exp) * 10) / (mine.next * 0.3)
			else
				down = 10 + math.floor((math.abs(mine.exp) * 90) / mine.next)
				if down > 100 then down = 100 end
			end
			if math.random(101-down) == 1 then
				mine.level = mine.level - 1
				mine.next = mine.level * mine.level * 2
				mine.exp = mine.next + mine.exp
				local temp ={ x = mine.entity.position.x .. "", y = mine.entity.position.y .. "", direction = mine.entity.direction .. ""}
				mine.entity.destroy()
				mine.entity = game.createentity{name="cursed-drill-"..mine.level, position = { temp.x, temp.y }, direction = temp.direction, force=game.forces.player}
				if cursed[game.player.name].gui.tableBuilds1S then
					if cursed[game.player.name].gui.tableMine.builds1c2.caption == mine.nick then
						cursed[game.player.name].gui.tableBuilds1.builds1c4.caption = "Level " .. mine.level
					end
				end
				game.player.print("Cursed: A mining drill has regressed")
			end
	end
end

function guiFlipFlop(name)
	local gui = cursed[game.player.name].gui
	local talents = cursed[game.player.name].talents
	local skills = cursed[game.player.name].skills
	if name == "talentsMain" then
		closeAllMain(1)
		if gui.frameTalentsS then
			gui.frameTalents.destroy()
			gui.frameTalentsS = false
			closeAllTalents(-1)
		else
			gui.frameTalents = gui.tableMain.add{ type="frame", name="frameTalents", direction = "horizontal", style = "outer_frame_style" }
			gui.frameTalentsS = true
			local tableTalents = gui.frameTalents.add{ type="table", name="tableTalents", colspan=6 }
			gui.frameTalentsDet1 = tableTalents.add{ type="frame", name="frameTalents1", direction = "vertical" }
			gui.frameTalentsDet1.add({ type="button", name="talentsMain1", caption = "Talents 1 (" .. game.player.getitemcount("cursed-talent-1") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet2 = tableTalents.add{ type="frame", name="frameTalents2", direction = "vertical" }
			gui.frameTalentsDet2.add({ type="button", name="talentsMain2", caption = "Talents 2 (" .. game.player.getitemcount("cursed-talent-2") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet3 = tableTalents.add{ type="frame", name="frameTalents3", direction = "vertical" }
			gui.frameTalentsDet3.add({ type="button", name="talentsMain3", caption = "Talents 3 (" .. game.player.getitemcount("cursed-talent-3") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet4 = tableTalents.add{ type="frame", name="frameTalents4", direction = "vertical" }
			gui.frameTalentsDet4.add({ type="button", name="talentsMain4", caption = "Talents 4 (" .. game.player.getitemcount("cursed-talent-4") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet5 = tableTalents.add{ type="frame", name="frameTalents5", direction = "vertical" }
			gui.frameTalentsDet5.add({ type="button", name="talentsMain5", caption = "Talents 5 (" .. game.player.getitemcount("cursed-talent-5") .. ")", style = "talents_bar_button1" })
			gui.frameTalentsDet6 = tableTalents.add{ type="frame", name="frameTalents6", direction = "vertical" }
			gui.frameTalentsDet6.add({ type="button", name="talentsMain6", caption = "Talents 6 (" .. game.player.getitemcount("cursed-talent-6") .. ")", style = "talents_bar_button1" })
		end
	elseif name == "statsMain" then
		closeAllMain(2)
		if gui.frameStatsS then
			gui.frameStats.destroy()
			gui.frameStatsS = false
			closeAllStats(-1)
		else
			gui.frameStats = gui.tableMain.add{ type="frame", name="frameStats", direction = "horizontal", style = "outer_frame_style" }
			gui.frameStatsS = true
			local tableStats = gui.frameStats.add{ type="table", name="tableStats", colspan=8 }
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
		closeAllMain(3)
		if gui.frameBuildsS then
			gui.frameBuilds.destroy()
			gui.frameBuildsS = false
			closeAllBuilds(-1)
		else
			gui.frameBuilds = gui.tableMain.add{ type="frame", name="frameBuilds", direction = "horizontal", style = "outer_frame_style" }
			gui.frameBuildsS = true
			local tableBuilds = gui.frameBuilds.add{ type="table", name="tableBuilds", colspan=2 }
			gui.frameBuildsDet1 = tableBuilds.add{ type="frame", name="frameBuilds1", direction = "vertical" }
			gui.frameBuildsDet1.add({ type="button", name="buildsMain1", caption = "Mines", style = "" })
			gui.frameBuildsDet2 = tableBuilds.add{ type="frame", name="frameBuilds2", direction = "vertical" }
			gui.frameBuildsDet2.add({ type="button", name="buildsMain2", caption = "Turrets", style = "" })
		end
	elseif name == "talentsMain1" then
	closeAllTalents(1)
		if gui.tableTalents1S then
			gui.tableTalents1.destroy()
			gui.tableTalents1S = false
		else
			gui.tableTalents1 = gui.frameTalentsDet1.add{ type="table", name="tableTalents1", colspan=1 }
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
	closeAllTalents(2)
		if gui.tableTalents2S then
			gui.tableTalents2.destroy()
			gui.tableTalents2S = false
		else
			gui.tableTalents2 = gui.frameTalentsDet2.add{ type="table", name="tableTalents2", colspan=1 }
			gui.tableTalents2S = true
			gui.tableTalents2.add({ type="button", name="talent2c1", caption = "Upgrade tool (".. talents[2][1].now.."/"..talents[2][1].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c2", caption = "Upgrade armor (".. talents[2][2].now.."/"..talents[2][2].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c3", caption = "Upgrade bow (".. talents[2][3].now.."/"..talents[2][3].max..")", style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c4", caption = "Upgrade arrows (".. talents[2][4].now.."/"..talents[2][4].max..")", style = "fake_disabled_button_style" })
			gui.tableTalents2.add({ type="button", name="talent2c5", caption = "Upgrade sword (".. talents[2][5].now.."/"..talents[2][5].max..")", style = "fake_disabled_button_style" })
			gui.tableTalents2.add({ type="button", name="talent2c6", caption = "Upgrade shield (".. talents[2][6].now.."/"..talents[2][6].max..")", style = "fake_disabled_button_style" })
			--[[gui.tableTalents2.add({ type="button", name="talent2c7", caption = "Upgrade sword (".. talents[2][7].now.."/"..talents[2][7].max..")", style = "fake_disabled_button_style" })
			gui.tableTalents2.add({ type="button", name="talent2c8", caption = "Upgrade shield (".. talents[2][8].now.."/"..talents[2][8].max..")", style = "fake_disabled_button_style" })]]
		end
	elseif name == "talentsMain3" then
	closeAllTalents(3)
		if gui.tableTalents3S then
			gui.tableTalents3.destroy()
			gui.tableTalents3S = false
		else
			gui.tableTalents3 = gui.frameTalentsDet3.add{ type="table", name="tableTalents3", colspan=1 }
			gui.tableTalents3S = true
			gui.tableTalents3.add({ type="button", name="talent3c1", caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c2", caption = "Update mines (" .. talents[3][2].now .. "/" .. talents[3][2].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c3", caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")", style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c4", caption = "Update turrets (" .. talents[3][4].now .. "/" .. talents[3][4].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c5", caption = "Buy walls (" .. talents[3][5].now .. "/" .. talents[3][5].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c6", caption = "Update walls (" .. talents[3][6].now .. "/" .. talents[3][6].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c7", caption = "Buy generator (" .. talents[3][7].now .. "/" .. talents[3][7].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c8", caption = "Update generators (" .. talents[3][8].now .. "/" .. talents[3][8].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c9", caption = "Buy assembler (" .. talents[3][9].now .. "/" .. talents[3][9].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents3.add({ type="button", name="talent3c10", caption = "Update assembler (" .. talents[3][10].now .. "/" .. talents[3][10].max .. ")", style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain4" then
	closeAllTalents(4)
		if gui.tableTalents4S then
			gui.tableTalents4.destroy()
			gui.tableTalents4S = false
		else
			gui.tableTalents4 = gui.frameTalentsDet4.add{ type="table", name="tableTalents4", colspan=1 }
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
	closeAllTalents(5)
		if gui.tableTalents5S then
			gui.tableTalents5.destroy()
			gui.tableTalents5S = false
		else
			gui.tableTalents5 = gui.frameTalentsDet5.add{ type="table", name="tableTalents5", colspan=1 }
			gui.tableTalents5S = true
			gui.tableTalents5.add({ type="button", name="talent5c1", caption = "Wind walk (" .. talents[5][1].now .. "/" .. talents[5][1].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c2", caption = "Defensor  (" .. talents[5][2].now .. "/" .. talents[5][2].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c3", caption = "Explosive rockets (" .. talents[5][3].now .. "/" .. talents[5][3].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c4", caption = "HP regen (" .. talents[5][4].now .. "/" .. talents[5][4].max .. ")", style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c5", caption = "Defensor bot (" .. talents[5][5].now .. "/" .. talents[5][5].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c6", caption = "Damage aura (" .. talents[5][6].now .. "/" .. talents[5][6].max .. ")", style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c7", caption = "Bigger inventory  (" .. talents[5][7].now .. "/" .. talents[5][7].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c8", caption = "Win talents killing (" .. talents[5][8].now .. "/" .. talents[5][8].max .. ")", style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c9", caption = "Lifesteal (" .. talents[5][9].now .. "/" .. talents[5][9].max .. ")", style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain6" then
		closeAllTalents(6)
		if gui.tableTalents6S then
			gui.tableTalents6.destroy()
			gui.tableTalents6S = false
		else
			gui.tableTalents6 = gui.frameTalentsDet6.add{ type="table", name="tableTalents5", colspan=1 }
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
		closeAllStats(1)
		if gui.tableStats1S then
			gui.tableStats1.destroy()
			gui.tableStats1S = false
		else
			gui.tableStats1 = gui.frameStatsDet1.add{ type="table", name="tableStats1", colspan=1 }
			gui.tableStats1S = true
			gui.tableStats1.add({ type="label", name="stat1c1", caption = "General - Level " .. skills.general.level, style = "" })
			gui.tableStats1.add({ type="label", name="stat1c2", caption = "Experience: " .. skills.general.exp .. " / " .. skills.general.next, style = "" })
			gui.tableStats1.add({type="progressbar", name="stat1c3", size=100}).value = skills.general.exp / skills.general.next
			gui.tableStats1.add({ type="label", name="stat1c4", caption = "Bonus: " .. skills.general.level / 40 .. "%", style = "" })
			gui.tableStats1.add({ type="label", name="stat1c5", caption = "Experience in all others stats", style = "" })
		end
	elseif name == "statsMain2" then
		closeAllStats(2)
		if gui.tableStats2S then
			gui.tableStats2.destroy()
			gui.tableStats2S = false
		else
			gui.tableStats2 = gui.frameStatsDet2.add{ type="table", name="tableStats2", colspan=1 }
			gui.tableStats2S = true
			gui.tableStats2.add({ type="label", name="stat2c1", caption = "Mining - Level " .. skills.mining.level, style = "" })
			gui.tableStats2.add({ type="label", name="stat2c2", caption = "Experience: " .. skills.mining.exp .. " / " .. skills.mining.next .. " (+" .. 100 * (talents[1][5].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats2.add({type="progressbar", name="stat2c3", size=100}).value = skills.mining.exp / skills.mining.next
			gui.tableStats2.add({ type="label", name="stat2c4", caption = "Bonus: " .. skills.mining.level / 16 .. "%", style = "" })
			gui.tableStats2.add({ type="label", name="stat2c5", caption = "Mining speed", style = "" })
		end
	elseif name == "statsMain3" then
		closeAllStats(3)
		if gui.tableStats3S then
			gui.tableStats3.destroy()
			gui.tableStats3S = false
		else
			gui.tableStats3 = gui.frameStatsDet3.add{ type="table", name="tableStats3", colspan=1 }
			gui.tableStats3S = true
			gui.tableStats3.add({ type="label", name="stat3c1", caption = "Farming - Level " .. skills.farming.level, style = "" })
			gui.tableStats3.add({ type="label", name="stat3c2", caption = "Experience: " .. skills.farming.exp .. " / " .. skills.farming.next .. " (+" .. 100 * (talents[1][6].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats3.add({type="progressbar", name="stat3c3", size=100}).value = skills.farming.exp / skills.farming.next
			gui.tableStats3.add({ type="label", name="stat3c4", caption = "Bonus: " .. skills.farming.level / 8 .. "%", style = "" })
			gui.tableStats3.add({ type="label", name="stat3c5", caption = "Woodcutting speed", style = "" })
		end
	elseif name == "statsMain4" then
		closeAllStats(4)
		if gui.tableStats4S then
			gui.tableStats4.destroy()
			gui.tableStats4S = false
		else
			gui.tableStats4 = gui.frameStatsDet4.add{ type="table", name="tableStats4", colspan=1 }
			gui.tableStats4S = true
			gui.tableStats4.add({ type="label", name="stat4c1", caption = "Crafting - Level " .. skills.crafting.level, style = "" })
			gui.tableStats4.add({ type="label", name="stat4c2", caption = "Experience: " .. skills.crafting.exp .. " / " .. skills.crafting.next .. " (+" .. 100 * (talents[1][7].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats4.add({type="progressbar", name="stat4c3", size=100}).value = skills.crafting.exp / skills.crafting.next
			gui.tableStats4.add({ type="label", name="stat4c4", caption = "Bonus: " .. skills.crafting.level / 24 .. "%", style = "" })
			gui.tableStats4.add({ type="label", name="stat4c5", caption = "Crafting speed", style = "" })
		end
	elseif name == "statsMain5" then
		closeAllStats(5)
		if gui.tableStats5S then
			gui.tableStats5.destroy()
			gui.tableStats5S = false
		else
			gui.tableStats5 = gui.frameStatsDet5.add{ type="table", name="tableStats5", colspan=1 }
			gui.tableStats5S = true
			gui.tableStats5.add({ type="label", name="stat5c1", caption = "Explore - Level " .. skills.explore.level, style = "" })
			gui.tableStats5.add({ type="label", name="stat5c2", caption = "Experience: " .. skills.explore.exp .. " / " .. skills.explore.next .. " (+" .. 100 * (talents[1][8].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats5.add({type="progressbar", name="stat5c3", size=100}).value = skills.explore.exp / skills.explore.next
			gui.tableStats5.add({ type="label", name="stat5c4", caption = "Bonus: " .. skills.explore.level / 32 .. "%", style = "" })
			gui.tableStats5.add({ type="label", name="stat5c5", caption = "Movement speed - Not implemented", style = "" })
		end
	elseif name == "statsMain6" then
		closeAllStats(6)
		if gui.tableStats6S then
			gui.tableStats6.destroy()
			gui.tableStats6S = false
		else
			gui.tableStats6 = gui.frameStatsDet6.add{ type="table", name="tableStats6", colspan=1 }
			gui.tableStats6S = true
			gui.tableStats6.add({ type="label", name="stat6c1", caption = "Defense - Level " .. skills.defense.level, style = "" })
			gui.tableStats6.add({ type="label", name="stat6c2", caption = "Experience: " .. skills.defense.exp .. " / " .. skills.defense.next .. " (+" .. 100 * (talents[1][10].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats6.add({type="progressbar", name="stat6c3", size=100}).value = skills.defense.exp / skills.defense.next
			gui.tableStats6.add({ type="label", name="stat6c4", caption = "Bonus: " .. skills.defense.level * 2 .. "%", style = "" })
			gui.tableStats6.add({ type="label", name="stat6c5", caption = "Health points - Not implemented", style = "" })
		end
	elseif name == "statsMain7" then
		closeAllStats(7)
		if gui.tableStats7S then
			gui.tableStats7.destroy()
			gui.tableStats7S = false
		else
			gui.tableStats7 = gui.frameStatsDet7.add{ type="table", name="tableStats7", colspan=1 }
			gui.tableStats7S = true
			gui.tableStats7.add({ type="label", name="stat7c1", caption = "Bow - Level " .. skills.range.level, style = "" })
			gui.tableStats7.add({ type="label", name="stat7c2", caption = "Experience: " .. skills.range.exp .. " / " .. skills.range.next .. " (+" .. 100 * (talents[1][9].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats7.add({type="progressbar", name="stat7c3", size=100}).value = skills.range.exp / skills.range.next
			gui.tableStats7.add({ type="label", name="stat7c4", caption = "Bonus: " .. skills.range.level * 10 .. "%", style = "" })
			gui.tableStats7.add({ type="label", name="stat7c5", caption = "Bow damage", style = "" })
		end
	elseif name == "statsMain8" then
		closeAllStats(8)
		if gui.tableStats8S then
			gui.tableStats8.destroy()
			gui.tableStats8S = false
		else
			gui.tableStats8 = gui.frameStatsDet8.add{ type="table", name="tableStats8", colspan=1 }
			gui.tableStats8S = true
			gui.tableStats8.add({ type="label", name="stat8c1", caption = "Sword - Level " .. skills.melee.level, style = "" })
			gui.tableStats8.add({ type="label", name="stat8c2", caption = "Experience: " .. skills.melee.exp .. " / " .. skills.melee.next .. " (+" .. 100 * (talents[1][9].now / 40 + skills.general.level / 40) .. "%)", style = "" })
			gui.tableStats8.add({type="progressbar", name="stat8c3", size=100}).value = skills.melee.exp / skills.melee.next
			gui.tableStats8.add({ type="label", name="stat8c4", caption = "Bonus: " .. skills.melee.level * 0 .. "%", style = "" })
			gui.tableStats8.add({ type="label", name="stat8c5", caption = "Sword damage - Sword not found :3", style = "" })
		end
	elseif name == "buildsMain1" then
		closeAllBuilds(1)
		if gui.tableBuilds1S then
			gui.tableBuilds1.destroy()
			gui.tableBuilds1S = false
		else
			local mines = cursed[game.player.name].mines
			local num = 0
			local nick
			for i = 1, #mines do
				if mines[i] ~= nil and mines[i].entity ~= nil and num == 0 then
					num = i
				end
			end
			gui.tableBuilds1 = gui.frameBuildsDet1.add{ type="table", name="tableBuilds1", colspan=1 }
			gui.tableBuilds1S = true
			gui.tableMine = gui.tableBuilds1.add({ type="table", name="tableMine", colspan=3 })
			gui.tableMine.add({ type="button", name="builds1c1", caption = "<", style = "" })
			gui.tableMine.add({ type="button", name="builds1c2", caption = mines[num].nick, style = "" })
			gui.tableMine.add({ type="button", name="builds1c3", caption = ">", style = "" })
			gui.tableBuilds1.add({ type="label", name="builds1c4", caption = "Level " .. mines[num].level, style = "" })
			gui.tableBuilds1.add({ type="label", name="builds1c5", caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next, style = "" })
			gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100}).value = mines[num].exp / mines[num].next
		end
	end
end

function reloadChracter()
	if cursed[game.player.name].skills.explore.level < maxExplore then
		local position = game.player.position
		local direction = game.player.character.direction
		game.player.character.destroy()
		game.player.character =  game.createentity{name="cursed-player-" .. cursed[game.player.name].skills.explore.level, position = position, direction = direction, force=game.forces.player}
	end
end

function closeAllMain(num)
	local gui = cursed[game.player.name].gui
	closeAllTalents(-1)
	closeAllStats(-1)
	closeAllBuilds(-1)
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
function closeAllTalents(num)
	local gui = cursed[game.player.name].gui
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
function closeAllStats(num)
	local gui = cursed[game.player.name].gui
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
		gui.tablStats3S = false
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
function closeAllBuilds(num)
	local gui = cursed[game.player.name].gui
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

function skillUp(skill,newnext)
	if skill.exp >= skill.next then
		skill.level = skill.level + 1
		skill.exp = skill.exp - skill.next
		skill.next = newnext
		if (skill == cursed[game.player.name].skills.general) then
			game.player.character.insert({name="cursed-talent-1",count=1})
		elseif skill == cursed[game.player.name].skills.mining then
			if cursed[game.player.name].gui.tableStats2S then
				cursed[game.player.name].gui.tableStats2.stat2c1.caption = "Mining - Level " .. skill.level
				cursed[game.player.name].gui.tableStats2.stat2c4.caption = "Bonus: " .. skill.level / 16 .. "%"
			end
		elseif skill == cursed[game.player.name].skills.farming then
			if cursed[game.player.name].gui.tableStats3S then
				cursed[game.player.name].gui.tableStats3.stat3c1.caption = "Farming - Level " .. skill.level
				cursed[game.player.name].gui.tableStats3.stat3c4.caption = "Bonus: " .. skill.level / 8 .. "%"
			end
		elseif skill == cursed[game.player.name].skills.crafting then
			game.player.force.manualcraftingspeedmodifier = 1 + ((skill.level) / 24)
			if cursed[game.player.name].gui.tableStats4S then
				cursed[game.player.name].gui.tableStats4.stat4c1.caption = "Crafting - Level " .. skill.level
				cursed[game.player.name].gui.tableStats4.stat4c4.caption = "Bonus: " .. skill.level / 24 .. "%"
			end
		elseif skill == cursed[game.player.name].skills.explore	then
			if cursed[game.player.name].gui.tableStats5S then
				cursed[game.player.name].gui.tableStats5.stat5c1.caption = "Explore - Level " .. skill.level
				cursed[game.player.name].gui.tableStats5.stat5c4.caption = "Bonus: " .. skill.level / 32 .. "%"
			end
		elseif skill == cursed[game.player.name].skills.defense then
			if cursed[game.player.name].gui.tableStats6S then
				cursed[game.player.name].gui.tableStats6.stat6c1.caption = "Defense - Level " .. skill.level
				cursed[game.player.name].gui.tableStats6.stat6c4.caption = "Bonus: " .. skill.level * 2 .. "%"
			end
		elseif skill == cursed[game.player.name].skills.range and skill.level <= maxRange then
			game.player.force.technologies["arrow-damage-" .. skill.level].researched = true
			if skill.level < maxRange then
				game.player.force.technologies["arrow-damage-" .. skill.level + 1].enabled = false
			end
			if cursed[game.player.name].gui.tableStats7S then
				cursed[game.player.name].gui.tableStats7.stat7c1.caption = "Bow - Level " .. skill.level
				if skill.level < maxRange then
					cursed[game.player.name].gui.tableStats7.stat7c4.caption = "Bonus: " .. skill.level * 10 .. "%"
				end
			end
		end
		if skill ~= cursed[game.player.name].skills.general then
			cursed[game.player.name].skills.general.exp = cursed[game.player.name].skills.general.exp + 1
			if cursed[game.player.name].skills.general.exp >=  cursed[game.player.name].skills.general.next then
				remote.call("cursed","showgeneral")
			end
		end
		game.player.print(skill.name .. " level " .. skill.level .. " - Next level: " .. skill.next)
	else
		game.player.print(skill.name .. " level "..skill.level .. " - Experience: " .. skill.exp .. " / " .. skill.next)
	end
end

function player(playerindex)
	return game.getplayer(playerindex)
end

remote.addinterface("cursed",
{
prueba = function()

		-- local mines = cursed[game.player.name].mines
		-- for i=1, #mines do
			-- if mines[i].entity.valid and game.player.selected.equals(mines[i].entity) then
					-- game.player.print("level: "..mines[i].level .. " - exp´: " .. mines[i].exp)
			-- end
		-- end
end,
	debugtime = function()
		game.daytime = ((game.tick%25000)/25000)
		game.player.print("Time: " .. util.formattime(game.tick))
	end,
	debugblood = function()
		local blood = cursed[game.player.name].blood
		for _,j in ipairs(game.findentitiesfiltered{area = {{game.player.position.x-2, game.player.position.y-2}, {game.player.position.x+2, game.player.position.y+2}}, name="cursed-blood"}) do
				for k = 1, #blood do
					if blood[k] ~= nil and blood[k].entity ~= nil and j.equals(blood[k].entity) then
						blood[k].entity.destroy()
						blood[k] = nil
						return
					end
				end
			j.destroy()
		end
	end,
	resettalents = function()
		if cursed[game.player.name].mines ~= nil then
			local mines = cursed[game.player.name].mines
			for i = 1, #mines do
				mines[i].entity.destroy()
				mines[i] = nil
			end
		end
		mines = {}
		cursed[game.player.name].mines = mines
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
		talents[3][1].max = talents[3][2].now + 2
		talents[3][2].max = maxMine - 2
		talents[3][3].max = talents[3][4].now + 2
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
		for i = 1, talents[2][4].max do
			if i <= talents[2][4].now then
				game.player.force.technologies["arrow-speed-" .. i].researched = true
			else
				game.player.force.technologies["arrow-speed-" .. i].researched = false
			end
		end
		if talents[2][4].now < talents[2][4].max then
			game.player.force.technologies["arrow-speed-" .. talents[2][4].now + 1].enabled = false
		end
		cursed[game.player.name].talents = talents
		remote.call("cursed","toolupgrade")
		remote.call("cursed","armorupgrade")
		remote.call("cursed","bowupgrade")
		game.player.print("Talents reseted")
	end,
	resetgui = function(destroyonly)
		local gui = cursed[game.player.name].gui
		if gui and gui.tableMain ~= nil then
			closeAllTalents(-1)
			if gui.frameTalentsS then
				gui.frameTalents.destroy()
				gui.frameTalentsS = false
			end
			gui.tableMain.destroy()
		else
			gui = {}
		end
		if not destroyonly then
			gui.tableMain = game.player.gui.left.add{ type="table", name="tableMain", colspan=2 }
			gui.tableMainS = true
			local frameTalentsMain = gui.tableMain.add{ type="frame", name="frameTalentsMain", direction = "vertical" }
			local tableTalentsMain = frameTalentsMain.add{ type="table", name="tableTalentsMain", colspan=1 }
			tableTalentsMain.add({ type="label", name="main", caption = "cursed", style = "recipe_tooltip_cannot_craft_label_style" })
			tableTalentsMain.add({ type="button", name="talentsMain", caption = "Talents", style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="statsMain", caption = "Stats", style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="buildsMain", caption = "Builds", style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="activesMain", caption = "Activables", style = "dialog_button_style" })
			cursed[game.player.name].gui = gui
			game.player.print("Gui reseted")
		end
	end,
	showgeneral = function()
		skillUp(cursed[game.player.name].skills.general,(((cursed[game.player.name].skills.general.level + 1) * 1.5) + 0.5 ))
	end,
	showmining = function()
		skillUp(cursed[game.player.name].skills.mining,(((cursed[game.player.name].skills.mining.level + 1) * (cursed[game.player.name].skills.mining.level + 1)) * 0.8 + 10 ))
	end,
	showfarming = function()
		skillUp(cursed[game.player.name].skills.farming,(((cursed[game.player.name].skills.farming.level + 1) * (cursed[game.player.name].skills.farming.level + 1)) * 0.8 + 10 ))
	end,
	showcrafting = function()
		skillUp(cursed[game.player.name].skills.crafting,(((cursed[game.player.name].skills.crafting.level + 1) * (cursed[game.player.name].skills.crafting.level + 1)) * 0.8 + 10 ))
	end,
	showexplore = function()
		skillUp(cursed[game.player.name].skills.explore,(((cursed[game.player.name].skills.explore.level + 1) * (cursed[game.player.name].skills.explore.level + 1)) * 0.8 + 10 ))
	end,
	showrange = function()
		skillUp(cursed[game.player.name].skills.range,(((cursed[game.player.name].skills.range.level + 1) * (cursed[game.player.name].skills.range.level + 1)) * 0.8 + 10 ))
	end,
--[[	showmelee = function()
		skillUp(cursed[game.player.name].skills.melee,(((cursed[game.player.name].skills.melee.level + 1) * (cursed[game.player.name].skills.melee.level + 1)) * 0.8 + 10 ))
	end,]]
	showdefense = function()
		skillUp(cursed[game.player.name].skills.defense,(((cursed[game.player.name].skills.defense.level + 1) * (cursed[game.player.name].skills.defense.level + 1)) * 0.8 + 10 ))
	end,
	toolupgrade = function()
		removeAxes()
		game.player.character.insert({name="cursed-axe-"..cursed[game.player.name].talents[2][1].now,count=1})
	end,
	armorupgrade = function()
		removeArmors()
		game.player.character.insert({name="cursed-armor-"..cursed[game.player.name].talents[2][2].now,count=1})
	end,
	bowupgrade = function()
		removeWeapons1()
		game.player.character.insert({name="cursed-weapon1-"..cursed[game.player.name].talents[2][3].now,count=1})
	end,
	resetstats = function(sure)
		if sure ~= nil and sure == "sure" then
			local skills = {}
			n = {"general","mining","farming","crafting","explore","range","melee","defense"}
			for i = 1, #n do
				skills[n[i]] = {}
				skills[n[i]].name = n[i]
				skills[n[i]].level = 1
				skills[n[i]].exp = 0
				skills[n[i]].next = ((skills[n[i]].level * skills[n[i]].level) * 0.8 + 10 )
			end
			skills.general.next = ((skills.general.level * 1.5) + 0.5 )
			for i = 1, maxRange do
				if i <= skills.range.level then
					game.player.force.technologies["arrow-damage-" .. i].researched = true
				else
					game.player.force.technologies["arrow-damage-" .. i].researched = false
				end
			end
			if skills.range.level < maxRange then
				game.player.force.technologies["arrow-damage-" .. skills.range.level + 1].enabled = false
			end
			cursed[game.player.name].skills = skills
		else
			game.player.print([[If you want reset yours skills write /c remote.call("cursed","resetskills","sure")]])
		end
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
