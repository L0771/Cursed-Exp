module("interface", package.seeall)

remote.addinterface("cursed",
{
resetgui = function(playername)
	if playername == nil then
		for _,v in ipairs(game.players) do
			if not v.gui.left.flowMain then
				resetgui.main(v)
			end
		end
	else
		local player = mix.getplayerbyname(playername)
		resetgui.main(player)
	end
end,

getversion = function()
	return datos.currentVersion
end,

changename = function(oldname,newname)
	local player = mix.getplayerbyname(newname)
	if oldname ~= newname and glob.cursed[newname].aux.base then
		glob.cursed[newname].aux.base.destroy()
	end
	glob.cursed[newname] = util.table.deepcopy(glob.cursed[oldname])
	resetgui.main(nil,nil,oldname)
	resetgui.main(player)
end,

playerrecreated = function(player, option)
	local player = mix.getplayerbyname(player)
	local talents = glob.cursed[player.name].talents
	removeItems.axes(player)
	if player.character then player.insert({name="cursed-axe-"..talents[2][1].now,count=1}) end
	removeItems.armors(player)
	if player.character then player.insert({name="cursed-armor-"..talents[2][2].now,count=1}) end
	removeItems.bows(player)
	if player.character then player.insert({name="cursed-bow-"..talents[2][3].now,count=1}) end
	if not option then
		if player.character then player.insert({name="cursed-arrow",count=10}) end
		functions_talents.insertTalents(player,1,10)
		functions_talents.insertTalents(player,2,1)
	end
end,

forumexport = function(player)
	if player ~= nil and player ~= "others" and glob.cursed[player] then
		files.explortForum(player)
	end
end,
})
