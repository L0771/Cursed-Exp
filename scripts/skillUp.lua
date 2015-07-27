module("skillUp", package.seeall)

function main(statcalled,newnext,player)
	local stats = glob.cursed[player.name].stats
	local class = glob.cursed[player.name].class
	if statcalled.exp >= statcalled.next and ((statcalled == stats.general and (class.maxGeneral == 0 or statcalled.level < class.maxGeneral)) or (statcalled == stats.mining and (class.maxMining == 0 or statcalled.level < class.maxMining)) or (statcalled == stats.farming and (class.maxFarming == 0 or statcalled.level < class.maxFarming)) or (statcalled == stats.crafting and (class.maxCrafting == 0 or statcalled.level < class.maxCrafting)) or (statcalled == stats.explore and (class.maxExplore == 0 or statcalled.level < class.maxExplore)) or (statcalled == stats.defence and (class.maxDefence == 0 or statcalled.level < class.maxDefence)) or (statcalled == stats.range and (class.maxBow == 0 or statcalled.level < class.maxBow))) then
		statcalled.level = statcalled.level + 1
		statcalled.exp = mix.round(statcalled.exp - statcalled.next,3)
		statcalled.next = newnext
		local gui = glob.cursed[player.name].gui
		if statcalled == stats.general then
			player.insert({name="cursed-talent-2",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat1"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil then
				local talents = glob.cursed[player.name].talents
				if gui.frameTalentsS then
						gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
				end
				if gui.tableStats1S then
					gui.tableStats1.stat1c1.caption = {"gui.stat1c1",{"bsc.stat1"},statcalled.level}
					gui.tableStats1.stat1c4.caption = {"gui.stat1c4",mix.round(statcalled.level * datos.resGeneral,2) }
				end
				if gui.tableStats2S then
					gui.tableStats2.stat2c2.caption = {"gui.stat2c2",math.ceil(stats.mining.exp),math.ceil(stats.mining.next),mix.round(100 * (talents[1][5].now / 40 + stats.general.level*datos.resGeneral + (class.multMining - 1)),1)}
				end
				if gui.tableStats3S then
					gui.tableStats3.stat3c2.caption = {"gui.stat3c2",math.ceil(stats.farming.exp),math.ceil(stats.farming.next),mix.round(100 * (talents[1][6].now / 40 + stats.general.level*datos.resGeneral + (class.multFarming - 1)),1)}
				end
				if gui.tableStats4S then
					gui.tableStats4.stat4c2.caption = {"gui.stat4c2",math.ceil(stats.crafting.exp),math.ceil(stats.crafting.next),mix.round(100 * (talents[1][7].now / 40 + stats.general.level*datos.resGeneral + (class.multCrafting - 1)),1)}
				end
				if gui.tableStats5S then
					gui.tableStats5.stat5c2.caption = {"gui.stat5c2",math.ceil(stats.explore.exp),math.ceil(stats.explore.next),mix.round(100 * (talents[1][8].now / 40 + stats.general.level*datos.resGeneral + (class.multExplore - 1)),1)}
				end
				if gui.tableStats6S then
					gui.tableStats6.stat6c2.caption = {"gui.stat6c2",math.ceil(stats.defence.exp),math.ceil(stats.defence.next),mix.round(100 * (talents[1][10].now / 40 + stats.general.level*datos.resGeneral + (class.multDefence - 1)),1)}
				end
				if gui.tableStats7S then
					gui.tableStats7.stat7c2.caption = {"gui.stat7c2",stats.range.exp,stats.range.next,100 * (talents[1][9].now / 40 + stats.general.level*datos.resGeneral + (class.multBow - 1))}
				end
				-- if gui.tableStats8S then
					-- gui.tableStats7.stat7c2.caption = {"gui.stat8c2",stats.range.exp,stats.range.next,100 * (talents[1][9].now / 40 + stats.general.level*datos.resGeneral + (class.multBow - 1))}
				-- end
			end
		elseif statcalled == stats.mining then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat2"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats2S then
				gui.tableStats2.stat2c1.caption = {"gui.stat2c1",{"bsc.stat2"},statcalled.level}
				gui.tableStats2.stat2c4.caption = {"gui.stat2c4",mix.round(statcalled.level * datos.resMining,2) }
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		elseif statcalled == stats.farming then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat3"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats3S then
				gui.tableStats3.stat3c1.caption = {"gui.stat3c1",{"bsc.stat3"},statcalled.level}
				gui.tableStats3.stat3c4.caption = {"gui.stat3c4",mix.round(statcalled.level * datos.resFarming,2)}
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		elseif statcalled == stats.crafting then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat4"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats4S then
				gui.tableStats4.stat4c1.caption = {"gui.stat4c1",{"bsc.stat4"},statcalled.level}
				gui.tableStats4.stat4c4.caption = {"gui.stat4c4",mix.round(statcalled.level * datos.resCrafting,2)}
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		elseif statcalled == stats.explore	then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat5"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats5S then
				gui.tableStats5.stat5c1.caption = {"gui.stat5c1",{"bsc.stat5"},statcalled.level}
				gui.tableStats5.stat5c4.caption = {"gui.stat5c4",mix.round(statcalled.level * datos.resExplore,2)}
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		elseif statcalled == stats.defence then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat6"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats6S then
				gui.tableStats6.stat6c1.caption = {"gui.stat6c1",{"bsc.stat6"},statcalled.level}
				gui.tableStats6.stat6c4.caption = {"gui.stat6c4",mix.round(statcalled.level  * datos.resDefence,2)}
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		elseif statcalled == stats.range then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat7"},statcalled.level,statcalled.next}})
			end
			if statcalled.level <= datos.maxRange then
				local arrows = player.getitemcount("cursed-ammo1-" .. statcalled.level - 1)
				removeItems.arrows(player,datos)
				if arrows > 0 then
					player.insert({name="cursed-ammo1-"..statcalled.level,count=arrows})
				end
			end
			if gui ~= nil and gui.tableStats7S then
				gui.tableStats7.stat7c1.caption = {"gui.stat7c1",{"bsc.stat7"},statcalled.level}
				if statcalled.level <= datos.maxRange then
					gui.tableStats7.stat7c4.caption = {"gui.stat7c4",mix.round(6.5 + statcalled.level * datos.resRange,2)}
				end
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		end
		if statcalled ~= stats.general then
			local class = glob.cursed[player.name].class
			stats.general.exp = math.floor(stats.general.exp + 1 * class.multGeneral)
			if stats.general.exp >=  stats.general.next then
				main(stats.general,(5),player)
			end
			if gui ~= nil and gui.tableStats1S then
				local class = glob.cursed[player.name].class
				gui.tableStats1.stat1c2.caption = {"gui.stat1c2",math.ceil(stats.general.exp),math.ceil(5),mix.round(100 * (class.multGeneral - 1),1)}
				gui.tableStats1.stat1c3.value = stats.general.exp/5
			end
		end
	end
end