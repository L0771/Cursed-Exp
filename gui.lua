-- module(..., package.seeall)

function resetgui(player,destroyonly)
	if player then
		local gui = glob.cursed[player.name].gui
		if gui and gui.tableMainS then
			closeAllTalents(-1,player)
			closeAllStats(-1,player)
			closeAllBuilds(-1,player)
			closeAllMain(-1,player)
			if player.gui.left.tableMain ~= nil then
				gui.tableMain.destroy()
			end
		else
			if destroyonly then
				gui = nil
			else
				gui = {}
			end
		end
		if not destroyonly then
			gui.tableMain = player.gui.left.add({ type="flow", name="tableMain", direction="horizontal" })
			gui.tableMainS = true
			local frameTalentsMain = gui.tableMain.add({ type="frame", name="frameTalentsMain", direction = "vertical" })
			local tableTalentsMain = frameTalentsMain.add({ type="flow", name="tableTalentsMain",direction="vertical" })
			tableTalentsMain.add({ type="label", name="main", caption = {"gui-main"}, style = "recipe_tooltip_cannot_craft_label_style" })
			tableTalentsMain.add({ type="button", name="talentsMain", caption = {"gui-talentsMain"}, style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="statsMain", caption = {"gui-statsMain"}, style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="buildsMain", caption = {"gui-buildsMain"}, style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="vaultMain", caption = {"gui-vaultMain"}, style = "dialog_button_style" })
			tableTalentsMain.add({ type="button", name="optionsMain", caption = {"gui-optionsMain"}, style = "dialog_button_style" })
			glob.cursed[player.name].gui = gui
		end
	else
		for _,v in ipairs(game.players) do
			if v.character ~= nil then
				if v.name == "" then
					v.name = "SP"
				end
				local gui = glob.cursed[v.name].gui
				if gui and gui.tableMainS then
					closeAllTalents(-1,v)
					closeAllStats(-1,v)
					closeAllBuilds(-1,v)
					closeAllMain(-1,v)
					if v.gui.left.tableMain ~= nil then
						gui.tableMain.destroy()
					end
				else
					if destroyonly then
						gui = nil
					else
						gui = {}
					end
				end
				if not destroyonly then
					gui.tableMain = v.gui.left.add({ type="flow", name="tableMain", direction="horizontal" })
					gui.tableMainS = true
					local frameTalentsMain = gui.tableMain.add({ type="frame", name="frameTalentsMain", direction = "vertical" })
					local tableTalentsMain = frameTalentsMain.add({ type="flow", name="tableTalentsMain",direction="vertical" })
					tableTalentsMain.add({ type="label", name="main", caption = {"gui-main"}, style = "recipe_tooltip_cannot_craft_label_style" })
					tableTalentsMain.add({ type="button", name="talentsMain", caption = {"gui-talentsMain"}, style = "dialog_button_style" })
					tableTalentsMain.add({ type="button", name="statsMain", caption = {"gui-statsMain"}, style = "dialog_button_style" })
					tableTalentsMain.add({ type="button", name="buildsMain", caption = {"gui-buildsMain"}, style = "dialog_button_style" })
					tableTalentsMain.add({ type="button", name="optionsMain", caption = {"gui-optionsMain"}, style = "dialog_button_style" })
					glob.cursed[v.name].gui = gui
				end
			end
		end
	end
end

