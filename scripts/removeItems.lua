module("removeItems", package.seeall)


function axes(player)
	for i=1,datos.maxTool do
		if player.getitemcount("cursed-axe-"..i) >=1 then
			player.removeitem({name="cursed-axe-"..i, count=player.getitemcount("cursed-axe-"..i)})
		end
	end
	if player.character and (player.getinventory(defines.inventory.playertools)[1] ~= nil) then
		if (string.sub(player.getinventory(defines.inventory.playertools)[1].name,1,11)) == "cursed-axe-"   then
			player.getinventory(defines.inventory.playertools).remove(player.getinventory(defines.inventory.playertools)[1])
		end
	end
end

function armors(player)
	for i=1,datos.maxArmor do
		if player.getitemcount("cursed-armor-"..i) >=1 then
			player.removeitem({name="cursed-armor-"..i, count=player.getitemcount("cursed-armor-"..i)})
		end
	end
	if player.character and (player.getinventory(defines.inventory.playerarmor)[1] ~= nil) then
		if (string.sub(player.getinventory(defines.inventory.playerarmor)[1].name,1,13)) == "cursed-armor-"   then
			player.getinventory(defines.inventory.playerarmor).remove(player.getinventory(defines.inventory.playerarmor)[1])
		end
	end
end

function bows(player)
	for i=1,datos.maxWeapon1 do
		if player.getitemcount("cursed-bow-"..i) >=1 then
			player.removeitem({name="cursed-bow-"..i, count=player.getitemcount("cursed-bow-"..i)})
		end
	end
	for i = 1, 3 do
		if player.character and player.getinventory(defines.inventory.playerguns)[i] ~= nil then
			if (string.sub(player.getinventory(defines.inventory.playerguns)[i].name,1,11)) == "cursed-bow-"   then
				player.getinventory(defines.inventory.playerguns).remove(player.getinventory(defines.inventory.playerguns)[i])
			end
		end
	end
end

function arrows(player)
	for i=1,datos.maxRange do
		if player.getitemcount("cursed-arrow-"..i) >=1 then
			player.removeitem({name="cursed-arrow-"..i, count=player.getitemcount("cursed-arrow-"..i)})
		end
	end
	for i = 1, 3 do
		if player.character and player.getinventory(defines.inventory.playerammo)[i] ~= nil then
			if (string.sub(player.getinventory(defines.inventory.playerammo)[i].name,1,12)) == "cursed-arrow"   then
				player.getinventory(defines.inventory.playerammo).remove(player.getinventory(defines.inventory.playerammo)[i])
			end
		end
	end
end