module("interface", package.seeall)
require("scripts/resetgui")

remote.addinterface("cursed",
{
resetgui = function()
	for _,v in ipairs(game.players) do
		if not v.gui.left.flowMain then
			resetgui.main(v)
		end
	end
end,
getversion = function()
	return datos.currentVersion
end,
})