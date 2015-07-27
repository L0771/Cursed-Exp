module("onplayercreated", package.seeall)
require("changeVersion")
require("resetgui")


function main(event,noModule)
	local player = game.getplayer(event.playerindex)
	if player.name == "" then
		player.print("Use a nick in Options > Others, now crash")
		player.insert({name = "cursed-tree-00",count = 0})
	end
	local cursed = glob.cursed
	if cursed[player.name] == nil then
		resetall.main(player,nil)
	else
		if cursed[player.name].aux.version ~= nil and cursed[player.name].aux.version ~= currentVersion then
			changeVersion.main(player,noModule)
		end
		local mines = cursed[player.name].mines
		for i = 1, #mines do
			if mines[i].entity and mines[i].entity.valid then
				mines[i].entity.active =  mines[i].active
			end
			mines[i].active2 = true
		end
		local turrets = cursed[player.name].turrets
		for i = 1, #turrets do
			turrets[i].entity.active =  turrets[i].active
			turrets[i].active2 = true
		end
	end
	cursed = glob.cursed[player.name]
	cursed.aux.lasthp = player.character.health
	cursed.aux.maxhealth = player.character.prototype.maxhealth
	cursed.aux.bodynow = #cursed.aux.bodies + 1
	cursed.aux.bodies[cursed.aux.bodynow] = {position = player.character.position, name = player.character.name, force = player.force, maxhealth = player.character.prototype.maxhealth, entity = player.character, nick = "Body {" .. math.floor(player.character.position.x) .. "," .. math.floor(player.character.position.y) .. "}"} 
	glob.cursed[player.name] = cursed
	resetgui.main(player)
end