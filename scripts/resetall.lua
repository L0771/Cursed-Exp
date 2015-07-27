module("resetall", package.seeall)
require("resetstats")
require("resettalents")
require("setBase")

function main(player,isoption)
	if isoption then
		resettalents.main(player,isoption)
		for i = 0, 6 do
			local rem = player.getitemcount("cursed-talent-" .. i)
			if rem > 0 then
				player.removeitem({name="cursed-talent-" .. i, count= rem})
			end
		end
		local rem = player.getitemcount("cursed-drill-1")
		if rem > 0 then
			player.removeitem({name="cursed-drill-1", count= rem})
		end
		local rem = player.getitemcount("cursed-turret-1")
		if rem > 0 then
			player.removeitem({name="cursed-turret-1", count= rem})
		end
	end
	cursed = {}
	cursed.aux = {}
	cursed.aux.pos = player.position
	if player.character then cursed.aux.lasthp = player.character.health else cursed.aux.lasthp = 100 end
	if player.character then cursed.aux.maxhealth = player.character.prototype.maxhealth else cursed.aux.lasthp = 100 end
	cursed.aux.donations = 1
	cursed.aux.arrows = 2
	cursed.aux.vault = nil
	cursed.aux.vaultentity = nil
	cursed.aux.version = currentVersion
	cursed.aux.tomb = nil
	cursed.aux.bodynow = nil
	cursed.aux.bodies = {}
	cursed.aux.connected = true
	cursed.opt = {}
	for i = 1, 8 do
		cursed.opt[i] = true
	end
	local base = nil
	if glob.cursed[player.name] and glob.cursed[player.name].aux.base ~= nil then base = glob.cursed[player.name].aux.base end
	glob.cursed[player.name] = cursed
	resetstats.main(player)
	resettalents.main(player,isoption)
	if base == nil then
		setBase.main(player)
	else
		glob.cursed[player.name].aux.base = base
	end
end