-- module(..., package.seeall)
require("defines")

function resetgui(player,destroyonly)
	if player then
		local gui = glob.cursed[player.name].gui
		if gui and player.gui.left.flowMain then
			-- closeAllTalents(-1,player)
			-- closeAllStats(-1,player)
			-- closeAllBuilds(-1,player)
			closeAllMain(-1,player)
			if player.gui.left.flowMain ~= nil then
				gui.flowMain.destroy()
			end
		else
			if destroyonly then
				gui = nil
			else
				gui = {}
			end
		end
		if not destroyonly then
			gui.flowMain = player.gui.left.add({ type="flow", name="flowMain", direction="horizontal", style = "cursed-flow" })
			gui.flowClosed = gui.flowMain.add({ type="flow", name="flowClosed", direction = "vertical", style = "cursed-flow" })
			gui.flowClosed.add({ type="button", name="closeMain", style = "cursed-buttonClosed" })
			
			-- gui.frameMain = gui.flowMain.add({ type="frame", name="frameMain", direction = "vertical", style = "cursed-frame" })
			-- gui.frameMainS = true
			-- gui.flowMain2 = gui.frameMain.add({ type="flow", name="flowMain2", direction = "vertical", style = "cursed-flow" })
			-- gui.tableMain = gui.flowMain2.add({type = "table", name = "tableMain", colspan = 2, style = "cursed-table2"})
			-- gui.tableMain.add({ type="label", name="main", caption = {"gui.main"}, style = "cursed-label-bold" })
			-- gui.tableMain.add({ type="button", name="closeMain", style = "cursed-buttonMini2" })
			-- gui.flowMain2.add({ type="button", name="talentsMain", caption = {"gui.talentsMain"}, style = "cursed-button" })
			-- gui.flowMain2.add({ type="button", name="statsMain", caption = {"gui.statsMain"}, style = "cursed-button" })
			-- gui.flowMain2.add({ type="button", name="buildsMain", caption = {"gui.buildsMain"}, style = "cursed-button" })
			-- gui.flowMain2.add({ type="button", name="vaultMain", caption = {"gui.vaultMain"}, style = "cursed-button" })
			-- gui.flowMain2.add({ type="button", name="optionsMain", caption = {"gui.optionsMain"}, style = "cursed-button" })
			glob.cursed[player.name].gui = gui
		end
	else
		for _,v in ipairs(game.players) do
			if v.character ~= nil then
				local gui = glob.cursed[v.name].gui
				if gui and v.gui.left.flowMain then
					-- closeAllTalents(-1,v)
					-- closeAllStats(-1,v)
					-- closeAllBuilds(-1,v)
					closeAllMain(-1,v)
					if v.gui.left.flowMain ~= nil then
						gui.flowMain.destroy()
					end
				else
					if destroyonly then
						gui = nil
					else
						gui = {}
					end
				end
				if not destroyonly then
					gui.flowMain = player.gui.left.add({ type="flow", name="flowMain", direction="horizontal", style = "cursed-flowMain" })
					gui.frameClosed = gui.flowMain.add({ type="frame", name="frameClosed", direction = "vertical", style = "cursed-frame" })
					gui.frameClosed.add({ type="button", name="closeMain", style = "cursed-buttonMini2" })
					
					-- gui.flowMainS = true
					-- gui.frameMain = gui.flowMain.add({ type="frame", name="frameMain", direction = "vertical", style = "cursed-frameMain" })
					-- gui.flowMain2 = gui.frameMain.add({ type="flow", name="flowMain2", direction = "vertical", style = "cursed-flowMain" })
					-- gui.flowMain2.add({ type="label", name="main", caption = {"gui.main"}, style = "cursed-label-bold" })
					-- gui.flowMain2.add({ type="button", name="talentsMain", caption = {"gui.talentsMain"}, style = "cursed-buttonMain" })
					-- gui.flowMain2.add({ type="button", name="statsMain", caption = {"gui.statsMain"}, style = "cursed-buttonMain" })
					-- gui.flowMain2.add({ type="button", name="buildsMain", caption = {"gui.buildsMain"}, style = "cursed-buttonMain" })
					-- gui.flowMain2.add({ type="button", name="vaultMain", caption = {"gui.vaultMain"}, style = "cursed-buttonMain" })
					-- gui.flowMain2.add({ type="button", name="optionsMain", caption = {"gui.optionsMain"}, style = "cursed-buttonMain" })
					glob.cursed[player.name].gui = gui
				end
			end
		end
	end
end