function clickgui(event)
	local player = game.getplayer(event.element.playerindex)
	if player.gui.left.tableMain then
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
		elseif event.element.name == "vaultMain" then
			if player.cursorstack then
				player.print("Cursed: Needs the hands free")
				-- player.print({"",{"msg-cursed"},": ",{"msg-cursorstack"}})
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
				local num = 0
				for i = 1, #mines do
					if mines[i] ~= nil and mines[i].entity ~= nil and num == 0 then
						num = i
					end
				end
				if num ~= 0 or gui.tableBuilds1S then
					guiFlipFlop("buildsMain1",player)
				else
					player.print("Cursed: Need minimum one mine")
					-- player.print({"",{"msg-cursed"},": ",{"msg-minmine"}})
				end
			else
				player.print("Cursed: Need minimum one mine")
				-- player.print({"",{"msg-cursed"},": ",{"msg-minmine"}})
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
					player.print("Cursed: Need minimum one turret")
					-- player.print({"",{"msg-cursed"},": ",{"msg-minturret"}})
				end
			else
				player.print("Cursed: Need minimum one turret")
				-- player.print({"",{"msg-cursed"},": ",{"msg-minturret"}})
			end
		elseif event.element.name == "talent1c1" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				if (talents[1][1].now < talents[1][1].max) then
					player.removeitem({name="cursed-talent-1", count=1})
					gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
					-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
					for _,v in ipairs(game.players) do
						talents = glob.cursed[v.name].talents
						talents[1][1].now = talents[1][1].now + 1
						talents[1][2].max = 0
						gui = glob.cursed[v.name].gui
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
							-- gui.tableTalents1.talent1c1.caption = {"",{"gui-talent1c1"}," (",talents[1][1].now,"/",talents[1][1].max,")"}
							gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
							-- gui.tableTalents1.talent1c2.caption = {"",{"gui-talent1c2"}," (",talents[1][2].now,"/",talents[1][2].max,")"}
						end
					end
					globalPrint("Cursed: " .. player.name .. " has bought 24hs day")
					-- globalPrint({"",{"msg-cursed"},": ",player.name," ",{"msg-24day-buy"}})
				end
			end
		elseif event.element.name == "talent1c2" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				if (talents[1][2].now < talents[1][2].max) then
					player.removeitem({name="cursed-talent-1", count=1})
					gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
					-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
					for _,v in ipairs(game.players) do
						talents = glob.cursed[v.name].talents
						talents[1][2].now = talents[1][2].now + 1
						talents[1][1].max = 0
						gui = glob.cursed[v.name].gui
						if gui.tableTalents1S then
							gui.tableTalents1.talent1c1.caption = "24hs day (" .. talents[1][1].now .. "/" .. talents[1][1].max .. ")"
							-- gui.tableTalents1.talent1c1.caption = {"",{"gui-talent1c1"}," (",talents[1][1].now,"/",talents[1][1].max,")"}
							gui.tableTalents1.talent1c2.caption = "24hs night (" .. talents[1][2].now .. "/" .. talents[1][2].max .. ")"
							-- gui.tableTalents1.talent1c2.caption = {"",{"gui-talent1c2"}," (",talents[1][2].now,"/",talents[1][2].max,")"}
						end
					end
					globalPrint("Cursed: " .. player.name .. " has bought 24hs night")
					-- globalPrint({"",{"msg-cursed"},": ",player.name," ",{"msg-24night-buy"}})
				end
			end
		elseif event.element.name == "talent1c3" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				if (talents[1][3].now < talents[1][3].max) then
					player.removeitem({name="cursed-talent-1", count=1})
					gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
					-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
					removeAxes(player)
					player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					talents[1][3].now = talents[1][3].now + 1
					gui.tableTalents1.talent1c3.caption = "Buy axe (" .. talents[1][3].now .. "/" .. talents[1][3].max .. ")"
					-- gui.tableTalents1.talent1c3.caption = {"",{"gui-talent1c3"}," (",talents[1][3].now,"/",talents[1][3].max,")"}
				end
			end
		elseif event.element.name == "talent1c4" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				if (talents[1][4].now < talents[1][4].max) then
					player.removeitem({name="cursed-talent-1", count=1})
					gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
					-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
					removeArmors(player)
					player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					talents[1][4].now = talents[1][4].now + 1
					gui.tableTalents1.talent1c4.caption = "Buy armor (" .. talents[1][4].now .. "/" .. talents[1][4].max .. ")"
					-- gui.tableTalents1.talent1c4.caption = {"",{"gui-talent1c4"}," (",talents[1][4].now,"/",talents[1][4].max,")"}
				end
			end
		elseif event.element.name == "talent1c5" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][5].now = talents[1][5].now + 1
				gui.tableTalents1.talent1c5.caption = "Mining bonus (" .. talents[1][5].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c5.caption = {"",{"gui-talent1c5"}," (",talents[1][5].now,"/","-",")"}
			end
		elseif event.element.name == "talent1c6" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][6].now = talents[1][6].now + 1
				gui.tableTalents1.talent1c6.caption = "Farming bonus (" .. talents[1][6].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c6.caption = {"",{"gui-talent1c6"}," (",talents[1][6].now,"/","-",")"}
			end
		elseif event.element.name == "talent1c7" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][7].now = talents[1][7].now + 1
				gui.tableTalents1.talent1c7.caption = "Crafting bonus (" .. talents[1][7].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c7.caption = {"",{"gui-talent1c7"}," (",talents[1][7].now,"/","-",")"}
			end
		elseif event.element.name == "talent1c8" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][8].now = talents[1][8].now + 1
				gui.tableTalents1.talent1c8.caption = "Explore bonus (" .. talents[1][8].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c8.caption = {"",{"gui-talent1c8"}," (",talents[1][8].now,"/","-",")"}
			end
		elseif event.element.name == "talent1c9" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][9].now = talents[1][9].now + 1
				gui.tableTalents1.talent1c9.caption = "Attack bonus (" .. talents[1][9].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c9.caption = {"",{"gui-talent1c9"}," (",talents[1][9].now,"/","-",")"}
			end
		elseif event.element.name == "talent1c10" then
			if (player.getitemcount("cursed-talent-1") >= 1) then
				player.removeitem({name="cursed-talent-1", count=1})
				gui.frameTalentsDet1.talentsMain1.caption = "Tier 1 (" .. player.getitemcount("cursed-talent-1") .. ")"
				-- gui.frameTalentsDet1.talentsMain1.caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}
				talents[1][10].now = talents[1][10].now + 1
				gui.tableTalents1.talent1c10.caption = "Defense bonus (" .. talents[1][10].now .. "/" .. "-" .. ")"
				-- gui.tableTalents1.talent1c10.caption = {"",{"gui-talent1c10"}," (",talents[1][10].now,"/","-",")"}
			end
		elseif event.element.name == "talent2c1" then
			if (player.getitemcount("cursed-talent-2") >= 1) then
				if (talents[2][1].now < talents[2][1].max) then
					player.removeitem({name="cursed-talent-2", count=1})
					gui.frameTalentsDet2.talentsMain2.caption = "Tier 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
					-- gui.frameTalentsDet2.talentsMain2.caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}
					talents[2][1].now = talents[2][1].now + 1
					removeAxes(player)
					player.character.insert({name="cursed-axe-"..talents[2][1].now,count=1})
					gui.tableTalents2.talent2c1.caption = "Upgrade tool (" .. talents[2][1].now .. "/" .. talents[2][1].max .. ")"
					-- gui.tableTalents2.talent2c1.caption = {"",{"gui-talent2c1"}," (",talents[2][1].now,"/",talents[2][1].max,")"}
				end
			end
		elseif event.element.name == "talent2c2" then
			if (player.getitemcount("cursed-talent-2") >= 1) then
				if (talents[2][2].now < talents[2][2].max) then
					player.removeitem({name="cursed-talent-2", count=1})
					gui.frameTalentsDet2.talentsMain2.caption = "Tier 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
					-- gui.frameTalentsDet2.talentsMain2.caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}
					talents[2][2].now = talents[2][2].now + 1
					removeArmors(player)
					player.character.insert({name="cursed-armor-"..talents[2][2].now,count=1})
					gui.tableTalents2.talent2c2.caption = "Upgrade armor (" .. talents[2][2].now .. "/" .. talents[2][2].max .. ")"
					-- gui.tableTalents2.talent2c2.caption = {"",{"gui-talent2c2"}," (",talents[2][2].now,"/",talents[2][2].max,")"}
				end
			end
		elseif event.element.name == "talent2c3" then
			if (player.getitemcount("cursed-talent-2") >= 1) then
				if (talents[2][3].now < talents[2][3].max) then
					player.removeitem({name="cursed-talent-2", count=1})
					gui.frameTalentsDet2.talentsMain2.caption = "Tier 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
					-- gui.frameTalentsDet2.talentsMain2.caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}
					talents[2][3].now = talents[2][3].now + 1
					removeBows(player)
					player.character.insert({name="cursed-weapon1-"..talents[2][3].now,count=1})
					gui.tableTalents2.talent2c3.caption = "Upgrade bow (" .. talents[2][3].now .. "/" .. talents[2][3].max .. ")"
					-- gui.tableTalents2.talent2c3.caption = {"",{"gui-talent2c3"}," (",talents[2][3].now,"/",talents[2][3].max,")"}
				end
			end
		-- elseif event.element.name == "talent2c4" then
			-- if (player.getitemcount("cursed-talent-2") >= 1) then
				-- if (talents[2][4].now < talents[2][4].max) then
					-- player.removeitem({name="cursed-talent-2", count=1})
					-- gui.frameTalentsDet2.talentsMain2.caption = "Tier 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
					-- -- gui.frameTalentsDet2.talentsMain2.caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}
					-- talents[2][4].now = talents[2][4].now + 1
					-- gui.tableTalents2.talent2c4.caption = {"",{"gui-talent2c4"}," (",talents[2][4].now,"/",talents[2][4].max,")"}
				-- end
			-- end
		-- elseif event.element.name == "talent2c5" then
			-- if (player.getitemcount("cursed-talent-2") >= 1) then
				-- if (talents[2][5].now < talents[2][5].max) then
					-- player.removeitem({name="cursed-talent-2", count=1})
					-- gui.frameTalentsDet2.talentsMain2.caption = "Tier 2 (" .. player.getitemcount("cursed-talent-2") .. ")"
					-- -- gui.frameTalentsDet2.talentsMain2.caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}
					-- talents[2][5].now = talents[2][5].now + 1
					-- gui.tableTalents2.talent2c5.caption = {"",{"gui-talent2c5"}," (",talents[2][5].now,"/",talents[2][5].max,")"}
				-- end
			-- end
		elseif event.element.name == "talent3c1" then
			if (player.getitemcount("cursed-talent-3") >= 1) then
				if (talents[3][1].now < talents[3][1].max) then
					player.removeitem({name="cursed-talent-3", count=1})
					gui.frameTalentsDet3.talentsMain3.caption = "Tier 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
					-- gui.frameTalentsDet3.talentsMain3.caption = {"",{"gui-talentsMain3"}," (",player.getitemcount("cursed-talent-3"),")"}
					player.character.insert({name="cursed-drill-1",count=1})
					talents[3][1].now = talents[3][1].now + 1
					gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
					-- gui.tableTalents3.talent3c1.caption = {"",{"gui-talent3c1"}," (",talents[3][1].now,"/",talents[3][1].max,")"}
				end
			end
		elseif event.element.name == "talent3c2" then
			if (player.getitemcount("cursed-talent-3") >= 1) then
				if (talents[3][2].now < talents[3][2].max) then
					player.removeitem({name="cursed-talent-3", count=1})
					gui.frameTalentsDet3.talentsMain3.caption = "Tier 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
					-- gui.frameTalentsDet3.talentsMain3.caption = {"",{"gui-talentsMain3"}," (",player.getitemcount("cursed-talent-3"),")"}
					talents[3][2].now = talents[3][2].now + 1
					talents[3][1].max = math.floor(talents[3][2].now / 5) + 2
					gui.tableTalents3.talent3c1.caption = "Buy mine (" .. talents[3][1].now .. "/" .. talents[3][1].max .. ")"
					-- gui.tableTalents3.talent3c1.caption = {"",{"gui-talent3c1"}," (",talents[3][1].now,"/",talents[3][1].max,")"}
					gui.tableTalents3.talent3c2.caption = "Upgrade mines (" .. talents[3][2].now .. "/" .. talents[3][2].max .. ")"
					-- gui.tableTalents3.talent3c2.caption = {"",{"gui-talent3c2"}," (",talents[3][2].now,"/",talents[3][2].max,")"}
				end
			end
		elseif event.element.name == "talent3c3" then
			if (player.getitemcount("cursed-talent-3") >= 1) then
				if (talents[3][3].now < talents[3][3].max) then
					player.removeitem({name="cursed-talent-3", count=1})
					gui.frameTalentsDet3.talentsMain3.caption = "Tier 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
					-- gui.frameTalentsDet3.talentsMain3.caption = {"",{"gui-talentsMain3"}," (",player.getitemcount("cursed-talent-3"),")"}
					player.character.insert({name="cursed-turret-1",count=1})
					talents[3][3].now = talents[3][3].now + 1
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
					-- gui.tableTalents3.talent3c3.caption = {"",{"gui-talent3c3"}," (",talents[3][3].now,"/",talents[3][3].max,")"}
				end
			end
		elseif event.element.name == "talent3c4" then
			if (player.getitemcount("cursed-talent-3") >= 1) then
				if (talents[3][4].now < talents[3][4].max) then
					player.removeitem({name="cursed-talent-3", count=1})
					gui.frameTalentsDet3.talentsMain3.caption = "Tier 3 (" .. player.getitemcount("cursed-talent-3") .. ")"
					-- gui.frameTalentsDet3.talentsMain3.caption = {"",{"gui-talentsMain3"}," (",player.getitemcount("cursed-talent-3"),")"}
					talents[3][4].now = talents[3][4].now + 1
					talents[3][3].max = math.floor(talents[3][4].now / 5) + 2
				gui.tableTalents3.talent3c3.caption = "Buy turret (" .. talents[3][3].now .. "/" .. talents[3][3].max .. ")"
					-- gui.tableTalents3.talent3c3.caption = {"",{"gui-talent3c3"}," (",talents[3][3].now,"/",talents[3][3].max,")"}
				gui.tableTalents3.talent3c4.caption = "Upgrade turrets (" .. talents[3][4].now .. "/" .. talents[3][4].max .. ")"
					-- gui.tableTalents3.talent3c4.caption = {"",{"gui-talent3c4"}," (",talents[3][4].now,"/",talents[3][4].max,")"}
				end
			end
		elseif event.element.name == "talent4c1" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][1].now = talents[4][1].now + 1
				gui.tableTalents4.talent4c1.caption = "Upgrade part 1 (" .. talents[4][1].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c1.caption = {"",{"gui-talent4c1"}," (",talents[4][1].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c2" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][2].now = talents[4][2].now + 1
				gui.tableTalents4.talent4c2.caption = "Upgrade part 2 (" .. talents[4][2].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c2.caption = {"",{"gui-talent4c2"}," (",talents[4][2].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c3" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][3].now = talents[4][3].now + 1
				gui.tableTalents4.talent4c3.caption = "Upgrade part 3 (" .. talents[4][3].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c3.caption = {"",{"gui-talent4c3"}," (",talents[4][3].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c4" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][4].now = talents[4][4].now + 1
				gui.tableTalents4.talent4c4.caption = "Upgrade part 4 (" .. talents[4][4].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c4.caption = {"",{"gui-talent4c4"}," (",talents[4][4].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c5" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][5].now = talents[4][5].now + 1
				gui.tableTalents4.talent4c5.caption = "Upgrade part 5 (" .. talents[4][5].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c5.caption = {"",{"gui-talent4c5"}," (",talents[4][5].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c6" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][6].now = talents[4][6].now + 1
				gui.tableTalents4.talent4c6.caption = "Upgrade part 6 (" .. talents[4][6].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c6.caption = {"",{"gui-talent4c6"}," (",talents[4][6].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c7" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][7].now = talents[4][7].now + 1
				gui.tableTalents4.talent4c7.caption = "Upgrade part 7 (" .. talents[4][7].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c7.caption = {"",{"gui-talent4c7"}," (",talents[4][7].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c8" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][8].now = talents[4][8].now + 1
				gui.tableTalents4.talent4c8.caption = "Upgrade part 8 (" .. talents[4][8].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c8.caption = {"",{"gui-talent4c8"}," (",talents[4][8].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c9" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][9].now = talents[4][9].now + 1
				gui.tableTalents4.talent4c9.caption = "Upgrade part 9 (" .. talents[4][9].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c9.caption = {"",{"gui-talent4c9"}," (",talents[4][9].now,"/","-",")"}
			end
		elseif event.element.name == "talent4c10" then
			if (player.getitemcount("cursed-talent-4") >= 1) then
				player.removeitem({name="cursed-talent-4", count=1})
				gui.frameTalentsDet4.talentsMain4.caption = "Tier 4 (" .. player.getitemcount("cursed-talent-4") .. ")"
				-- gui.frameTalentsDet4.talentsMain4.caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}
				talents[4][10].now = talents[4][10].now + 1
				gui.tableTalents4.talent4c10.caption = "Upgrade part 10 (" .. talents[4][10].now .. "/" .. "-" .. ")"
				-- gui.tableTalents4.talent4c10.caption = {"",{"gui-talent4c10"}," (",talents[4][10].now,"/","-",")"}
			end
		elseif event.element.name == "talent5c4" then
			if (player.getitemcount("cursed-talent-5") >= 1) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Tier 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				-- gui.frameTalentsDet5.talentsMain5.caption = {"",{"gui-talentsMain5"}," (",player.getitemcount("cursed-talent-5"),")"}
				talents[5][4].now = talents[5][4].now + 1
				gui.tableTalents5.talent5c4.caption = "HP regen (" .. talents[5][4].now .. "/" .. "-" .. ")"
				-- gui.tableTalents5.talent5c4.caption = {"",{"gui-talent5c4"}," (",talents[5][4].now,"/","-",")"}
			end
		elseif event.element.name == "talent5c6" then
			if (player.getitemcount("cursed-talent-5") >= 1) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Tier 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				-- gui.frameTalentsDet5.talentsMain5.caption = {"",{"gui-talentsMain5"}," (",player.getitemcount("cursed-talent-5"),")"}
				talents[5][6].now = talents[5][6].now + 1
				gui.tableTalents5.talent5c6.caption = "Damage aura (" .. talents[5][6].now .. "/" .. "-" .. ")"
				-- gui.tableTalents5.talent5c6.caption = {"",{"gui-talent5c6"}," (",talents[5][6].now,"/","-",")"}
			end
		elseif event.element.name == "talent5c7" then
			if (player.getitemcount("cursed-talent-5") >= 1) then
				if (talents[5][7].now < talents[5][7].max) then
					player.removeitem({name="cursed-talent-5", count=1})
					gui.frameTalentsDet5.talentsMain5.caption = "Tier 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
					-- gui.frameTalentsDet5.talentsMain5.caption = {"",{"gui-talentsMain5"}," (",player.getitemcount("cursed-talent-5"),")"}
					talents[5][7].now = talents[5][7].now + 1
					gui.tableTalents5.talent5c7.caption = "Bank (" .. talents[5][7].now .. "/" .. talents[5][7].max .. ")"
					-- gui.tableTalents5.talent5c7.caption = {"",{"gui-talent5c7"}," (",talents[5][7].now,"/","-",")"}
				end
			end
		elseif event.element.name == "talent5c8" then
			if (player.getitemcount("cursed-talent-5") >= 1) then
				player.removeitem({name="cursed-talent-5", count=1})
				gui.frameTalentsDet5.talentsMain5.caption = "Tier 5 (" .. player.getitemcount("cursed-talent-5") .. ")"
				-- gui.frameTalentsDet5.talentsMain5.caption = {"",{"gui-talentsMain5"}," (",player.getitemcount("cursed-talent-5"),")"}
				talents[5][8].now = talents[5][8].now + 1
				gui.tableTalents5.talent5c8.caption = "Win talents killing (" .. talents[5][8].now .. "/" .. "-" .. ")"
				-- gui.tableTalents5.talent5c8.caption = {"",{"gui-talent5c8"}," (",talents[5][8].now,"/","-",")"}
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
			-- gui.tableBuilds1Active.builds1c4.caption = {"",{"gui-builds1c4"}," ",mines[num].level}
			gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
			-- gui.tableBuilds1.builds1c5.caption = {"",{"gui-builds1c5"}," ",mines[num].exp,"/",mines[num].next}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
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
			-- gui.tableBuilds1Active.builds1c4.caption = {"",{"gui-builds1c4"}," ",mines[num].level}
			gui.tableBuilds1.builds1c5.caption = "Experience " .. mines[num].exp .. "/" .. mines[num].next
			-- gui.tableBuilds1.builds1c5.caption = {"",{"gui-builds1c5"}," ",mines[num].exp,"/",mines[num].next}
			if mines[num].exp > 0 then
				gui.tableBuilds1.builds1c6.value = mines[num].exp / mines[num].next
			else
				gui.tableBuilds1.builds1c6.value = 0
			end
			gui.tableBuilds1Active.builds1c7.state = mines[num].active
		elseif event.element.name == "builds1c7" then
			local mines = glob.cursed[player.name].mines
			local num = 0
			for i = 1, #mines do
				if num == 0 and gui.tableMine.builds1c2.caption == mines[i].nick then
					num = i
				end
			end
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
			-- gui.tableBuilds2Active.builds2c4.caption = {"",{"gui-builds2c4"}," ",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = "Experience " .. turrets[num].exp .. "/" .. turrets[num].next
			-- gui.tableBuilds2.builds2c5.caption = {"",{"gui-builds2c5"}," ",turrets[num].exp,"/",turrets[num].next}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
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
			-- gui.tableBuilds2Active.builds2c4.caption = {"",{"gui-builds2c4"}," ",turrets[num].level}
			gui.tableBuilds2.builds2c5.caption = "Experience " .. turrets[num].exp .. "/" .. turrets[num].next
			-- gui.tableBuilds2.builds2c5.caption = {"",{"gui-builds2c5"}," ",turrets[num].exp,"/",turrets[num].next}
			if turrets[num].exp > 0 then
				gui.tableBuilds2.builds2c6.value = turrets[num].exp / turrets[num].next
			else
				gui.tableBuilds2.builds2c6.value = 0
			end
			gui.tableBuilds2Active.builds2c7.state = turrets[num].active
		elseif event.element.name == "builds2c7" then
			local turrets = glob.cursed[player.name].turrets
			local num = 0
			for i = 1, #turrets do
				if num == 0 and gui.tableTurret.builds2c2.caption == turrets[i].nick then
					num = i
				end
			end
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
			local num = 0
			for i = 1, #turrets do
				if num == 0 and gui.tableTurret.builds2c2.caption == turrets[i].nick then
					num = i
				end
			end
			turrets[num].nick = gui.changeNick2t.text
			gui.tableTurret.builds2c2.caption = turrets[num].nick
			changeNick("turret",player)
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
				if gui.tableOptions.option2c1.state == true then
					resetstats(player)
					player.print("Cursed: Stats reseted")
					-- player.print({"",{"msg-cursed"},": ",{"msg-stats-reseted"}})
				end
				if gui.tableOptions.option2c2.state == true then
					resettalents(player)
					player.print("Cursed: Talents reseted")
					-- player.print({"",{"msg-cursed"},": ",{"msg-talents-reseted"}})
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
					player.print("Cursed: Mines destroyed")
					-- player.print({"",{"msg-cursed"},": ",{"msg-mines-deleted"}})
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
					player.print("Cursed: Turrets destroyed")
					-- player.print({"",{"msg-cursed"},": ",{"msg-turrets-deleted"}})
				end
				if gui.tableOptions.option3c3.state == true then
					-- if single == true then
						local tanks = glob.cursed.tanks
						local n = #tanks
						for i = 1, #tanks do
							tanks[n].entity.destroy()
							table.remove(tanks,n)
							n = n - 1
						end
						glob.cursed.tanks = tanks
						player.print("Cursed: Tanks destroyed")
						-- player.print({"",{"msg-cursed"},": ",{"msg-delete-tanksSP"}})
					-- else
						-- player.print({"",{"msg-cursed"},": ",{"msg-delete-tanksMP"}})
					-- end
				end
				if gui.tableOptions.option3c4.state == true then
					-- if single == true then
						local blood = glob.cursed.blood
						local n = #blood
						for i = 1, #blood do
							blood[n].entity.destroy()
							table.remove(blood,n)
							n = n - 1
						end
						glob.cursed.blood = blood
						player.print("Cursed: Blood destroyed")
						-- player.print({"",{"msg-cursed"},": ",{"msg-delete-bloodSP"}})
					-- else
						-- player.print({"",{"msg-cursed"},": ",{"msg-delete-bloodMP"}})
					-- end
				end
				if gui.tableOptions.option4c1.state == true then
					player.force.resetrecipes()
					player.print("Cursed: Debug recipes")
					-- player.print({"",{"msg-cursed"},": ",{"msg-debug-recipes"}})
				end
				if gui.tableOptions.option4c2.state == true then
					player.force.resettechnologies()
					player.print("Cursed: Debug technologies")
					-- player.print({"",{"msg-cursed"},": ",{"msg-debug-technologies"}})
				end
				if gui.tableOptions.option4c3.state == true then
					game.daytime = ((event.tick % 25000)/25000)
					player.print("Cursed: Debug time: " .. util.formattime(event.tick % 25000))
					-- player.print({"",{"msg-cursed"},": ",{"msg-debug-time"},": ",util.formattime(event.tick % 25000)})
				end
				if gui.tableOptions.option2c3.state == true then
					resetgui(false,true)
					someonejoined = true
					tiempo = 2
					resetall(player)
					player.print("Cursed: All reseted")
					-- player.print({"",{"msg-cursed"},": ",{"msg-all-reseted"}})
					return
				end
				if gui.tableOptions.option4c4.state == true then
					resetgui(false,true)
					someonejoined = true
					tiempo = 2
					player.print("Cursed: Debug GUI")
					-- player.print({"",{"msg-cursed"},": ",{"msg-debug-gui"}})
					return
				end
				guiFlipFlop("optionsMain",player)
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
			gui.frameTalents = gui.tableMain.add({ type="flow", name="frameTalents", direction = "horizontal", style = "" })
			gui.frameTalentsS = true
			local tableTalents = gui.frameTalents.add({ type="flow", name="tableTalents", direction = "horizontal", style = "" })
			gui.frameTalentsDet1 = tableTalents.add({ type="frame", name="frameTalents1", direction = "vertical" })
			gui.frameTalentsDet1.add({ type="button", name="talentsMain1", caption = {"",{"gui-talentsMain1"}," (",player.getitemcount("cursed-talent-1"),")"}, style = "talents_bar_button1" })
			gui.frameTalentsDet2 = tableTalents.add({ type="frame", name="frameTalents2", direction = "vertical" })
			gui.frameTalentsDet2.add({ type="button", name="talentsMain2", caption = {"",{"gui-talentsMain2"}," (",player.getitemcount("cursed-talent-2"),")"}, style = "talents_bar_button1" })
			gui.frameTalentsDet3 = tableTalents.add({ type="frame", name="frameTalents3", direction = "vertical" })
			gui.frameTalentsDet3.add({ type="button", name="talentsMain3", caption = {"",{"gui-talentsMain3"}," (",player.getitemcount("cursed-talent-3"),")"}, style = "talents_bar_button1" })
			gui.frameTalentsDet4 = tableTalents.add({ type="frame", name="frameTalents4", direction = "vertical" })
			gui.frameTalentsDet4.add({ type="button", name="talentsMain4", caption = {"",{"gui-talentsMain4"}," (",player.getitemcount("cursed-talent-4"),")"}, style = "talents_bar_button1" })
			gui.frameTalentsDet5 = tableTalents.add({ type="frame", name="frameTalents5", direction = "vertical" })
			gui.frameTalentsDet5.add({ type="button", name="talentsMain5", caption = {"",{"gui-talentsMain5"}," (",player.getitemcount("cursed-talent-5"),")"}, style = "talents_bar_button1" })
			gui.frameTalentsDet6 = tableTalents.add({ type="frame", name="frameTalents6", direction = "vertical" })
			gui.frameTalentsDet6.add({ type="button", name="talentsMain6", caption = {"",{"gui-talentsMain6"}," (",player.getitemcount("cursed-talent-6"),")"}, style = "talents_bar_button1" })
		end
	elseif name == "statsMain" then
		closeAllMain(2,player)
		if gui.frameStatsS then
			gui.frameStats.destroy()
			gui.frameStatsS = false
			closeAllStats(-1,player)
		else
			gui.frameStats = gui.tableMain.add({ type="flow", name="frameStats", direction = "horizontal", style = "" })
			gui.frameStatsS = true
			local tableStats = gui.frameStats.add({ type="flow", name="tableStats", direction = "horizontal", style = "" })
			gui.frameStatsDet1 = tableStats.add({ type="frame", name="frameStats1", direction = "vertical" })
			gui.frameStatsDet1.add({ type="button", name="statsMain1", caption = {"gui-statsMain1"}, style = "" })
			gui.frameStatsDet2 = tableStats.add({ type="frame", name="frameStats2", direction = "vertical" })
			gui.frameStatsDet2.add({ type="button", name="statsMain2", caption = {"gui-statsMain2"}, style = "" })
			gui.frameStatsDet3 = tableStats.add({ type="frame", name="frameStats3", direction = "vertical" })
			gui.frameStatsDet3.add({ type="button", name="statsMain3", caption = {"gui-statsMain3"}, style = "" })
			gui.frameStatsDet4 = tableStats.add({ type="frame", name="frameStats4", direction = "vertical" })
			gui.frameStatsDet4.add({ type="button", name="statsMain4", caption = {"gui-statsMain4"}, style = "" })
			gui.frameStatsDet5 = tableStats.add({ type="frame", name="frameStats5", direction = "vertical" })
			gui.frameStatsDet5.add({ type="button", name="statsMain5", caption = {"gui-statsMain5"}, style = "" })
			gui.frameStatsDet6 = tableStats.add({ type="frame", name="frameStats6", direction = "vertical" })
			gui.frameStatsDet6.add({ type="button", name="statsMain6", caption = {"gui-statsMain6"}, style = "" })
			gui.frameStatsDet7 = tableStats.add({ type="frame", name="frameStats7", direction = "vertical" })
			gui.frameStatsDet7.add({ type="button", name="statsMain7", caption = {"gui-statsMain7"}, style = "" })
			gui.frameStatsDet8 = tableStats.add({ type="frame", name="frameStats8", direction = "vertical" })
			gui.frameStatsDet8.add({ type="button", name="statsMain8", caption = {"gui-statsMain8"}, style = "" })
		end
	elseif name == "buildsMain" then
		closeAllMain(3,player)
		if gui.frameBuildsS then
			gui.frameBuilds.destroy()
			gui.frameBuildsS = false
			closeAllBuilds(-1,player)
		else
			gui.frameBuilds = gui.tableMain.add({ type="flow", name="frameBuilds", direction = "horizontal", style = "" })
			gui.frameBuildsS = true
			local tableBuilds = gui.frameBuilds.add({ type="flow", name="tableBuilds", direction = "horizontal", style = "" })
			gui.frameBuildsDet1 = tableBuilds.add({ type="frame", name="frameBuilds1", direction = "vertical" })
			gui.frameBuildsDet1.add({ type="button", name="buildsMain1", caption = {"gui-buildsMain1"}, style = "" })
			gui.frameBuildsDet2 = tableBuilds.add({ type="frame", name="frameBuilds2", direction = "vertical" })
			gui.frameBuildsDet2.add({ type="button", name="buildsMain2", caption = {"gui-buildsMain2"}, style = "" })
		end
	elseif name == "optionsMain" then
		closeAllMain(4,player)
		if gui.frameOptionsS then
			gui.frameOptions.destroy()
			gui.frameOptionsS = false
		else
			local opt = glob.cursed[player.name].opt
			gui.frameOptions = gui.tableMain.add({ type="frame", name="frameOptions", direction = "vertical", style = "" })
			gui.frameOptionsS = true
			gui.tableOptions = gui.frameOptions.add({ type="table", name="tableOptions", colspan = 4, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c1", caption = {"gui-option1c1"}, state=opt[1], style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c2", caption = {"gui-option1c2"}, state=opt[2], style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c3", caption = {"gui-option1c3"}, state=opt[3], style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c4", caption = {"gui-option1c4"}, state=opt[4], style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c5", caption = {"gui-option1c5"}, state=opt[5], style = "" })
			gui.tableOptions.add({ type="checkbox", name="option1c6", caption = {"gui-option1c6"}, state=opt[6], style = "" })
			gui.tableOptions.add({ type="label", name="optionl1", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl2", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="option3", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl4", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl5", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl6", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option2c1", caption = {"gui-option2c1"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option2c2", caption = {"gui-option2c2"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option2c3", caption = {"gui-option2c3"}, state=false, style = "" })
			gui.tableOptions.add({ type="label", name="optionl7", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option3c1", caption = {"gui-option3c1"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option3c2", caption = {"gui-option3c2"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option3c3", caption = {"gui-option3c3"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option3c4", caption = {"gui-option3c4"}, state=false, style = "" })
			gui.tableOptions.add({ type="label", name="option8", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl9", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl10", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl11", caption = " ", style = "" })
			gui.tableOptions.add({ type="checkbox", name="option4c1", caption = {"gui-option4c1"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option4c2", caption = {"gui-option4c2"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option4c3", caption = {"gui-option4c3"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option4c4", caption = {"gui-option4c4"}, state=false, style = "" })
			gui.tableOptions.add({ type="label", name="option12", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl13", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="option14", caption = " ", style = "" })
			gui.tableOptions.add({ type="label", name="optionl15", caption = " ", style = "" })
			gui.tableOptions.add({ type="button", name="option5c1", caption = {"gui-option5c1"}, style = "" })
			gui.tableOptions.add({ type="button", name="option5c2", caption = {"gui-option5c2"}, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option5c3", caption = {"gui-option5c3"}, state=false, style = "" })
			gui.tableOptions.add({ type="checkbox", name="option5c4", caption = {"gui-option5c4"}, state=false, style = "" })
		end
	elseif name == "talentsMain1" then
	closeAllTalents(1,player)
		if gui.tableTalents1S then
			gui.tableTalents1.destroy()
			gui.tableTalents1S = false
		else
			gui.tableTalents1 = gui.frameTalentsDet1.add({ type="flow", name="tableTalents1", direction = "vertical" })
			gui.tableTalents1S = true
			gui.tableTalents1.add({ type="button", name="talent1c1", caption = {"",{"gui-talent1c1"}," (",talents[1][1].now,"/",talents[1][1].max,")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c2", caption = {"",{"gui-talent1c2"}," (",talents[1][2].now,"/",talents[1][2].max,")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c3", caption = {"",{"gui-talent1c3"}," (",talents[1][3].now,"/",talents[1][3].max,")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c4", caption = {"",{"gui-talent1c4"}," (",talents[1][4].now,"/",talents[1][4].max,")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c5", caption = {"",{"gui-talent1c5"}," (",talents[1][5].now,"/","-",")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c6", caption = {"",{"gui-talent1c6"}," (",talents[1][6].now,"/","-",")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c7", caption = {"",{"gui-talent1c7"}," (",talents[1][7].now,"/","-",")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c8", caption = {"",{"gui-talent1c8"}," (",talents[1][8].now,"/","-",")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c9", caption = {"",{"gui-talent1c9"}," (",talents[1][9].now,"/","-",")"}, style = "" })
			gui.tableTalents1.add({ type="button", name="talent1c10", caption = {"",{"gui-talent1c10"}," (",talents[1][10].now,"/","-",")"}, style = "" })
		end
	elseif name == "talentsMain2" then
	closeAllTalents(2,player)
		if gui.tableTalents2S then
			gui.tableTalents2.destroy()
			gui.tableTalents2S = false
		else
			gui.tableTalents2 = gui.frameTalentsDet2.add({ type="flow", name="tableTalents2", direction = "vertical" })
			gui.tableTalents2S = true
			gui.tableTalents2.add({ type="button", name="talent2c1", caption = {"",{"gui-talent2c1"}," (",talents[2][1].now,"/",talents[2][1].max,")"}, style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c2", caption = {"",{"gui-talent2c2"}," (",talents[2][2].now,"/",talents[2][2].max,")"}, style = "" })
			gui.tableTalents2.add({ type="button", name="talent2c3", caption = {"",{"gui-talent2c3"}," (",talents[2][3].now,"/",talents[2][3].max,")"}, style = "" })
			-- gui.tableTalents2.add({ type="button", name="talent2c4", caption = {"",{"gui-talent2c4"}," (",talents[2][4].now,"/",talents[2][4].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents2.add({ type="button", name="talent2c5", caption = {"",{"gui-talent2c5"}," (",talents[2][5].now,"/",talents[2][5].max,")"}, style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain3" then
	closeAllTalents(3,player)
		if gui.tableTalents3S then
			gui.tableTalents3.destroy()
			gui.tableTalents3S = false
		else
			gui.tableTalents3 = gui.frameTalentsDet3.add({ type="flow", name="tableTalents3", direction = "vertical" })
			gui.tableTalents3S = true
			gui.tableTalents3.add({ type="button", name="talent3c1", caption = {"",{"gui-talent3c1"}," (",talents[3][1].now,"/",talents[3][1].max,")"}, style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c2", caption = {"",{"gui-talent3c2"}," (",talents[3][2].now,"/",talents[3][2].max,")"}, style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c3", caption = {"",{"gui-talent3c3"}," (",talents[3][3].now,"/",talents[3][3].max,")"}, style = "" })
			gui.tableTalents3.add({ type="button", name="talent3c4", caption = {"",{"gui-talent3c4"}," (",talents[3][4].now,"/",talents[3][4].max,")"}, style = "" })
			-- gui.tableTalents3.add({ type="button", name="talent3c5", caption = {"",{"gui-talent3c5"}," (",talents[3][5].now,"/",talents[3][5].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents3.add({ type="button", name="talent3c6", caption = {"",{"gui-talent3c6"}," (",talents[3][6].now,"/",talents[3][6].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents3.add({ type="button", name="talent3c7", caption = {"",{"gui-talent3c7"}," (",talents[3][7].now,"/",talents[3][7].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents3.add({ type="button", name="talent3c8", caption = {"",{"gui-talent3c8"}," (",talents[3][8].now,"/",talents[3][8].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents3.add({ type="button", name="talent3c9", caption = {"",{"gui-talent3c9"}," (",talents[3][9].now,"/",talents[3][9].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents3.add({ type="button", name="talent3c10", caption = {"",{"gui-talent3c10"}," (",talents[3][10].now,"/",talents[3][10].max,")"}, style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain4" then
	closeAllTalents(4,player)
		if gui.tableTalents4S then
			gui.tableTalents4.destroy()
			gui.tableTalents4S = false
		else
			gui.tableTalents4 = gui.frameTalentsDet4.add({ type="flow", name="tableTalents4", direction = "vertical" })
			gui.tableTalents4S = true
			gui.tableTalents4.add({ type="button", name="talent4c1", caption = {"",{"gui-talent4c1"}," (",talents[4][1].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c2", caption = {"",{"gui-talent4c2"}," (",talents[4][2].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c3", caption = {"",{"gui-talent4c3"}," (",talents[4][3].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c4", caption = {"",{"gui-talent4c4"}," (",talents[4][4].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c5", caption = {"",{"gui-talent4c5"}," (",talents[4][5].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c6", caption = {"",{"gui-talent4c6"}," (",talents[4][6].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c7", caption = {"",{"gui-talent4c7"}," (",talents[4][7].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c8", caption = {"",{"gui-talent4c8"}," (",talents[4][8].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c9", caption = {"",{"gui-talent4c9"}," (",talents[4][9].now,"/","-",")"}, style = "" })
			gui.tableTalents4.add({ type="button", name="talent4c10", caption = {"",{"gui-talent4c10"}," (",talents[4][10].now,"/","-",")"}, style = "" })
		end
	elseif name == "talentsMain5" then
	closeAllTalents(5,player)
		if gui.tableTalents5S then
			gui.tableTalents5.destroy()
			gui.tableTalents5S = false
		else
			gui.tableTalents5 = gui.frameTalentsDet5.add({ type="flow", name="tableTalents5", direction = "vertical" })
			gui.tableTalents5S = true
			-- gui.tableTalents5.add({ type="button", name="talent5c1", caption = {"",{"gui-talent5c1"}," (",talents[5][1].now,"/",talents[5][1].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents5.add({ type="button", name="talent5c2", caption = {"",{"gui-talent5c2"}," (",talents[5][2].now,"/",talents[5][2].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents5.add({ type="button", name="talent5c3", caption = {"",{"gui-talent5c3"}," (",talents[5][3].now,"/",talents[5][3].max,")"}, style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c4", caption = {"",{"gui-talent5c4"}," (",talents[5][4].now,"/","-",")"}, style = "" })
			-- gui.tableTalents5.add({ type="button", name="talent5c5", caption = {"",{"gui-talent5c5"}," (",talents[5][5].now,"/",talents[5][5].max,")"}, style = "fake_disabled_button_style" })
			gui.tableTalents5.add({ type="button", name="talent5c6", caption = {"",{"gui-talent5c6"}," (",talents[5][6].now,"/","-",")"}, style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c7", caption = {"",{"gui-talent5c7"}," (",talents[5][7].now,"/",talents[5][7].max,")"}, style = "" })
			gui.tableTalents5.add({ type="button", name="talent5c8", caption = {"",{"gui-talent5c8"}," (",talents[5][8].now,"/","-",")"}, style = "" })
			-- gui.tableTalents5.add({ type="button", name="talent5c9", caption = {"",{"gui-talent5c9"}," (",talents[5][9].now,"/",talents[5][9].max,")"}, style = "fake_disabled_button_style" })
		end
	elseif name == "talentsMain6" then
		closeAllTalents(6,player)
		if gui.tableTalents6S then
			gui.tableTalents6.destroy()
			gui.tableTalents6S = false
		else
			gui.tableTalents6 = gui.frameTalentsDet6.add({ type="flow", name="tableTalents5", direction = "vertical" })
			gui.tableTalents6S = true
			-- gui.tableTalents6.add({ type="button", name="talent6c1", caption = {"",{"gui-talent6c1"}," (",talents[6][1].now,"/",talents[6][1].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c2", caption = {"",{"gui-talent6c2"}," (",talents[6][2].now,"/",talents[6][2].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c3", caption = {"",{"gui-talent6c3"}," (",talents[6][3].now,"/",talents[6][3].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c4", caption = {"",{"gui-talent6c4"}," (",talents[6][4].now,"/",talents[6][4].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c5", caption = {"",{"gui-talent6c5"}," (",talents[6][5].now,"/",talents[6][5].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c6", caption = {"",{"gui-talent6c6"}," (",talents[6][6].now,"/",talents[6][6].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c7", caption = {"",{"gui-talent6c7"}," (",talents[6][7].now,"/",talents[6][7].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c8", caption = {"",{"gui-talent6c8"}," (",talents[6][8].now,"/",talents[6][8].max,")"}, style = "fake_disabled_button_style" })
			-- gui.tableTalents6.add({ type="button", name="talent6c9", caption = {"",{"gui-talent6c9"}," (",talents[6][9].now,"/",talents[6][9].max,")"}, style = "fake_disabled_button_style" })
		end
	elseif name == "statsMain1" then
		closeAllStats(1,player)
		if gui.tableStats1S then
			gui.tableStats1.destroy()
			gui.tableStats1S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats1 = gui.frameStatsDet1.add({ type="flow", name="tableStats1", direction = "vertical" })
			gui.tableStats1S = true
			gui.tableStats1.add({ type="label", name="stat1c1", caption = {"",{"gui-statsMain1"}," - ",{"gui-statsLevel"}," ",stats.general.level}, style = "" })
			gui.tableStats1.add({ type="label", name="stat1c2", caption = {"",{"gui-statsExperience"},": ",stats.general.exp," / ",stats.general.next}, style = "" })
			gui.tableStats1.add({type="progressbar", name="stat1c3", size=100}).value = stats.general.exp / stats.general.next
			gui.tableStats1.add({ type="label", name="stat1c4", caption = {"",{"gui-statsBonus"},": ",stats.general.level/40,"%"}, style = "" })
			gui.tableStats1.add({ type="label", name="stat1c5", caption = {"gui-stat1bonus"}, style = "" })
		end
	elseif name == "statsMain2" then
		closeAllStats(2,player)
		if gui.tableStats2S then
			gui.tableStats2.destroy()
			gui.tableStats2S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats2 = gui.frameStatsDet2.add({ type="flow", name="tableStats2", direction = "vertical" })
			gui.tableStats2S = true
			gui.tableStats2.add({ type="label", name="stat2c1", caption = {"",{"gui-statsMain2"}," - ",{"gui-statsLevel"}," ",stats.mining.level}, style = "" })
			gui.tableStats2.add({ type="label", name="stat2c2", caption = {"",{"gui-statsExperience"},": ",stats.mining.exp," / ",stats.mining.next," (+",100 * (talents[1][5].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats2.add({type="progressbar", name="stat2c3", size=100}).value = stats.mining.exp / stats.mining.next
			gui.tableStats2.add({ type="label", name="stat2c4", caption = {"",{"gui-statsBonus"},": ",stats.mining.level,"%"}, style = "" })
			gui.tableStats2.add({ type="label", name="stat2c5", caption = {"gui-stat2bonus"}, style = "" })
		end
	elseif name == "statsMain3" then
		closeAllStats(3,player)
		if gui.tableStats3S then
			gui.tableStats3.destroy()
			gui.tableStats3S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats3 = gui.frameStatsDet3.add({ type="flow", name="tableStats3", direction = "vertical" })
			gui.tableStats3S = true
			gui.tableStats3.add({ type="label", name="stat3c1", caption = {"",{"gui-statsMain3"}," - ",{"gui-statsLevel"}," ",stats.farming.level}, style = "" })
			gui.tableStats3.add({ type="label", name="stat3c2", caption = {"",{"gui-statsExperience"},": ",stats.farming.exp," / ",stats.farming.next," (+",100 * (talents[1][6].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats3.add({type="progressbar", name="stat3c3", size=100}).value = stats.farming.exp / stats.farming.next
			gui.tableStats3.add({ type="label", name="stat3c4", caption = {"",{"gui-statsBonus"},": ",stats.farming.level * 2,"%"}, style = "" })
			gui.tableStats3.add({ type="label", name="stat3c5", caption = {"gui-stat3bonus"}, style = "" })
		end
	elseif name == "statsMain4" then
		closeAllStats(4,player)
		if gui.tableStats4S then
			gui.tableStats4.destroy()
			gui.tableStats4S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats4 = gui.frameStatsDet4.add({ type="flow", name="tableStats4", direction = "vertical" })
			gui.tableStats4S = true
			gui.tableStats4.add({ type="label", name="stat4c1", caption = {"",{"gui-statsMain4"}," - ",{"gui-statsLevel"}," ",stats.crafting.level}, style = "" })
			gui.tableStats4.add({ type="label", name="stat4c2", caption = {"",{"gui-statsExperience"},": ",stats.crafting.exp," / ",stats.crafting.next," (+",100 * (talents[1][7].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats4.add({type="progressbar", name="stat4c3", size=100}).value = stats.crafting.exp / stats.crafting.next
			gui.tableStats4.add({ type="label", name="stat4c4", caption = {"",{"gui-statsBonus"},": ",stats.crafting.level / 2.5,"%"}, style = "" })
			gui.tableStats4.add({ type="label", name="stat4c5", caption = {"gui-stat4bonus"}, style = "" })
		end
	elseif name == "statsMain5" then
		closeAllStats(5,player)
		if gui.tableStats5S then
			gui.tableStats5.destroy()
			gui.tableStats5S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats5 = gui.frameStatsDet5.add({ type="flow", name="tableStats5", direction = "vertical" })
			gui.tableStats5S = true
			gui.tableStats5.add({ type="label", name="stat5c1", caption = {"",{"gui-statsMain5"}," - ",{"gui-statsLevel"}," ",stats.explore.level}, style = "" })
			gui.tableStats5.add({ type="label", name="stat5c2", caption = {"",{"gui-statsExperience"},": ",stats.explore.exp," / ",stats.explore.next," (+",100 * (talents[1][8].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats5.add({type="progressbar", name="stat5c3", size=100}).value = stats.explore.exp / stats.explore.next
			gui.tableStats5.add({ type="label", name="stat5c4", caption = {"",{"gui-statsBonus"},": ",100 * stats.explore.level / 32,"%"}, style = "" })
			gui.tableStats5.add({ type="label", name="stat5c5", caption = {"gui-stat5bonus"}, style = "" })
		end
	elseif name == "statsMain6" then
		closeAllStats(6,player)
		if gui.tableStats6S then
			gui.tableStats6.destroy()
			gui.tableStats6S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats6 = gui.frameStatsDet6.add({ type="flow", name="tableStats6", direction = "vertical" })
			gui.tableStats6S = true
			gui.tableStats6.add({ type="label", name="stat6c1", caption = {"",{"gui-statsMain6"}," - ",{"gui-statsLevel"}," ",stats.defence.level}, style = "" })
			gui.tableStats6.add({ type="label", name="stat6c2", caption = {"",{"gui-statsExperience"},": ",stats.defence.exp," / ",stats.defence.next," (+",100 * (talents[1][10].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats6.add({type="progressbar", name="stat6c3", size=100}).value = stats.defence.exp / stats.defence.next
			gui.tableStats6.add({ type="label", name="stat6c4", caption = {"",{"gui-statsBonus"},": ",stats.defence.level / 100,"%"}, style = "" })
			gui.tableStats6.add({ type="label", name="stat6c5", caption = {"gui-stat6bonus"}, style = "" })
		end
	elseif name == "statsMain7" then
		closeAllStats(7,player)
		if gui.tableStats7S then
			gui.tableStats7.destroy()
			gui.tableStats7S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats7 = gui.frameStatsDet7.add({ type="flow", name="tableStats7", direction = "vertical" })
			gui.tableStats7S = true
			gui.tableStats7.add({ type="label", name="stat7c1", caption = {"",{"gui-statsMain7"}," - ",{"gui-statsLevel"}," ",stats.range.level}, style = "" })
			gui.tableStats7.add({ type="label", name="stat7c2", caption = {"",{"gui-statsExperience"},": ",stats.range.exp," / ",stats.range.next," (+",100 * (talents[1][9].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats7.add({type="progressbar", name="stat7c3", size=100}).value = stats.range.exp / stats.range.next
			gui.tableStats7.add({ type="label", name="stat7c4", caption = {"",{"gui-statsBonus"},": ",6.5 + stats.range.level * 0.5,"%"}, style = "" })
			gui.tableStats7.add({ type="label", name="stat7c5", caption = {"gui-stat7bonus"}, style = "" })
		end
	elseif name == "statsMain8" then
		closeAllStats(8,player)
		if gui.tableStats8S then
			gui.tableStats8.destroy()
			gui.tableStats8S = false
		else
			local stats = glob.cursed[player.name].stats
			gui.tableStats8 = gui.frameStatsDet8.add({ type="flow", name="tableStats8", direction = "vertical" })
			gui.tableStats8S = true
			gui.tableStats8.add({ type="label", name="stat8c1", caption = {"",{"gui-statsMain8"}," - ",{"gui-statsLevel"}," ",stats.melee.level}, style = "" })
			gui.tableStats8.add({ type="label", name="stat8c2", caption = {"",{"gui-statsExperience"},": ",stats.melee.exp," / ",stats.melee.next," (+",100 * (talents[1][9].now / 40 + stats.general.level / 40),"%)"}, style = "" })
			gui.tableStats8.add({type="progressbar", name="stat8c3", size=100}).value = stats.melee.exp / stats.melee.next
			gui.tableStats8.add({ type="label", name="stat8c4", caption = {"",{"gui-statsBonus"},": ",stats.melee.level * 0,"%"}, style = "" })
			gui.tableStats8.add({ type="label", name="stat8c5", caption = {"gui-stat8bonus"}, style = "" })
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
			gui.tableBuilds1 = gui.frameBuildsDet1.add({ type="flow", name="tableBuilds1", direction = "vertical" })
			gui.tableBuilds1S = true
			gui.tableMine = gui.tableBuilds1.add({ type="flow", name="tableMine", direction = "horizontal" })
			gui.tableMine.add({ type="button", name="builds1c1", caption = {"gui-builds1c1"}, style = "" })
			gui.tableMine.add({ type="button", name="builds1c2", caption = mines[num].nick, style = "" })
			gui.tableMine.add({ type="button", name="builds1c3", caption = {"gui-builds1c3"}, style = "" })
			gui.tableBuilds1Active = gui.tableBuilds1.add({ type="table", name="tableBuilds1Active", colspan = 2, style = "" })
			gui.tableBuilds1Active.add({ type="label", name="builds1c4", caption = {"",{"gui-builds1c4"}," ",mines[num].level}, style = "" })
			gui.tableBuilds1Active.add({ type="checkbox", name="builds1c7", caption = {"gui-builds1c7"}, state=mines[num].active, style = "" })
			gui.tableBuilds1.add({ type="label", name="builds1c5", caption = {"",{"gui-builds1c5"}," ",mines[num].exp,"/",mines[num].next}, style = "" })
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
			gui.tableBuilds2 = gui.frameBuildsDet2.add({ type="flow", name="tableBuilds2", direction = "vertical" })
			gui.tableBuilds2S = true
			gui.tableTurret = gui.tableBuilds2.add({ type="flow", name="tableTurret", direction = "horizontal" })
			gui.tableTurret.add({ type="button", name="builds2c1", caption = {"gui-builds2c1"}, style = "" })
			gui.tableTurret.add({ type="button", name="builds2c2", caption = turrets[num].nick, style = "" })
			gui.tableTurret.add({ type="button", name="builds2c3", caption = {"gui-builds2c3"}, style = "" })
			gui.tableBuilds2Active = gui.tableBuilds2.add({ type="table", name="tableBuilds2Active", colspan = 2, style = "" })
			gui.tableBuilds2Active.add({ type="label", name="builds2c4", caption = {"",{"gui-builds2c4"}," ",turrets[num].level}, style = "" })
			gui.tableBuilds2Active.add({ type="checkbox", name="builds2c7", caption = {"gui-builds2c7"}, state=turrets[num].active, style = "" })
			gui.tableBuilds2.add({ type="label", name="builds2c5", caption = {"",{"gui-builds2c5"}," ",turrets[num].exp,"/",turrets[num].next}, style = "" })
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
			gui.changeNick1 = player.gui.center.add({ type="flow", name="changeNick1", direction="vertical" })
			gui.changeNick1S = true
			local framechangeNick1 = gui.changeNick1.add({ type="frame", name="changeNick1f1", direction = "vertical" })
			gui.changeNick1t = framechangeNick1.add({ type="textfield", name="changeNick1t", text=""})
			local framechangeNick1Buttons = framechangeNick1.add({ type="flow", name="changeNick1Buttons",direction="horizontal" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b1", caption = {"gui-changeNickb1"}, style = "" })
			framechangeNick1Buttons.add({ type="button", name="changeNick1b2", caption = {"gui-changeNickb2"}, style = "" })
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
			framechangeNick2Buttons.add({ type="button", name="changeNick2b1", caption = {"gui-changeNickb1"}, style = "" })
			framechangeNick2Buttons.add({ type="button", name="changeNick2b2", caption = {"gui-changeNickb2"}, style = "" })
		end
	end
end
function closeAllMain(num,player)
	local gui = glob.cursed[player.name].gui
	closeAllTalents(-1,player)
	closeAllStats(-1,player)
	closeAllBuilds(-1,player)
	if gui ~= nil and num == -1 then
		gui.frameTalentsS = false
		gui.frameStatsS = false
		gui.frameBuildsS = false 
		gui.frameOptionsS = false 
	end
	if gui ~= nil and gui.frameTalentsS and num ~= 1 then
		gui.frameTalents.destroy()
		gui.frameTalentsS = false
	end
	if gui ~= nil and gui.frameStatsS and num ~= 2 then
		gui.frameStats.destroy()
		gui.frameStatsS = false 
	end
	if gui ~= nil and gui.frameBuildsS and num ~= 3 then
		gui.frameBuilds.destroy()
		gui.frameBuildsS = false 
	end
	if gui ~= nil and gui.frameOptionsS and num ~= 4 then
		gui.frameOptions.destroy()
		gui.frameOptionsS = false 
	end
end
function closeAllTalents(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and num == -1 then
		gui.tableTalents1S = false
		gui.tableTalents2S = false
		gui.tableTalents3S = false
		gui.tableTalents4S = false
		gui.tableTalents5S = false
		gui.tableTalents6S = false
	end
	if gui ~= nil and gui.tableTalents1S and num ~= 1 then
		gui.tableTalents1.destroy()
		gui.tableTalents1S = false
	end
	if gui ~= nil and gui.tableTalents2S and num ~= 2 then
		gui.tableTalents2.destroy()
		gui.tableTalents2S = false
	end
	if gui ~= nil and gui.tableTalents3S and num ~= 3 then
		gui.tableTalents3.destroy()
		gui.tableTalents3S = false
	end
	if gui ~= nil and gui.tableTalents4S and num ~= 4 then
		gui.tableTalents4.destroy()
		gui.tableTalents4S = false
	end
	if gui ~= nil and gui.tableTalents5S and num ~= 5 then
		gui.tableTalents5.destroy()
		gui.tableTalents5S = false
	end
	if gui ~= nil and gui.tableTalents6S and num ~= 6 then
		gui.tableTalents6.destroy()
		gui.tableTalents6S = false
	end
end
function closeAllStats(num,player)
	local gui = glob.cursed[player.name].gui
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
	if gui ~= nil and gui.tableStats1S and num ~= 1 then
		gui.tableStats1.destroy()
		gui.tableStats1S = false
	end
	if gui ~= nil and gui.tableStats2S and num ~= 2 then
		gui.tableStats2.destroy()
		gui.tableStats2S = false
	end
	if gui ~= nil and gui.tableStats3S and num ~= 3 then
		gui.tableStats3.destroy()
		gui.tableStats3S = false
	end
	if gui ~= nil and gui.tableStats4S and num ~= 4 then
		gui.tableStats4.destroy()
		gui.tableStats4S = false
	end
	if gui ~= nil and gui.tableStats5S and num ~= 5 then
		gui.tableStats5.destroy()
		gui.tableStats5S = false
	end
	if gui ~= nil and gui.tableStats6S and num ~= 6 then
		gui.tableStats6.destroy()
		gui.tableStats6S = false
	end
	if gui ~= nil and gui.tableStats7S and num ~= 7 then
		gui.tableStats7.destroy()
		gui.tableStats7S = false
	end
	if gui ~= nil and gui.tableStats8S and num ~= 8 then
		gui.tableStats8.destroy()
		gui.tableStats8S = false
	end
end
function closeAllBuilds(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and num == -1 then
		gui.tableBuilds1S = false
		gui.tableBuilds2S = false
	end
	if gui ~= nil and gui.tableBuilds1S and num ~= 1 then
		gui.tableBuilds1.destroy()
		gui.tableBuilds1S = false
	end
	if gui ~= nil and gui.tableBuilds2S and num ~= 2 then
		gui.tableBuilds2.destroy()
		gui.tableBuilds2S = false
	end
end
