module("resetgui", package.seeall)

function main(player,destroyonly,playername)
	if player ~= nil then
		local gui = glob.cursed[player.name].gui
		-- if gui and player.gui.left.flowMain or player.gui.left.flowMain ~= nil then
			-- closeGui.closeAllMain(-1,player)
			if player.gui.left.flowMain ~= nil then
				player.gui.left.flowMain.destroy()
			end
			-- gui = {}
		-- else
			if destroyonly then
				gui = nil
			else
				gui = {}
			end
		-- end
		if not destroyonly then
			gui.flowMain = player.gui.left.add({ type="flow", name="flowMain", direction="horizontal", style = "cursed-flow" })
			gui.flowClosed = gui.flowMain.add({ type="flow", name="flowClosed", direction = "vertical", style = "cursed-flow" })
			gui.flowClosed.add({ type="button", name="closeMain", style = "cursed-buttonClosed" })
			glob.cursed[player.name].gui = gui
		end
	elseif playername ~= nil then
		local gui = glob.cursed[playername].gui
		gui = {}
		glob.cursed[playername].gui = gui
	else
		for _,v in ipairs(game.players) do
			if v.character ~= nil then
				local gui = glob.cursed[v.name].gui
				if gui and v.gui.left.flowMain then
					closeGui.closeAllMain(-1,v)
					if v.gui.left.flowMain ~= nil then
						gui.flowMain.destroy()
					end
				else
					if destroyonly then
						gui = nil
					else
						gui = {}
					end
				end
				if player.gui.left.flowMain then
					player.gui.left.flowMain.destroy()
				end
				if not destroyonly then
					gui.flowMain = player.gui.left.add({ type="flow", name="flowMain", direction="horizontal", style = "cursed-flowMain" })
					gui.frameClosed = gui.flowMain.add({ type="frame", name="frameClosed", direction = "vertical", style = "cursed-frame" })
					gui.frameClosed.add({ type="button", name="closeMain", style = "cursed-buttonMini2" })
					glob.cursed[player.name].gui = gui
				end
			end
		end
	end
end