function clickgui(event)
	local player = game.getplayer(event.element.playerindex)
	if player.gui.left.flowMain then
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
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
		if event.element.name == "closeMain" then
			guiFlipFlop("closeMain",player)
		elseif event.element.name == "talentsMain" then
			guiFlipFlop("talentsMain",player)
		elseif event.element.name == "statsMain" then
			guiFlipFlop("statsMain",player)
		elseif event.element.name == "buildsMain" then
			guiFlipFlop("buildsMain",player)
		elseif event.element.name == "vaultMain" then
			if player.cursorstack then
				player.print({"msg.cursed", {"msg.cursorstack"}})
			else
				local vaultentity = glob.cursed[player.name].aux.vaultentity
				local cant = player.getitemcount("cursed-vault")
				if vaultentity == nil and cant == 0 then
					player.cursorstack = {name="cursed-vault", count=1}
				end
			end
		elseif event.element.name == "optionsMain" then
			guiFlipFlop("optionsMain",player)
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
		elseif event.element.name == "talent1c1" then
			if (talents[1][1].now < talents[1][1].max) then
				if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
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
			local max = player.getitemcount("cursed-talent-1")
			if max > talents[1][1].max - talents[1][1].now then max = talents[1][1].max - talents[1][1].now end
			if max > 0 then
			player.removeitem({name="cursed-talent-1", count=max})
			gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
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
				if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
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
			local max = player.getitemcount("cursed-talent-1")
			if max > talents[1][2].max - talents[1][2].now then max = talents[1][2].max - talents[1][2].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
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
				if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
					removeAxes(player)
					player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					talents[1][3].now = talents[1][3].now + 1
					gui.tableTalents1.talent1c3.caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}
				end
			end
		elseif event.element.name == "talent1c3p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > talents[1][3].max - talents[1][3].now then max = talents[1][3].max - talents[1][3].now end
			if max > 0 then
					player.removeitem({name="cursed-talent-1", count=max})
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
					removeAxes(player)
					player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					talents[1][3].now = talents[1][3].now + max
					gui.tableTalents1.talent1c3.caption = {"gui.talent1c3",talents[1][3].now,talents[1][3].max}
			end
		elseif event.element.name == "talent1c4" then
			if (talents[1][4].now < talents[1][4].max) then
				if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
					removeArmors(player)
					player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					talents[1][4].now = talents[1][4].now + 1
					gui.tableTalents1.talent1c4.caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}
				end
			end
		elseif event.element.name == "talent1c4p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > talents[1][4].max - talents[1][4].now then max = talents[1][4].max - talents[1][4].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				removeArmors(player)
				player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
				talents[1][4].now = talents[1][4].now + max
				gui.tableTalents1.talent1c4.caption = {"gui.talent1c4",talents[1][4].now,talents[1][4].max}
			end
		elseif event.element.name == "talent1c5" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][5].now = talents[1][5].now + 1
				gui.tableTalents1.talent1c5.caption = {"gui.talent1c5",talents[1][5].now,"-"}
			end
		elseif event.element.name == "talent1c5p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][5].now = talents[1][5].now + max
				gui.tableTalents1.talent1c5.caption = {"gui.talent1c5",talents[1][5].now,"-"}
			end
		elseif event.element.name == "talent1c6" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][6].now = talents[1][6].now + 1
				gui.tableTalents1.talent1c6.caption = {"gui.talent1c6",talents[1][6].now,"-"}
			end
		elseif event.element.name == "talent1c6p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][6].now = talents[1][6].now + max
				gui.tableTalents1.talent1c6.caption = {"gui.talent1c6",talents[1][6].now,"-"}
			end
		elseif event.element.name == "talent1c7" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][7].now = talents[1][7].now + 1
				gui.tableTalents1.talent1c7.caption = {"gui.talent1c7",talents[1][7].now,"-"}
			end
		elseif event.element.name == "talent1c7p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][7].now = talents[1][7].now + max
				gui.tableTalents1.talent1c7.caption = {"gui.talent1c7",talents[1][7].now,"-"}
			end
		elseif event.element.name == "talent1c8" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][8].now = talents[1][8].now + 1
				gui.tableTalents1.talent1c8.caption = {"gui.talent1c8",talents[1][8].now,"-"}
			end
		elseif event.element.name == "talent1c8p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][8].now = talents[1][8].now + max
				gui.tableTalents1.talent1c8.caption = {"gui.talent1c8",talents[1][8].now,"-"}
			end
		elseif event.element.name == "talent1c9" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][9].now = talents[1][9].now + 1
				gui.tableTalents1.talent1c9.caption = {"gui.talent1c9",talents[1][9].now,"-"}
			end
		elseif event.element.name == "talent1c9p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][9].now = talents[1][9].now + max
				gui.tableTalents1.talent1c9.caption = {"gui.talent1c9",talents[1][9].now,"-"}
			end
		elseif event.element.name == "talent1c10" then
			if (player.removeitem({name="cursed-talent-1", count=1}) >= 1) then
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][10].now = talents[1][10].now + 1
				gui.tableTalents1.talent1c10.caption = {"gui.talent1c10",talents[1][10].now,"-"}
			end
		elseif event.element.name == "talent1c10p" then
			local max = player.getitemcount("cursed-talent-1")
			if max > 0 then
				player.removeitem({name="cursed-talent-1", count=max})
				gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
				talents[1][10].now = talents[1][10].now + max
				gui.tableTalents1.talent1c10.caption = {"gui.talent1c10",talents[1][10].now,"-"}
			end
		elseif event.element.name == "talent2c1" then
			if (talents[2][1].now < talents[2][1].max) then
				if (player.removeitem({name="cursed-talent-2", count=1}) >= 1) then
					gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
					talents[2][1].now = talents[2][1].now + 1
					removeAxes(player)
					player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					gui.tableTalents2.talent2c1.caption = {"gui.talent2c1",talents[2][1].now,talents[2][1].max}
				end
			end
		elseif event.element.name == "talent2c1p" then
			local max = player.getitemcount("cursed-talent-2")
			if max > talents[2][1].max - talents[2][1].now then max = talents[2][1].max - talents[2][1].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-2", count=max})
				gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
				talents[2][1].now = talents[2][1].now + max
				removeAxes(player)
				player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
				gui.tableTalents2.talent2c1.caption = {"gui.talent2c1",talents[2][1].now,talents[2][1].max}
			end
		elseif event.element.name == "talent2c2" then
			if (talents[2][2].now < talents[2][2].max) then
				if (player.removeitem({name="cursed-talent-2", count=1}) >= 1) then
					gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
					talents[2][2].now = talents[2][2].now + 1
					removeArmors(player)
					player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					gui.tableTalents2.talent2c2.caption = {"gui.talent2c2",talents[2][2].now,talents[2][2].max}
				end
			end
		elseif event.element.name == "talent2c2p" then
			local max = player.getitemcount("cursed-talent-2")
			if max > talents[2][2].max - talents[2][2].now then max = talents[2][2].max - talents[2][2].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-2", count=max})
				gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
				talents[2][2].now = talents[2][2].now + max
				removeArmors(player)
				player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
				gui.tableTalents2.talent2c2.caption = {"gui.talent2c2",talents[2][2].now,talents[2][2].max}
			end
		elseif event.element.name == "talent2c3" then
			if (talents[2][3].now < talents[2][3].max) then
				if (player.removeitem({name="cursed-talent-2", count=1}) >= 1) then
					gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
					talents[2][3].now = talents[2][3].now + 1
					removeBows(player)
					player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
					gui.tableTalents2.talent2c3.caption = {"gui.talent2c3",talents[2][3].now,talents[2][3].max}
				end
			end
		elseif event.element.name == "talent2c3p" then
			local max = player.getitemcount("cursed-talent-2")
			if max > talents[2][3].max - talents[2][3].now then max = talents[2][3].max - talents[2][3].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-2", count=max})
				gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
				talents[2][3].now = talents[2][3].now + max
				removeBows(player)
				player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
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
				if (player.removeitem({name="cursed-talent-3", count=1}) >= 1) then
					gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
					talents[3][1].now = talents[3][1].now + 1
					local mines = glob.cursed[player.name].mines
					local cant = talents[3][1].now - (#mines + player.getitemcount("cursed-drill-1"))
					if cant > 0 then
						player.character.insert({name="cursed-drill-1",count= cant})
					end
					gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
				end
			end
		elseif event.element.name == "talent3c1p" then
			local max = player.getitemcount("cursed-talent-3")
			if max > talents[3][1].max - talents[3][1].now then max = talents[3][1].max - talents[3][1].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-3", count=max})
				gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
				talents[3][1].now = talents[3][1].now + max
				local mines = glob.cursed[player.name].mines
				local cant = talents[3][1].now - (#mines + player.getitemcount("cursed-drill-1"))
				if cant > 0 then
					player.character.insert({name="cursed-drill-1",count= cant})
				end
				gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
			end
		elseif event.element.name == "talent3c2" then
			if (talents[3][2].now < talents[3][2].max) then
				if (player.removeitem({name="cursed-talent-3", count=1}) >= 1) then
					gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
					talents[3][2].now = talents[3][2].now + 1
					talents[3][1].max = math.floor(talents[3][2].now / 5) + 2
					gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
					gui.tableTalents3.talent3c2.caption = {"gui.talent3c2",talents[3][2].now,talents[3][2].max}
				end
			end
		elseif event.element.name == "talent3c2p" then
			local max = player.getitemcount("cursed-talent-3")
			if max > talents[3][2].max - talents[3][2].now then max = talents[3][2].max - talents[3][2].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-3", count=max})
				gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
				talents[3][2].now = talents[3][2].now + max
				talents[3][1].max = math.floor(talents[3][2].now / 5) + 2
				gui.tableTalents3.talent3c1.caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}
				gui.tableTalents3.talent3c2.caption = {"gui.talent3c2",talents[3][2].now,talents[3][2].max}
			end
		elseif event.element.name == "talent3c3" then
			if (talents[3][3].now < talents[3][3].max) then
				if (player.removeitem({name="cursed-talent-3", count=1}) >= 1) then
					gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
					talents[3][3].now = talents[3][3].now + 1
					local turrets = glob.cursed[player.name].turrets
					local cant = talents[3][3].now - (#turrets + player.getitemcount("cursed-turret-1"))
					if cant > 0 then
						player.character.insert({name="cursed-turret-1",count= cant})
					end
					gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
				end
			end
		elseif event.element.name == "talent3c3p" then
			local max = player.getitemcount("cursed-talent-3")
			if max > talents[3][3].max - talents[3][3].now then max = talents[3][3].max - talents[3][3].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-3", count=max})
				gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
				player.character.insert({name="cursed-turret-1",count=max})
				talents[3][3].now = talents[3][3].now + max
				local turrets = glob.cursed[player.name].turrets
				local cant = talents[3][3].now - (#turrets + player.getitemcount("cursed-turret-1"))
				if cant > 0 then
					player.character.insert({name="cursed-turret-1",count= cant})
				end
				gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
			end
		elseif event.element.name == "talent3c4" then
			if (talents[3][4].now < talents[3][4].max) then
				if (player.removeitem({name="cursed-talent-3", count=1}) >= 1) then
					gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
					talents[3][4].now = talents[3][4].now + 1
					talents[3][3].max = math.floor(talents[3][4].now / 5) + 2
					gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
					gui.tableTalents3.talent3c4.caption = {"gui.talent3c4",talents[3][4].now,talents[3][4].max}
				end
			end
		elseif event.element.name == "talent3c4p" then
			local max = player.getitemcount("cursed-talent-3")
			if max > talents[3][4].max - talents[3][4].now then max = talents[3][4].max - talents[3][4].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-3", count=max})
				gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
				talents[3][4].now = talents[3][4].now + max
				talents[3][3].max = math.floor(talents[3][4].now / 5) + 2
				gui.tableTalents3.talent3c3.caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}
				gui.tableTalents3.talent3c4.caption = {"gui.talent3c4",talents[3][4].now,talents[3][4].max}
			end
		elseif event.element.name == "talent4c1" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][1].now = talents[4][1].now + 1
				gui.tableTalents4.talent4c1.caption = {"gui.talent4c1",talents[4][1].now,"-"}
			end
		elseif event.element.name == "talent4c1p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][1].now = talents[4][1].now + max
				gui.tableTalents4.talent4c1.caption = {"gui.talent4c1",talents[4][1].now,"-"}
			end
		elseif event.element.name == "talent4c2" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][2].now = talents[4][2].now + 1
				gui.tableTalents4.talent4c2.caption = {"gui.talent4c2",talents[4][2].now,"-"}
			end
		elseif event.element.name == "talent4c2p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][2].now = talents[4][2].now + max
				gui.tableTalents4.talent4c2.caption = {"gui.talent4c2",talents[4][2].now,"-"}
			end
		elseif event.element.name == "talent4c3" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][3].now = talents[4][3].now + 1
				gui.tableTalents4.talent4c3.caption = {"gui.talent4c3",talents[4][3].now,"-"}
			end
		elseif event.element.name == "talent4c3p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][3].now = talents[4][3].now + max
				gui.tableTalents4.talent4c3.caption = {"gui.talent4c3",talents[4][3].now,"-"}
			end
		elseif event.element.name == "talent4c4" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][4].now = talents[4][4].now + 1
				gui.tableTalents4.talent4c4.caption = {"gui.talent4c4",talents[4][4].now,"-"}
			end
		elseif event.element.name == "talent4c4p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][4].now = talents[4][4].now + max
				gui.tableTalents4.talent4c4.caption = {"gui.talent4c4",talents[4][4].now,"-"}
			end
		elseif event.element.name == "talent4c5" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][5].now = talents[4][5].now + 1
				gui.tableTalents4.talent4c5.caption = {"gui.talent4c5",talents[4][5].now,"-"}
			end
		elseif event.element.name == "talent4c5p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][5].now = talents[4][5].now + max
				gui.tableTalents4.talent4c5.caption = {"gui.talent4c5",talents[4][5].now,"-"}
			end
		elseif event.element.name == "talent4c6" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][6].now = talents[4][6].now + 1
				gui.tableTalents4.talent4c6.caption = {"gui.talent4c6",talents[4][6].now,"-"}
			end
		elseif event.element.name == "talent4c6p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][6].now = talents[4][6].now + max
				gui.tableTalents4.talent4c6.caption = {"gui.talent4c6",talents[4][6].now,"-"}
			end
		elseif event.element.name == "talent4c7" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][7].now = talents[4][7].now + 1
				gui.tableTalents4.talent4c7.caption = {"gui.talent4c7",talents[4][7].now,"-"}
			end
		elseif event.element.name == "talent4c7p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][7].now = talents[4][7].now + max
				gui.tableTalents4.talent4c7.caption = {"gui.talent4c7",talents[4][7].now,"-"}
			end
		elseif event.element.name == "talent4c8" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][8].now = talents[4][8].now + 1
				gui.tableTalents4.talent4c8.caption = {"gui.talent4c8",talents[4][8].now,"-"}
			end
		elseif event.element.name == "talent4c8p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][8].now = talents[4][8].now + max
				gui.tableTalents4.talent4c8.caption = {"gui.talent4c8",talents[4][8].now,"-"}
			end
		elseif event.element.name == "talent4c9" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][9].now = talents[4][9].now + 1
				gui.tableTalents4.talent4c9.caption = {"gui.talent4c9",talents[4][9].now,"-"}
			end
		elseif event.element.name == "talent4c9p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][9].now = talents[4][9].now + max
				gui.tableTalents4.talent4c9.caption = {"gui.talent4c9",talents[4][9].now,"-"}
			end
		elseif event.element.name == "talent4c10" then
			if (player.removeitem({name="cursed-talent-4", count=1}) >= 1) then
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][10].now = talents[4][10].now + 1
				gui.tableTalents4.talent4c10.caption = {"gui.talent4c10",talents[4][10].now,"-"}
			end
		elseif event.element.name == "talent4c10p" then
			local max = player.getitemcount("cursed-talent-4")
			if max > 0 then
				player.removeitem({name="cursed-talent-4", count=max})
				gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
				talents[4][10].now = talents[4][10].now + max
				gui.tableTalents4.talent4c10.caption = {"gui.talent4c10",talents[4][10].now,"-"}
			end
		elseif event.element.name == "talent5c4" then
			if (player.removeitem({name="cursed-talent-5", count=1}) >= 1) then
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][4].now = talents[5][4].now + 1
				gui.tableTalents5.talent5c4.caption = {"gui.talent5c4",talents[5][4].now,"-"}
			end
		elseif event.element.name == "talent5c4p" then
			local max = player.getitemcount("cursed-talent-5")
			if max > 0 then
				player.removeitem({name="cursed-talent-5", count=max})
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][4].now = talents[5][4].now + max
				gui.tableTalents5.talent5c4.caption = {"gui.talent5c4",talents[5][4].now,"-"}
			end
		elseif event.element.name == "talent5c6" then
			if (player.removeitem({name="cursed-talent-5", count=1}) >= 1) then
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][6].now = talents[5][6].now + 1
				gui.tableTalents5.talent5c6.caption = {"gui.talent5c6",talents[5][6].now,"-"}
			end
		elseif event.element.name == "talent5c6p" then
			local max = player.getitemcount("cursed-talent-5")
			if max > 0 then
				player.removeitem({name="cursed-talent-5", count=max})
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][6].now = talents[5][6].now + max
				gui.tableTalents5.talent5c6.caption = {"gui.talent5c6",talents[5][6].now,"-"}
			end
		elseif event.element.name == "talent5c7" then
			if (talents[5][7].now < talents[5][7].max) then
				if (player.removeitem({name="cursed-talent-5", count=1}) >= 1) then
					gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
					talents[5][7].now = talents[5][7].now + 1
					gui.tableTalents5.talent5c7.caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}
				end
			end
		elseif event.element.name == "talent5c7p" then
			local max = player.getitemcount("cursed-talent-5")
			if max > talents[5][7].max - talents[5][7].now then max = talents[5][7].max - talents[5][7].now end
			if max > 0 then
				player.removeitem({name="cursed-talent-5", count=max})
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][7].now = talents[5][7].now + max
				gui.tableTalents5.talent5c7.caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}
			end
		elseif event.element.name == "talent5c8" then
			if (player.removeitem({name="cursed-talent-5", count=1}) >= 1) then
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][8].now = talents[5][8].now + 1
				gui.tableTalents5.talent5c8.caption = {"gui.talent5c8",talents[5][8].now,"-"}
			end
		elseif event.element.name == "talent5c8p" then
			local max = player.getitemcount("cursed-talent-5")
			if max > 0 then
				player.removeitem({name="cursed-talent-5", count=max})
				gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
				talents[5][8].now = talents[5][8].now + max
				gui.tableTalents5.talent5c8.caption = {"gui.talent5c8",talents[5][8].now,"-"}
			end
		elseif event.element.name == "talent6c1" then
			if (player.removeitem({name="cursed-talent-6", count=1}) >= 1) then
				gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
				talents[6][1].now = talents[6][1].now + 1
				gui.tableTalents6.talent6c1.caption = {"gui.talent6c1",talents[6][1].now,"-"}
			end
		elseif event.element.name == "talent6c1p" then
			local max = player.getitemcount("cursed-talent-6")
			if max > 0 then
				player.removeitem({name="cursed-talent-6", count=max})
				gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
				talents[6][1].now = talents[6][1].now + max
				gui.tableTalents6.talent6c1.caption = {"gui.talent6c1",talents[6][1].now,"-"}
			end
		elseif event.element.name == "talent6c2" then
			if (player.removeitem({name="cursed-talent-6", count=1}) >= 1) then
				gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
				talents[6][2].now = talents[6][2].now + 1
				gui.tableTalents6.talent6c2.caption = {"gui.talent6c2",talents[6][2].now,"-"}
			end
		elseif event.element.name == "talent6c2p" then
			local max = player.getitemcount("cursed-talent-6")
			if max > 0 then
				player.removeitem({name="cursed-talent-6", count=max})
				gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
				talents[6][2].now = talents[6][2].now + max
				gui.tableTalents6.talent6c2.caption = {"gui.talent6c2",talents[6][2].now,"-"}
			end
		elseif event.element.name == "builds1c1" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			if num == 1 then num = #mines else num = num - 1 end
			gui.tableMine.builds1c2.caption = mines[num].nick
				gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mines[num].level}
				gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",mines[num].exp,mines[num].next}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
			gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}
			gui.tableBuilds1.builds1c9.value = mines[num].entity.health / (175 + mines[num].level * 25)
			gui.tableBuilds1ID.builds1c11.caption = num
		elseif event.element.name == "builds1c3" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			if num == #mines then num = 1 else num = num + 1 end
			gui.tableMine.builds1c2.caption = mines[num].nick
			gui.tableBuilds1Active.builds1c4.caption = {"gui.builds1c4",mines[num].level}
			gui.tableBuilds1.builds1c5.caption = {"gui.builds1c5",mines[num].exp,mines[num].next}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
			gui.tableBuilds1.builds1c8.caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}
			gui.tableBuilds1.builds1c9.value = mines[num].entity.health / (175 + mines[num].level * 25)
			gui.tableBuilds1ID.builds1c11.caption = num
		elseif event.element.name == "builds1c7" then
			local mines = glob.cursed[player.name].mines
			local num = tonumber(gui.tableBuilds1ID.builds1c11.caption)
			if gui.tableBuilds1Active.builds1c7.state == true then
				mines[num].active = true
				mines[num].active2 = true
				mines[num].entity.active = true
			else
				mines[num].active = false
				mines[num].active2 = false
				mines[num].entity.active = false
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
		elseif event.element.name == "builds2c1" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			if num == 1 then num = #turrets else num = num - 1 end
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",turrets[num].exp,turrets[num].next}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
			gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}
			gui.tableBuilds2.builds2c9.value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			gui.tableBuilds2ID.builds2c11.caption = num
		elseif event.element.name == "builds2c3" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			if num == #turrets then num = 1 else num = num + 1 end
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			gui.tableBuilds2Active.builds2c4.caption = {"gui.builds2c4",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = {"gui.builds2c5",turrets[num].exp,turrets[num].next}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
			gui.tableBuilds2.builds2c8.caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}
			gui.tableBuilds2.builds2c9.value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			gui.tableBuilds2ID.builds2c11.caption = num
		elseif event.element.name == "builds2c7" then
			local turrets = glob.cursed[player.name].turrets
			local num = tonumber(gui.tableBuilds2ID.builds2c11.caption)
			if gui.tableBuilds2Active.builds2c7.state == true then
				turrets[num].entity.active = true
				turrets[num].active = true
				turrets[num].active2 = true
			else
				turrets[num].entity.active = false
				turrets[num].active = false
				turrets[num].active2 = false
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
		elseif event.element.name == "builds3c1" then
			if player.character then
				setBase(player)
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
			if num == 1 then num = #walls else num = num - 1 end
			gui.tableWall1.builds5c2.caption = walls[num].nick
			gui.tableBuilds5ID.builds5c5.caption = num  
			gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",walls[num].level}
			gui.tableBuilds5Active.builds5c7.state = walls[num].active
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}
				gui.tableBuilds5.builds5c9.value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
			else
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",0,walls[num].maxmass}
				gui.tableBuilds5.builds5c9.value = 0
			end
			gui.tableWall2.builds5c12.caption = #walls[num].sides.wallxp
			gui.tableWall2.builds5c16.caption = #walls[num].sides.wallxn
			gui.tableWall2.builds5c20.caption = #walls[num].sides.wallyp
			gui.tableWall2.builds5c24.caption = #walls[num].sides.wallyn
			gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",walls[num].exp,walls[num].next}
			if walls[num].exp > 0 then
				gui.tableBuilds5.builds5c27.value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.builds5c27.value = 0
			end
		elseif event.element.name == "builds5c3" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if num == #walls then num = 1 else num = num + 1 end
			gui.tableWall1.builds5c2.caption = walls[num].nick
			gui.tableBuilds5ID.builds5c5.caption = num  
			gui.tableBuilds5Active.builds5c6.caption = {"gui.builds5c6",walls[num].level}
			gui.tableBuilds5Active.builds5c7.state = walls[num].active
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}
				gui.tableBuilds5.builds5c9.value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
			else
				gui.tableBuilds5.builds5c8.caption = {"gui.builds5c8",0,walls[num].maxmass}
				gui.tableBuilds5.builds5c9.value = 0
			end
			gui.tableWall2.builds5c12.caption = #walls[num].sides.wallxp
			gui.tableWall2.builds5c16.caption = #walls[num].sides.wallxn
			gui.tableWall2.builds5c20.caption = #walls[num].sides.wallyp
			gui.tableWall2.builds5c24.caption = #walls[num].sides.wallyn
			gui.tableBuilds5.builds5c26.caption = {"gui.builds5c26",walls[num].exp,walls[num].next}
			if walls[num].exp > 0 then
				gui.tableBuilds5.builds5c27.value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.builds5c27.value = 0
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
		elseif event.element.name == "builds5c7" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			if gui.tableBuilds5Active.builds1c7.state == true then
				walls[num].storage.active = true
				walls[num].active = true
				walls[num].active2 = true
			else
				walls[num].storage.active = false
				walls[num].active = false
				walls[num].active2 = false
			end
		elseif event.element.name == "builds5c11" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxp = walls[num].sides.wallxp
			if #wallxp > 0 then
				if wallxp[#wallxp].valid then
					local fluid = wallxp[#wallxp].health
					if wallxp[#wallxp].fluidbox[1] ~= nil and wallxp[#wallxp].fluidbox[1].type == "living-mass" then
						fluid = fluid + wallxp[#wallxp].fluidbox[1].amount
					end
					if (#wallxp - 1) > 0 then
						if wallxp[#wallxp - 1].fluidbox[1] ~= nil and wallxp[#wallxp - 1].fluidbox[1].type == "living-mass" then
							fluid = fluid + wallxp[#wallxp - 1].fluidbox[1].amount * 2.75
						end
						local oldhp = wallxp[#wallxp - 1].health
						local position = wallxp[#wallxp - 1].position
						wallxp[#wallxp - 1].destroy()
						wallxp[#wallxp - 1] = game.createentity{name="cursed-wall-0100",position=position, force=player.force}
						wallxp[#wallxp - 1].health = oldhp
					else
						walls[num].invi.xp.active = false
						if walls[num].invi.xp.fluidbox[1] ~= nil and walls[num].invi.xp.fluidbox[1].type == "living-mass" then
							fluid = fluid + walls[num].invi.xp.fluidbox[1].amount
							walls[num].invi.xp.fluidbox[1] = nil
						end
					end
					if fluid > 0 and (walls[num].storage.fluidbox[1] == nil or (walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type ~= "living-mass")) then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
					elseif fluid > 0 then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount + fluid, temperature = 30}
					end
					wallxp[#wallxp].destroy()
				end
				table.remove(wallxp,#wallxp)
				gui.tableWall2.builds5c12.caption = #wallxp
				walls[num].sides.wallxp = wallxp
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c13" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxp = walls[num].sides.wallxp
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 125 and #wallxp < 16 then
				local position = {x = walls[num].storage.position.x + 2 + #wallxp, y = walls[num].storage.position.y}
				if game.canplaceentity{name = "cursed-wall-0100", position = position} == true then
					walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount - 125, temperature = 30}
					if walls[num].invi.xp.fluidbox[1] ~= nil and walls[num].invi.xp.fluidbox[1].type ~= "living-mass" then
						walls[num].invi.xp.fluidbox[1] = nil
					end
					walls[num].invi.xp.active = true
					if #wallxp > 0 then
						local oldhp = wallxp[#wallxp].health
						local position = wallxp[#wallxp].position
						wallxp[#wallxp].destroy()
						wallxp[#wallxp] = game.createentity{name="cursed-wall-0101",position=position, force=player.force}
						wallxp[#wallxp].health = oldhp
					end
					wallxp[#wallxp + 1] = game.createentity{name="cursed-wall-0100",position=position, force=player.force}
					gui.tableWall2.builds5c12.caption = #wallxp
					walls[num].sides.wallxp = wallxp
					glob.cursed[player.name].walls = walls
				end
			end
		elseif event.element.name == "builds5c15" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxn = walls[num].sides.wallxn
			if #wallxn > 0 then
				if wallxn[#wallxn].valid then
					local fluid = wallxn[#wallxn].health
					if wallxn[#wallxn].fluidbox[1] ~= nil and wallxn[#wallxn].fluidbox[1].type == "living-mass" then
						fluid = fluid + wallxn[#wallxn].fluidbox[1].amount
					end
					if (#wallxn - 1) > 0 then
						if wallxn[#wallxn - 1].fluidbox[1] ~= nil and wallxn[#wallxn - 1].fluidbox[1].type == "living-mass" then
							fluid = fluid + wallxn[#wallxn - 1].fluidbox[1].amount * 2.75
						end
						local oldhp = wallxn[#wallxn - 1].health
						local position = wallxn[#wallxn - 1].position
						wallxn[#wallxn - 1].destroy()
						wallxn[#wallxn - 1] = game.createentity{name="cursed-wall-0001",position=position, force=player.force}
						wallxn[#wallxn - 1].health = oldhp
					else
						walls[num].invi.xn.active = false
						if walls[num].invi.xn.fluidbox[1] ~= nil and walls[num].invi.xn.fluidbox[1].type == "living-mass" then
							fluid = fluid + walls[num].invi.xn.fluidbox[1].amount
							walls[num].invi.xn.fluidbox[1] = nil
						end
					end
					if fluid > 0 and (walls[num].storage.fluidbox[1] == nil or (walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type ~= "living-mass")) then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
					elseif fluid > 0 then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount + fluid, temperature = 30}
					end
					wallxn[#wallxn].destroy()
				end
				table.remove(wallxn,#wallxn)
				gui.tableWall2.builds5c16.caption = #wallxn
				walls[num].sides.wallxn = wallxn
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c17" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallxn = walls[num].sides.wallxn
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 125 and #wallxn < 16 then
				local position = {x = walls[num].storage.position.x - 2 - #wallxn, y = walls[num].storage.position.y}
				if game.canplaceentity{name = "cursed-wall-0001", position = position} == true then
					walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount - 125, temperature = 30}
					if walls[num].invi.xn.fluidbox[1] ~= nil and walls[num].invi.xn.fluidbox[1].type ~= "living-mass" then
						walls[num].invi.xn.fluidbox[1] = nil
					end
					walls[num].invi.xn.active = true
					if #wallxn > 0 then
						local oldhp = wallxn[#wallxn].health
						local position = wallxn[#wallxn].position
						wallxn[#wallxn].destroy()
						wallxn[#wallxn] = game.createentity{name="cursed-wall-0101",position=position, force=player.force}
						wallxn[#wallxn].health = oldhp
					end
					wallxn[#wallxn + 1] = game.createentity{name="cursed-wall-0001",position=position, force=player.force}
					gui.tableWall2.builds5c16.caption = #wallxn
					walls[num].sides.wallxn = wallxn
					glob.cursed[player.name].walls = walls
				end
			end
		elseif event.element.name == "builds5c19" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyp = walls[num].sides.wallyp
			if #wallyp > 0 then
				if wallyp[#wallyp].valid then
					local fluid = wallyp[#wallyp].health
					if wallyp[#wallyp].fluidbox[1] ~= nil and wallyp[#wallyp].fluidbox[1].type == "living-mass" then
						fluid = fluid + wallyp[#wallyp].fluidbox[1].amount
					end
					if (#wallyp - 1) > 0 then
						if wallyp[#wallyp - 1].fluidbox[1] ~= nil and wallyp[#wallyp - 1].fluidbox[1].type == "living-mass" then
							fluid = fluid + wallyp[#wallyp - 1].fluidbox[1].amount * 2.75
						end
						local oldhp = wallyp[#wallyp - 1].health
						local position = wallyp[#wallyp - 1].position
						wallyp[#wallyp - 1].destroy()
						wallyp[#wallyp - 1] = game.createentity{name="cursed-wall-1000",position=position, force=player.force}
						wallyp[#wallyp - 1].health = oldhp
					else
						walls[num].invi.yp.active = false
						if walls[num].invi.yp.fluidbox[1] ~= nil and walls[num].invi.yp.fluidbox[1].type == "living-mass" then
							fluid = fluid + walls[num].invi.yp.fluidbox[1].amount
							walls[num].invi.yp.fluidbox[1] = nil
						end
					end
					if fluid > 0 and (walls[num].storage.fluidbox[1] == nil or (walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type ~= "living-mass")) then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
					elseif fluid > 0 then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount + fluid, temperature = 30}
					end
					wallyp[#wallyp].destroy()
				end
				table.remove(wallyp,#wallyp)
				gui.tableWall2.builds5c20.caption = #wallyp
				walls[num].sides.wallyp = wallyp
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c21" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyp = walls[num].sides.wallyp
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 125 and #wallyp < 16 then
				local position = {x = walls[num].storage.position.x, y = walls[num].storage.position.y - 2 - #wallyp}
				if game.canplaceentity{name = "cursed-wall-1000", position = position} == true then
					walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount - 125, temperature = 30}
					if walls[num].invi.yp.fluidbox[1] ~= nil and walls[num].invi.yp.fluidbox[1].type ~= "living-mass" then
						walls[num].invi.yp.fluidbox[1] = nil
					end
					walls[num].invi.yp.active = true
					if #wallyp > 0 then
						local oldhp = wallyp[#wallyp].health
						local position = wallyp[#wallyp].position
						wallyp[#wallyp].destroy()
						wallyp[#wallyp] = game.createentity{name="cursed-wall-1010",position=position, force=player.force}
						wallyp[#wallyp].health = oldhp
					end
					wallyp[#wallyp + 1] = game.createentity{name="cursed-wall-1000",position=position, force=player.force}
					gui.tableWall2.builds5c20.caption = #wallyp
					walls[num].sides.wallyp = wallyp
					glob.cursed[player.name].walls = walls
				end
			end
		elseif event.element.name == "builds5c23" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyn = walls[num].sides.wallyn
			if #wallyn > 0 then
				if wallyn[#wallyn].valid then
					local fluid = wallyn[#wallyn].health
					if wallyn[#wallyn].fluidbox[1] ~= nil and wallyn[#wallyn].fluidbox[1].type == "living-mass" then
						fluid = fluid + wallyn[#wallyn].fluidbox[1].amount
					end
					if (#wallyn - 1) > 0 then
						if wallyn[#wallyn - 1].fluidbox[1] ~= nil and wallyn[#wallyn - 1].fluidbox[1].type == "living-mass" then
							fluid = fluid + wallyn[#wallyn - 1].fluidbox[1].amount * 2.75
						end
						local oldhp = wallyn[#wallyn - 1].health
						local position = wallyn[#wallyn - 1].position
						wallyn[#wallyn - 1].destroy()
						wallyn[#wallyn - 1] = game.createentity{name="cursed-wall-1000",position=position, force=player.force}
						wallyn[#wallyn - 1].health = oldhp
					else
						walls[num].invi.yn.active = false
						if walls[num].invi.yn.fluidbox[1] ~= nil and walls[num].invi.yn.fluidbox[1].type == "living-mass" then
							fluid = fluid + walls[num].invi.yn.fluidbox[1].amount
							walls[num].invi.yn.fluidbox[1] = nil
						end
					end
					if fluid > 0 and (walls[num].storage.fluidbox[1] == nil or (walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type ~= "living-mass")) then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
					elseif fluid > 0 then
						walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount + fluid, temperature = 30}
					end
					wallyn[#wallyn].destroy()
				end
				table.remove(wallyn,#wallyn)
				gui.tableWall2.builds5c24.caption = #wallyn
				walls[num].sides.wallyn = wallyn
				glob.cursed[player.name].walls = walls
			end
		elseif event.element.name == "builds5c25" then
			local walls = glob.cursed[player.name].walls
			local num = tonumber(gui.tableBuilds5ID.builds5c5.caption)
			local wallyn = walls[num].sides.wallyn
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" and walls[num].storage.fluidbox[1].amount > 125 and #wallyn < 16 then
				local position = {x = walls[num].storage.position.x, y = walls[num].storage.position.y + 2 + #wallyn}
				if game.canplaceentity{name = "cursed-wall-1000", position = position} == true then
					walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount - 125, temperature = 30}
					if walls[num].invi.yn.fluidbox[1] ~= nil and walls[num].invi.yn.fluidbox[1].type ~= "living-mass" then
						walls[num].invi.yn.fluidbox[1] = nil
					end
					walls[num].invi.yn.active = true
					if #wallyn > 0 then
						local oldhp = wallyn[#wallyn].health
						local position = wallyn[#wallyn].position
						wallyn[#wallyn].destroy()
						wallyn[#wallyn] = game.createentity{name="cursed-wall-1010",position=position, force=player.force}
						wallyn[#wallyn].health = oldhp
					end
					wallyn[#wallyn + 1] = game.createentity{name="cursed-wall-0010",position=position, force=player.force}
					gui.tableWall2.builds5c24.caption = #wallyn
					walls[num].sides.wallyn = wallyn
					glob.cursed[player.name].walls = walls
				end
			end
		elseif event.element.name == "option5c1" then
			guiFlipFlop("optionsMain",player)
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
				if gui.tableOptions.option2c1.state == true then
					resetstats(player)
					player.print({"msg.cursed", {"msg.stats-reseted"}})
				end
				if gui.tableOptions.option2c2.state == true then
					resettalents(player,true)
					player.print({"msg.cursed", {"msg.talents-reseted"}})
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
					resetgui(false,true)
					resetall(player,true)
						player.print({"msg.cursed", {"msg.all-reseted"}})
					return true
				end
				if gui.tableOptions.option4c4.state == true then
					resetgui(false,true)
						player.print({"msg.cursed", {"msg.debug-gui"}})
					return true
				end
				guiFlipFlop("optionsMain",player)
			end
		end
	end
end

function guiFlipFlop(name,player)
	local gui = glob.cursed[player.name].gui
	local talents = glob.cursed[player.name].talents
	if name == "closeMain" then
		closeAllMain(-1,player)
		if gui.frameMainS then
			gui.frameMain.destroy()
			gui.frameMainS = false
			gui.flowClosed = gui.flowMain.add({ type="flow", name="flowClosed", direction = "vertical", style = "cursed-flow" })
			gui.flowClosed.add({ type="button", name="closeMain", style = "cursed-buttonClosed" })
		else
			gui.flowClosed.destroy()
			gui.frameMain = gui.flowMain.add({ type="frame", name="frameMain", direction = "vertical", style = "cursed-frame" })
			gui.frameMainS = true
			gui.flowMain2 = gui.frameMain.add({ type="flow", name="flowMain2", direction = "vertical", style = "cursed-flow" })
			gui.tableMain = gui.flowMain2.add({type = "table", name = "tableMain", colspan = 2, style = "cursed-table2"})
			gui.tableMain.add({ type="label", name="main", caption = {"gui.main"}, style = "cursed-label-bold" })
			gui.tableMain.add({ type="button", name="closeMain", style = "cursed-buttonMini2" })
			gui.flowMain2.add({ type="button", name="talentsMain", caption = {"gui.talentsMain"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="statsMain", caption = {"gui.statsMain"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="buildsMain", caption = {"gui.buildsMain"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="vaultMain", caption = {"gui.vaultMain"}, style = "cursed-button" })
			gui.flowMain2.add({ type="button", name="optionsMain", caption = {"gui.optionsMain"}, style = "cursed-button" })
		end
	elseif name == "talentsMain" then
		closeAllMain(1,player)
		if gui.frameTalentsS then
			gui.frameTalents.destroy()
			gui.frameTalentsS = false
			closeAllTalents(-1,player)
			gui.flowMain2.talentsMain.style = "cursed-button"
		else
			gui.flowMain2.talentsMain.style = "cursed-button-clicked"
			gui.frameTalents = gui.flowMain.add({ type="flow", name="frameTalents", direction = "horizontal", style = "cursed-flow" })
			gui.frameTalentsS = true
			-- local tableTalents = gui.frameTalents.add({ type="flow", name="tableTalents", direction = "horizontal", style = "" })
			gui.frameTalentsDet1 = gui.frameTalents.add({ type="frame", name="frameTalents1", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet1.add({ type="button", name="talentsMain1", caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}, style = "cursed-button" })
			gui.frameTalentsDet2 = gui.frameTalents.add({ type="frame", name="frameTalents2", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet2.add({ type="button", name="talentsMain2", caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}, style = "cursed-button" })
			gui.frameTalentsDet3 = gui.frameTalents.add({ type="frame", name="frameTalents3", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet3.add({ type="button", name="talentsMain3", caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}, style = "cursed-button" })
			gui.frameTalentsDet4 = gui.frameTalents.add({ type="frame", name="frameTalents4", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet4.add({ type="button", name="talentsMain4", caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}, style = "cursed-button" })
			gui.frameTalentsDet5 = gui.frameTalents.add({ type="frame", name="frameTalents5", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet5.add({ type="button", name="talentsMain5", caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}, style = "cursed-button" })
			gui.frameTalentsDet6 = gui.frameTalents.add({ type="frame", name="frameTalents6", direction = "vertical", style = "cursed-frame" })
			gui.frameTalentsDet6.add({ type="button", name="talentsMain6", caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}, style = "cursed-button" })
		end
	elseif name == "statsMain" then
		closeAllMain(2,player)
		if gui.frameStatsS then
			gui.frameStats.destroy()
			gui.frameStatsS = false
			closeAllStats(-1,player)
			gui.flowMain2.statsMain.style = "cursed-button"
		else
			gui.flowMain2.statsMain.style = "cursed-button-clicked"
			gui.frameStats = gui.flowMain.add({ type="flow", name="frameStats", direction = "horizontal", style = "cursed-flow" })
			gui.frameStatsS = true
			-- local tableStats = gui.frameStats.add({ type="flow", name="tableStats", direction = "horizontal", style = "" })
			gui.frameStatsDet1 = gui.frameStats.add({ type="frame", name="frameStats1", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet1.add({ type="button", name="statsMain1", caption = {"bsc.stat1"}, style = "cursed-button" })
			gui.frameStatsDet2 = gui.frameStats.add({ type="frame", name="frameStats2", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet2.add({ type="button", name="statsMain2", caption = {"bsc.stat2"}, style = "cursed-button" })
			gui.frameStatsDet3 = gui.frameStats.add({ type="frame", name="frameStats3", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet3.add({ type="button", name="statsMain3", caption = {"bsc.stat3"}, style = "cursed-button" })
			gui.frameStatsDet4 = gui.frameStats.add({ type="frame", name="frameStats4", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet4.add({ type="button", name="statsMain4", caption = {"bsc.stat4"}, style = "cursed-button" })
			gui.frameStatsDet5 = gui.frameStats.add({ type="frame", name="frameStats5", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet5.add({ type="button", name="statsMain5", caption = {"bsc.stat5"}, style = "cursed-button" })
			gui.frameStatsDet6 = gui.frameStats.add({ type="frame", name="frameStats6", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet6.add({ type="button", name="statsMain6", caption = {"bsc.stat6"}, style = "cursed-button" })
			gui.frameStatsDet7 = gui.frameStats.add({ type="frame", name="frameStats7", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet7.add({ type="button", name="statsMain7", caption = {"bsc.stat7"}, style = "cursed-button" })
			gui.frameStatsDet8 = gui.frameStats.add({ type="frame", name="frameStats8", direction = "vertical", style = "cursed-frame" })
			gui.frameStatsDet8.add({ type="button", name="statsMain8", caption = {"bsc.stat8"}, style = "cursed-button" })
		end
	elseif name == "buildsMain" then
		closeAllMain(3,player)
		if gui.frameBuildsS then
			gui.frameBuilds.destroy()
			gui.frameBuildsS = false
			closeAllBuilds(-1,player)
			gui.flowMain2.buildsMain.style = "cursed-button"
		else
			gui.flowMain2.buildsMain.style = "cursed-button-clicked"
			gui.frameBuilds = gui.flowMain.add({ type="flow", name="frameBuilds", direction = "horizontal", style = "cursed-flow" })
			gui.frameBuildsS = true
			-- local tableBuilds = gui.frameBuilds.add({ type="flow", name="tableBuilds", direction = "horizontal", style = "" })
			gui.frameBuildsDet3 = gui.frameBuilds.add({ type="frame", name="frameBuilds1", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet3.add({ type="button", name="buildsMain3", caption = {"gui.buildsMain3"}, style = "cursed-button" })
			gui.frameBuildsDet5 = gui.frameBuilds.add({ type="frame", name="frameBuilds5", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet5.add({ type="button", name="buildsMain5", caption = {"gui.buildsMain5"}, style = "cursed-button" })
			gui.frameBuildsDet1 = gui.frameBuilds.add({ type="frame", name="frameBuilds2", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet1.add({ type="button", name="buildsMain1", caption = {"gui.buildsMain1"}, style = "cursed-button" })
			gui.frameBuildsDet2 = gui.frameBuilds.add({ type="frame", name="frameBuilds3", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet2.add({ type="button", name="buildsMain2", caption = {"gui.buildsMain2"}, style = "cursed-button" })
			gui.frameBuildsDet4 = gui.frameBuilds.add({ type="frame", name="frameBuilds4", direction = "vertical", style = "cursed-frame" })
			gui.frameBuildsDet4.add({ type="button", name="buildsMain4", caption = {"gui.buildsMain4"}, style = "cursed-button" })
		end
	elseif name == "optionsMain" then
		closeAllMain(4,player)
		if gui.frameOptionsS then
			gui.frameOptions.destroy()
			gui.frameOptionsS = false
			gui.flowMain2.optionsMain.style = "cursed-button"
		else
			gui.flowMain2.optionsMain.style = "cursed-button-clicked"
			local opt = glob.cursed[player.name].opt
			gui.frameOptions = gui.flowMain.add({ type="frame", name="frameOptions", direction = "vertical", style = "cursed-frame" })
			gui.frameOptionsS = true
			gui.tableOptions = gui.frameOptions.add({ type="table", name="tableOptions", colspan = 4, style = "cursed-table" })
			gui.tableOptions.add({ type="checkbox", name="option1c1", caption = {"gui.option1c1"}, state=opt[1], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c2", caption = {"gui.option1c2"}, state=opt[2], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c3", caption = {"gui.option1c3"}, state=opt[3], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c4", caption = {"gui.option1c4"}, state=opt[4], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c5", caption = {"gui.option1c5"}, state=opt[5], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c6", caption = {"gui.option1c6"}, state=opt[6], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c7", caption = {"gui.option1c7"}, state=opt[7], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option1c8", caption = {"gui.option1c8"}, state=opt[8], style = "cursed-checkbox" })
			gui.tableOptions.add({ type="label", name="optionl1", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl2", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="option3", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl4", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option2c1", caption = {"gui.option2c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option2c2", caption = {"gui.option2c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option2c3", caption = {"gui.option2c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="label", name="optionl5", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option3c1", caption = {"gui.option3c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c2", caption = {"gui.option3c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c3", caption = {"gui.option3c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option3c4", caption = {"gui.option3c4"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="label", name="optionl6", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl7", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="option8", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl9", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option4c1", caption = {"gui.option4c1"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c2", caption = {"gui.option4c2"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c3", caption = {"gui.option4c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option4c4", caption = {"gui.option4c4"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="label", name="optionl10", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl11", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="option12", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl13", caption = " ", style = "" })
			gui.tableOptions.add({ type="button", name="option5c1", caption = {"gui.option5c1"}, style = "cursed-button" })
			gui.tableOptions.add({ type="button", name="option5c2", caption = {"gui.option5c2"}, style = "cursed-button" })
			gui.tableOptions.add({ type="checkbox", name="option5c3", caption = {"gui.option5c3"}, state=false, style = "cursed-checkbox" })
			gui.tableOptions.add({ type="checkbox", name="option5c4", caption = {"gui.option5c4"}, state=false, style = "cursed-checkbox" })
		end
	elseif name == "talentsMain1" then
	closeAllTalents(1,player)
		if gui.tableTalents1S then
			gui.tableTalents1.destroy()
			gui.tableTalents1S = false
			gui.frameTalentsDet1.talentsMain1.style = "cursed-button"
		else
			gui.frameTalentsDet1.talentsMain1.style = "cursed-button-clicked"
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
			gui.tableTalents1.add({ type="button", name="talent1c5", caption = {"gui.talent1c5",talents[1][5].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c6", caption = {"gui.talent1c6",talents[1][6].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c7", caption = {"gui.talent1c7",talents[1][7].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c8", caption = {"gui.talent1c8",talents[1][8].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c9", caption = {"gui.talent1c9",talents[1][9].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents1.add({ type="button", name="talent1c10", caption = {"gui.talent1c10",talents[1][10].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents1.add({ type="button", name="talent1c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain2" then
	closeAllTalents(2,player)
		if gui.tableTalents2S then
			gui.tableTalents2.destroy()
			gui.tableTalents2S = false
			gui.frameTalentsDet2.talentsMain2.style = "cursed-button"
		else
			gui.frameTalentsDet2.talentsMain2.style = "cursed-button-clicked"
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
	closeAllTalents(3,player)
		if gui.tableTalents3S then
			gui.tableTalents3.destroy()
			gui.tableTalents3S = false
			gui.frameTalentsDet3.talentsMain3.style = "cursed-button"
		else
			gui.frameTalentsDet3.talentsMain3.style = "cursed-button-clicked"
			gui.tableTalents3 = gui.frameTalentsDet3.add({ type="table", name="tableTalents3", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents3 = gui.frameTalentsDet3.add({ type="flow", name="tableTalents3", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents3S = true
			gui.tableTalents3.add({ type="button", name="talent3c1", caption = {"gui.talent3c1",talents[3][1].now,talents[3][1].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c2", caption = {"gui.talent3c2",talents[3][2].now,talents[3][2].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c3", caption = {"gui.talent3c3",talents[3][3].now,talents[3][3].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents3.add({ type="button", name="talent3c4", caption = {"gui.talent3c4",talents[3][4].now,talents[3][4].max}, style = "cursed-buttonInside1" })
			gui.tableTalents3.add({ type="button", name="talent3c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c5", caption = {"gui.talent3c5",talents[3][5].now,talents[3][5].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c6", caption = {"gui.talent3c6",talents[3][6].now,talents[3][6].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c7", caption = {"gui.talent3c7",talents[3][7].now,talents[3][7].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c8", caption = {"gui.talent3c8",talents[3][8].now,talents[3][8].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c9", caption = {"gui.talent3c9",talents[3][9].now,talents[3][9].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents3.add({ type="button", name="talent3c10", caption = {"gui.talent3c10",talents[3][10].now,talents[3][10].max}, style = "cursed-buttonInside1" })
			-- gui.tableTalents3.add({ type="button", name="talent3c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain4" then
	closeAllTalents(4,player)
		if gui.tableTalents4S then
			gui.tableTalents4.destroy()
			gui.tableTalents4S = false
			gui.frameTalentsDet4.talentsMain4.style = "cursed-button"
		else
			gui.frameTalentsDet4.talentsMain4.style = "cursed-button-clicked"
			gui.tableTalents4 = gui.frameTalentsDet4.add({ type="table", name="tableTalents4", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents4 = gui.frameTalentsDet4.add({ type="flow", name="tableTalents4", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents4S = true
			gui.tableTalents4.add({ type="button", name="talent4c1", caption = {"gui.talent4c1",talents[4][1].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c2", caption = {"gui.talent4c2",talents[4][2].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c3", caption = {"gui.talent4c3",talents[4][3].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c4", caption = {"gui.talent4c4",talents[4][4].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c5", caption = {"gui.talent4c5",talents[4][5].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c6", caption = {"gui.talent4c6",talents[4][6].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c7", caption = {"gui.talent4c7",talents[4][7].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c8", caption = {"gui.talent4c8",talents[4][8].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c9", caption = {"gui.talent4c9",talents[4][9].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents4.add({ type="button", name="talent4c10", caption = {"gui.talent4c10",talents[4][10].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents4.add({ type="button", name="talent4c10p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain5" then
	closeAllTalents(5,player)
		if gui.tableTalents5S then
			gui.tableTalents5.destroy()
			gui.tableTalents5S = false
			gui.frameTalentsDet5.talentsMain5.style = "cursed-button"
		else
			gui.frameTalentsDet5.talentsMain5.style = "cursed-button-clicked"
			gui.tableTalents5 = gui.frameTalentsDet5.add({ type="table", name="tableTalents5", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents5 = gui.frameTalentsDet5.add({ type="flow", name="tableTalents5", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents5S = true
			-- gui.tableTalents5.add({ type="button", name="talent5c1", caption = {"",{"gui-talent5c1"}," (",talents[5][1].now,"/",talents[5][1].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c2", caption = {"",{"gui-talent5c2"}," (",talents[5][2].now,"/",talents[5][2].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c2p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c3", caption = {"",{"gui-talent5c3"}," (",talents[5][3].now,"/",talents[5][3].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c3p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c4", caption = {"gui.talent5c4",talents[5][4].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c4p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c5", caption = {"",{"gui-talent5c5"}," (",talents[5][5].now,"/",talents[5][5].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c5p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c6", caption = {"gui.talent5c6",talents[5][6].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c6p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c7", caption = {"gui.talent5c7",talents[5][7].now,talents[5][7].max}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c7p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents5.add({ type="button", name="talent5c8", caption = {"gui.talent5c8",talents[5][8].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents5.add({ type="button", name="talent5c8p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			-- gui.tableTalents5.add({ type="button", name="talent5c9", caption = {"",{"gui-talent5c9"}," (",talents[5][9].now,"/",talents[5][9].max,")"}, style = "cursed-buttonInside1" })
			-- gui.tableTalents5.add({ type="button", name="talent5c9p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
		end
	elseif name == "talentsMain6" then
		closeAllTalents(6,player)
		if gui.tableTalents6S then
			gui.tableTalents6.destroy()
			gui.tableTalents6S = false
			gui.frameTalentsDet6.talentsMain6.style = "cursed-button"
		else
			gui.frameTalentsDet6.talentsMain6.style = "cursed-button-clicked"
			gui.tableTalents6 = gui.frameTalentsDet6.add({ type="table", name="tableTalents6", colspan = 2, style = "cursed-table" })
			-- gui.tableTalents6 = gui.frameTalentsDet6.add({ type="flow", name="tableTalents5", direction = "vertical", style = "cursed-flow" })
			gui.tableTalents6S = true
			gui.tableTalents6.add({ type="button", name="talent6c1", caption = {"gui.talent6c1",talents[6][1].now,"-"}, style = "cursed-buttonInside1" })
			gui.tableTalents6.add({ type="button", name="talent6c1p", caption = {"gui.plus"}, style = "cursed-buttonMini" })
			gui.tableTalents6.add({ type="button", name="talent6c2", caption = {"gui.talent6c2",talents[6][2].now,"-"}, style = "cursed-buttonInside1" })
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
		closeAllStats(1,player)
		if gui.tableStats1S then
			gui.tableStats1.destroy()
			gui.tableStats1S = false
			gui.frameStatsDet1.statsMain1.style = "cursed-button"
		else
			gui.frameStatsDet1.statsMain1.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats1 = gui.frameStatsDet1.add({ type="flow", name="tableStats1", direction = "vertical", style = "cursed-flow" })
			gui.tableStats1S = true
			gui.tableStats1.add({ type="label", name="stat1c1", caption = {"gui.stat1c1",{"bsc.stat1"},stats.general.level}, style = "cursed-label" })
			gui.tableStats1.add({ type="label", name="stat1c2", caption = {"gui.stat1c2",stats.general.exp,stats.general.next}, style = "cursed-label" })
			gui.tableStats1.add({type="progressbar", name="stat1c3", size=100, style = "cursed-progressbar"}).value = stats.general.exp / stats.general.next
			gui.tableStats1.add({ type="label", name="stat1c4", caption = {"gui.stat1c4",100 * stats.general.level/40}, style = "cursed-label" })
			gui.tableStats1.add({ type="label", name="stat1c5", caption = {"gui.stat1c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain2" then
		closeAllStats(2,player)
		if gui.tableStats2S then
			gui.tableStats2.destroy()
			gui.tableStats2S = false
			gui.frameStatsDet2.statsMain2.style = "cursed-button"
		else
			gui.frameStatsDet2.statsMain2.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats2 = gui.frameStatsDet2.add({ type="flow", name="tableStats2", direction = "vertical", style = "cursed-flow" })
			gui.tableStats2S = true
			gui.tableStats2.add({ type="label", name="stat2c1", caption = {"gui.stat2c1",{"bsc.stat2"},stats.mining.level}, style = "cursed-label" })
			gui.tableStats2.add({ type="label", name="stat2c2", caption = {"gui.stat2c2",stats.mining.exp,stats.mining.next,100 * (talents[1][5].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats2.add({type="progressbar", name="stat2c3", size=100, style = "cursed-progressbar"}).value = stats.mining.exp / stats.mining.next
			gui.tableStats2.add({ type="label", name="stat2c4", caption = {"gui.stat2c4",stats.mining.level}, style = "cursed-label" })
			gui.tableStats2.add({ type="label", name="stat2c5", caption = {"gui.stat2c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain3" then
		closeAllStats(3,player)
		if gui.tableStats3S then
			gui.tableStats3.destroy()
			gui.tableStats3S = false
			gui.frameStatsDet3.statsMain3.style = "cursed-button"
		else
			gui.frameStatsDet3.statsMain3.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats3 = gui.frameStatsDet3.add({ type="flow", name="tableStats3", direction = "vertical", style = "cursed-flow" })
			gui.tableStats3S = true
			gui.tableStats3.add({ type="label", name="stat3c1", caption = {"gui.stat3c1",{"bsc.stat3"},stats.farming.level}, style = "cursed-label" })
			gui.tableStats3.add({ type="label", name="stat3c2", caption = {"gui.stat3c2",stats.farming.exp,stats.farming.next,100 * (talents[1][6].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats3.add({type="progressbar", name="stat3c3", size=100, style = "cursed-progressbar"}).value = stats.farming.exp / stats.farming.next
			gui.tableStats3.add({ type="label", name="stat3c4", caption = {"gui.stat3c4",stats.farming.level / 0.5}, style = "cursed-label" })
			gui.tableStats3.add({ type="label", name="stat3c5", caption = {"gui.stat3c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain4" then
		closeAllStats(4,player)
		if gui.tableStats4S then
			gui.tableStats4.destroy()
			gui.tableStats4S = false
			gui.frameStatsDet4.statsMain4.style = "cursed-button"
		else
			gui.frameStatsDet4.statsMain4.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats4 = gui.frameStatsDet4.add({ type="flow", name="tableStats4", direction = "vertical", style = "cursed-flow" })
			gui.tableStats4S = true
			gui.tableStats4.add({ type="label", name="stat4c1", caption = {"gui.stat4c1",{"bsc.stat4"},stats.crafting.level}, style = "cursed-label" })
			gui.tableStats4.add({ type="label", name="stat4c2", caption = {"gui.stat4c2",stats.crafting.exp,stats.crafting.next,100 * (talents[1][7].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats4.add({type="progressbar", name="stat4c3", size=100, style = "cursed-progressbar"}).value = stats.crafting.exp / stats.crafting.next
			gui.tableStats4.add({ type="label", name="stat4c4", caption = {"gui.stat4c4",stats.crafting.level / 2.5}, style = "cursed-label" })
			gui.tableStats4.add({ type="label", name="stat4c5", caption = {"gui.stat4c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain5" then
		closeAllStats(5,player)
		if gui.tableStats5S then
			gui.tableStats5.destroy()
			gui.tableStats5S = false
			gui.frameStatsDet5.statsMain5.style = "cursed-button"
		else
			gui.frameStatsDet5.statsMain5.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats5 = gui.frameStatsDet5.add({ type="flow", name="tableStats5", direction = "vertical", style = "cursed-flow" })
			gui.tableStats5S = true
			gui.tableStats5.add({ type="label", name="stat5c1", caption = {"gui.stat5c1",{"bsc.stat5"},stats.explore.level}, style = "cursed-label" })
			gui.tableStats5.add({ type="label", name="stat5c2", caption = {"gui.stat5c2",stats.explore.exp,stats.explore.next,100 * (talents[1][8].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats5.add({type="progressbar", name="stat5c3", size=100, style = "cursed-progressbar"}).value = stats.explore.exp / stats.explore.next
			gui.tableStats5.add({ type="label", name="stat5c4", caption = {"gui.stat5c4",100 * stats.explore.level / 32}, style = "cursed-label" })
			gui.tableStats5.add({ type="label", name="stat5c5", caption = {"gui.stat5c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain6" then
		closeAllStats(6,player)
		if gui.tableStats6S then
			gui.tableStats6.destroy()
			gui.tableStats6S = false
			gui.frameStatsDet6.statsMain6.style = "cursed-button"
		else
			gui.frameStatsDet6.statsMain6.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats6 = gui.frameStatsDet6.add({ type="flow", name="tableStats6", direction = "vertical", style = "cursed-flow" })
			gui.tableStats6S = true
			gui.tableStats6.add({ type="label", name="stat6c1", caption = {"gui.stat6c1",{"bsc.stat6"},stats.defence.level}, style = "cursed-label" })
			gui.tableStats6.add({ type="label", name="stat6c2", caption = {"gui.stat6c2",stats.defence.exp,stats.defence.next,100 * (talents[1][10].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats6.add({type="progressbar", name="stat6c3", size=100, style = "cursed-progressbar"}).value = stats.defence.exp / stats.defence.next
			gui.tableStats6.add({ type="label", name="stat6c4", caption = {"gui.stat6c4",stats.defence.level / 100}, style = "cursed-label" })
			gui.tableStats6.add({ type="label", name="stat6c5", caption = {"gui.stat6c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain7" then
		closeAllStats(7,player)
		if gui.tableStats7S then
			gui.tableStats7.destroy()
			gui.tableStats7S = false
			gui.frameStatsDet7.statsMain7.style = "cursed-button"
		else
			gui.frameStatsDet7.statsMain7.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats7 = gui.frameStatsDet7.add({ type="flow", name="tableStats7", direction = "vertical", style = "cursed-flow" })
			gui.tableStats7S = true
			gui.tableStats7.add({ type="label", name="stat7c1", caption = {"gui.stat7c1",{"bsc.stat7"},stats.range.level}, style = "cursed-label" })
			gui.tableStats7.add({ type="label", name="stat7c2", caption = {"gui.stat7c2",stats.range.exp,stats.range.next,100 * (talents[1][9].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats7.add({type="progressbar", name="stat7c3", size=100, style = "cursed-progressbar"}).value = stats.range.exp / stats.range.next
			gui.tableStats7.add({ type="label", name="stat7c4", caption = {"gui.stat7c4",6.5 + stats.range.level * 0.5}, style = "cursed-label" })
			gui.tableStats7.add({ type="label", name="stat7c5", caption = {"gui.stat7c5"}, style = "cursed-label" })
		end
	elseif name == "statsMain8" then
		closeAllStats(8,player)
		if gui.tableStats8S then
			gui.tableStats8.destroy()
			gui.tableStats8S = false
			gui.frameStatsDet8.statsMain8.style = "cursed-button"
		else
			gui.frameStatsDet8.statsMain8.style = "cursed-button-clicked"
			local stats = glob.cursed[player.name].stats
			gui.tableStats8 = gui.frameStatsDet8.add({ type="flow", name="tableStats8", direction = "vertical", style = "cursed-flow" })
			gui.tableStats8S = true
			gui.tableStats8.add({ type="label", name="stat8c1", caption = {"gui.stat8c1",{"bsc.stat8"},stats.melee.level}, style = "cursed-label" })
			gui.tableStats8.add({ type="label", name="stat8c2", caption = {"gui.stat8c2",stats.melee.exp,stats.melee.next,100 * (talents[1][9].now / 40 + stats.general.level / 40)}, style = "cursed-label" })
			gui.tableStats8.add({type="progressbar", name="stat8c3", size=100}).value = stats.melee.exp / stats.melee.next
			gui.tableStats8.add({ type="label", name="stat8c4", caption = {"gui.stat8c4",stats.melee.level * 0}, style = "cursed-label" })
			gui.tableStats8.add({ type="label", name="stat8c5", caption = {"gui.stat8c5"}, style = "cursed-label" })
		end
	elseif name == "buildsMain1" then
		closeAllBuilds(1,player)
		if gui.tableBuilds1S then
			gui.tableBuilds1.destroy()
			gui.tableBuilds1S = false
			gui.frameBuildsDet1.buildsMain1.style = "cursed-button"
		else
			gui.frameBuildsDet1.buildsMain1.style = "cursed-button-clicked"
			local mines = glob.cursed[player.name].mines
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
			gui.tableBuilds1.add({ type="label", name="builds1c8", caption = {"gui.builds1c8",math.ceil(mines[num].entity.health),175 + mines[num].level * 25}, style = "cursed-label" })
			gui.tableBuilds1.add({type="progressbar", name="builds1c9", size=100, style = "cursed-progressbar"}).value = mines[num].entity.health / (175 + mines[num].level * 25)
			gui.tableBuilds1.add({ type="label", name="builds1c5", caption = {"gui.builds1c5",mines[num].exp,mines[num].next}, style = "cursed-label" })
			if mines[num].exp > 0 then
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100, style = "cursed-progressbar"}).value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.add({type="progressbar", name="builds1c6", size=100, style = "cursed-progressbar"}).value = 0
			end
		end
	elseif name == "buildsMain2" then
		closeAllBuilds(2,player)
		if gui.tableBuilds2S then
			gui.tableBuilds2.destroy()
			gui.tableBuilds2S = false
			gui.frameBuildsDet2.buildsMain2.style = "cursed-button"
		else
			gui.frameBuildsDet2.buildsMain2.style = "cursed-button-clicked"
			local turrets = glob.cursed[player.name].turrets
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
			gui.tableBuilds2.add({ type="label", name="builds2c8", caption = {"gui.builds2c8",math.ceil(turrets[num].entity.health),175 + turrets[num].level * 25}, style = "cursed-label" })
			gui.tableBuilds2.add({type="progressbar", name="builds2c9", size=100, style = "cursed-progressbar"}).value = turrets[num].entity.health / (175 + turrets[num].level * 25)
			gui.tableBuilds2.add({ type="label", name="builds2c5", caption = {"gui.builds2c5",turrets[num].exp,turrets[num].next}, style = "cursed-label" })
			if turrets[num].exp > 0 then
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100, style = "cursed-progressbar"}).value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.add({type="progressbar", name="builds2c6", size=100, style = "cursed-progressbar"}).value = 0
			end
		end
	elseif name == "buildsMain3" then
		closeAllBuilds(3,player)
		if gui.tableBuilds3S then
			gui.tableBuilds3.destroy()
			gui.tableBuilds3S = false
			gui.frameBuildsDet3.buildsMain3.style = "cursed-button"
		else
			gui.frameBuildsDet3.buildsMain3.style = "cursed-button-clicked"
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
	elseif name == "buildsMain4" then
		closeAllBuilds(4,player)
		if gui.tableBuilds4S then
			gui.tableBuilds4.destroy()
			gui.tableBuilds4S = false
			gui.frameBuildsDet4.buildsMain4.style = "cursed-button"
		else
			gui.frameBuildsDet4.buildsMain4.style = "cursed-button-clicked"
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
	elseif name == "buildsMain5" then
		closeAllBuilds(5,player)
		if gui.tableBuilds5S then
			gui.tableBuilds5.destroy()
			gui.tableBuilds5S = false
			gui.frameBuildsDet5.buildsMain5.style = "cursed-button"
		else
			gui.frameBuildsDet5.buildsMain5.style = "cursed-button-clicked"
			local walls = glob.cursed[player.name].walls
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
			if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
				gui.tableBuilds5.add({ type="label", name="builds5c8", caption = {"gui.builds5c8",math.ceil(walls[num].storage.fluidbox[1].amount),walls[num].maxmass}, style = "cursed-label" })
				gui.tableBuilds5.add({type="progressbar", name="builds5c9", size=100, style = "cursed-progressbar"}).value = walls[num].storage.fluidbox[1].amount / walls[num].maxmass
			else
				gui.tableBuilds5.add({ type="label", name="builds5c8", caption = {"gui.builds5c8",0,walls[num].maxmass}, style = "cursed-label" })
				gui.tableBuilds5.add({type="progressbar", name="builds5c9", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableBuilds5.add({ type="label", name="builds5c26", caption = {"gui.builds5c26",walls[num].exp,walls[num].next}, style = "cursed-label" })
			if walls[num].exp > 0 then
				gui.tableBuilds5.add({type="progressbar", name="builds5c27", size=100, style = "cursed-progressbar"}).value = walls[num].exp / walls[num].next
			else
				gui.tableBuilds5.add({type="progressbar", name="builds5c27", size=100, style = "cursed-progressbar"}).value = 0
			end
			gui.tableWall2 = gui.tableBuilds5.add({ type="table", name="tableWall2", colspan = 4, style = "cursed-table" })
			gui.tableWall2.add({ type="label", name="builds5c10", caption = {"gui.builds5c10"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c11", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="label", name="builds5c12", caption = #walls[num].sides.wallxp, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c13", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall3 = gui.tableBuilds5.add({ type="flow", name="tableWall3", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c14", caption = {"gui.builds5c14"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c15", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="label", name="builds5c16", caption = #walls[num].sides.wallxn, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c17", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall4 = gui.tableBuilds5.add({ type="flow", name="tableWall4", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c18", caption = {"gui.builds5c18"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c19", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="label", name="builds5c20", caption = #walls[num].sides.wallyp, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c21", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			-- gui.tableWall5 = gui.tableBuilds5.add({ type="flow", name="tableWall5", direction = "horizontal", style = "cursed-flow" })
			gui.tableWall2.add({ type="label", name="builds5c22", caption = {"gui.builds5c22"}, style = "cursed-label" })
			gui.tableWall2.add({ type="button", name="builds5c23", caption = {"gui.builds5c1"}, style = "cursed-buttonMini" })
			gui.tableWall2.add({ type="label", name="builds5c24", caption = #walls[num].sides.wallyn, style = "cursed-buttonMini-Off" })
			gui.tableWall2.add({ type="button", name="builds5c25", caption = {"gui.builds5c3"}, style = "cursed-buttonMini" })
			
			-- gui.tableBuilds5.add({ type="label", name="builds4c4", caption = {"gui.builds4c4",math.ceil(bodies[num].entity.health),bodies[num].maxhealth}, style = "cursed-label" })
			-- gui.tableBuilds5.add({type="progressbar", name="builds4c5", size=100, style = "cursed-progressbar"}).value = bodies[num].entity.health / bodies[num].maxhealth
			-- gui.tableBuilds4p = gui.tableBuilds4.add({ type="table", name="tableBuilds4p", colspan = 2, style = "cursed-table" })
			-- gui.tableBuilds4p.add({ type="button", name="builds4c6", caption = {"gui.builds4c6"}, style = "cursed-buttonInside3" })
			-- gui.tableBuilds4p.add({ type="button", name="builds4c9", caption = {"gui.builds4c9"}, style = "cursed-buttonMini" })
			-- if num == glob.cursed[player.name].aux.bodynow then gui.tableBuilds4p.builds4c6.caption = {"gui.builds4c6p"} end
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
			gui.changeNick1 = player.gui.center.add({ type="flow", name="changeNick1", direction="vertical" })
			gui.changeNick1S = true
			local framechangeNick1 = gui.changeNick1.add({ type="frame", name="changeNick1f1", direction = "vertical" })
			gui.changeNick1t = framechangeNick1.add({ type="textfield", name="changeNick1t", text=""})
			local framechangeNick1Buttons = framechangeNick1.add({ type="flow", name="changeNick1Buttons",direction="horizontal" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b1", caption = {"gui.changeNickb1"}, style = "" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b2", caption = {"gui.changeNickb2"}, style = "" })
		end
	elseif build == "turret" then
		if gui.changeNick2S then
			gui.changeNick2.destroy()
			gui.changeNick2S = false
		else
			gui.changeNick2 = player.gui.center.add({ type="flow", name="changeNick2", direction="vertical" })
			gui.changeNick2S = true
			local framechangeNick2 = gui.changeNick2.add({ type="frame", name="changeNick2f1", direction = "vertical" })
			gui.changeNick2t = framechangeNick2.add({ type="textfield", name="changeNick2t", text=""})
			local framechangeNick2Buttons = framechangeNick2.add({ type="flow", name="changeNick2Buttons",direction="horizontal" })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b1", caption = {"gui.changeNickb1"}, style = "" })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b2", caption = {"gui.changeNickb2"}, style = "" })
		end
	elseif build == "body" then
		if gui.changeNick4S then
			gui.changeNick4.destroy()
			gui.changeNick4S = false
		else
			gui.changeNick4 = player.gui.center.add({ type="flow", name="changeNick4", direction="vertical" })
			gui.changeNick4S = true
			local framechangeNick4 = gui.changeNick4.add({ type="frame", name="changeNick4f1", direction = "vertical" })
			gui.changeNick4t = framechangeNick4.add({ type="textfield", name="changeNick4t", text=""})
			local framechangeNick4Buttons = framechangeNick4.add({ type="flow", name="changeNick4Buttons",direction="horizontal" })
			framechangeNick4Buttons.add({ type="button", name="changeNick4b1", caption = {"gui.changeNickb1"}, style = "" })
			framechangeNick4Buttons.add({ type="button", name="changeNick4b2", caption = {"gui.changeNickb2"}, style = "" })
		end
	elseif build == "wall" then
		if gui.changeNick5S then
			gui.changeNick5.destroy()
			gui.changeNick5S = false
		else
			gui.changeNick5 = player.gui.center.add({ type="flow", name="changeNick5", direction="vertical" })
			gui.changeNick5S = true
			local framechangeNick5 = gui.changeNick5.add({ type="frame", name="changeNick5f1", direction = "vertical" })
			gui.changeNick5t = framechangeNick5.add({ type="textfield", name="changeNick5t", text=""})
			local framechangeNick5Buttons = framechangeNick5.add({ type="flow", name="changeNick5Buttons",direction="horizontal" })
			framechangeNick5Buttons.add({ type="button", name="changeNick5b1", caption = {"gui.changeNickb1"}, style = "" })
			framechangeNick5Buttons.add({ type="button", name="changeNick5b2", caption = {"gui.changeNickb2"}, style = "" })
		end
	end
end
function closeAllMain(num,player)
	local gui = glob.cursed[player.name].gui
	closeAllTalents(-1,player)
	closeAllStats(-1,player)
	closeAllBuilds(-1,player)
	if gui ~= nil and gui.frameTalentsS and gui.frameTalents and num ~= 1 then
		gui.flowMain2.talentsMain.style = "cursed-button"
		gui.frameTalents.destroy()
		gui.frameTalentsS = false
	end
	if gui ~= nil and gui.frameStatsS and gui.frameStats and num ~= 2 then
		gui.flowMain2.statsMain.style = "cursed-button"
		gui.frameStats.destroy()
		gui.frameStatsS = false 
	end
	if gui ~= nil and gui.frameBuildsS and gui.frameBuilds and num ~= 3 then
		gui.flowMain2.buildsMain.style = "cursed-button"
		gui.frameBuilds.destroy()
		gui.frameBuildsS = false 
	end
	if gui ~= nil and gui.frameOptionsS and gui.frameOptions and num ~= 4 then
		gui.flowMain2.optionsMain.style = "cursed-button"
		gui.frameOptions.destroy()
		gui.frameOptionsS = false 
	end
	if gui ~= nil and num == -1 then
		gui.frameTalentsS = false
		gui.frameStatsS = false
		gui.frameBuildsS = false 
		gui.frameOptionsS = false 
	end
end
function closeAllTalents(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and gui.tableTalents1S and gui.tableTalents1 and num ~= 1 then
		gui.frameTalentsDet1.talentsMain1.style = "cursed-button"
		gui.tableTalents1.destroy()
		gui.tableTalents1S = false
	end
	if gui ~= nil and gui.tableTalents2S and gui.tableTalents2 and num ~= 2 then
		gui.frameTalentsDet2.talentsMain2.style = "cursed-button"
		gui.tableTalents2.destroy()
		gui.tableTalents2S = false
	end
	if gui ~= nil and gui.tableTalents3S and gui.tableTalents3 and num ~= 3 then
		gui.frameTalentsDet3.talentsMain3.style = "cursed-button"
		gui.tableTalents3.destroy()
		gui.tableTalents3S = false
	end
	if gui ~= nil and gui.tableTalents4S and gui.tableTalents4 and num ~= 4 then
		gui.frameTalentsDet4.talentsMain4.style = "cursed-button"
		gui.tableTalents4.destroy()
		gui.tableTalents4S = false
	end
	if gui ~= nil and gui.tableTalents5S and gui.tableTalents5 and num ~= 5 then
		gui.frameTalentsDet5.talentsMain5.style = "cursed-button"
		gui.tableTalents5.destroy()
		gui.tableTalents5S = false
	end
	if gui ~= nil and gui.tableTalents6S and gui.tableTalents6 and num ~= 6 then
		gui.frameTalentsDet6.talentsMain6.style = "cursed-button"
		gui.tableTalents6.destroy()
		gui.tableTalents6S = false
	end
	if gui ~= nil and num == -1 then
		gui.tableTalents1S = false
		gui.tableTalents2S = false
		gui.tableTalents3S = false
		gui.tableTalents4S = false
		gui.tableTalents5S = false
		gui.tableTalents6S = false
	end
end
function closeAllStats(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and gui.tableStats1S and gui.tableStats1 and num ~= 1 then
		gui.frameStatsDet1.statsMain1.style = "cursed-button"
		gui.tableStats1.destroy()
		gui.tableStats1S = false
	end
	if gui ~= nil and gui.tableStats2S and gui.tableStats2 and num ~= 2 then
		gui.frameStatsDet2.statsMain2.style = "cursed-button"
		gui.tableStats2.destroy()
		gui.tableStats2S = false
	end
	if gui ~= nil and gui.tableStats3S and gui.tableStats3 and num ~= 3 then
		gui.frameStatsDet3.statsMain3.style = "cursed-button"
		gui.tableStats3.destroy()
		gui.tableStats3S = false
	end
	if gui ~= nil and gui.tableStats4S and gui.tableStats4 and num ~= 4 then
		gui.frameStatsDet4.statsMain4.style = "cursed-button"
		gui.tableStats4.destroy()
		gui.tableStats4S = false
	end
	if gui ~= nil and gui.tableStats5S and gui.tableStats5 and num ~= 5 then
		gui.frameStatsDet5.statsMain5.style = "cursed-button"
		gui.tableStats5.destroy()
		gui.tableStats5S = false
	end
	if gui ~= nil and gui.tableStats6S and gui.tableStats6 and num ~= 6 then
		gui.frameStatsDet6.statsMain6.style = "cursed-button"
		gui.tableStats6.destroy()
		gui.tableStats6S = false
	end
	if gui ~= nil and gui.tableStats7S and gui.tableStats7 and num ~= 7 then
		gui.frameStatsDet7.statsMain7.style = "cursed-button"
		gui.tableStats7.destroy()
		gui.tableStats7S = false
	end
	if gui ~= nil and gui.tableStats8S and gui.tableStats8 and num ~= 8 then
		gui.frameStatsDet8.statsMain8.style = "cursed-button"
		gui.tableStats8.destroy()
		gui.tableStats8S = false
	end
	if gui ~= nil and num == -1 then
		gui.tableStats1S = false
		gui.tableStats2S = false
		gui.tableStats3S = false
		gui.tableStats4S = false
		gui.tableStats5S = false
		gui.tableStats6S = false
		gui.tableStats7S = false
		gui.tableStats8S = false
	end
end
function closeAllBuilds(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and num == -1 then
		gui.tableBuilds1S = false
		gui.tableBuilds2S = false
		gui.tableBuilds3S = false
	end
	if gui ~= nil and gui.tableBuilds1S and gui.tableBuilds1 and num ~= 1 then
		gui.frameBuildsDet1.buildsMain1.style = "cursed-button"
		gui.tableBuilds1.destroy()
		gui.tableBuilds1S = false
	end
	if gui ~= nil and gui.tableBuilds2S and gui.tableBuilds2 and num ~= 2 then
		gui.frameBuildsDet2.buildsMain2.style = "cursed-button"
		gui.tableBuilds2.destroy()
		gui.tableBuilds2S = false
	end
	if gui ~= nil and gui.tableBuilds3S and gui.tableBuilds3 and num ~= 3 then
		gui.frameBuildsDet3.buildsMain3.style = "cursed-button"
		gui.tableBuilds3.destroy()
		gui.tableBuilds3S = false
	end
	if gui ~= nil and gui.tableBuilds4S and gui.tableBuilds4 and num ~= 4 then
		gui.frameBuildsDet4.buildsMain4.style = "cursed-button"
		gui.tableBuilds4.destroy()
		gui.tableBuilds4S = false
	end
	if gui ~= nil and gui.tableBuilds5S and gui.tableBuilds5 and num ~= 5 then
		gui.frameBuildsDet5.buildsMain5.style = "cursed-button"
		gui.tableBuilds5.destroy()
		gui.tableBuilds5S = false
	end
end

function globalPrint(text)
	local players = game.players
	for i=1, #players do
		players[i].print(text)
	end
end

function setBase(player)
	if player.character then
		local position = game.findnoncollidingposition("cursed-base", player.position, 25, 1)
		if position ~= nil then
			local base = glob.cursed[player.name].aux.base
			local cant = 0
			if base and base ~= nil then
				if base.getinventory(defines.inventory.labinput)[1] ~= nil then
					cant = base.getinventory(defines.inventory.labinput)[1].count
				end
				base.destroy()
			end
			base = {}
			base = game.createentity{name="cursed-base", position=position, force=game.forces.player}
			base.destructible = false
			base.active = false
			if cant ~= 0 then
				base.insert({name = "cursed-player", count = cant})
			end
			glob.cursed[player.name].aux.base = base
		else
			player.print({"msg.cursed",{"place-base"}})
		end
	end
end