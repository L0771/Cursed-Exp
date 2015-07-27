
function clickgui(event)
	local player = game.getplayer(event.element.playerindex)
	if player.gui.left.flowMain then
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
		local inv = glob.cursed[player.name].inv
		if gui.changeNick1S and string.sub(event.element.name,1,11) ~= "changeNick1" and event.element.name ~= "builds1c2" then
			changeNick("mine",player)
		end
		if gui.changeNick2S and string.sub(event.element.name,1,11) ~= "changeNick2" and event.element.name ~= "builds2c2" then
			changeNick("turret",player)
		end
		if gui.changeNick4S and string.sub(event.element.name,1,11) ~= "changeNick4" and event.element.name ~= "builds4c2" then
			changeNick("body",player)
		end
		if gui.changeNick5S and string.sub(event.element.name,1,11) ~= "changeNick5" and event.element.name ~= "builds5c2" then
			changeNick("wall",player)
		end
		if gui.changeNick6S and string.sub(event.element.name,1,11) ~= "changeNick6" and event.element.name ~= "builds6c2" then
			changeNick("fisher",player)
		end
		if event.element.name == "closeMain" then
			guiFlipFlop("closeMain",player)
		elseif event.element.name == "v1Main" then
			guiFlipFlop("v1Main",player)
		elseif event.element.name == "v2Main" then
			guiFlipFlop("v2Main",player)
		elseif event.element.name == "v3Main" then
			guiFlipFlop("v3Main",player)
		elseif event.element.name == "v7Main" then
			if player.cursorstack then
				player.print({"msg.cursed", {"msg.cursorstack"}})
			else
				local vaultentity = glob.cursed[player.name].aux.vaultentity
				local cant = player.getitemcount("cursed-vault")
				if vaultentity == nil and cant == 0 then
					player.cursorstack = {name="cursed-vault", count=1}
				end
			end
		elseif event.element.name == "v6Main" then
			guiFlipFlop("v6Main",player)
		elseif event.element.name == "v5Main" then
			guiFlipFlop("v5Main",player)
		elseif event.element.name == "v4Main" then
			guiFlipFlop("v4Main",player)
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
				guiFlipFlop("buildsMain1",player)
			else
				player.print({"msg.cursed", {"msg.minmine"}})
			end
		elseif event.element.name == "buildsMain2" then
			local turrets = glob.cursed[player.name].turrets
			if #turrets ~= 0 or gui.tableBuilds2S then
				guiFlipFlop("buildsMain2",player)
			else
				player.print({"msg.cursed", {"msg.minturret"}})
			end
		elseif event.element.name == "buildsMain3" then
			guiFlipFlop("buildsMain3",player)
		elseif event.element.name == "buildsMain4" then
			local bodies = glob.cursed[player.name].aux.bodies
			if #bodies ~= 0 or gui.tableBuilds4S then
				guiFlipFlop("buildsMain4",player)
			else
				player.print({"msg.cursed", {"msg.minbodies"}})
			end
		elseif event.element.name == "buildsMain5" then
			local walls = glob.cursed[player.name].walls
			if #walls ~= 0 or gui.tableBuilds5S then
				guiFlipFlop("buildsMain5",player)
			else
				player.print({"msg.cursed", {"msg.minwall"}})
			end
		elseif event.element.name == "buildsMain6" then
			local fishers = glob.cursed[player.name].fishers
			if #fishers ~= 0 or gui.tableBuilds6S then
				guiFlipFlop("buildsMain6",player)
			else
				player.print({"msg.cursed", {"msg.minfisher"}})
			end
		elseif event.element.name == "talent1c1" then
			if (talents[1][1].now < talents[1][1].max) then
				if (functions_talents.removeTalentsAll(player,1,1) == 1) then
					for _,v in ipairs(game.players) do
						talents = glob.cursed[v.name].talents
						talents[1][1].now = talents[1][1].now + 1
						talents[1][2].max = 0
						gui = glob.cursed[v.name].gui
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
							gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
						end
					end
					globalPrint({"msg.cursed", {"msg.24day-buy",player.name}})
				end
			end
		elseif event.element.name == "talent1c1p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > talents[1][1].max - talents[1][1].now then max = talents[1][1].max - talents[1][1].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				for _,v in ipairs(game.players) do
					talents = glob.cursed[v.name].talents
					talents[1][1].now = talents[1][1].now + max
					talents[1][2].max = 0
					gui = glob.cursed[v.name].gui
					if gui.tableTalents1S then
						gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
						gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
					end
				end
				globalPrint({"msg.cursed", {"msg.24day-buy",player.name}})
			end
		elseif event.element.name == "talent1c2" then
			if (talents[1][2].now < talents[1][2].max) then
				if (functions_talents.removeTalentsAll(player,1,1) == 1) then
					for _,v in ipairs(game.players) do
						talents = glob.cursed[v.name].talents
						talents[1][2].now = talents[1][2].now + 1
						talents[1][1].max = 0
						gui = glob.cursed[v.name].gui
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
							gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
						end
					end
					globalPrint({"msg.cursed", {"msg.24night-buy",player.name}})
				end
			end
		elseif event.element.name == "talent1c2p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > talents[1][2].max - talents[1][2].now then max = talents[1][2].max - talents[1][2].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				for _,v in ipairs(game.players) do
					talents = glob.cursed[v.name].talents
					talents[1][2].now = talents[1][2].now + max
					talents[1][1].max = 0
					gui = glob.cursed[v.name].gui
					if gui.tableTalents1S then
						gui.tableTalents1.talent1c1.caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}
						gui.tableTalents1.talent1c2.caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}
					end
				end
				globalPrint({"msg.cursed", {"msg.24night-buy",player.name}})
			end
		elseif event.element.name == "talent1c3" then
			if (talents[1][3].now < talents[1][3].max) then
				if (functions_talents.removeTalentsAll(player,1,1) == 1) then
					removeItems.axes(player)
					player.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					talents[1][3].now = talents[1][3].now + 1
					gui.tableTalents1.talent1c3.caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}
				end
			end
		elseif event.element.name == "talent1c3p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > talents[1][3].max - talents[1][3].now then max = talents[1][3].max - talents[1][3].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				removeItems.axes(player)
				player.insert({name="cursed-axe-"..talents[2][1].now,count=1})
				talents[1][3].now = talents[1][3].now + max
				gui.tableTalents1.talent1c3.caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}
			end
		elseif event.element.name == "talent1c4" then
			if (talents[1][4].now < talents[1][4].max) then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
					local inside = {}
					if player.character and (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
						if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
							local adentro = player.getinventory(defines.inventory.playerarmor)[1].grid.equipment
							for i = 1, #adentro do
								inside[#inside+1] = {name = adentro[i].name, position = adentro[i].position}
							end
						end
					end
					removeItems.armors(player)
					player.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					if player.getinventory(defines.inventory.playerarmor)[1].hasgrid then
						local grid = player.getinventory(defines.inventory.playerarmor)[1].grid
						for i = 1, #inside do
							grid.put{name = inside[i].name, position = inside[i].position}
						end
					end
					talents[1][4].now = talents[1][4].now + 1
					gui.tableTalents1.talent1c4.caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}
				end
			end
		elseif event.element.name == "talent1c4p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > talents[1][4].max - talents[1][4].now then max = talents[1][4].max - talents[1][4].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				local inside = {}
				if player.character and (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
					if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
						local adentro = player.getinventory(defines.inventory.playerarmor)[1].grid.equipment
						for i = 1, #adentro do
							inside[#inside+1] = {name = adentro[i].name, position = adentro[i].position}
						end
					end
				end
				removeItems.armors(player)
				player.insert({name="cursed-armor-"..talents[2][2].now,count=1})
				if player.getinventory(defines.inventory.playerarmor)[1].hasgrid then
					local grid = player.getinventory(defines.inventory.playerarmor)[1].grid
					for i = 1, #inside do
						grid.put{name = inside[i].name, position = inside[i].position}
					end
				end
				talents[1][4].now = talents[1][4].now + max
				gui.tableTalents1.talent1c4.caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}
			end
		elseif event.element.name == "talent1c5" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][5].now = talents[1][5].now + 1
				gui.tableTalents1.talent1c5.caption = {"gui.talent1c5",talents[1][5].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c5p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][5].now = talents[1][5].now + max
				gui.tableTalents1.talent1c5.caption = {"gui.talent1c5",talents[1][5].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c6" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][6].now = talents[1][6].now + 1
				gui.tableTalents1.talent1c6.caption = {"gui.talent1c6",talents[1][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c6p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][6].now = talents[1][6].now + max
				gui.tableTalents1.talent1c6.caption = {"gui.talent1c6",talents[1][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c7" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][7].now = talents[1][7].now + 1
				gui.tableTalents1.talent1c7.caption = {"gui.talent1c7",talents[1][7].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c7p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][7].now = talents[1][7].now + max
				gui.tableTalents1.talent1c7.caption = {"gui.talent1c7",talents[1][7].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c8" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][8].now = talents[1][8].now + 1
				gui.tableTalents1.talent1c8.caption = {"gui.talent1c8",talents[1][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c8p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][8].now = talents[1][8].now + max
				gui.tableTalents1.talent1c8.caption = {"gui.talent1c8",talents[1][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c9" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][9].now = talents[1][9].now + 1
				gui.tableTalents1.talent1c9.caption = {"gui.talent1c9",talents[1][9].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c9p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][9].now = talents[1][9].now + max
				gui.tableTalents1.talent1c9.caption = {"gui.talent1c9",talents[1][9].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c10" then
			if (functions_talents.removeTalentsAll(player,1,1) == 1) then
				talents[1][10].now = talents[1][10].now + 1
				gui.tableTalents1.talent1c10.caption = {"gui.talent1c10",talents[1][10].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent1c10p" then
			local max = player.getitemcount("cursed-talent-1") + inv.talents["pt1"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,1,max)
				talents[1][10].now = talents[1][10].now + max
				gui.tableTalents1.talent1c10.caption = {"gui.talent1c10",talents[1][10].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent2c1" then
			if (talents[2][1].now < talents[2][1].max) then
				if (functions_talents.removeTalentsAll(player,2,1) == 1) then
					talents[2][1].now = talents[2][1].now + 1
					removeItems.axes(player)
					player.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					gui.tableTalents2.talent2c1.caption = {"gui.talent2c1",talents[2][1].now,talents[2][1].max}
				end
			end
		elseif event.element.name == "talent2c1p" then
			local max = player.getitemcount("cursed-talent-2") + inv.talents["pt2"]
			if max > talents[2][1].max - talents[2][1].now then max = talents[2][1].max - talents[2][1].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,2,max)
				talents[2][1].now = talents[2][1].now + max
				removeItems.axes(player)
				player.insert({name="cursed-axe-"..talents[2][1].now,count=1})
				gui.tableTalents2.talent2c1.caption = {"gui.talent2c1",talents[2][1].now,talents[2][1].max}
			end
		elseif event.element.name == "talent2c2" then
			if (talents[2][2].now < talents[2][2].max) then
				if (functions_talents.removeTalentsAll(player,2,1) == 1) then
					talents[2][2].now = talents[2][2].now + 1
					local inside = {}
					if player.character and (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
						if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
							local adentro = player.getinventory(defines.inventory.playerarmor)[1].grid.equipment
							for i = 1, #adentro do
								inside[#inside+1] = {name = adentro[i].name, position = adentro[i].position}
							end
						end
					end
					removeItems.armors(player)
					player.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					if player.getinventory(defines.inventory.playerarmor)[1].hasgrid then
						local grid = player.getinventory(defines.inventory.playerarmor)[1].grid
						for i = 1, #inside do
							grid.put{name = inside[i].name, position = inside[i].position}
						end
					end
					gui.tableTalents2.talent2c2.caption = {"gui.talent2c2",talents[2][2].now,talents[2][2].max}
				end
			end
		elseif event.element.name == "talent2c2p" then
			local max = player.getitemcount("cursed-talent-2") + inv.talents["pt2"]
			if max > talents[2][2].max - talents[2][2].now then max = talents[2][2].max - talents[2][2].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,2,max)
				talents[2][2].now = talents[2][2].now + max
				local inside = {}
				if player.character and (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
					if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
						local adentro = player.getinventory(defines.inventory.playerarmor)[1].grid.equipment
						for i = 1, #adentro do
							inside[#inside+1] = {name = adentro[i].name, position = adentro[i].position}
						end
					end
				end
				removeItems.armors(player)
				player.insert({name="cursed-armor-"..talents[2][2].now,count=1})
				if player.getinventory(defines.inventory.playerarmor)[1].hasgrid then
					local grid = player.getinventory(defines.inventory.playerarmor)[1].grid
					for i = 1, #inside do
						grid.put{name = inside[i].name, position = inside[i].position}
					end
				end
				gui.tableTalents2.talent2c2.caption = {"gui.talent2c2",talents[2][2].now,talents[2][2].max}
			end
		elseif event.element.name == "talent2c3" then
			if (talents[2][3].now < talents[2][3].max) then
				if (functions_talents.removeTalentsAll(player,2,1) == 1) then
					talents[2][3].now = talents[2][3].now + 1
					removeItems.bows(player)
					player.insert({name="cursed-bow-"..talents[2][3].now,count=1})
					gui.tableTalents2.talent2c3.caption = {"gui.talent2c3",talents[2][3].now,talents[2][3].max}
				end
			end
		elseif event.element.name == "talent2c3p" then
			local max = player.getitemcount("cursed-talent-2") + inv.talents["pt2"]
			if max > talents[2][3].max - talents[2][3].now then max = talents[2][3].max - talents[2][3].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,2,max)
				talents[2][3].now = talents[2][3].now + max
				removeItems.bows(player)
				player.insert({name="cursed-bow-"..talents[2][3].now,count=1})
				gui.tableTalents2.talent2c3.caption = {"gui.talent2c3",talents[2][3].now,talents[2][3].max}
			end
		-- elseif event.element.name == "talent2c4" then
			-- if (talents[2][4].now < talents[2][4].max) then
				-- if (player.removeitem({name="cursed-talent-2", count=1})>= 1) then
					-- gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
					-- talents[2][4].now = talents[2][4].now + 1
					-- gui.tableTalents2.talent2c4.caption = {"",{"gui-talent2c4"}," (",talents[2][4].now,"/",talents[2][4].max,")"}
				-- end
			-- end
		-- elseif event.element.name == "talent2c5" then
			-- if (talents[2][5].now < talents[2][5].max) then
				-- if (player.removeitem({name="cursed-talent-2", count=1}) >= 1) then
					-- gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
					-- talents[2][5].now = talents[2][5].now + 1
					-- gui.tableTalents2.talent2c5.caption = {"",{"gui-talent2c5"}," (",talents[2][5].now,"/",talents[2][5].max,")"}
				-- end
			-- end
		elseif event.element.name == "talent3c1" then
			if (talents[3][1].now < talents[3][1].max) then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-drill-1",count=1})) then
					if (functions_talents.removeTalentsAll(player,4,1) == 1) then
						talents[3][1].now = talents[3][1].now + 1
						player.insert({name="cursed-drill-1",count= 1})
						gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
					end
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c1p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > talents[3][1].max - talents[3][1].now then max = talents[3][1].max - talents[3][1].now end
			if max > 0 then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-drill-1",count=max})) then
					functions_talents.removeTalentsAll(player,4,max)
					talents[3][1].now = talents[3][1].now + max
					player.insert({name="cursed-drill-1",count= max})
					gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c2" then
			if (functions_talents.removeTalentsAll(player,4,1) == 1) then
				talents[3][2].now = talents[3][2].now + 1
				talents[3][1].max = math.floor(math.sqrt(talents[3][2].now) * 0.8+2)
				gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
				gui.tableTalents3.talent3c2.caption = {"gui.talent3c2",talents[3][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c2p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,4,max)
				talents[3][2].now = talents[3][2].now + max
				talents[3][1].max = math.floor(math.sqrt(talents[3][2].now) * 0.8+2)
				gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
				gui.tableTalents3.talent3c2.caption = {"gui.talent3c2",talents[3][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c3" then
			if (talents[3][3].now < talents[3][3].max) then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-turret-1",count=1})) then
					if (functions_talents.removeTalentsAll(player,4,1) == 1) then
						talents[3][3].now = talents[3][3].now + 1
						player.insert({name="cursed-turret-1",count= 1})
						gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
					end
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c3p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > talents[3][3].max - talents[3][3].now then max = talents[3][3].max - talents[3][3].now end
			if max > 0 then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-turret-1",count=max})) then
					functions_talents.removeTalentsAll(player,4,max)
					player.insert({name="cursed-turret-1",count=max})
					talents[3][3].now = talents[3][3].now + max
					gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c4" then
			if (functions_talents.removeTalentsAll(player,4,1) == 1) then
				talents[3][4].now = talents[3][4].now + 1
				talents[3][3].max = math.floor(math.sqrt(talents[3][4].now) * 0.8+2)
				gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
				gui.tableTalents3.talent3c4.caption = {"gui.talent3c4",talents[3][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c4p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,4,max)
				talents[3][4].now = talents[3][4].now + max
				talents[3][3].max = math.floor(math.sqrt(talents[3][4].now) * 0.8+2)
				gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
				gui.tableTalents3.talent3c4.caption = {"gui.talent3c4",talents[3][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c5" then
			if (talents[3][5].now < talents[3][5].max) then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-wall-base",count=1})) then
					if (functions_talents.removeTalentsAll(player,4,1) == 1) then
						talents[3][5].now = talents[3][5].now + 1
						player.insert({name="cursed-wall-base",count= 1})
						gui.tableTalents3.talent3c5.caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}
					end
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c5p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > talents[3][5].max - talents[3][5].now then max = talents[3][5].max - talents[3][5].now end
			if max > 0 then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-wall-base",count=max})) then
					functions_talents.removeTalentsAll(player,4,max)
					player.insert({name="cursed-wall-base",count=max})
					talents[3][5].now = talents[3][5].now + max
					local walls = glob.cursed[player.name].walls
					gui.tableTalents3.talent3c5.caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c6" then
			if (functions_talents.removeTalentsAll(player,4,1) == 1) then
				talents[3][6].now = talents[3][6].now + 1
				talents[3][5].max = math.floor(math.sqrt(talents[3][6].now) * 0.8+2)
				gui.tableTalents3.talent3c5.caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}
				gui.tableTalents3.talent3c6.caption = {"gui.talent3c6",talents[3][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c6p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,4,max)
				talents[3][6].now = talents[3][6].now + max
				talents[3][5].max = math.floor(math.sqrt(talents[3][6].now) * 0.8+2)
				gui.tableTalents3.talent3c5.caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}
				gui.tableTalents3.talent3c6.caption = {"gui.talent3c6",talents[3][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c7" then
			if (talents[3][7].now < talents[3][7].max) then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-fisher-1",count=1})) then
					if (functions_talents.removeTalentsAll(player,4,1) == 1) then
						talents[3][7].now = talents[3][7].now + 1
						player.insert({name="cursed-fisher-1",count = 1})
						gui.tableTalents3.talent3c7.caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}
					end
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c7p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > talents[3][7].max - talents[3][7].now then max = talents[3][7].max - talents[3][7].now end
			if max > 0 then
				if (player.getinventory(defines.inventory.playerquickbar).caninsert({name="cursed-fisher-1",count=max})) then
					functions_talents.removeTalentsAll(player,3,max)
					player.insert({name="cursed-fisher-1",count=max})
					talents[3][7].now = talents[3][7].now + max
					gui.tableTalents3.talent3c7.caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}
				else
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "talent3c8" then
			if (functions_talents.removeTalentsAll(player,4,1) == 1) then
				talents[3][8].now = talents[3][8].now + 1
				talents[3][7].max = math.floor(math.sqrt(talents[3][8].now) * 0.8+2)
				gui.tableTalents3.talent3c7.caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}
				gui.tableTalents3.talent3c8.caption = {"gui.talent3c8",talents[3][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent3c8p" then
			local max = player.getitemcount("cursed-talent-4") + inv.talents["pt4"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,4,max)
				talents[3][8].now = talents[3][8].now + max
				talents[3][7].max = math.floor(math.sqrt(talents[3][8].now) * 0.8+2)
				gui.tableTalents3.talent3c7.caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}
				gui.tableTalents3.talent3c8.caption = {"gui.talent3c8",talents[3][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c1" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][1].now = talents[4][1].now + 1
				gui.tableTalents4.talent4c1.caption = {"gui.talent4c1",talents[4][1].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c1p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][1].now = talents[4][1].now + max
				gui.tableTalents4.talent4c1.caption = {"gui.talent4c1",talents[4][1].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c2" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][2].now = talents[4][2].now + 1
				gui.tableTalents4.talent4c2.caption = {"gui.talent4c2",talents[4][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c2p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][2].now = talents[4][2].now + max
				gui.tableTalents4.talent4c2.caption = {"gui.talent4c2",talents[4][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c3" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][3].now = talents[4][3].now + 1
				gui.tableTalents4.talent4c3.caption = {"gui.talent4c3",talents[4][3].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c3p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][3].now = talents[4][3].now + max
				gui.tableTalents4.talent4c3.caption = {"gui.talent4c3",talents[4][3].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c4" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][4].now = talents[4][4].now + 1
				gui.tableTalents4.talent4c4.caption = {"gui.talent4c4",talents[4][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c4p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][4].now = talents[4][4].now + max
				gui.tableTalents4.talent4c4.caption = {"gui.talent4c4",talents[4][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c5" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][5].now = talents[4][5].now + 1
				gui.tableTalents4.talent4c5.caption = {"gui.talent4c5",talents[4][5].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c5p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][5].now = talents[4][5].now + max
				gui.tableTalents4.talent4c5.caption = {"gui.talent4c5",talents[4][5].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c6" then
			if (functions_talents.removeTalentsAll(player,3,1) == 1) then
				talents[4][6].now = talents[4][6].now + 1
				gui.tableTalents4.talent4c6.caption = {"gui.talent4c6",talents[4][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent4c6p" then
			local max = player.getitemcount("cursed-talent-3") + inv.talents["pt3"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,3,max)
				talents[4][6].now = talents[4][6].now + max
				gui.tableTalents4.talent4c6.caption = {"gui.talent4c6",talents[4][6].now,{"gui.plus"}}
			end
		-- elseif event.element.name == "talent4c7" then
			-- if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][7].now = talents[4][7].now + 1
				-- gui.tableTalents4.talent4c7.caption = {"gui.talent4c7",talents[4][7].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c7p" then
			-- local max = player.getitemcount("cursed-talent-4")
			-- if max > 0 then
				-- player.removeitem({name="cursed-talent-4", count=max})
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][7].now = talents[4][7].now + max
				-- gui.tableTalents4.talent4c7.caption = {"gui.talent4c7",talents[4][7].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c8" then
			-- if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][8].now = talents[4][8].now + 1
				-- gui.tableTalents4.talent4c8.caption = {"gui.talent4c8",talents[4][8].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c8p" then
			-- local max = player.getitemcount("cursed-talent-4")
			-- if max > 0 then
				-- player.removeitem({name="cursed-talent-4", count=max})
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][8].now = talents[4][8].now + max
				-- gui.tableTalents4.talent4c8.caption = {"gui.talent4c8",talents[4][8].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c9" then
			-- if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][9].now = talents[4][9].now + 1
				-- gui.tableTalents4.talent4c9.caption = {"gui.talent4c9",talents[4][9].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c9p" then
			-- local max = player.getitemcount("cursed-talent-4")
			-- if max > 0 then
				-- player.removeitem({name="cursed-talent-4", count=max})
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][9].now = talents[4][9].now + max
				-- gui.tableTalents4.talent4c9.caption = {"gui.talent4c9",talents[4][9].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c10" then
			-- if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][10].now = talents[4][10].now + 1
				-- gui.tableTalents4.talent4c10.caption = {"gui.talent4c10",talents[4][10].now,{"gui.plus"}}
			-- end
		-- elseif event.element.name == "talent4c10p" then
			-- local max = player.getitemcount("cursed-talent-4")
			-- if max > 0 then
				-- player.removeitem({name="cursed-talent-4", count=max})
				-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				-- talents[4][10].now = talents[4][10].now + max
				-- gui.tableTalents4.talent4c10.caption = {"gui.talent4c10",talents[4][10].now,{"gui.plus"}}
			-- end
		elseif event.element.name == "talent5c4" then
			if (functions_talents.removeTalentsAll(player,5,1) == 1) then
				talents[5][4].now = talents[5][4].now + 1
				gui.tableTalents5.talent5c4.caption = {"gui.talent5c4",talents[5][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent5c4p" then
			local max = player.getitemcount("cursed-talent-5") + inv.talents["pt5"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,5,max)
				talents[5][4].now = talents[5][4].now + max
				gui.tableTalents5.talent5c4.caption = {"gui.talent5c4",talents[5][4].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent5c6" then
			if (functions_talents.removeTalentsAll(player,5,1) == 1) then
				talents[5][6].now = talents[5][6].now + 1
				gui.tableTalents5.talent5c6.caption = {"gui.talent5c6",talents[5][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent5c6p" then
			local max = player.getitemcount("cursed-talent-5") + inv.talents["pt5"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,5,max)
				talents[5][6].now = talents[5][6].now + max
				gui.tableTalents5.talent5c6.caption = {"gui.talent5c6",talents[5][6].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent5c7" then
			if (talents[5][7].now < talents[5][7].max) then
				if (functions_talents.removeTalentsAll(player,5,1) == 1) then
					gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
					talents[5][7].now = talents[5][7].now + 1
					gui.tableTalents5.talent5c7.caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}
				end
			end
		elseif event.element.name == "talent5c7p" then
			local max = player.getitemcount("cursed-talent-5") + inv.talents["pt5"]
			if max > talents[5][7].max - talents[5][7].now then max = talents[5][7].max - talents[5][7].now end
			if max > 0 then
				functions_talents.removeTalentsAll(player,5,max)
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][7].now = talents[5][7].now + max
				gui.tableTalents5.talent5c7.caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}
			end
		elseif event.element.name == "talent5c8" then
			if (functions_talents.removeTalentsAll(player,5,1) == 1) then
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][8].now = talents[5][8].now + 1
				gui.tableTalents5.talent5c8.caption = {"gui.talent5c8",talents[5][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent5c8p" then
			local max = player.getitemcount("cursed-talent-5") + inv.talents["pt5"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,5,max)
				talents[5][8].now = talents[5][8].now + max
				gui.tableTalents5.talent5c8.caption = {"gui.talent5c8",talents[5][8].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent6c1" then
			if (functions_talents.removeTalentsAll(player,6,1) == 1) then
				-- gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
				talents[6][1].now = talents[6][1].now + 1
				gui.tableTalents6.talent6c1.caption = {"gui.talent6c1",talents[6][1].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent6c1p" then
			local max = player.getitemcount("cursed-talent-6") + inv.talents["pt6"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,6,max)
				talents[6][1].now = talents[6][1].now + max
				gui.tableTalents6.talent6c1.caption = {"gui.talent6c1",talents[6][1].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent6c2" then
			if (functions_talents.removeTalentsAll(player,6,1) == 1) then
				talents[6][2].now = talents[6][2].now + 1
				gui.tableTalents6.talent6c2.caption = {"gui.talent6c2",talents[6][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "talent6c2p" then
			local max = player.getitemcount("cursed-talent-6") + inv.talents["pt6"]
			if max > 0 then
				functions_talents.removeTalentsAll(player,6,max)
				talents[6][2].now = talents[6][2].now + max
				gui.tableTalents6.talent6c2.caption = {"gui.talent6c2",talents[6][2].now,{"gui.plus"}}
			end
		elseif event.element.name == "builds1c1" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == 1 then num = #mines else num = num - 1 end
			gui.tableMine.builds1c2.caption = mines[num].nick
				gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mines[num].level}
				gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",math.ceil(mines[num].exp),math.ceil(mines[num].next),mix.round(100 * (talents[3][2].now * 0.01 + (stats.mining.level * 0.02)),2)}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
			if mines[num].entity and mines[num].entity.valid then
				gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}
				gui.tableBuilds1.builds1c9.value = mines[num].entity.health / (175 + mines[num].level * 25)
			else
				gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds1.builds1c9.value = 0
			end
			gui.tableBuilds1ID.builds1c11.caption = num
			if gui.tableBuilds1.builds1c12 then
				gui.tableBuilds1.builds1c12.destroy()
			end
			if gui.tableBuilds1.builds1c13 then
				gui.tableBuilds1.builds1c13.destroy()
			end
			if mines[num].entity == nil or (mines[num].entity ~= nil and not mines[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "mines" and rebuild.id == num then
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds1.add({ type="button", name="builds1c13", caption = {"gui.builds1c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds1c3" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == #mines then num = 1 else num = num + 1 end
			gui.tableMine.builds1c2.caption = mines[num].nick
			gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mines[num].level}
			gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",math.ceil(mines[num].exp),math.ceil(mines[num].next),mix.round(100 * (talents[3][2].now * 0.01 + (stats.mining.level * 0.02)),2)}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
			if mines[num].entity and mines[num].entity.valid then
				gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}
				gui.tableBuilds1.builds1c9.value = mines[num].entity.health / (175 + mines[num].level * 25)
			else
				gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds1.builds1c9.value = 0
			end
			gui.tableBuilds1ID.builds1c11.caption = num
			if gui.tableBuilds1.builds1c12 then
				gui.tableBuilds1.builds1c12.destroy()
			end
			if gui.tableBuilds1.builds1c13 then
				gui.tableBuilds1.builds1c13.destroy()
			end
			if mines[num].entity == nil or (mines[num].entity ~= nil and not mines[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "mines" and rebuild.id == num then
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds1.add({ type="button", name="builds1c13", caption = {"gui.builds1c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds1c7" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			if gui.tableBuilds1Active.builds1c7.state == true then
				mines[num].active = true
				mines[num].active2 = true
				if mines[num].entity ~= nil and mines[num].entity.valid then
					mines[num].entity.active = true
				end
			else
				mines[num].active = false
				mines[num].active2 = false
				if mines[num].entity ~= nil and mines[num].entity.valid then
					mines[num].entity.active = false
				end
			end
		elseif event.element.name == "builds1c2" then
			changeNick("mine",player)
		elseif event.element.name == "changeNick1b2" then
			changeNick("mine",player)
		elseif event.element.name == "changeNick1b1" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			mines[num].nick = gui.changeNick1t.text
			gui.tableMine.builds1c2.caption = mines[num].nick
			changeNick("mine",player)
		elseif event.element.name == "builds1c12" then
			local rebuild = glob.cursed[player.name].aux.rebuild
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			if rebuild ~= nil and rebuild.name == "mines" and rebuild.id == num then
				rebuild = nil
				gui.tableBuilds1.builds1c12.caption = {"gui.builds1c12"}
			else
				rebuild = {name = "mines", id = num}
				gui.tableBuilds1.builds1c12.caption = {"gui.builds1c12c"}
			end
			glob.cursed[player.name].aux.rebuild = rebuild
		elseif event.element.name == "builds1c13" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			table.remove(mines,num)
			guiFlipFlop("buildsMain1",player)
		elseif event.element.name == "builds2c1" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == 1 then num = #turrets else num = num - 1 end
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",math.ceil(turrets[num].exp),math.ceil(turrets[num].next),mix.round(100 * ((talents[3][4].now * 0.01) + (stats.range.level * 0.02)),2)}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
			if turrets[num].entity and turrets[num].entity.valid then
				gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}
				gui.tableBuilds2.builds2c9.value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			else
				gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds2.builds2c9.value = 0
			end
			gui.tableBuilds2ID.builds2c11.caption = num
			if gui.tableBuilds2.builds2c12 then
				gui.tableBuilds2.builds2c12.destroy()
			end
			if gui.tableBuilds2.builds2c13 then
				gui.tableBuilds2.builds2c13.destroy()
			end
			if turrets[num].entity == nil or (turrets[num].entity ~= nil and not turrets[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "turrets" and rebuild.id == num then
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds2.add({ type="button", name="builds2c13", caption = {"gui.builds2c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds2c3" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == #turrets then num = 1 else num = num + 1 end
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",math.ceil(turrets[num].exp),math.ceil(turrets[num].next),mix.round(100 * ((talents[3][4].now * 0.01) + (stats.range.level * 0.02)),2)}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
			if turrets[num].entity and turrets[num].entity.valid then
				gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}
				gui.tableBuilds2.builds2c9.value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			else
				gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds2.builds2c9.value = 0
			end
			gui.tableBuilds2ID.builds2c11.caption = num
			if gui.tableBuilds2.builds2c12 then
				gui.tableBuilds2.builds2c12.destroy()
			end
			if gui.tableBuilds2.builds2c13 then
				gui.tableBuilds2.builds2c13.destroy()
			end
			if turrets[num].entity == nil or (turrets[num].entity ~= nil and not turrets[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "turrets" and rebuild.id == num then
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds2.add({ type="button", name="builds2c13", caption = {"gui.builds2c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds2c7" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			if gui.tableBuilds2Active.builds2c7.state == true then
				turrets[num].active = true
				turrets[num].active2 = true
				if turrets[num].entity ~= nil and turrets[num].entity.valid then
					turrets[num].entity.active = true
				end
			else
				turrets[num].active = false
				turrets[num].active2 = false
				if turrets[num].entity ~= nil and turrets[num].entity.valid then
					turrets[num].entity.active = false
				end
			end
		elseif event.element.name == "builds2c2" then
			changeNick("turret",player)
		elseif event.element.name == "changeNick2b2" then
			changeNick("turret",player)
		elseif event.element.name == "changeNick2b1" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			turrets[num].nick = gui.changeNick2t.text
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			changeNick("turret",player)
		elseif event.element.name == "builds2c12" then
			local rebuild = glob.cursed[player.name].aux.rebuild
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			if rebuild ~= nil and rebuild.name == "turrets" and rebuild.id == num then
				rebuild = nil
				gui.tableBuilds2.builds2c12.caption = {"gui.builds2c12"}
			else
				rebuild = {name = "turrets", id = num}
				gui.tableBuilds2.builds2c12.caption = {"gui.builds2c12c"}
			end
			glob.cursed[player.name].aux.rebuild = rebuild
		elseif event.element.name == "builds2c13" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			table.remove(turrets,num)
			guiFlipFlop("buildsMain2",player)
		elseif event.element.name == "builds3c1" then
			if player.character then
				setBase.main(player)
				local base = glob.cursed[player.name].aux.base
				gui.tableBuilds3.builds3c2.caption = {"gui.builds3c2", math.floor(base.position.x), math.floor(base.position.y)}
				gui.tableBuilds3.builds3c3.caption = {"gui.builds3c3", math.floor(player.character.position.x), math.floor(player.character.position.y)}
				local A1 = {x = base.position.x - player.character.position.x , y = base.position.y - player.character.position.y}
				local A2 = {x = 1, y = 0}
				gui.tableBuilds3.builds3c3.caption = {"gui.builds3c3", math.floor(player.character.position.x), math.floor(player.character.position.y)}
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
		elseif event.element.name == "builds3c6" then
			if player.character then
				local base = glob.cursed[player.name].aux.base
				if base then
					if talents[6][2].now > 0 then
						if player.character.health == glob.cursed[player.name].aux.maxhealth then
							local bodies = base.getitemcount("cursed-player")
							base.getinventory(defines.inventory.labinput).remove({name="cursed-player",count=1})
							bodies = bodies - base.getitemcount("cursed-player")
							if bodies > 0 then
								talents[6][2].now = talents[6][2].now - 1
								glob.cursed[player.name].aux.base = base
								local items = {}
								if player.character.hasitemsinside() or player.character.cursorstack ~= nil then
									local n = 1
									local playerquickbar = player.character.getinventory(defines.inventory.playerquickbar)
									for i = 1, #playerquickbar do
										if playerquickbar[i] ~= nil then
											items[n] = {name=playerquickbar[i].name,count=playerquickbar[i].count}
											n = n + 1
										end
									end
									local playermain = player.character.getinventory(defines.inventory.playermain) 
									for i = 1, #playermain do
										if playermain[i] ~= nil then
											items[n] = {name=playermain[i].name,count=playermain[i].count}
											n = n + 1
										end
									end
									local playerguns = player.character.getinventory(defines.inventory.playerguns) 
									for i = 1, #playerguns do
										if playerguns[i] ~= nil then
											items[n] = {name=playerguns[i].name,count=playerguns[i].count}
											n = n + 1
										end
									end
									local playertools = player.character.getinventory(defines.inventory.playertools) 
									for i = 1, #playertools do
										if playertools[i] ~= nil then
											items[n] = {name=playertools[i].name,count=playertools[i].count}
											n = n + 1
										end
									end
									local playerammo = player.character.getinventory(defines.inventory.playerammo) 
									for i = 1, #playerammo do
										if playerammo[i] ~= nil then
											items[n] = {name=playerammo[i].name,count=playerammo[i].count}
											n = n + 1
										end
									end
									local playerarmor = player.character.getinventory(defines.inventory.playerarmor) 
									for i = 1, #playerarmor do
										if playerarmor[i] ~= nil then
											items[n] = {name=playerarmor[i].name,count=playerarmor[i].count}
											n = n + 1
										end
									end
									local cursorstack = player.character.cursorstack
									if cursorstack ~= nil then
										items[n] = {name=cursorstack.name,count=cursorstack.count}
										n = n + 1
									end
								end
								local bodies = glob.cursed[player.name].aux.bodies
								local new = #bodies + 1
								local old = glob.cursed[player.name].aux.bodynow
								local positionplayer = game.findnoncollidingposition(player.character.name, base.position, 25, 1)
								local bodyNew = game.createentity{name=player.character.name, position=positionplayer, force=player.force}
								bodies[new] = {position = positionplayer, name = player.character.name, force = player.force, maxhealth = bodyNew.prototype.maxhealth, entity = bodyNew, nick = "Body {" .. math.floor(positionplayer.x) .. "," .. math.floor(positionplayer.y) .. "}"}
								for i = 1, #items do
									bodies[new].entity.insert(items[i])
								end
								bodies[old].position = player.character.position
								bodies[old].name = player.character.name
								local bodyOld = game.createentity{name=bodies[old].name, position=bodies[old].position, force=bodies[old].force}
								bodies[old].entity.destroy()
								bodies[old].entity = bodyOld
								player.setcontroller({type = defines.controllers.character, character = bodies[new].entity})
								-- local lastplayer = bodies[old].entity
								-- bodies[old].entity = game.createentity{name=bodies[old].name, position=bodies[actual].position, force=player.force}
								-- lastplayer.destroy()
								glob.cursed[player.name].aux.pos = bodies[new].entity.position
								glob.cursed[player.name].aux.bodynow = new
								
								local A1 = {x = base.position.x - player.character.position.x , y = base.position.y - player.character.position.y}
								local A2 = {x = 1, y = 0}
								gui.tableBuilds3.builds3c3.caption = {"gui.builds3c3", math.floor(player.character.position.x), math.floor(player.character.position.y)}
								local coseno = (A1.x * A2.x + A1.y * A2.y) / (math.sqrt(math.pow(A1.x,2) + math.pow(A1.y,2)) * math.sqrt(math.pow(A2.x,2) + math.pow(A2.y,2)))
								local seno
								if A1.y > 0 then
									seno = math.sqrt(1 - math.pow(coseno,2))
								else
									seno = -1 * math.sqrt(1 - math.pow(coseno,2))
								end
								gui.tableBuilds3CP.style.leftpadding = 94 + (coseno * 66)
								gui.tableBuilds3CP.style.toppadding = 94 + (seno * 66)
							else
								player.print({"msg.cursed", {"msg.mincorpses"}})
							end
						else
							player.print({"msg.cursed", {"msg.maxhealth"}})
						end
					else
						player.print({"msg.cursed", {"msg.maxtalentbodies"}})
					end
				else
					player.print({"msg.cursed", {"msg.minbase"}})
				end
			end
		elseif event.element.name == "builds4c1" then
			local bodies = glob.cursed[player.name].aux.bodies
			local num = tonumber(gui.tableBuilds4ID.builds4c8.caption)
			if num == 1 then num = #bodies else num = num - 1 end
			gui.tableBody.builds4c2.caption = bodies[num].nick
			gui.tableBuilds4.builds4c4.caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}
			gui.tableBuilds4.builds4c5.value = bodies[num].entity.health / bodies[num].maxhealth
			gui.tableBuilds4ID.builds4c8.caption = num
			if num == glob.cursed[player.name].aux.bodynow then gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} else gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6"} end
		elseif event.element.name == "builds4c3" then
			local bodies = glob.cursed[player.name].aux.bodies
			local num = tonumber(gui.tableBuilds4ID.builds4c8.caption)
			if num == #bodies then num = 1 else num = num + 1 end
			gui.tableBody.builds4c2.caption = bodies[num].nick
			gui.tableBuilds4.builds4c4.caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}
			gui.tableBuilds4.builds4c5.value = bodies[num].entity.health / bodies[num].maxhealth
			gui.tableBuilds4ID.builds4c8.caption = num
			if num == glob.cursed[player.name].aux.bodynow then gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} else gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6"} end
		elseif event.element.name == "builds4c2" then
			changeNick("body",player)
		elseif event.element.name == "changeNick4b2" then
			changeNick("body",player)
		elseif event.element.name == "changeNick4b1" then
			local bodies = glob.cursed[player.name].aux.bodies
			local num = tonumber(gui.tableBuilds4ID.builds4c8.caption)
			bodies[num].nick = gui.changeNick4t.text
			gui.tableBody.builds4c2.caption = bodies[num].nick
			changeNick("body",player)
		elseif event.element.name == "builds4c6" then
			if player.character then
				local new = tonumber(gui.tableBuilds4ID.builds4c8.caption)
				local old = glob.cursed[player.name].aux.bodynow
				if new ~= old then
					if player.character.health == glob.cursed[player.name].aux.maxhealth then
						local items = {}
						if player.character.hasitemsinside() or player.character.cursorstack ~= nil then
							local n = 1
							local playerquickbar = player.character.getinventory(defines.inventory.playerquickbar)
							for i = 1, #playerquickbar do
								if playerquickbar[i] ~= nil then
									items[n] = {name=playerquickbar[i].name,count=playerquickbar[i].count}
									n = n + 1
								end
							end
							local playermain = player.character.getinventory(defines.inventory.playermain) 
							for i = 1, #playermain do
								if playermain[i] ~= nil then
									items[n] = {name=playermain[i].name,count=playermain[i].count}
									n = n + 1
								end
							end
							local playerguns = player.character.getinventory(defines.inventory.playerguns) 
							for i = 1, #playerguns do
								if playerguns[i] ~= nil then
									items[n] = {name=playerguns[i].name,count=playerguns[i].count}
									n = n + 1
								end
							end
							local playertools = player.character.getinventory(defines.inventory.playertools) 
							for i = 1, #playertools do
								if playertools[i] ~= nil then
									items[n] = {name=playertools[i].name,count=playertools[i].count}
									n = n + 1
								end
							end
							local playerammo = player.character.getinventory(defines.inventory.playerammo) 
							for i = 1, #playerammo do
								if playerammo[i] ~= nil then
									items[n] = {name=playerammo[i].name,count=playerammo[i].count}
									n = n + 1
								end
							end
							local playerarmor = player.character.getinventory(defines.inventory.playerarmor) 
							for i = 1, #playerarmor do
								if playerarmor[i] ~= nil then
									items[n] = {name=playerarmor[i].name,count=playerarmor[i].count}
									n = n + 1
								end
							end
							local cursorstack = player.character.cursorstack
							if cursorstack ~= nil then
								items[n] = {name=cursorstack.name,count=cursorstack.count}
								n = n + 1
							end
						end
						local bodies = glob.cursed[player.name].aux.bodies
						for i = 1, #items do
							bodies[new].entity.insert(items[i])
						end
						bodies[old].position = player.character.position
						bodies[old].name = player.character.name
						local bodyOld = game.createentity{name=bodies[old].name, position=bodies[old].position, force=bodies[old].force}
						bodies[old].entity.destroy()
						bodies[old].entity = bodyOld
						player.setcontroller({type = defines.controllers.character, character = bodies[new].entity})
						glob.cursed[player.name].aux.pos = bodies[new].entity.position
						glob.cursed[player.name].aux.bodynow = new
						gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} 
					else
						player.print({"msg.cursed", {"msg.maxhealth"}})
					end
				end
			end
		elseif event.element.name == "builds4c9" then
			local bodies = glob.cursed[player.name].aux.bodies
			local old = glob.cursed[player.name].aux.bodynow
			if #bodies > 1 and tonumber(gui.tableBuilds4ID.builds4c8.caption) == old then
				local base = glob.cursed[player.name].aux.base
				if util.distance(base.position,player.position) < 6 then
					local items = {}
					if player.character.hasitemsinside() or player.character.cursorstack ~= nil then
						local n = 1
						local playerquickbar = player.character.getinventory(defines.inventory.playerquickbar)
						for i = 1, #playerquickbar do
							if playerquickbar[i] ~= nil then
								items[n] = {name=playerquickbar[i].name,count=playerquickbar[i].count}
								n = n + 1
							end
						end
						local playermain = player.character.getinventory(defines.inventory.playermain) 
						for i = 1, #playermain do
							if playermain[i] ~= nil then
								items[n] = {name=playermain[i].name,count=playermain[i].count}
								n = n + 1
							end
						end
						local playerguns = player.character.getinventory(defines.inventory.playerguns) 
						for i = 1, #playerguns do
							if playerguns[i] ~= nil then
								items[n] = {name=playerguns[i].name,count=playerguns[i].count}
								n = n + 1
							end
						end
						local playertools = player.character.getinventory(defines.inventory.playertools) 
						for i = 1, #playertools do
							if playertools[i] ~= nil then
								items[n] = {name=playertools[i].name,count=playertools[i].count}
								n = n + 1
							end
						end
						local playerammo = player.character.getinventory(defines.inventory.playerammo) 
						for i = 1, #playerammo do
							if playerammo[i] ~= nil then
								items[n] = {name=playerammo[i].name,count=playerammo[i].count}
								n = n + 1
							end
						end
						local playerarmor = player.character.getinventory(defines.inventory.playerarmor) 
						for i = 1, #playerarmor do
							if playerarmor[i] ~= nil then
								items[n] = {name=playerarmor[i].name,count=playerarmor[i].count}
								n = n + 1
							end
						end
						local cursorstack = player.character.cursorstack
						if cursorstack ~= nil then
							items[n] = {name=cursorstack.name,count=cursorstack.count}
							n = n + 1
						end
					end
					
					local new
					if new == 1 then new = 2 else new = old - 1 end
					for i = 1, #items do
						bodies[new].entity.insert(items[i])
					end
					base.insert({name="cursed-player", count = 1})
					bodies[old].entity.destroy()
					player.setcontroller({type = defines.controllers.character, character = bodies[new].entity})
					table.remove(bodies,old)
					glob.cursed[player.name].aux.pos = bodies[new].entity.position
					glob.cursed[player.name].aux.bodynow = new
					guiFlipFlop("buildsMain4",player)
				end
			end
		elseif event.element.name == "builds5c1" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local stats = glob.cursed[player.name].stats
			if num == 1 then num = #walls else num = num - 1 end
			gui.tableWall1.builds5c2.caption = walls[num].nick
			gui.tableBuilds5ID.builds5c5.caption = num  
			gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",walls[num].level}
			gui.tableBuilds5Active.builds5c7.state = walls[num].active
			if walls[num].storage and walls[num].storage.valid then
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
					gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}
					gui.tableBuilds5.builds5c9.value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
				else
					gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",0,walls[num].maxmass}
					gui.tableBuilds5.builds5c9.value = 0
				end
			else
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds5.builds5c9.value = 0
			end
			gui.tableWall2.builds5c12.caption = #walls[num].sides.wallxp
			gui.tableWall2.builds5c16.caption = #walls[num].sides.wallxn
			gui.tableWall2.builds5c20.caption = #walls[num].sides.wallyp
			gui.tableWall2.builds5c24.caption = #walls[num].sides.wallyn
			gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",math.ceil(walls[num].exp),math.ceil(walls[num].next),mix.round(100 * (talents[3][6].now * 0.01 + stats.defence.level * 0.02),2)}
			if walls[num].exp > 0 then
				gui.tableBuilds5.builds5c27.value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.builds5c27.value = 0
			end
			if gui.tableBuilds5.builds5c29 then
				gui.tableBuilds5.builds5c29.destroy()
			end
			if gui.tableBuilds5.builds5c30 then
				gui.tableBuilds5.builds5c30.destroy()
			end
			if walls[num].storage == nil or ( walls[num].storage ~= nil and not walls[num].storage.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "walls" and rebuild.id == num then
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds5.add({ type="button", name="builds5c30", caption = {"gui.builds5c30"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds5c3" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local stats = glob.cursed[player.name].stats
			if num == #walls then num = 1 else num = num + 1 end
			gui.tableWall1.builds5c2.caption = walls[num].nick
			gui.tableBuilds5ID.builds5c5.caption = num  
			gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",walls[num].level}
			gui.tableBuilds5Active.builds5c7.state = walls[num].active
			if walls[num].storage and walls[num].storage.valid then
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
					gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}
					gui.tableBuilds5.builds5c9.value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
				else
					gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",0,walls[num].maxmass}
					gui.tableBuilds5.builds5c9.value = 0
				end
			else
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds5.builds5c9.value = 0
			end
			gui.tableWall2.builds5c12.caption = #walls[num].sides.wallxp
			gui.tableWall2.builds5c16.caption = #walls[num].sides.wallxn
			gui.tableWall2.builds5c20.caption = #walls[num].sides.wallyp
			gui.tableWall2.builds5c24.caption = #walls[num].sides.wallyn
			gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",math.ceil(walls[num].exp),math.ceil(walls[num].next),mix.round(100 * (talents[3][6].now * 0.01 + stats.defence.level * 0.02),2)}
			if walls[num].exp > 0 then
				gui.tableBuilds5.builds5c27.value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.builds5c27.value = 0
			end
			if gui.tableBuilds5.builds5c29 then
				gui.tableBuilds5.builds5c29.destroy()
			end
			if gui.tableBuilds5.builds5c30 then
				gui.tableBuilds5.builds5c30.destroy()
			end
			if walls[num].storage == nil or ( walls[num].storage ~= nil and not walls[num].storage.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "walls" and rebuild.id == num then
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds5.add({ type="button", name="builds5c30", caption = {"gui.builds5c30"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds5c2" then
			changeNick("wall",player)
		elseif event.element.name == "changeNick5b2" then
			changeNick("wall",player)
		elseif event.element.name == "changeNick5b1" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			walls[num].nick = gui.changeNick5t.text
			gui.tableWall1.builds5c2.caption = walls[num].nick
			changeNick("wall",player)
		elseif event.element.name == "builds5c29" then
			local rebuild = glob.cursed[player.name].aux.rebuild
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if rebuild ~= nil and rebuild.name == "walls" and rebuild.id == num then
				rebuild = nil
				gui.tableBuilds5.builds5c29.caption = {"gui.builds5c29"}
			else
				rebuild = {name = "walls", id = num}
				gui.tableBuilds5.builds5c29.caption = {"gui.builds5c29c"}
			end
			glob.cursed[player.name].aux.rebuild = rebuild
		elseif event.element.name == "builds5c30" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			table.remove(walls,num)
			guiFlipFlop("buildsMain5",player)
		elseif event.element.name == "builds5c7" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if gui.tableBuilds5Active.builds5c7.state == true then
				walls[num].active = true
				walls[num].active2 = true
				if walls[num].storage ~= nil and walls[num].storage.valid then
					walls[num].storage.active = true
				end
			else
				walls[num].active = false
				walls[num].active2 = false
				if walls[num].storage ~= nil and walls[num].storage.valid then
					walls[num].storage.active = false
				end
			end
		elseif event.element.name == "builds5c11" then -- Right <
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxp = walls[num].sides.wallxp
			if #wallxp > 0 then
				if wallxp[#wallxp].valid then
					functions_wall.delWall(player,wallxp[#wallxp],num)
				end
				table.remove(wallxp,#wallxp)
				gui.tableWall2.builds5c12.caption = #wallxp
				walls[num].sides.wallxp = wallxp
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c13" then -- Right >
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if walls[num].storage ~= nil and walls[num].storage.valid then
				local wallxp = walls[num].sides.wallxp
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 100 and #wallxp < functions_wall.range(walls[num].level,talents[3][6].now) then
					local position = {x = walls[num].storage.position.x + 2 + #wallxp, y = walls[num].storage.position.y}
					if game.canplaceentity{name = "cursed-wall-1111", position = position} == true then
						wallxp[#wallxp + 1] = functions_wall.addWall(player,num,position,"0100")
						gui.tableWall2.builds5c12.caption = #wallxp
					end
				end
			end
		elseif event.element.name == "builds5c15" then -- Left <
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxn = walls[num].sides.wallxn
			if #wallxn > 0 then
				if wallxn[#wallxn].valid then
					functions_wall.delWall(player,wallxn[#wallxn],num)
				end
				table.remove(wallxn,#wallxn)
				gui.tableWall2.builds5c16.caption = #wallxn
				walls[num].sides.wallxn = wallxn
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c17" then -- Left >
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if walls[num].storage ~= nil and walls[num].storage.valid then
				local wallxn = walls[num].sides.wallxn
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 100 and #wallxn < functions_wall.range(walls[num].level,talents[3][6].now) then
					local position = {x = walls[num].storage.position.x - 2 - #wallxn, y = walls[num].storage.position.y}
					if game.canplaceentity{name = "cursed-wall-1111", position = position} == true then
						wallxn[#wallxn + 1] = functions_wall.addWall(player,num,position,"0001")
						gui.tableWall2.builds5c16.caption = #wallxn
					end
				end
			end
		elseif event.element.name == "builds5c19" then -- Top <
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyp = walls[num].sides.wallyp
			if #wallyp > 0 then
				if wallyp[#wallyp].valid then
					functions_wall.delWall(player,wallyp[#wallyp],num)
				end
				table.remove(wallyp,#wallyp)
				gui.tableWall2.builds5c20.caption = #wallyp
				walls[num].sides.wallyp = wallyp
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c21" then -- Top >
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if walls[num].storage ~= nil and walls[num].storage.valid then
				local wallyp = walls[num].sides.wallyp
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 100 and #wallyp < functions_wall.range(walls[num].level,talents[3][6].now) then
					local position = {x = walls[num].storage.position.x, y = walls[num].storage.position.y - 2 - #wallyp}
					if game.canplaceentity{name = "cursed-wall-1111", position = position} == true then
						wallyp[#wallyp + 1] = functions_wall.addWall(player,num,position,"1000")
						gui.tableWall2.builds5c20.caption = #wallyp
					end
				end
			end
		elseif event.element.name == "builds5c23" then -- Both <
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyn = walls[num].sides.wallyn
			if #wallyn > 0 then
				if wallyn[#wallyn].valid then
					functions_wall.delWall(player,wallyn[#wallyn],num)
				end
				table.remove(wallyn,#wallyn)
				gui.tableWall2.builds5c24.caption = #wallyn
				walls[num].sides.wallyn = wallyn
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c25" then -- Both >
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if walls[num].storage ~= nil and walls[num].storage.valid then
				local wallyn = walls[num].sides.wallyn
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 100 and #wallyn < functions_wall.range(walls[num].level,talents[3][6].now) then
					local position = {x = walls[num].storage.position.x, y = walls[num].storage.position.y + 2 + #wallyn}
					if game.canplaceentity{name = "cursed-wall-1111", position = position} == true then
						wallyn[#wallyn + 1] = functions_wall.addWall(player,num,position,"0010")
						gui.tableWall2.builds5c24.caption = #wallyn
					end
				end
			end
		elseif event.element.name == "builds6c1" then
			local fishers = glob.cursed[player.name].fishers
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == 1 then num = #fishers else num = num - 1 end
			gui.tableFishers.builds6c2.caption = fishers[num].nick
			gui.tableBuilds6Active.builds6c4.caption = {"gui.builds6c4",fishers[num].level}
			gui.tableBuilds6.builds6c5.caption = {"gui.builds6c5",math.ceil(fishers[num].exp),math.ceil(fishers[num].next),mix.round(100 * (talents[3][8].now * 0.01 + (stats.explore.level * 0.02)),2)}
			if fishers[num].exp > 0 then
				gui.tableBuilds6.builds6c6.value = fishers[num].exp / fishers[num].next
			else
				gui.tableBuilds6.builds6c6.value = 0
			end
			gui.tableBuilds6Active.builds6c7.state = fishers[num].active
			if fishers[num].entity and fishers[num].entity.valid then
				gui.tableBuilds6.builds6c8.caption = {"gui.builds6c8",math.ceil(fishers[num].entity.health),(175 + fishers[num].level * 25) / 2}
				gui.tableBuilds6.builds6c9.value = fishers[num].entity.health / ((175 + fishers[num].level * 25) / 2)
			else
				gui.tableBuilds6.builds6c8.caption = {"gui.builds6c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds6.builds6c9.value = 0
			end
			gui.tableBuilds6ID.builds6c11.caption = num
			if gui.tableBuilds6.builds6c12 then
				gui.tableBuilds6.builds6c12.destroy()
			end
			if gui.tableBuilds6.builds6c13 then
				gui.tableBuilds6.builds6c13.destroy()
			end
			if fishers[num].entity == nil or (fishers[num].entity ~= nil and not fishers[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild ~= nil and rebuild.name == "fishers" and rebuild.id == num then
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds6.add({ type="button", name="builds6c13", caption = {"gui.builds6c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds6c3" then
			local fishers = glob.cursed[player.name].fishers
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			local stats = glob.cursed[player.name].stats
			if num == #fishers then num = 1 else num = num + 1 end
			gui.tableFishers.builds6c2.caption = fishers[num].nick
			gui.tableBuilds6Active.builds6c4.caption = {"gui.builds6c4",fishers[num].level}
			gui.tableBuilds6.builds6c5.caption = {"gui.builds6c5",math.ceil(fishers[num].exp),math.ceil(fishers[num].next),mix.round(100 * (talents[3][8].now * 0.01 + (stats.explore.level * 0.02)),2)}
			if fishers[num].exp > 0 then
				gui.tableBuilds6.builds6c6.value = fishers[num].exp / fishers[num].next
			else
				gui.tableBuilds6.builds6c6.value = 0
			end
			gui.tableBuilds6Active.builds6c7.state = fishers[num].active
			if fishers[num].entity and fishers[num].entity.valid then
				gui.tableBuilds6.builds6c8.caption = {"gui.builds6c8",math.ceil(fishers[num].entity.health),(175 + fishers[num].level * 25) / 2}
				gui.tableBuilds6.builds6c9.value = fishers[num].entity.health / ((175 + fishers[num].level * 25) / 2)
			else
				gui.tableBuilds6.builds6c8.caption = {"gui.builds6c8",{"gui.plus"},{"gui.plus"}}
				gui.tableBuilds6.builds6c9.value = 0
			end
			gui.tableBuilds6ID.builds6c11.caption = num
			if gui.tableBuilds6.builds6c12 then
				gui.tableBuilds6.builds6c12.destroy()
			end
			if gui.tableBuilds6.builds6c13 then
				gui.tableBuilds6.builds6c13.destroy()
			end
			if fishers[num].entity == nil or (fishers[num].entity ~= nil and not fishers[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild ~= nil and rebuild.name == "fishers" and rebuild.id == num then
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds6.add({ type="button", name="builds6c13", caption = {"gui.builds6c13"}, style = "cursed-buttonInside2" })
			end
		elseif event.element.name == "builds6c7" then
			local fishers = glob.cursed[player.name].fishers
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			if gui.tableBuilds6Active.builds6c7.state == true then
				fishers[num].active = true
				fishers[num].active2 = true
				if fishers[num].entity ~= nil and fishers[num].entity.valid then
					fishers[num].entity.active = true
				end
			else
				fishers[num].active = false
				fishers[num].active2 = false
				if fishers[num].entity ~= nil and fishers[num].entity.valid then
					fishers[num].entity.active = false
				end
			end
		elseif event.element.name == "builds6c2" then
			changeNick("fisher",player)
		elseif event.element.name == "changeNick6b2" then
			changeNick("fisher",player)
		elseif event.element.name == "changeNick6b1" then
			local fishers = glob.cursed[player.name].fishers
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			fishers[num].nick = gui.changeNick6t.text
			gui.tableFishers.builds6c2.caption = fishers[num].nick
			changeNick("fisher",player)
		elseif event.element.name == "builds6c12" then
			local rebuild = glob.cursed[player.name].aux.rebuild
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			if rebuild ~= nil and rebuild.name == "fishers" and rebuild.id == num then
				rebuild = nil
				gui.tableBuilds6.builds6c12.caption = {"gui.builds2c12"}
			else
				rebuild = {name = "fishers", id = num}
				gui.tableBuilds6.builds6c12.caption = {"gui.builds2c12c"}
			end
			glob.cursed[player.name].aux.rebuild = rebuild
		elseif event.element.name == "builds6c13" then
			local fishers = glob.cursed[player.name].fishers
			local num = tonumber(gui.tableBuilds6ID.builds6c11.caption)
			table.remove(fishers,num)
			guiFlipFlop("buildsMain6",player)
		elseif event.element.name == "invMain1c0" then
			return
		elseif event.element.name == "invMain2c0" then
			return
		elseif event.element.name == "invMain1c0p" then
			glob.cursed[player.name].opt[10] = true
			local inv = glob.cursed[player.name].inv
			for tier = 1, 6 do
				local ins = 0
				if inv.parts["pt" .. tier] > 0 then
					ins = functions_talents.removePartsGui(player,tier,inv.parts["pt" .. tier])
				end
				if ins > 0 then
					player.insert({name = "cursed-talent-part-" .. tier,count = ins})
				elseif inv.parts["pt" .. tier] > 0 then
					player.print({"msg.mininventory"})
				end
			end
		elseif event.element.name == "invMain2c0p" then
			glob.cursed[player.name].opt[10] = true
			local inv = glob.cursed[player.name].inv
			for tier = 1, 6 do
				local ins = 0
				if inv.talents["pt" .. tier] > 0 then
					ins = functions_talents.removeTalentsGui(player,tier,inv.talents["pt" .. tier])
				end
				if ins > 0 then
					player.insert({name = "cursed-talent-" .. tier,count = ins})
				elseif inv.talents["pt" .. tier] > 0 then
					player.print({"msg.mininventory"})
				end
			end
		elseif string.sub(event.element.name,1,9) == "invMain1c" then
			glob.cursed[player.name].opt[10] = true
			local inv = glob.cursed[player.name].inv
			local tier = string.sub(event.element.name,10,10)
			local ins = 0
			if inv.parts["pt" .. tier] > 0 then
				if string.sub(event.element.name,11,11) == "p" then
					ins = functions_talents.removePartsGui(player,tier,inv.parts["pt" .. tier])
				else
					ins = functions_talents.removePartsGui(player,tier,1)
				end
			end
			if ins > 0 then
				player.insert({name = "cursed-talent-part-" .. tier,count = ins})
			elseif inv.parts["pt" .. tier] > 0 then
				player.print({"msg.mininventory"})
			end
		elseif string.sub(event.element.name,1,9) == "invMain2c" then
			glob.cursed[player.name].opt[10] = true
			local inv = glob.cursed[player.name].inv
			local tier = string.sub(event.element.name,10,10)
			local ins = 0
			if inv.talents["pt" .. tier] > 0 then
				if string.sub(event.element.name,11,11) == "p" then
					ins = functions_talents.removeTalentsGui(player,tier,inv.talents["pt" .. tier])
				else
					ins = functions_talents.removeTalentsGui(player,tier,1)
				end
			end
			if ins > 0 then
				player.insert({name = "cursed-talent-" .. tier,count = ins})
			elseif inv.talents["pt" .. tier] > 0 then
				player.print({"msg.mininventory"})
			end
		elseif event.element.name == "option5c1" then
			guiFlipFlop("v4Main",player)
		elseif event.element.name == "option5c2" then
			local opt = glob.cursed[player.name].opt
			if gui.tableOptions.option5c3.state == true and gui.tableOptions.option5c4.state == true then
				-- player.clearconsole()
				if gui.tableOptions.option1c1.state == true then
					opt[1] = true
				else
					opt[1] = false
				end
				if gui.tableOptions.option1c2.state == true then
					opt[2] = true
				else
					opt[2] = false
				end
				if gui.tableOptions.option1c3.state == true then
					opt[3] = true
				else
					opt[3] = false
				end
				if gui.tableOptions.option1c4.state == true then
					opt[4] = true
				else
					opt[4] = false
				end
				if gui.tableOptions.option1c5.state == true then
					opt[5] = true
				else
					opt[5] = false
				end
				if gui.tableOptions.option1c6.state == true then
					opt[6] = true
				else
					opt[6] = false
				end
				if gui.tableOptions.option1c7.state == true then
					opt[7] = true
				else
					opt[7] = false
				end
				if gui.tableOptions.option1c8.state == true then
					opt[8] = true
				else
					opt[8] = false
				end
				if gui.tableOptions.option1c9.state == true then
					opt[9] = true
				else
					opt[9] = false
				end
				if gui.tableOptions.option1c10.state == true then
					opt[10] = true
				else
					opt[10] = false
				end
				if gui.tableOptions.option2c1.state == true then
					resetstats.main(player)
					player.print({"msg.cursed", {"msg.stats-reseted"}})
				end
				if gui.tableOptions.option2c2.state == true then
					resettalents.main(player,true)
					player.print({"msg.cursed", {"msg.talents-reseted"}})
				end
				if gui.tableOptions.option2c4.state == true then
					local b = false
					local trees = nil
					if remote.interfaces.treefarm_interface and remote.interfaces.treefarm_interface.readSeed then
						trees = remote.call("treefarm_interface", "readSeed","cursed-tree")
					elseif remote.interfaces.treefarm and remote.interfaces.treefarm.readSeed then
						trees = remote.call("treefarm", "readSeed","cursed-tree")
					end
					if not trees then
						local cursedTree = {
							["name"] = "cursed-tree",
							["states"] = { "cursed-tree-00", "cursed-tree-01", "cursed-tree-02", "cursed-tree-03", "cursed-tree-04" },
							["output"] = {"cursed-heart", 1},
							["efficiency"] = { ["grass"] = 0.50, ["grass-medium"] = 0.50, ["grass-dry"] = 0.45, ["dirt"] = 0.35, ["dirt-dark"] = 0.55, ["hills"] = 0.25, ["sand"] = 0.75, ["sand-dark"] = 0.75, ["other"] = 0 },
							["basicGrowingTime"] = 6250,
							["randomGrowingTime"] = 12500,
							["fertilizerBoost"] = 1,
							}
						if remote.interfaces.treefarm_interface and remote.interfaces.treefarm_interface.getSeedTypesData then
							remote.call("treefarm_interface", "addSeed", cursedTree)
						elseif remote.interfaces.treefarm and remote.interfaces.treefarm.getSeedTypesData then
							remote.call("treefarm", "addSeed", cursedTree)
						end
					end
					player.print({"msg.cursed", {"msg.trees-reseted"}})
				end
				if gui.tableOptions.option3c1.state == true then
					local mines = glob.cursed[player.name].mines
					if mines ~= nil then
						for i = 1, #mines do
							mines[i].entity.destroy()
							table.remove(mines,i)
						end
					end
					mines = {}
					glob.cursed[player.name].mines = mines
					player.print({"msg.cursed", {"msg.mines-deleted"}})
				end
				if gui.tableOptions.option3c2.state == true then
					local turrets = glob.cursed[player.name].turrets
					if turrets ~= nil then
						for i = 1, #turrets do
							turrets[i].entity.destroy()
							table.remove(turrets,i)
						end
					end
					turrets = {}
					glob.cursed[player.name].turrets = turrets
					player.print({"msg.cursed", {"msg.turrets-deleted"}})
				end
				if gui.tableOptions.option3c3.state == true then
					-- if single == true then
						local tanks = glob.cursed.others.tanks
						local n = #tanks
						for i = 1, #tanks do
							tanks[n].entity.destroy()
							table.remove(tanks,n)
							n = n - 1
						end
						glob.cursed.others.tanks = tanks
						player.print({"msg.cursed", {"msg.delete-tanks"}})
					-- end
				end
				if gui.tableOptions.option3c4.state == true then
					local blood = glob.cursed.others.blood
					for i = #blood, 1, -1 do
						if blood[i] and blood[i].entity then
							blood[i].entity.destroy()
						end
						table.remove(blood,i)
					end
					glob.cursed.others.blood = blood
					player.print({"msg.cursed", {"msg.delete-blood"}})
				end
				if gui.tableOptions.option4c1.state == true then
					player.force.resetrecipes()
					player.print({"msg.cursed", {"msg.debug-recipes"}})
				end
				if gui.tableOptions.option4c2.state == true then
					player.force.resettechnologies()
					player.print({"msg.cursed", {"msg.debug-technologies"}})
				end
				if gui.tableOptions.option4c3.state == true then
					game.daytime = ((event.tick % 25000)/25000)
					player.print({"msg.cursed", {"msg.debug-time",util.formattime(event.tick % 25000)}})
				end
				if gui.tableOptions.option2c3.state == true then
					resetgui.main(false,true)
					resetall.main(player,true)
						player.print({"msg.cursed", {"msg.all-reseted"}})
					return true
				end
				if gui.tableOptions.option4c4.state == true then
					resetgui.main(false,true)
						player.print({"msg.cursed", {"msg.debug-gui"}})
					return true
				end
				if gui.tableOptions.option6c1.state == true then
					player.insert{name="cursed-drill-1", count = 5}
				end
				if gui.tableOptions.option6c2.state == true then
					player.insert{name="cursed-turret-1", count = 5}
				end
				if gui.tableOptions.option6c3.state == true then
					player.insert{name="cursed-fisher-1", count = 5}
				end
				if gui.tableOptions.option6c4.state == true then
					player.insert{name="cursed-wall-base", count = 5}
				end
				if gui.tableOptions.option7c1 and gui.tableOptions.option7c1.state == true then
					remote.call('cursed-classes', 'resetclass',player,nil,true)
				end
				guiFlipFlop("v4Main",player)
			end
		end
	end
end

function guiFlipFlop(name,player)
	local gui = glob.cursed[player.name].gui
	local talents = glob.cursed[player.name].talents
	local inv = glob.cursed[player.name].inv
	if name == "closeMain" then
		closeGui.closeAllMain(-1,player)
		if gui.frameMainS then
			if gui.frameMain ~= nil then
				gui.frameMain.destroy()
			end
			gui.frameMainS = false
			gui.flowClosed = gui.flowMain.add({ type="flow", name="flowClosed", direction = "vertical", style = "cursed-flow" })
			gui.flowClosed.add({ type="button", name="closeMain", style = "cursed-buttonClosed" })
		else
			if gui.flowClosed ~= nil then
				gui.flowClosed.destroy()
			end
			gui.frameMain = gui.flowMain.add({ type="frame", name="frameMain", direction = "vertical", style = "cursed-frame" })
			gui.frameMainS = true
			gui.flowMain2 = gui.frameMain.add({ type="flow", name="flowMain2", direction = "vertical", style = "cursed-flow" })
			gui.tableMain = gui.flowMain2.add({type = "table", name = "tableMain", colspan = 2, style = "cursed-table2"})
			gui.tableMain.add({ type="label", name="main", caption = {"gui.main"}, style = "cursed-label-bold" })
			gui.tableMain.add({ type="button", name="closeMain", style = "cursed-buttonMini2" })
			gui.flowMain2.add({ type="button", name="v1Main", caption = {"gui.s1Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v2Main", caption = {"gui.s2Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v3Main", caption = {"gui.s3Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v7Main", caption = {"gui.s7Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v6Main", caption = {"gui.s6Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v5Main", caption = {"gui.s5Main"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="v4Main", caption = {"gui.s4Main"}, style = "cursed-button" })
		end
	elseif name == "v1Main" then
		closeGui.closeAllMain(1,player)
		if gui.frameMain1S then
			if gui.frameMain1 ~= nil then
				gui.frameMain1.destroy()
			end
			gui.frameMain1S = false
			closeGui.closeAllTalents(-1,player)
			-- gui.flowMain2.v1Main.style = "cursed-button"
			gui.flowMain2.v1Main.caption = {"gui.s1Main"}
		else
			-- gui.flowMain2.v1Main.style = "cursed-button-clicked"
			gui.flowMain2.v1Main.caption = {"gui.clicked",{"gui.s1Main"}}
			gui.frameMain1 = gui.flowMain.add({ type="flow", name="frameMain1", direction = "horizontal", style = "cursed-flow" })
			gui.frameMain1S = true
			gui.frameTalentsDet1 = gui.frameMain1.add({ type="frame", name="frameTalents1", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet1.add({ type="button", name="talentsMain1", caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1") + inv.talents["pt1"]}, style = "cursed-button" })
			gui.frameTalentsDet2 = gui.frameMain1.add({ type="frame", name="frameTalents2", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet2.add({ type="button", name="talentsMain2", caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2") + inv.talents["pt2"]}, style = "cursed-button" })
			gui.frameTalentsDet4 = gui.frameMain1.add({ type="frame", name="frameTalents4", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet4.add({ type="button", name="talentsMain4", caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-3") + inv.talents["pt3"]}, style = "cursed-button" })
			gui.frameTalentsDet3 = gui.frameMain1.add({ type="frame", name="frameTalents3", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet3.add({ type="button", name="talentsMain3", caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-4") + inv.talents["pt4"]}, style = "cursed-button" })
			gui.frameTalentsDet5 = gui.frameMain1.add({ type="frame", name="frameTalents5", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet5.add({ type="button", name="talentsMain5", caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5") + inv.talents["pt5"]}, style = "cursed-button" })
			gui.frameTalentsDet6 = gui.frameMain1.add({ type="frame", name="frameTalents6", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet6.add({ type="button", name="talentsMain6", caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6") + inv.talents["pt6"]}, style = "cursed-button" })
		end
	elseif name == "v2Main" then
		closeGui.closeAllMain(2,player)
		if gui.frameMain2S then
			if gui.frameMain2 ~= nil then
				gui.frameMain2.destroy()
			end
			gui.frameMain2S = false
			closeGui.closeAllStats(-1,player)
			-- gui.flowMain2.v2Main.style = "cursed-button"
			gui.flowMain2.v2Main.caption = {"gui.s2Main"}
		else
			-- gui.flowMain2.v2Main.style = "cursed-button-clicked"
			gui.flowMain2.v2Main.caption = {"gui.clicked",{"gui.s2Main"}}
			gui.frameMain2 = gui.flowMain.add({ type="flow", name="frameMain2", direction = "horizontal", style = "cursed-flow" })
			gui.frameMain2S = true
			-- local tableStats = gui.frameMain2.add({ type="flow", name="tableStats", direction = "horizontal" })
			gui.frameStatsDet1 = gui.frameMain2.add({ type="frame", name="frameStats1", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet1.add({ type="button", name="statsMain1", caption = {"bsc.stat1"}, style = "cursed-button" })
			gui.frameStatsDet2 = gui.frameMain2.add({ type="frame", name="frameStats2", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet2.add({ type="button", name="statsMain2", caption = {"bsc.stat2"}, style = "cursed-button" })
			gui.frameStatsDet3 = gui.frameMain2.add({ type="frame", name="frameStats3", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet3.add({ type="button", name="statsMain3", caption = {"bsc.stat3"}, style = "cursed-button" })
			gui.frameStatsDet4 = gui.frameMain2.add({ type="frame", name="frameStats4", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet4.add({ type="button", name="statsMain4", caption = {"bsc.stat4"}, style = "cursed-button" })
			gui.frameStatsDet5 = gui.frameMain2.add({ type="frame", name="frameStats5", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet5.add({ type="button", name="statsMain5", caption = {"bsc.stat5"}, style = "cursed-button" })
			gui.frameStatsDet6 = gui.frameMain2.add({ type="frame", name="frameStats6", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet6.add({ type="button", name="statsMain6", caption = {"bsc.stat6"}, style = "cursed-button" })
			gui.frameStatsDet7 = gui.frameMain2.add({ type="frame", name="frameStats7", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet7.add({ type="button", name="statsMain7", caption = {"bsc.stat7"}, style = "cursed-button" })
			gui.frameStatsDet8 = gui.frameMain2.add({ type="frame", name="frameStats8", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet8.add({ type="button", name="statsMain8", caption = {"bsc.stat8"}, style = "cursed-button" })
		end
	elseif name == "v3Main" then
		closeGui.closeAllMain(3,player)
		if gui.frameMain3S then
			if gui.frameMain3 ~= nil then
				gui.frameMain3.destroy()
			end
			gui.frameMain3S= false
			closeGui.closeAllBuilds(-1,player)
			-- gui.flowMain2.v3Main.style = "cursed-button"
			gui.flowMain2.v3Main.caption = {"gui.s3Main"}
		else
			-- gui.flowMain2.v3Main.style = "cursed-button-clicked"
			gui.flowMain2.v3Main.caption = {"gui.clicked",{"gui.s3Main"}}
			gui.frameMain3 = gui.flowMain.add({ type="flow", name="frameMain3", direction = "horizontal", style = "cursed-flow" })
			gui.frameMain3S = true
			-- local tableBuilds = gui.frameMain3.add({ type="flow", name="tableBuilds", direction = "horizontal" })
			gui.frameBuildsDet1 = gui.frameMain3.add({ type="frame", name="frameBuilds1", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet1.add({ type="button", name="buildsMain1", caption = {"gui.buildsMain1"}, style = "cursed-button" })
			gui.frameBuildsDet2 = gui.frameMain3.add({ type="frame", name="frameBuilds2", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet2.add({ type="button", name="buildsMain2", caption = {"gui.buildsMain2"}, style = "cursed-button" })
			gui.frameBuildsDet6 = gui.frameMain3.add({ type="frame", name="frameBuilds6", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet6.add({ type="button", name="buildsMain6", caption = {"gui.buildsMain6"}, style = "cursed-button" })
			gui.frameBuildsDet5 = gui.frameMain3.add({ type="frame", name="frameBuilds5", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet5.add({ type="button", name="buildsMain5", caption = {"gui.buildsMain5"}, style = "cursed-button" })
			gui.frameBuildsDet3 = gui.frameMain3.add({ type="frame", name="frameBuilds3", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet3.add({ type="button", name="buildsMain3", caption = {"gui.buildsMain3"}, style = "cursed-button" })
			gui.frameBuildsDet4 = gui.frameMain3.add({ type="frame", name="frameBuilds4", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet4.add({ type="button", name="buildsMain4", caption = {"gui.buildsMain4"}, style = "cursed-button" })
		end
	elseif name == "v6Main" then
		closeGui.closeAllMain(6,player)
		if gui.frameMain6S then
			if gui.frameMain6 ~= nil then
				gui.frameMain6.destroy()
			end
			gui.frameMain6S = false
			-- gui.flowMain2.v6Main.style = "cursed-button"
			gui.flowMain2.v6Main.caption = {"gui.s6Main"}
		else
			-- gui.flowMain2.v6Main.style = "cursed-button-clicked"
			gui.flowMain2.v6Main.caption = {"gui.clicked",{"gui.s6Main"}}
			gui.frameMain6 = gui.flowMain.add({ type="flow", name="frameMain6", direction = "horizontal", style = "cursed-flow" })
			gui.frameMain6S = true
			local inv = glob.cursed[player.name].inv
			gui.frameInvDet1 = gui.frameMain6.add({ type="frame", name="frameInv1", direction = "vertical", style = "cursed-frame" })
			gui.tableInv1c0 = gui.frameInvDet1.add({ type="table", name="tableInv1c0", colspan = 2, style = "cursed-table" })
			gui.tableInv1c0.add({ type="button", name="invMain1c0", caption = {"gui.invMain1c0",inv.parts["pt0"]}, style = "cursed-buttonInside1" })
			gui.tableInv1c0.add({ type="button", name="invMain1c0p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableInv1c1 = gui.frameInvDet1.add({ type="table", name="tableInv1c1", colspan = 2, style = "cursed-table" })
			for i = 1, 6 do
				gui.tableInv1c1.add({ type="button", name="invMain1c" .. i, caption = {"gui.invMain1c" .. i,inv.parts["pt" .. i]}, style = "cursed-buttonInside1" })
				gui.tableInv1c1.add({ type="button", name="invMain1c" .. i .. "p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			end
			gui.frameInvDet2 = gui.frameMain6.add({ type="frame", name="frameInv2", direction = "vertical", style = "cursed-frame" })
			gui.tableInv2c0 = gui.frameInvDet2.add({ type="table", name="tableInv2c0", colspan = 2, style = "cursed-table" })
			gui.tableInv2c0.add({ type="button", name="invMain2c0", caption = {"gui.invMain2c0",inv.talents["pt0"]}, style = "cursed-buttonInside1" })
			gui.tableInv2c0.add({ type="button", name="invMain2c0p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableInv2c1 = gui.frameInvDet2.add({ type="table", name="tableInv2c1", colspan = 2, style = "cursed-table" })
			for i = 1, 6 do
				gui.tableInv2c1.add({ type="button", name="invMain2c" .. i, caption = {"gui.invMain2c" .. i,inv.talents["pt" .. i]}, style = "cursed-buttonInside1" })
				gui.tableInv2c1.add({ type="button", name="invMain2c" .. i .. "p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			end
		end
	elseif name == "v5Main" then
		closeGui.closeAllMain(5,player)
		if gui.frameMain5S then
			if gui.frameMain5 ~= nil then
				gui.frameMain5.destroy()
			end
			gui.frameMain5S = false
			-- gui.flowMain2.v5Main.style = "cursed-button"
			gui.flowMain2.v5Main.caption = {"gui.s5Main"}
		else
			-- gui.flowMain2.v5Main.style = "cursed-button-clicked"
			gui.flowMain2.v5Main.caption = {"gui.clicked",{"gui.s5Main"}}
			gui.frameMain5 = gui.flowMain.add({ type="flow", name="frameMain5", direction = "horizontal", style = "cursed-flow" })
			gui.frameMain5S = true
			gui.frameOxygenDet = gui.frameMain5.add({ type="frame", name="frameOxygen1", direction = "vertical", style = "cursed-frame" })
			if player.character then
				gui.frameOxygenDet.add({ type="label", name="oxygen1c1", caption = {"gui.oxygen1c1",math.floor(game.getpollution(player.character.position))}, style = "cursed-label" })
			else
				gui.frameOxygenDet.add({ type="label", name="oxygen1c1", caption = {"gui.oxygen1c1",0}, style = "cursed-label" })
			end
			gui.frameOxygenDet.add({ type="label", name="oxygen1c2", caption = {"gui.oxygen1c2",functions_pollution.getDmg(player)}, style = "cursed-label" })
			if remote.interfaces.oxygen then
				local oxy = remote.call("oxygen", "getoxygenofplayer",player.name)
				if player.character and oxy ~= nil then
					gui.frameOxygenDet.add({ type="label", name="oxygen1c3", caption = {"gui.oxygen1c3",math.floor(oxy)}, style = "cursed-label" })
				else
					gui.frameOxygenDet.add({ type="label", name="oxygen1c3", caption = {"gui.oxygen1c3",0}, style = "cursed-label" })
				end
			end
		end
	elseif name == "v4Main" then
		closeGui.closeAllMain(4,player)
		if gui.frameMain4S then
			if gui.frameMain4 ~= nil then
				gui.frameMain4.destroy()
			end
			gui.frameMain4S = false
				-- gui.flowMain2.v4Main.style = "cursed-button"
			gui.flowMain2.v4Main.caption = {"gui.s4Main"}
		else
				-- gui.flowMain2.v4Main.style = "cursed-button-clicked"
			gui.flowMain2.v4Main.caption = {"gui.clicked",{"gui.s4Main"}}
			local opt = glob.cursed[player.name].opt
			gui.frameMain4 = gui.flowMain.add({ type="frame", name="frameMain4", direction = "vertical", style = "cursed-frame" })
			gui.frameMain4S = true
			gui.tableOptions = gui.frameMain4.add({ type="table", name="tableOptions", colspan = 4, style = "cursed-table" })
			gui.tableOptions.add({ type="checkbox", name="option1c1", caption = {"gui.option1c1"}, state=opt[1], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c2", caption = {"gui.option1c2"}, state=opt[2], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c3", caption = {"gui.option1c3"}, state=opt[3], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c4", caption = {"gui.option1c4"}, state=opt[4], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c5", caption = {"gui.option1c5"}, state=opt[5], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c6", caption = {"gui.option1c6"}, state=opt[6], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c7", caption = {"gui.option1c7"}, state=opt[7], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c8", caption = {"gui.option1c8"}, state=opt[8], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c10", caption = {"gui.option1c10"}, state=opt[10], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c9", caption = {"gui.option1c9"}, state=opt[9], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="label", name="optionl1", caption = " " })
			-- gui.tableOptions.add({ type="label", name="optionl2", caption = " " })
			if remote.interfaces["cursed-classes"] then
				gui.tableOptions.add({ type="checkbox", name="option7c1", caption = {"gui.option7c1"}, state=false, style = "cursed-checkbox" })
			else
				gui.tableOptions.add({ type="label", name="optionl3", caption = " " })
			end
			gui.tableOptions.add({ type="checkbox", name="option6c1", caption = {"gui.option6c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option6c2", caption = {"gui.option6c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option6c3", caption = {"gui.option6c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option6c4", caption = {"gui.option6c4"}, state=false, style = "cursed-checkbox" })
			-- gui.tableOptions.add({ type="label", name="optionl4", caption = " " })
			gui.tableOptions.add({ type="checkbox", name="option2c1", caption = {"gui.option2c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option2c2", caption = {"gui.option2c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option2c3", caption = {"gui.option2c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option2c4", caption = {"gui.option2c4"}, state=false, style = "cursed-checkbox" })
			-- gui.tableOptions.add({ type="label", name="optionl5", caption = " " })
			gui.tableOptions.add({ type="checkbox", name="option3c1", caption = {"gui.option3c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c2", caption = {"gui.option3c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c3", caption = {"gui.option3c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c4", caption = {"gui.option3c4"}, state=false, style = "cursed-checkbox" })
			-- gui.tableOptions.add({ type="label", name="optionl6", caption = " " })
			-- gui.tableOptions.add({ type="label", name="optionl7", caption = " " })
			-- gui.tableOptions.add({ type="label", name="option8", caption = " " })
			-- gui.tableOptions.add({ type="label", name="optionl9", caption = " " })
			gui.tableOptions.add({ type="checkbox", name="option4c1", caption = {"gui.option4c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c2", caption = {"gui.option4c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c3", caption = {"gui.option4c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c4", caption = {"gui.option4c4"}, state=false, style = "cursed-checkbox" })
			-- gui.tableOptions.add({ type="label", name="optionl10", caption = " " })
			-- gui.tableOptions.add({ type="label", name="optionl11", caption = " " })
			-- gui.tableOptions.add({ type="label", name="option12", caption = " " })
			-- gui.tableOptions.add({ type="label", name="optionl13", caption = " " })
			gui.tableOptions.add({ type="button", name="option5c1", caption = {"gui.option5c1"}, style = "cursed-button" })
			gui.tableOptions.add({ type="button", name="option5c2", caption = {"gui.option5c2"}, style = "cursed-button" })
			gui.tableOptions.add({ type="checkbox", name="option5c3", caption = {"gui.option5c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option5c4", caption = {"gui.option5c4"}, state=false, style = "cursed-checkbox" })
		end
	elseif name == "talentsMain1" then
		closeGui.closeAllTalents(1,player)
		if gui.tableTalents1S then
			if gui.tableTalents1 ~= nil then
				gui.tableTalents1.destroy()
			end
			gui.tableTalents1S = false
			-- gui.frameTalentsDet1.talentsMain1.style = "cursed-button"
			gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1") + inv.talents["pt1"]}
		else
			-- gui.frameTalentsDet1.talentsMain1.style = "cursed-button-clicked"
			gui.frameTalentsDet1.talentsMain1.caption = {"gui.clicked",{"gui.talentsMain1",player.getitemcount("cursed-talent-1") + inv.talents["pt1"]}}
			gui.tableTalents1 = gui.frameTalentsDet1.add({ type="table", name="tableTalents1", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents1 = gui.frameTalentsDet1.add({ type="flow", name="tableTalents1", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents1S = true
			gui.tableTalents1.add({ type="button", name="talent1c1", caption = {"gui.talent1c1",talents[1][1].now,talents[1][1].max}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c2", caption = {"gui.talent1c2",talents[1][2].now,talents[1][2].max}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c3", caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c4", caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c5", caption = {"gui.talent1c5",talents[1][5].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c6", caption = {"gui.talent1c6",talents[1][6].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c7", caption = {"gui.talent1c7",talents[1][7].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c8", caption = {"gui.talent1c8",talents[1][8].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c9", caption = {"gui.talent1c9",talents[1][9].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c10", caption = {"gui.talent1c10",talents[1][10].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain2" then
		closeGui.closeAllTalents(2,player)
		if gui.tableTalents2S then
			if gui.tableTalents2 ~= nil then
				gui.tableTalents2.destroy()
			end
			gui.tableTalents2S = false
			-- gui.frameTalentsDet2.talentsMain2.style = "cursed-button"
			gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2") + inv.talents["pt2"]}
		else
			-- gui.frameTalentsDet2.talentsMain2.style = "cursed-button-clicked"
			gui.frameTalentsDet2.talentsMain2.caption = {"gui.clicked",{"gui.talentsMain2",player.getitemcount("cursed-talent-2") + inv.talents["pt2"]}}
			gui.tableTalents2 = gui.frameTalentsDet2.add({ type="table", name="tableTalents2", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents2 = gui.frameTalentsDet2.add({ type="flow", name="tableTalents2", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents2S = true
			gui.tableTalents2.add({ type="button", name="talent2c1", caption = {"gui.talent2c1",talents[2][1].now,talents[2][1].max}, style = "cursed-buttonInside1" })
			gui.tableTalents2.add({ type="button", name="talent2c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents2.add({ type="button", name="talent2c2", caption = {"gui.talent2c2",talents[2][2].now,talents[2][2].max}, style = "cursed-buttonInside1" })
			gui.tableTalents2.add({ type="button", name="talent2c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents2.add({ type="button", name="talent2c3", caption = {"gui.talent2c3",talents[2][3].now,talents[2][3].max}, style = "cursed-buttonInside1" })
			gui.tableTalents2.add({ type="button", name="talent2c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents2.add({ type="button", name="talent2c4", caption = {"gui.talent2c4",talents[2][4].now,talents[2][4].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents2.add({ type="button", name="talent2c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents2.add({ type="button", name="talent2c5", caption = {"gui.talent2c5",talents[2][5].now,talents[2][5].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents2.add({ type="button", name="talent2c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain3" then
		closeGui.closeAllTalents(3,player)
		if gui.tableTalents3S then
			if gui.tableTalents3 ~= nil then
				gui.tableTalents3.destroy()
			end
			gui.tableTalents3S = false
			-- gui.frameTalentsDet3.talentsMain3.style = "cursed-button"
			gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-4") + inv.talents["pt4"]}
		else
			-- gui.frameTalentsDet3.talentsMain3.style = "cursed-button-clicked"
			gui.frameTalentsDet3.talentsMain3.caption = {"gui.clicked",{"gui.talentsMain3",player.getitemcount("cursed-talent-4") + inv.talents["pt4"]}}
			gui.tableTalents3 = gui.frameTalentsDet3.add({ type="table", name="tableTalents3", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents3 = gui.frameTalentsDet3.add({ type="flow", name="tableTalents3", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents3S = true
			gui.tableTalents3.add({ type="button", name="talent3c1", caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c2", caption = {"gui.talent3c2",talents[3][2].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c3", caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c4", caption = {"gui.talent3c4",talents[3][4].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c5", caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c6", caption = {"gui.talent3c6",talents[3][6].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c7", caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c8", caption = {"gui.talent3c8",talents[3][8].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c9", caption = {"gui.talent3c9",talents[3][9].now,talents[3][9].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c10", caption = {"gui.talent3c10",talents[3][10].now,talents[3][10].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain4" then
		closeGui.closeAllTalents(4,player)
		if gui.tableTalents4S then
			if gui.tableTalents4 ~= nil then
				gui.tableTalents4.destroy()
			end
			gui.tableTalents4S = false
			-- gui.frameTalentsDet4.talentsMain4.style = "cursed-button"
			gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-3") + inv.talents["pt3"]}
		else
			-- gui.frameTalentsDet4.talentsMain4.style = "cursed-button-clicked"
			gui.frameTalentsDet4.talentsMain4.caption = {"gui.clicked",{"gui.talentsMain4",player.getitemcount("cursed-talent-3") + inv.talents["pt3"]}}
			gui.tableTalents4 = gui.frameTalentsDet4.add({ type="table", name="tableTalents4", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents4 = gui.frameTalentsDet4.add({ type="flow", name="tableTalents4", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents4S = true
			gui.tableTalents4.add({ type="button", name="talent4c1", caption = {"gui.talent4c1",talents[4][1].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c2", caption = {"gui.talent4c2",talents[4][2].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c3", caption = {"gui.talent4c3",talents[4][3].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c4", caption = {"gui.talent4c4",talents[4][4].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c5", caption = {"gui.talent4c5",talents[4][5].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c6", caption = {"gui.talent4c6",talents[4][6].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents4.add({ type="button", name="talent4c7", caption = {"gui.talent4c7",talents[4][7].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			-- gui.tableTalents4.add({ type="button", name="talent4c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents4.add({ type="button", name="talent4c8", caption = {"gui.talent4c8",talents[4][8].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			-- gui.tableTalents4.add({ type="button", name="talent4c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents4.add({ type="button", name="talent4c9", caption = {"gui.talent4c9",talents[4][9].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			-- gui.tableTalents4.add({ type="button", name="talent4c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents4.add({ type="button", name="talent4c10", caption = {"gui.talent4c10",talents[4][10].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			-- gui.tableTalents4.add({ type="button", name="talent4c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain5" then
		closeGui.closeAllTalents(5,player)
		if gui.tableTalents5S then
			if gui.tableTalents5 ~= nil then
				gui.tableTalents5.destroy()
			end
			gui.tableTalents5S = false
			-- gui.frameTalentsDet5.talentsMain5.style = "cursed-button"
			gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5") + inv.talents["pt5"]}
		else
			-- gui.frameTalentsDet5.talentsMain5.style = "cursed-button-clicked"
			gui.frameTalentsDet5.talentsMain5.caption = {"gui.clicked",{"gui.talentsMain5",player.getitemcount("cursed-talent-5") + inv.talents["pt5"]}}
			gui.tableTalents5 = gui.frameTalentsDet5.add({ type="table", name="tableTalents5", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents5 = gui.frameTalentsDet5.add({ type="flow", name="tableTalents5", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents5S = true
			-- gui.tableTalents5.add({ type="button", name="talent5c1", caption = {"",{"gui-talent5c1"}," (",talents[5][1].now,"/",talents[5][1].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c2", caption = {"",{"gui-talent5c2"}," (",talents[5][2].now,"/",talents[5][2].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c3", caption = {"",{"gui-talent5c3"}," (",talents[5][3].now,"/",talents[5][3].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c4", caption = {"gui.talent5c4",talents[5][4].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c5", caption = {"",{"gui-talent5c5"}," (",talents[5][5].now,"/",talents[5][5].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c6", caption = {"gui.talent5c6",talents[5][6].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c7", caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c8", caption = {"gui.talent5c8",talents[5][8].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c9", caption = {"",{"gui-talent5c9"}," (",talents[5][9].now,"/",talents[5][9].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain6" then
		closeGui.closeAllTalents(6,player)
		if gui.tableTalents6S then
			if gui.tableTalents6 ~= nil then
				gui.tableTalents6.destroy()
			end
			gui.tableTalents6S = false
			-- gui.frameTalentsDet6.talentsMain6.style = "cursed-button"
			gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6") + inv.talents["pt6"]}
		else
			-- gui.frameTalentsDet6.talentsMain6.style = "cursed-button-clicked"
			gui.frameTalentsDet6.talentsMain6.caption = {"gui.clicked",{"gui.talentsMain6",player.getitemcount("cursed-talent-6") + inv.talents["pt6"]}}
			gui.tableTalents6 = gui.frameTalentsDet6.add({ type="table", name="tableTalents6", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents6 = gui.frameTalentsDet6.add({ type="flow", name="tableTalents5", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents6S = true
			gui.tableTalents6.add({ type="button", name="talent6c1", caption = {"gui.talent6c1",talents[6][1].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents6.add({ type="button", name="talent6c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents6.add({ type="button", name="talent6c2", caption = {"gui.talent6c2",talents[6][2].now,{"gui.plus"}}, style = "cursed-buttonInside1" })
			gui.tableTalents6.add({ type="button", name="talent6c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c3", caption = {"",{"gui-talent6c3"}," (",talents[6][3].now,"/",talents[6][3].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c4", caption = {"",{"gui-talent6c4"}," (",talents[6][4].now,"/",talents[6][4].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c5", caption = {"",{"gui-talent6c5"}," (",talents[6][5].now,"/",talents[6][5].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c6", caption = {"",{"gui-talent6c6"}," (",talents[6][6].now,"/",talents[6][6].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c7", caption = {"",{"gui-talent6c7"}," (",talents[6][7].now,"/",talents[6][7].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c8", caption = {"",{"gui-talent6c8"}," (",talents[6][8].now,"/",talents[6][8].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents6.add({ type="button", name="talent6c9", caption = {"",{"gui-talent6c9"}," (",talents[6][9].now,"/",talents[6][9].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents6.add({ type="button", name="talent6c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "statsMain1" then
		closeGui.closeAllStats(1,player)
		if gui.tableStats1S then
			if gui.tableStats1 ~= nil then
				gui.tableStats1.destroy()
			end
			gui.tableStats1S = false
			-- gui.frameStatsDet1.statsMain1.style = "cursed-button"
			gui.frameStatsDet1.statsMain1.caption = {"bsc.stat1"}
		else
			-- gui.frameStatsDet1.statsMain1.style = "cursed-button-clicked"
			gui.frameStatsDet1.statsMain1.caption = {"gui.clicked",{"bsc.stat1"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats1 = gui.frameStatsDet1.add({ type="flow", name="tableStats1", direction = "vertical", style = "cursed-flow" })
			gui.tableStats1S = true
			gui.tableStats1.add({ type="label", name="stat1c1", caption = {"gui.stat1c1",{"bsc.stat1"},stats.general.level}, style = "cursed-label" })
			gui.tableStats1.add({ type="label", name="stat1c2", caption = {"gui.stat1c2",math.ceil(stats.general.exp),math.ceil(stats.general.next),mix.round(100 * (class.multGeneral - 1),1)}, style = "cursed-label" })
			gui.tableStats1.add({type="progressbar", name="stat1c3", size=100, style = "cursed-progressbar"}).value = stats.general.exp / stats.general.next
			gui.tableStats1.add({ type="label", name="stat1c4", caption = {"gui.stat1c4", mix.round(100 * stats.general.level * datos.resGeneral,2) }, style = "cursed-label" })
			gui.tableStats1.add({ type="label", name="stat1c5", caption = {"gui.stat1c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain2" then
		closeGui.closeAllStats(2,player)
		if gui.tableStats2S then
			if gui.tableStats2 ~= nil then
				gui.tableStats2.destroy()
			end
			gui.tableStats2S = false
			-- gui.frameStatsDet2.statsMain2.style = "cursed-button"
			gui.frameStatsDet2.statsMain2.caption = {"bsc.stat2"}
		else
			-- gui.frameStatsDet2.statsMain2.style = "cursed-button-clicked"
			gui.frameStatsDet2.statsMain2.caption = {"gui.clicked",{"bsc.stat2"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats2 = gui.frameStatsDet2.add({ type="flow", name="tableStats2", direction = "vertical", style = "cursed-flow" })
			gui.tableStats2S = true
			gui.tableStats2.add({ type="label", name="stat2c1", caption = {"gui.stat2c1",{"bsc.stat2"},stats.mining.level}, style = "cursed-label" })
			gui.tableStats2.add({ type="label", name="stat2c2", caption = {"gui.stat2c2",math.ceil(stats.mining.exp),math.ceil(stats.mining.next),mix.round(100 * (class.multMining + talents[1][5].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats2.add({type="progressbar", name="stat2c3", size=100, style = "cursed-progressbar"}).value = stats.mining.exp / stats.mining.next
			gui.tableStats2.add({ type="label", name="stat2c4", caption = {"gui.stat2c4",mix.round(stats.mining.level * datos.resMining,2)}, style = "cursed-label" })
			gui.tableStats2.add({ type="label", name="stat2c5", caption = {"gui.stat2c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain3" then
		closeGui.closeAllStats(3,player)
		if gui.tableStats3S then
			if gui.tableStats3 ~= nil then
				gui.tableStats3.destroy()
			end
			gui.tableStats3S = false
			-- gui.frameStatsDet3.statsMain3.style = "cursed-button"
			gui.frameStatsDet3.statsMain3.caption = {"bsc.stat3"}
		else
			-- gui.frameStatsDet3.statsMain3.style = "cursed-button-clicked"
			gui.frameStatsDet3.statsMain3.caption = {"gui.clicked",{"bsc.stat3"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats3 = gui.frameStatsDet3.add({ type="flow", name="tableStats3", direction = "vertical", style = "cursed-flow" })
			gui.tableStats3S = true
			gui.tableStats3.add({ type="label", name="stat3c1", caption = {"gui.stat3c1",{"bsc.stat3"},stats.farming.level}, style = "cursed-label" })
			gui.tableStats3.add({ type="label", name="stat3c2", caption = {"gui.stat3c2",math.ceil(stats.farming.exp),math.ceil(stats.farming.next),mix.round(100 * (class.multFarming + talents[1][6].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats3.add({type="progressbar", name="stat3c3", size=100, style = "cursed-progressbar"}).value = stats.farming.exp / stats.farming.next
			gui.tableStats3.add({ type="label", name="stat3c4", caption = {"gui.stat3c4",mix.round(stats.farming.level * datos.resFarming,2)}, style = "cursed-label" })
			gui.tableStats3.add({ type="label", name="stat3c5", caption = {"gui.stat3c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain4" then
		closeGui.closeAllStats(4,player)
		if gui.tableStats4S then
			if gui.tableStats4 ~= nil then
				gui.tableStats4.destroy()
			end
			gui.tableStats4S = false
			-- gui.frameStatsDet4.statsMain4.style = "cursed-button"
			gui.frameStatsDet4.statsMain4.caption = {"bsc.stat4"}
		else
			-- gui.frameStatsDet4.statsMain4.style = "cursed-button-clicked"
			gui.frameStatsDet4.statsMain4.caption = {"gui.clicked",{"bsc.stat4"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats4 = gui.frameStatsDet4.add({ type="flow", name="tableStats4", direction = "vertical", style = "cursed-flow" })
			gui.tableStats4S = true
			gui.tableStats4.add({ type="label", name="stat4c1", caption = {"gui.stat4c1",{"bsc.stat4"},stats.crafting.level}, style = "cursed-label" })
			gui.tableStats4.add({ type="label", name="stat4c2", caption = {"gui.stat4c2",math.ceil(stats.crafting.exp),math.ceil(stats.crafting.next),mix.round(100 * (class.multCrafting + talents[1][7].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats4.add({type="progressbar", name="stat4c3", size=100, style = "cursed-progressbar"}).value = stats.crafting.exp / stats.crafting.next
			gui.tableStats4.add({ type="label", name="stat4c4", caption = {"gui.stat4c4",mix.round(stats.crafting.level * datos.resCrafting,2)}, style = "cursed-label" })
			gui.tableStats4.add({ type="label", name="stat4c5", caption = {"gui.stat4c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain5" then
		closeGui.closeAllStats(5,player)
		if gui.tableStats5S then
			if gui.tableStats5 ~= nil then
				gui.tableStats5.destroy()
			end
			gui.tableStats5S = false
			-- gui.frameStatsDet5.statsMain5.style = "cursed-button"
			gui.frameStatsDet5.statsMain5.caption = {"bsc.stat5"}
		else
			-- gui.frameStatsDet5.statsMain5.style = "cursed-button-clicked"
			gui.frameStatsDet5.statsMain5.caption = {"gui.clicked",{"bsc.stat5"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats5 = gui.frameStatsDet5.add({ type="flow", name="tableStats5", direction = "vertical", style = "cursed-flow" })
			gui.tableStats5S = true
			gui.tableStats5.add({ type="label", name="stat5c1", caption = {"gui.stat5c1",{"bsc.stat5"},stats.explore.level}, style = "cursed-label" })
			gui.tableStats5.add({ type="label", name="stat5c2", caption = {"gui.stat5c2",math.ceil(stats.explore.exp),math.ceil(stats.explore.next),mix.round(100 * (class.multExplore + talents[1][8].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats5.add({type="progressbar", name="stat5c3", size=100, style = "cursed-progressbar"}).value = stats.explore.exp / stats.explore.next
			gui.tableStats5.add({ type="label", name="stat5c4", caption = {"gui.stat5c4",mix.round(stats.explore.level * datos.resExplore,2)}, style = "cursed-label" })
			gui.tableStats5.add({ type="label", name="stat5c5", caption = {"gui.stat5c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain6" then
		closeGui.closeAllStats(6,player)
		if gui.tableStats6S then
			if gui.tableStats6 ~= nil then
				gui.tableStats6.destroy()
			end
			gui.tableStats6S = false
			-- gui.frameStatsDet6.statsMain6.style = "cursed-button"
			gui.frameStatsDet6.statsMain6.caption = {"bsc.stat6"}
		else
			-- gui.frameStatsDet6.statsMain6.style = "cursed-button-clicked"
			gui.frameStatsDet6.statsMain6.caption = {"gui.clicked",{"bsc.stat6"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats6 = gui.frameStatsDet6.add({ type="flow", name="tableStats6", direction = "vertical", style = "cursed-flow" })
			gui.tableStats6S = true
			gui.tableStats6.add({ type="label", name="stat6c1", caption = {"gui.stat6c1",{"bsc.stat6"},stats.defence.level}, style = "cursed-label" })
			gui.tableStats6.add({ type="label", name="stat6c2", caption = {"gui.stat6c2",math.ceil(stats.defence.exp),math.ceil(stats.defence.next),mix.round(100 * (class.multDefence + talents[1][10].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats6.add({type="progressbar", name="stat6c3", size=100, style = "cursed-progressbar"}).value = stats.defence.exp / stats.defence.next
			gui.tableStats6.add({ type="label", name="stat6c4", caption = {"gui.stat6c4",mix.round(((stats.defence.level * datos.resDefence) / 100) * 60,2)}, style = "cursed-label" })
			gui.tableStats6.add({ type="label", name="stat6c5", caption = {"gui.stat6c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain7" then
		closeGui.closeAllStats(7,player)
		if gui.tableStats7S then
			if gui.tableStats7 ~= nil then
				gui.tableStats7.destroy()
			end
			gui.tableStats7S = false
			-- gui.frameStatsDet7.statsMain7.style = "cursed-button"
			gui.frameStatsDet7.statsMain7.caption = {"bsc.stat7"}
		else
			-- gui.frameStatsDet7.statsMain7.style = "cursed-button-clicked"
			gui.frameStatsDet7.statsMain7.caption = {"gui.clicked",{"bsc.stat7"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats7 = gui.frameStatsDet7.add({ type="flow", name="tableStats7", direction = "vertical", style = "cursed-flow" })
			gui.tableStats7S = true
			gui.tableStats7.add({ type="label", name="stat7c1", caption = {"gui.stat7c1",{"bsc.stat7"},stats.range.level}, style = "cursed-label" })
			gui.tableStats7.add({ type="label", name="stat7c2", caption = {"gui.stat7c2",math.ceil(stats.range.exp),math.ceil(stats.range.next),mix.round(100 * (class.multBow + talents[1][9].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats7.add({type="progressbar", name="stat7c3", size=100, style = "cursed-progressbar"}).value = stats.range.exp / stats.range.next
			gui.tableStats7.add({ type="label", name="stat7c4", caption = {"gui.stat7c4",math.floor(((stats.range.level ^ 2 * 0.0015+ stats.range.level * 0.35 ) / 2 + 4.8) * 100) / 100}, style = "cursed-label"})
			gui.tableStats7.add({ type="label", name="stat7c5", caption = {"gui.stat7c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain8" then
		closeGui.closeAllStats(8,player)
		if gui.tableStats8S then
			if gui.tableStats8 ~= nil then
				gui.tableStats8.destroy()
			end
			gui.tableStats8S = false
			-- gui.frameStatsDet8.statsMain8.style = "cursed-button"
			gui.frameStatsDet8.statsMain8.caption = {"bsc.stat8"}
		else
			-- gui.frameStatsDet8.statsMain8.style = "cursed-button-clicked"
			gui.frameStatsDet8.statsMain8.caption = {"gui.clicked",{"bsc.stat8"}}
			local stats = glob.cursed[player.name].stats
			local class = glob.cursed[player.name].class
			gui.tableStats8 = gui.frameStatsDet8.add({ type="flow", name="tableStats8", direction = "vertical", style = "cursed-flow" })
			gui.tableStats8S = true
			gui.tableStats8.add({ type="label", name="stat8c1", caption = {"gui.stat8c1",{"bsc.stat8"},stats.melee.level}, style = "cursed-label" })
			gui.tableStats8.add({ type="label", name="stat8c2", caption = {"gui.stat8c2",math.ceil(stats.melee.exp),math.ceil(stats.melee.next),mix.round(100 * (class.multSword - 1) * (talents[1][9].now / 40 + stats.general.level*datos.resGeneral),1)}, style = "cursed-label" })
			gui.tableStats8.add({type="progressbar", name="stat8c3", size=100}).value = stats.melee.exp / stats.melee.next
			gui.tableStats8.add({ type="label", name="stat8c4", caption = {"gui.stat8c4",mix.round(stats.melee.level * 0,2)}, style = "cursed-label" })
			gui.tableStats8.add({ type="label", name="stat8c5", caption = {"gui.stat8c5"}, style = "cursed-label" })
		end
	elseif name == "buildsMain1" then --Mines
		closeGui.closeAllBuilds(1,player)
		if gui.tableBuilds1S then
			if gui.tableBuilds1 ~= nil then
				gui.tableBuilds1.destroy()
			end
			gui.tableBuilds1S = false
			-- gui.frameBuildsDet1.buildsMain1.style = "cursed-button"
			gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		else
			-- gui.frameBuildsDet1.buildsMain1.style = "cursed-button-clicked"
			gui.frameBuildsDet1.buildsMain1.caption = {"gui.clicked",{"gui.buildsMain1"}}
			local mines = glob.cursed[player.name].mines
			local stats = glob.cursed[player.name].stats
			local num = 1
			gui.tableBuilds1 = gui.frameBuildsDet1.add({ type="flow", name="tableBuilds1", direction = "vertical", style = "cursed-flow" })
			gui.tableBuilds1S = true
			gui.tableMine = gui.tableBuilds1.add({ type="flow", name="tableMine", direction = "horizontal", style = "cursed-flow" })
			gui.tableMine.add({ type="button", name="builds1c1", caption = {"gui.builds1c1"}, style = "cursed-buttonMini" })
			gui.tableMine.add({ type="button", name="builds1c2", caption = mines[num].nick, style = "cursed-buttonVar" })
			gui.tableMine.add({ type="button", name="builds1c3", caption = {"gui.builds1c3"}, style = "cursed-buttonMini" })
			gui.tableBuilds1ID = gui.tableBuilds1.add({ type="table", name="tableBuilds1ID", colspan = 2, style = "cursed-table" })
			gui.tableBuilds1ID.add({ type="label", name="builds1c10", caption = {"gui.builds1c10"}, style = "cursed-label" })
			gui.tableBuilds1ID.add({ type="label", name="builds1c11", caption = num, style = "cursed-label" })
			gui.tableBuilds1Active = gui.tableBuilds1.add({ type="table", name="tableBuilds1Active", colspan = 2, style = "cursed-table2" })
			gui.tableBuilds1Active.add({ type="checkbox", name="builds1c7", caption = {"gui.builds1c7"}, state=mines[num].active, style = "cursed-checkbox" })
			gui.tableBuilds1Active.add({ type="label", name="builds1c4", caption = {"gui.builds1c4",mines[num].level}, style = "cursed-label" })
			if mines[num].entity and mines[num].entity.valid then
				gui.tableBuilds1.add({ type="label", name="builds1c8", caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}, style = "cursed-label" })
				gui.tableBuilds1.add({type="progressbar", name="builds1c9", size=100, style = "cursed-progressbar"}).value = mines[num].entity.health / (175 + mines[num].level * 25)
			else
				gui.tableBuilds1.add({ type="label", name="builds1c8", caption = {"gui.builds1c8",{"gui.plus"},{"gui.plus"}}, style = "cursed-label" })
				gui.tableBuilds1.add({type="progressbar", name="builds1c9", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableBuilds1.add({ type="label", name="builds1c5", caption = {"gui.builds1c5",math.ceil(mines[num].exp),math.ceil(mines[num].next),mix.round(100 * (talents[3][2].now * 0.01 + (stats.mining.level * 0.02)),2)}, style = "cursed-label" })
			if mines[num].exp > 0 then
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100, style = "cursed-progressbar"}).value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100, style = "cursed-progressbar"}).value = 0
			end
			if mines[num].entity == nil or (mines[num].entity ~= nil and not mines[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "mines" and rebuild.id == num then
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds1.add({ type="button", name="builds1c12", caption = {"gui.builds1c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds1.add({ type="button", name="builds1c13", caption = {"gui.builds1c13"}, style = "cursed-buttonInside2" })
			end
		end
	elseif name == "buildsMain2" then --Turrets
		closeGui.closeAllBuilds(2,player)
		if gui.tableBuilds2S then
			if gui.tableBuilds2 ~= nil then
				gui.tableBuilds2.destroy()
			end
			gui.tableBuilds2S = false
			-- gui.frameBuildsDet2.buildsMain2.style = "cursed-button"
			gui.frameBuildsDet2.buildsMain2.caption = {"gui.buildsMain2"}
		else
			-- gui.frameBuildsDet2.buildsMain2.style = "cursed-button-clicked"
			gui.frameBuildsDet2.buildsMain2.caption = {"gui.clicked",{"gui.buildsMain2"}}
			local turrets = glob.cursed[player.name].turrets
			local stats = glob.cursed[player.name].stats
			local num = 1
			gui.tableBuilds2 = gui.frameBuildsDet2.add({ type="flow", name="tableBuilds2", direction = "vertical", style = "cursed-flow" })
			gui.tableBuilds2S = true
			gui.tableTurret = gui.tableBuilds2.add({ type="flow", name="tableTurret", direction = "horizontal", style = "cursed-flow" })
			gui.tableTurret.add({ type="button", name="builds2c1", caption = {"gui.builds2c1"}, style = "cursed-buttonMini" })
			gui.tableTurret.add({ type="button", name="builds2c2", caption = turrets[num].nick, style = "cursed-buttonVar" })
			gui.tableTurret.add({ type="button", name="builds2c3", caption = {"gui.builds2c3"}, style = "cursed-buttonMini" })
			gui.tableBuilds2ID = gui.tableBuilds2.add({ type="table", name="tableBuilds2ID", colspan = 2, style = "cursed-table" })
			gui.tableBuilds2ID.add({ type="label", name="builds2c10", caption = {"gui.builds2c10"}, style = "cursed-label" })
			gui.tableBuilds2ID.add({ type="label", name="builds2c11", caption = num, style = "cursed-label" })
			gui.tableBuilds2Active = gui.tableBuilds2.add({ type="table", name="tableBuilds2Active", colspan = 2, style = "cursed-table2" })
			gui.tableBuilds2Active.add({ type="checkbox", name="builds2c7", caption = {"gui.builds2c7"}, state=turrets[num].active, style = "cursed-checkbox" })
			gui.tableBuilds2Active.add({ type="label", name="builds2c4", caption = {"gui.builds2c4",turrets[num].level}, style = "cursed-label" })
			if turrets[num].entity and turrets[num].entity.valid then
				gui.tableBuilds2.add({ type="label", name="builds2c8", caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}, style = "cursed-label" })
				gui.tableBuilds2.add({type="progressbar", name="builds2c9", size=100, style = "cursed-progressbar"}).value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			else
				gui.tableBuilds2.add({ type="label", name="builds2c8", caption = {"gui.builds2c8",{"gui.plus"},{"gui.plus"}}, style = "cursed-label" })
				gui.tableBuilds2.add({type="progressbar", name="builds2c9", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableBuilds2.add({ type="label", name="builds2c5", caption = {"gui.builds2c5",math.ceil(turrets[num].exp),math.ceil(turrets[num].next),mix.round(100 * ((talents[3][4].now * 0.01) + (stats.range.level * 0.02)),2)}, style = "cursed-label" })
			if turrets[num].exp > 0 then
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100, style = "cursed-progressbar"}).value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100, style = "cursed-progressbar"}).value = 0
			end
			if turrets[num].entity == nil or (turrets[num].entity ~= nil and not turrets[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "turrets" and rebuild.id == num then
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds2.add({ type="button", name="builds2c12", caption = {"gui.builds2c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds2.add({ type="button", name="builds2c13", caption = {"gui.builds2c13"}, style = "cursed-buttonInside2" })
			end
		end
	elseif name == "buildsMain3" then --Base
		closeGui.closeAllBuilds(3,player)
		if gui.tableBuilds3S then
			if gui.tableBuilds3 ~= nil then
				gui.tableBuilds3.destroy()
			end
			gui.tableBuilds3S = false
			-- gui.frameBuildsDet3.buildsMain3.style = "cursed-button"
			gui.frameBuildsDet3.buildsMain3.caption = {"gui.buildsMain3"}
		else
			-- gui.frameBuildsDet3.buildsMain3.style = "cursed-button-clicked"
			gui.frameBuildsDet3.buildsMain3.caption = {"gui.clicked",{"gui.buildsMain3"}}
			if player.character then
				local base = glob.cursed[player.name].aux.base
				gui.tableBuilds3 = gui.frameBuildsDet3.add({ type="flow", name="tableBuilds3", direction = "vertical", style = "cursed-flow" })
				gui.tableBuilds3S = true
				gui.tableBuilds3.add({ type="button", name="builds3c1", caption = {"gui.builds3c1"}, style = "cursed-buttonInside2" })
				gui.tableBuilds3.add({ type="label", name="builds3c2", caption = {"gui.builds3c2", math.floor(base.position.x), math.floor(base.position.y)}, style = "cursed-label" })
				gui.tableBuilds3.add({ type="label", name="builds3c3", caption = {"gui.builds3c3", math.floor(player.character.position.x), math.floor(player.character.position.y)}, style = "cursed-label" })
				gui.tableBuilds3CP = gui.tableBuilds3.add({ type="frame", name="builds3c4", style = "cursed-frame-compass" })
				gui.tableBuilds3CP.add({ type="button", name="builds3c5", style = "cursed-button-point" })
				gui.tableBuilds3.add({ type="button", name="builds3c6", caption = {"gui.builds3c6"}, style = "cursed-buttonInside2" })
				local A1 = {x = base.position.x - player.character.position.x , y = base.position.y - player.character.position.y}
				local A2 = {x = 1, y = 0}
				gui.tableBuilds3.builds3c3.caption = {"gui.builds3c3", math.floor(player.character.position.x), math.floor(player.character.position.y)}
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
	elseif name == "buildsMain4" then --Bodies
		closeGui.closeAllBuilds(4,player)
		if gui.tableBuilds4S then
			if gui.tableBuilds4 ~= nil then
				gui.tableBuilds4.destroy()
			end
			gui.tableBuilds4S = false
			-- gui.frameBuildsDet4.buildsMain4.style = "cursed-button"
			gui.frameBuildsDet4.buildsMain4.caption = {"gui.buildsMain4"}
		else
			-- gui.frameBuildsDet4.buildsMain4.style = "cursed-button-clicked"
			gui.frameBuildsDet4.buildsMain4.caption = {"gui.clicked",{"gui.buildsMain4"}}
			local bodies = glob.cursed[player.name].aux.bodies
			local num = glob.cursed[player.name].aux.bodynow
			gui.tableBuilds4 = gui.frameBuildsDet4.add({ type="flow", name="tableBuilds4", direction = "vertical", style = "cursed-flow" })
			gui.tableBuilds4S = true
			gui.tableBody = gui.tableBuilds4.add({ type="flow", name="tableBody", direction = "horizontal", style = "cursed-flow" })
			gui.tableBody.add({ type="button", name="builds4c1", caption = {"gui.builds4c1"}, style = "cursed-buttonMini" })
			gui.tableBody.add({ type="button", name="builds4c2", caption = bodies[num].nick, style = "cursed-buttonVar" })
			gui.tableBody.add({ type="button", name="builds4c3", caption = {"gui.builds4c3"}, style = "cursed-buttonMini" })
			gui.tableBuilds4ID = gui.tableBuilds4.add({ type="table", name="tableBuilds4ID", colspan = 2, style = "cursed-table" })
			gui.tableBuilds4ID.add({ type="label", name="builds4c7", caption = {"gui.builds4c7"}, style = "cursed-label" })
			gui.tableBuilds4ID.add({ type="label", name="builds4c8", caption = num, style = "cursed-label" })
			gui.tableBuilds4.add({ type="label", name="builds4c4", caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}, style = "cursed-label" })
			gui.tableBuilds4.add({type="progressbar", name="builds4c5", size=100, style = "cursed-progressbar"}).value = bodies[num].entity.health / bodies[num].maxhealth
			gui.tableBuilds4p = gui.tableBuilds4.add({ type="table", name="tableBuilds4p", colspan = 2, style = "cursed-table" })
			gui.tableBuilds4p.add({ type="button", name="builds4c6", caption = {"gui.builds4c6"}, style = "cursed-buttonInside3" })
			gui.tableBuilds4p.add({ type="button", name="builds4c9", caption = {"gui.builds4c9"}, style = "cursed-buttonMini" })
			if num == glob.cursed[player.name].aux.bodynow then gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} end
		end
	elseif name == "buildsMain5" then --Walls
		closeGui.closeAllBuilds(5,player)
		if gui.tableBuilds5S then
			if gui.tableBuilds5 ~= nil then
				gui.tableBuilds5.destroy()
			end
			gui.tableBuilds5S = false
			-- gui.frameBuildsDet5.buildsMain5.style = "cursed-button"
			gui.frameBuildsDet5.buildsMain5.caption = {"gui.buildsMain5"}
		else
			-- gui.frameBuildsDet5.buildsMain5.style = "cursed-button-clicked"
			gui.frameBuildsDet5.buildsMain5.caption = {"gui.clicked",{"gui.buildsMain5"}}
			local walls = glob.cursed[player.name].walls
			local stats = glob.cursed[player.name].stats
			local num = 1
			gui.tableBuilds5 = gui.frameBuildsDet5.add({ type="flow", name="tableBuilds5", direction = "vertical", style = "cursed-flow" })
			gui.tableBuilds5S = true
			gui.tableWall1 = gui.tableBuilds5.add({ type="flow", name="tableWall1", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall1.add({ type="button", name="builds5c1", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall1.add({ type="button", name="builds5c2", caption = walls[num].nick, style = "cursed-buttonVar" })
			gui.tableWall1.add({ type="button", name="builds5c3", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			gui.tableBuilds5ID = gui.tableBuilds5.add({ type="table", name="tableBuilds5ID", colspan = 2, style = "cursed-table" })
			gui.tableBuilds5ID.add({ type="label", name="builds5c4", caption = {"gui.builds5c4"}, style = "cursed-label" })
			gui.tableBuilds5ID.add({ type="label", name="builds5c5", caption = num, style = "cursed-label" })
			gui.tableBuilds5Active = gui.tableBuilds5.add({ type="table", name="tableBuilds5Active", colspan = 2, style = "cursed-table2" })
			gui.tableBuilds5Active.add({ type="checkbox", name="builds5c7", caption = {"gui.builds5c7"}, state=walls[num].active, style = "cursed-checkbox" })
			gui.tableBuilds5Active.add({ type="label", name="builds5c6", caption = {"gui.builds5c6",walls[num].level}, style = "cursed-label" })
			if walls[num].storage and walls[num].storage.valid then
				if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
					gui.tableBuilds5.add({ type="label", name="builds5c8", caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}, style = "cursed-label" })
					gui.tableBuilds5.add({type="progressbar", name="builds5c9", size=100, style = "cursed-progressbar"}).value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
				else
					gui.tableBuilds5.add({ type="label", name="builds5c8", caption = {"gui.builds5c8",0,walls[num].maxmass}, style = "cursed-label" })
					gui.tableBuilds5.add({type="progressbar", name="builds5c9", size=100, style = "cursed-progressbar"}).value = 0
				end
			else
				gui.tableBuilds5.add({ type="label", name="builds5c8", caption = {"gui.builds5c8",{"gui.plus"},{"gui.plus"}}, style = "cursed-label" })
				gui.tableBuilds5.add({type="progressbar", name="builds5c9", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableBuilds5.add({ type="label", name="builds5c26", caption = {"gui.builds5c26",math.ceil(walls[num].exp),math.ceil(walls[num].next),mix.round(100 * (talents[3][6].now * 0.01 + stats.defence.level * 0.02),2)}, style = "cursed-label" })
			if walls[num].exp > 0 then
				gui.tableBuilds5.add({type="progressbar", name="builds5c27", size=100, style = "cursed-progressbar"}).value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.add({type="progressbar", name="builds5c27", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableWall2 = gui.tableBuilds5.add({ type="table", name="tableWall2", colspan = 4, style = "cursed-table" })
			gui.tableWall2.add({ type="label", name="builds5c10", caption = {"gui.builds5c10"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c11", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="button", name="builds5c12", caption = #walls[num].sides.wallxp, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c13", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall2.add({ type="checkbox", name="builds5c28", caption = {"gui.builds5c28"}, state=walls[num].gate.xp, style = "cursed-checkbox" })
			-- gui.tableWall3 = gui.tableBuilds5.add({ type="flow", name="tableWall3", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c14", caption = {"gui.builds5c14"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c15", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="button", name="builds5c16", caption = #walls[num].sides.wallxn, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c17", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall2.add({ type="checkbox", name="builds5c29", caption = {"gui.builds5c28"}, state=walls[num].gate.xn, style = "cursed-checkbox" })
			-- gui.tableWall4 = gui.tableBuilds5.add({ type="flow", name="tableWall4", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c18", caption = {"gui.builds5c18"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c19", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="button", name="builds5c20", caption = #walls[num].sides.wallyp, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c21", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall2.add({ type="checkbox", name="builds5c30", caption = {"gui.builds5c28"}, state=walls[num].gate.yp, style = "cursed-checkbox" })
			-- gui.tableWall5 = gui.tableBuilds5.add({ type="flow", name="tableWall5", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c22", caption = {"gui.builds5c22"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c23", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="button", name="builds5c24", caption = #walls[num].sides.wallyn, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c25", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall2.add({ type="checkbox", name="builds5c31", caption = {"gui.builds5c28"}, state=walls[num].gate.yn, style = "cursed-checkbox" })
			
			-- gui.tableBuilds5.add({ type="label", name="builds4c4", caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}, style = "cursed-label" })
			-- gui.tableBuilds5.add({type="progressbar", name="builds4c5", size=100, style = "cursed-progressbar"}).value = bodies[num].entity.health / bodies[num].maxhealth
			-- gui.tableBuilds4p = gui.tableBuilds4.add({ type="table", name="tableBuilds4p", colspan = 2, style = "cursed-table" })
			-- gui.tableBuilds4p.add({ type="button", name="builds4c6", caption = {"gui.builds4c6"}, style = "cursed-buttonInside3" })
			-- gui.tableBuilds4p.add({ type="button", name="builds4c9", caption = {"gui.builds4c9"}, style = "cursed-buttonMini" })
			-- if num == glob.cursed[player.name].aux.bodynow then gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} end
			if walls[num].storage == nil or (walls[num].storage ~= nil and not walls[num].storage.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "walls" and rebuild.id == num then
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds5.add({ type="button", name="builds5c29", caption = {"gui.builds5c29"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds5.add({ type="button", name="builds5c30", caption = {"gui.builds5c30"}, style = "cursed-buttonInside2" })
			end
		end
	elseif name == "buildsMain6" then --Fishers
		closeGui.closeAllBuilds(6,player)
		if gui.tableBuilds6S then
			if gui.tableBuilds6 ~= nil then
				gui.tableBuilds6.destroy()
			end
			gui.tableBuilds6S = false
			-- gui.frameBuildsDet6.buildsMain6.style = "cursed-button"
			gui.frameBuildsDet6.buildsMain6.caption = {"gui.buildsMain6"}
		else
			-- gui.frameBuildsDet6.buildsMain6.style = "cursed-button-clicked"
			gui.frameBuildsDet6.buildsMain6.caption = {"gui.clicked",{"gui.buildsMain6"}}
			local fishers = glob.cursed[player.name].fishers
			local stats = glob.cursed[player.name].stats
			local num = 1
			gui.tableBuilds6 = gui.frameBuildsDet6.add({ type="flow", name="tableBuilds6", direction = "vertical", style = "cursed-flow" })
			gui.tableBuilds6S = true
			gui.tableFishers = gui.tableBuilds6.add({ type="flow", name="tableFishers", direction = "horizontal", style = "cursed-flow" })
			gui.tableFishers.add({ type="button", name="builds6c1", caption = {"gui.builds6c1"}, style = "cursed-buttonMini" })
			gui.tableFishers.add({ type="button", name="builds6c2", caption = fishers[num].nick, style = "cursed-buttonVar" })
			gui.tableFishers.add({ type="button", name="builds6c3", caption = {"gui.builds6c3"}, style = "cursed-buttonMini" })
			gui.tableBuilds6ID = gui.tableBuilds6.add({ type="table", name="tableBuilds6ID", colspan = 2, style = "cursed-table" })
			gui.tableBuilds6ID.add({ type="label", name="builds6c10", caption = {"gui.builds6c10"}, style = "cursed-label" })
			gui.tableBuilds6ID.add({ type="label", name="builds6c11", caption = num, style = "cursed-label" })
			gui.tableBuilds6Active = gui.tableBuilds6.add({ type="table", name="tableBuilds6Active", colspan = 2, style = "cursed-table2" })
			gui.tableBuilds6Active.add({ type="checkbox", name="builds6c7", caption = {"gui.builds6c7"}, state=fishers[num].active, style = "cursed-checkbox" })
			gui.tableBuilds6Active.add({ type="label", name="builds6c4", caption = {"gui.builds6c4",fishers[num].level}, style = "cursed-label" })
			if fishers[num].entity and fishers[num].entity.valid then
				gui.tableBuilds6.add({ type="label", name="builds6c8", caption = {"gui.builds6c8",math.ceil(fishers[num].entity.health),(175 + fishers[num].level * 25) / 2}, style = "cursed-label" })
				gui.tableBuilds6.add({type="progressbar", name="builds6c9", size=100, style = "cursed-progressbar"}).value = fishers[num].entity.health / ((175 + fishers[num].level * 25) / 2)
			else
				gui.tableBuilds6.add({ type="label", name="builds6c8", caption = {"gui.builds6c8",{"gui.plus"},{"gui.plus"}}, style = "cursed-label" })
				gui.tableBuilds6.add({type="progressbar", name="builds6c9", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableBuilds6.add({ type="label", name="builds6c5", caption = {"gui.builds6c5",math.ceil(fishers[num].exp),math.ceil(fishers[num].next),mix.round(100 * (talents[3][8].now * 0.01 + (stats.explore.level * 0.02)),2)}, style = "cursed-label" })
			if fishers[num].exp > 0 then
				gui.tableBuilds6.add({type="progressbar", name="builds6c6", size=100, style = "cursed-progressbar"}).value = fishers[num].exp / fishers[num].next
			else
				gui.tableBuilds6.add({type="progressbar", name="builds6c6", size=100, style = "cursed-progressbar"}).value = 0
			end
			if fishers[num].entity == nil or (fishers[num].entity ~= nil and not fishers[num].entity.valid) then
				local rebuild = glob.cursed[player.name].aux.rebuild
				if rebuild and rebuild.name == "fishers" and rebuild.id == num then
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12c"}, style = "cursed-buttonInside2" })
				else
					gui.tableBuilds6.add({ type="button", name="builds6c12", caption = {"gui.builds6c12"}, style = "cursed-buttonInside2" })
				end
				gui.tableBuilds6.add({ type="button", name="builds6c13", caption = {"gui.builds6c13"}, style = "cursed-buttonInside2" })
			end
		end
	end
end

function changeNick(build,player)
	local gui = glob.cursed[player.name].gui
	if build == "mine" then
		if gui.changeNick1S then
			if gui.changeNick1 ~= nil then
				gui.changeNick1.destroy()
			end
			gui.changeNick1S = false
		else
			gui.changeNick1 = player.gui.center.add({ type="flow", name="changeNick1", direction="vertical" })
			gui.changeNick1S = true
			local framechangeNick1 = gui.changeNick1.add({ type="frame", name="changeNick1f1", direction = "vertical" })
			gui.changeNick1t = framechangeNick1.add({ type="textfield", name="changeNick1t", text=""})
			local framechangeNick1Buttons = framechangeNick1.add({ type="flow", name="changeNick1Buttons",direction="horizontal" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b1", caption = {"gui.changeNickb1"} })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b2", caption = {"gui.changeNickb2"} })
		end
	elseif build == "turret" then
		if gui.changeNick2S then
			if gui.changeNick2 ~= nil then
				gui.changeNick2.destroy()
			end
			gui.changeNick2S = false
		else
			gui.changeNick2 = player.gui.center.add({ type="flow", name="changeNick2", direction="vertical" })
			gui.changeNick2S = true
			local framechangeNick2 = gui.changeNick2.add({ type="frame", name="changeNick2f1", direction = "vertical" })
			gui.changeNick2t = framechangeNick2.add({ type="textfield", name="changeNick2t", text=""})
			local framechangeNick2Buttons = framechangeNick2.add({ type="flow", name="changeNick2Buttons",direction="horizontal" })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b1", caption = {"gui.changeNickb1"} })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b2", caption = {"gui.changeNickb2"} })
		end
	elseif build == "body" then
		if gui.changeNick4S then
			if gui.changeNick4 ~= nil then
				gui.changeNick4.destroy()
			end
			gui.changeNick4S = false
		else
			gui.changeNick4 = player.gui.center.add({ type="flow", name="changeNick4", direction="vertical" })
			gui.changeNick4S = true
			local framechangeNick4 = gui.changeNick4.add({ type="frame", name="changeNick4f1", direction = "vertical" })
			gui.changeNick4t = framechangeNick4.add({ type="textfield", name="changeNick4t", text=""})
			local framechangeNick4Buttons = framechangeNick4.add({ type="flow", name="changeNick4Buttons",direction="horizontal" })
			framechangeNick4Buttons.add({ type="button", name="changeNick4b1", caption = {"gui.changeNickb1"} })
			framechangeNick4Buttons.add({ type="button", name="changeNick4b2", caption = {"gui.changeNickb2"} })
		end
	elseif build == "wall" then
		if gui.changeNick5S then
			if gui.changeNick5 ~= nil then
				gui.changeNick5.destroy()
			end
			gui.changeNick5S = false
		else
			gui.changeNick5 = player.gui.center.add({ type="flow", name="changeNick5", direction="vertical" })
			gui.changeNick5S = true
			local framechangeNick5 = gui.changeNick5.add({ type="frame", name="changeNick5f1", direction = "vertical" })
			gui.changeNick5t = framechangeNick5.add({ type="textfield", name="changeNick5t", text=""})
			local framechangeNick5Buttons = framechangeNick5.add({ type="flow", name="changeNick5Buttons",direction="horizontal" })
			framechangeNick5Buttons.add({ type="button", name="changeNick5b1", caption = {"gui.changeNickb1"} })
			framechangeNick5Buttons.add({ type="button", name="changeNick5b2", caption = {"gui.changeNickb2"} })
		end
	elseif build == "fisher" then
		if gui.changeNick6S then
			if gui.changeNick6 ~= nil then
				gui.changeNick6.destroy()
			end
			gui.changeNick6S = false
		else
			gui.changeNick6 = player.gui.center.add({ type="flow", name="changeNick6", direction="vertical" })
			gui.changeNick6S = true
			local framechangeNick6 = gui.changeNick6.add({ type="frame", name="changeNick6f1", direction = "vertical" })
			gui.changeNick6t = framechangeNick6.add({ type="textfield", name="changeNick6t", text=""})
			local framechangeNick6Buttons = framechangeNick6.add({ type="flow", name="changeNick6Buttons",direction="horizontal" })
			framechangeNick6Buttons.add({ type="button", name="changeNick6b1", caption = {"gui.changeNickb1"} })
			framechangeNick6Buttons.add({ type="button", name="changeNick6b2", caption = {"gui.changeNickb2"} })
		end
	end
end

function globalPrint(text)
	local players = game.players
	for i=1, #players do
		players[i].print(text)
	end
end

function searchPipe(pipe)
	local cursed = glob.cursed
	for k,v in pairs(cursed) do
		if k ~= "others" then
			local walls = v.walls
			for i = 1, #walls do
				for pos,sides in pairs(walls[i].sides) do
					for j = 1, #sides do
						if sides[j] and sides[j].equals(pipe) then
							return {k,i,pos,j,sides[j]}
						end
					end
				end
			end
		end
	end
end