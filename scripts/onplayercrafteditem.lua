module("onplayercrafteditem", package.seeall)

function main(event,noCraftExp)
	if event.itemstack.name == "cursed-donation" then
		local player = game.getplayer(event.playerindex)
		if player.character then
			local donations = glob.cursed[player.name].aux.donations
			if donations > 0 then
				if player.character.health > 50 then
					if player.caninsert{name = "cursed-donation", count = 1} then
						local lasthp = glob.cursed[player.name].aux.lasthp
						player.character.health = player.character.health - 50
						lasthp = player.character.health
						donations = donations - 1
						glob.cursed[player.name].aux.donations = donations
						glob.cursed[player.name].aux.lasthp = lasthp
						local stats = glob.cursed[player.name].stats
						local cant = math.floor((stats.explore.level * datos.resExplore) / 100)
						if math.random(100 / datos.resExplore) <= stats.explore.level - (cant * (100 / datos.resExplore)) then
							cant = cant + 1
						end
						if cant > 0 then
							player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
							if glob.cursed[player.name].opt[4] == true then
								player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
							end
							game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)} })
						end
						
						local newtp = math.floor((stats.explore.level * datos.resExplore) / 500)
						if math.random(500 / datos.resExplore) <= stats.explore.level - (newtp * (500 / datos.resExplore)) then
							newtp = newtp + 1
						end
						if newtp > 0 then
							local num = math.random(6)
							player.insert{name = "cursed-talent-part-" .. num, count = newtp}
							if glob.cursed[player.name].opt[10] == true then
								player.print({"msg.cursed",{"msg.item-bonus",newtp, game.getlocaliseditemname("cursed-talent-part-" .. num)}})
								game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",newtp , game.getlocaliseditemname("cursed-talent-part-" .. num)} })
							end
						end
						
					else
						if glob.cursed[player.name].opt[7] == true then
							player.print({"msg.cursed", {"msg.mininventory"}})
						end
					end
				else
					remover.item = event.itemstack
					remover.player = player.name
					if glob.cursed[player.name].opt[7] == true then
						player.print({"msg.cursed", {"msg.mindonation"}})
					end
				end
			else
				remover.item = event.itemstack
				remover.player = player.name
				if glob.cursed[player.name].opt[7] == true then
					player.print({"msg.cursed", {"msg.maxdonation"}})
				end
			end
		else
			remover.item = event.itemstack
			remover.player = player.name
		end
	elseif event.itemstack.name == "cursed-ammo1" then
		local player = game.getplayer(event.playerindex)
		remover.item = event.itemstack
		remover.player = player.name
		if player.character then
			local arrows = glob.cursed[player.name].aux.arrows
			if arrows > 0 then
				if player.character.health > 25 then
					local stats = glob.cursed[player.name].stats
					if player.caninsert{name="cursed-ammo1-" .. stats.range.level, count = 1} then
						local lasthp = glob.cursed[player.name].aux.lasthp
						player.character.health = player.character.health - 25
						lasthp = player.character.health
						arrows = arrows - 1
						glob.cursed[player.name].aux.arrows = arrows
						glob.cursed[player.name].aux.lasthp = lasthp
						player.insert({name="cursed-ammo1-"..stats.range.level,count=event.itemstack.count})
						local cant = math.floor((stats.explore.level * datos.resExplore) / 100)
						if math.random(100 / datos.resExplore) <= stats.explore.level - (cant * (100 / datos.resExplore)) then
							cant = cant + 1
						end
						if cant > 0 then
							player.insert{name="cursed-ammo1-"..stats.range.level,count=(event.itemstack.count * cant)}
							if glob.cursed[player.name].opt[4] == true then
								player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname("cursed-ammo1-" .. stats.range.level)}})
							end
							game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",event.itemstack.count * cant , game.getlocaliseditemname("cursed-ammo1-" .. stats.range.level)} })
						end
						
						local newtp = math.floor((stats.explore.level * datos.resExplore) / 500)
						if math.random(500 / datos.resExplore) <= stats.explore.level - (newtp * (500 / datos.resExplore)) then
							newtp = newtp + 1
						end
						if newtp > 0 then
							local num = math.random(6)
							player.insert{name = "cursed-talent-part-" .. num, count = newtp}
							if glob.cursed[player.name].opt[10] == true then
								player.print({"msg.cursed",{"msg.item-bonus",newtp, game.getlocaliseditemname("cursed-talent-part-" .. num)}})
								game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",newtp , game.getlocaliseditemname("cursed-talent-part-" .. num)} })
							end
						end
						
					else
						if glob.cursed[player.name].opt[7] == true then
							player.print({"msg.cursed", {"msg.mininventory"}})
						end
					end
				else
					if glob.cursed[player.name].opt[7] == true then
						player.print({"msg.cursed", {"msg.minarrow"}})
					end
				end
			else
				if glob.cursed[player.name].opt[7] == true then
					player.print({"msg.cursed", {"msg.maxarrow"}})
				end
			end
		end
	elseif string.sub(event.itemstack.name,1,19) == "cursed-talent-part-" then
		local num = (tonumber(string.sub(event.itemstack.name,20,21)))
		local player = game.getplayer(event.playerindex)
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
		local cant = math.floor(talents[4][num].now / 2)
		if math.random(2) <= talents[4][num].now - (cant * 2) then
			cant = cant + 1
		end
		if cant > 0 then
			player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
			if glob.cursed[player.name].opt[6] == true then
				player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
			end
				game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)} })
		end
	elseif not noCraftExp[event.itemstack.name] then
		local player = game.getplayer(event.playerindex)
		local stats = glob.cursed[player.name].stats
		local talents = glob.cursed[player.name].talents
		local gui = glob.cursed[player.name].gui
		local class = glob.cursed[player.name].class
		stats.crafting.exp = mix.round(stats.crafting.exp + ( 0.1 * (1 + talents[1][7].now / 40 + stats.general.level*datos.resGeneral)),3)
		local cant = math.floor((stats.crafting.level * datos.resCrafting) / 100)
		if math.random(100 / datos.resCrafting) <= stats.crafting.level - (cant * (100 / datos.resCrafting)) then
			cant = cant + 1
		end
		if cant > 0 then
			player.insert{name=event.itemstack.name,count=(event.itemstack.count * cant)}
			if glob.cursed[player.name].opt[3] == true then
				player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)}})
				game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying",event.itemstack.count * cant , game.getlocaliseditemname(event.itemstack.name)} })
			end
			if stats.crafting.exp < stats.crafting.next * 1.5 then
				stats.crafting.exp = mix.round(stats.crafting.exp + ( cant * 0.1 * (1 * class.multCrafting + talents[1][7].now / 40 + stats.general.level*datos.resGeneral)),3)
			end
		end
		
		local newtp = math.floor((stats.crafting.level * datos.resCrafting) / 500)
		if math.random(500 / datos.resCrafting) <= stats.crafting.level - (newtp * (500 / datos.resCrafting)) then
			newtp = newtp + 1
		end
		if newtp > 0 then
			local num = math.random(6)
			player.insert{name = "cursed-talent-part-" .. num, count = newtp}
			if glob.cursed[player.name].opt[10] == true then
				player.print({"msg.cursed",{"msg.item-bonus",newtp, game.getlocaliseditemname("cursed-talent-part-" .. num)}})
			end
		end
		
		if stats.crafting.exp >= stats.crafting.next then
			skillUp.main(stats.crafting,(((stats.crafting.level + 1) * (stats.crafting.level + 1)) * 0.8 + 10 ),player)
		end
		if gui ~= nil and gui.tableStats4S then
			gui.tableStats4.stat4c2.caption = {"gui.stat4c2",math.ceil(stats.crafting.exp),math.ceil(stats.crafting.next),mix.round(100 * (talents[1][7].now / 40 + stats.general.level*datos.resGeneral + (class.multCrafting - 1)),1)}
			gui.tableStats4.stat4c3.value = stats.crafting.exp / stats.crafting.next
		end
	end
end