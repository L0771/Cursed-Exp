module("setBase", package.seeall)

function main(player)
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