module("skillUp", package.seeall)
require("mix")

function main(statcalled,newnext,player)
	if statcalled.exp >= statcalled.next then
		statcalled.level = statcalled.level + 1
		statcalled.exp = mix.round(statcalled.exp - statcalled.next,3)
		statcalled.next = newnext
		local stats = glob.cursed[player.name].stats
		local gui = glob.cursed[player.name].gui
		if statcalled == stats.general then
			player.insert({name="cursed-talent-2",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat1"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats1S then
				gui.tableStats1.stat1c1.caption = {"gui.stat1c1",{"bsc.stat1"},statcalled.level}
				gui.tableStats1.stat1c4.caption = {"gui.stat1c4",statcalled.level / 40}
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
			end
		elseif statcalled == stats.mining then
			player.insert({name="cursed-talent-1",count=1})
			if glob.cursed[player.name].opt[5] == true then
				player.print({"msg.cursed",{"msg.stat-level",{"bsc.stat2"},statcalled.level,statcalled.next}})
			end
			if gui ~= nil and gui.tableStats2S then
				gui.tableStats2.stat2c1.caption = {"gui.stat2c1",{"bsc.stat2"},statcalled.level}
				gui.tableStats2.stat2c4.caption = {"gui.stat2c4",statcalled.level}
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
				gui.tableStats3.stat3c4.caption = {"gui.stat3c4",statcalled.level * 2}
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
				gui.tableStats4.stat4c4.caption = {"gui.stat4c4",statcalled.level / 2.5}
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
				gui.tableStats5.stat5c4.caption = {"gui.stat5c4",100 * statcalled.level / 32}
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
				gui.tableStats6.stat6c4.caption = {"gui.stat6c4",statcalled.level / 100}
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
					gui.tableStats7.stat7c4.caption = {"gui.stat7c4",6.5 + statcalled.level * 0.5}
				end
			end
			if gui ~= nil and gui.frameTalentsS then
					gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
			end
		end
		if statcalled ~= stats.general then
			stats.general.exp = stats.general.exp + 1
			if stats.general.exp >=  stats.general.next then
				main(stats.general,(5),player)
			end
			if gui ~= nil and gui.tableStats1S then
				gui.tableStats1.stat1c2.caption = {"gui.stat1c2",stats.general.exp,5}
				gui.tableStats1.stat1c3.value = stats.general.exp/5
			end
		end
	end
end