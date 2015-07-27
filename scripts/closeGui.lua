module("closeGui", package.seeall)

function closeAllMain(num,player)
	local gui = glob.cursed[player.name].gui
	closeAllTalents(-1,player)
	closeAllStats(-1,player)
	closeAllBuilds(-1,player)
	if gui ~= nil and gui.frameTalentsS and gui.frameTalents and num ~= 1 then
		gui.flowMain2.talentsMain.style = "cursed-button"
		gui.frameTalents.destroy()
		gui.frameTalentsS = false
	end
	if gui ~= nil and gui.frameStatsS and gui.frameStats and num ~= 2 then
		gui.flowMain2.statsMain.style = "cursed-button"
		gui.frameStats.destroy()
		gui.frameStatsS = false 
	end
	if gui ~= nil and gui.frameBuildsS and gui.frameBuilds and num ~= 3 then
		gui.flowMain2.buildsMain.style = "cursed-button"
		gui.frameBuilds.destroy()
		gui.frameBuildsS = false 
	end
	if gui ~= nil and gui.frameOptionsS and gui.frameOptions and num ~= 4 then
		gui.flowMain2.optionsMain.style = "cursed-button"
		gui.frameOptions.destroy()
		gui.frameOptionsS = false 
	end
	if gui ~= nil and num == -1 then
		gui.frameTalentsS = false
		gui.frameStatsS = false
		gui.frameBuildsS = false 
		gui.frameOptionsS = false 
	end
end
function closeAllTalents(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and gui.tableTalents1S and gui.tableTalents1 and num ~= 1 then
		gui.frameTalentsDet1.talentsMain1.style = "cursed-button"
		gui.tableTalents1.destroy()
		gui.tableTalents1S = false
	end
	if gui ~= nil and gui.tableTalents2S and gui.tableTalents2 and num ~= 2 then
		gui.frameTalentsDet2.talentsMain2.style = "cursed-button"
		gui.tableTalents2.destroy()
		gui.tableTalents2S = false
	end
	if gui ~= nil and gui.tableTalents3S and gui.tableTalents3 and num ~= 3 then
		gui.frameTalentsDet3.talentsMain3.style = "cursed-button"
		gui.tableTalents3.destroy()
		gui.tableTalents3S = false
	end
	if gui ~= nil and gui.tableTalents4S and gui.tableTalents4 and num ~= 4 then
		gui.frameTalentsDet4.talentsMain4.style = "cursed-button"
		gui.tableTalents4.destroy()
		gui.tableTalents4S = false
	end
	if gui ~= nil and gui.tableTalents5S and gui.tableTalents5 and num ~= 5 then
		gui.frameTalentsDet5.talentsMain5.style = "cursed-button"
		gui.tableTalents5.destroy()
		gui.tableTalents5S = false
	end
	if gui ~= nil and gui.tableTalents6S and gui.tableTalents6 and num ~= 6 then
		gui.frameTalentsDet6.talentsMain6.style = "cursed-button"
		gui.tableTalents6.destroy()
		gui.tableTalents6S = false
	end
	if gui ~= nil and num == -1 then
		gui.tableTalents1S = false
		gui.tableTalents2S = false
		gui.tableTalents3S = false
		gui.tableTalents4S = false
		gui.tableTalents5S = false
		gui.tableTalents6S = false
	end
end
function closeAllStats(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and gui.tableStats1S and gui.tableStats1 and num ~= 1 then
		gui.frameStatsDet1.statsMain1.style = "cursed-button"
		gui.tableStats1.destroy()
		gui.tableStats1S = false
	end
	if gui ~= nil and gui.tableStats2S and gui.tableStats2 and num ~= 2 then
		gui.frameStatsDet2.statsMain2.style = "cursed-button"
		gui.tableStats2.destroy()
		gui.tableStats2S = false
	end
	if gui ~= nil and gui.tableStats3S and gui.tableStats3 and num ~= 3 then
		gui.frameStatsDet3.statsMain3.style = "cursed-button"
		gui.tableStats3.destroy()
		gui.tableStats3S = false
	end
	if gui ~= nil and gui.tableStats4S and gui.tableStats4 and num ~= 4 then
		gui.frameStatsDet4.statsMain4.style = "cursed-button"
		gui.tableStats4.destroy()
		gui.tableStats4S = false
	end
	if gui ~= nil and gui.tableStats5S and gui.tableStats5 and num ~= 5 then
		gui.frameStatsDet5.statsMain5.style = "cursed-button"
		gui.tableStats5.destroy()
		gui.tableStats5S = false
	end
	if gui ~= nil and gui.tableStats6S and gui.tableStats6 and num ~= 6 then
		gui.frameStatsDet6.statsMain6.style = "cursed-button"
		gui.tableStats6.destroy()
		gui.tableStats6S = false
	end
	if gui ~= nil and gui.tableStats7S and gui.tableStats7 and num ~= 7 then
		gui.frameStatsDet7.statsMain7.style = "cursed-button"
		gui.tableStats7.destroy()
		gui.tableStats7S = false
	end
	if gui ~= nil and gui.tableStats8S and gui.tableStats8 and num ~= 8 then
		gui.frameStatsDet8.statsMain8.style = "cursed-button"
		gui.tableStats8.destroy()
		gui.tableStats8S = false
	end
	if gui ~= nil and num == -1 then
		gui.tableStats1S = false
		gui.tableStats2S = false
		gui.tableStats3S = false
		gui.tableStats4S = false
		gui.tableStats5S = false
		gui.tableStats6S = false
		gui.tableStats7S = false
		gui.tableStats8S = false
	end
end
function closeAllBuilds(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil and num == -1 then
		gui.tableBuilds1S = false
		gui.tableBuilds2S = false
		gui.tableBuilds3S = false
	end
	if gui ~= nil and gui.tableBuilds1S and gui.tableBuilds1 and num ~= 1 then
		gui.frameBuildsDet1.buildsMain1.style = "cursed-button"
		gui.tableBuilds1.destroy()
		gui.tableBuilds1S = false
	end
	if gui ~= nil and gui.tableBuilds2S and gui.tableBuilds2 and num ~= 2 then
		gui.frameBuildsDet2.buildsMain2.style = "cursed-button"
		gui.tableBuilds2.destroy()
		gui.tableBuilds2S = false
	end
	if gui ~= nil and gui.tableBuilds3S and gui.tableBuilds3 and num ~= 3 then
		gui.frameBuildsDet3.buildsMain3.style = "cursed-button"
		gui.tableBuilds3.destroy()
		gui.tableBuilds3S = false
	end
	if gui ~= nil and gui.tableBuilds4S and gui.tableBuilds4 and num ~= 4 then
		gui.frameBuildsDet4.buildsMain4.style = "cursed-button"
		gui.tableBuilds4.destroy()
		gui.tableBuilds4S = false
	end
	if gui ~= nil and gui.tableBuilds5S and gui.tableBuilds5 and num ~= 5 then
		gui.frameBuildsDet5.buildsMain5.style = "cursed-button"
		gui.tableBuilds5.destroy()
		gui.tableBuilds5S = false
	end
end