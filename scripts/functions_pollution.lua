module("functions_pollution", package.seeall)


function getDmg(player)
	if remote.interfaces.oxygen then
		if remote.call("oxygen","getoxygenofplayer",player.name) == 0 then
			if remote.call("oxygen","hasgasmask",player.name) then
				return 1
			else
				return 2
			end
		else
			return 0
		end
	else
		if player.character and glob.cursed[player.name].opt[9] and game.getpollution(player.character.position) > 2000 then
			return math.floor((game.getpollution(player.character.position) / 2000) * 10 / 3)
		else
			return 0
		end
	end
end


function updateGui(player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and gui.frameMain5S then
		gui.frameOxygenDet.oxygen1c1.caption = {"gui.oxygen1c1",math.floor(game.getpollution(player.character.position))}
		gui.frameOxygenDet.oxygen1c2.caption = {"gui.oxygen1c2",getDmg(player)}
		if remote.interfaces.oxygen then
			local oxy = remote.call("oxygen", "getoxygenofplayer",player.name)
			if oxy ~= nil then
				gui.frameOxygenDet.oxygen1c3.caption = {"gui.oxygen1c3",math.floor(oxy)}
			end
		end
	end
end