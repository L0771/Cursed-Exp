module("resetstats", package.seeall)

function main(player)
	local stats = {}
	n = {"general","mining","farming","crafting","explore","range","melee","defence"}
	for i = 1, #n do
		stats[n[i]] = {}
		stats[n[i]].name = n[i]
		stats[n[i]].level = 1
		stats[n[i]].exp = 0
		stats[n[i]].next = ((stats[n[i]].level * stats[n[i]].level) * 0.8 + 10 )
	end
	stats.general.next = (5)
	glob.cursed[player.name].stats = stats
end