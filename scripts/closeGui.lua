module("closeGui", package.seeall)

function closeAllMain(num,player)
	local gui = glob.cursed[player.name].gui
	closeAllTalents(-1,player)
	closeAllStats(-1,player)
	closeAllBuilds(-1,player)
	if gui ~= nil then
		local maxMain = 5
		for i = 1, maxMain do
			if gui["frameMain" .. i .. "S"] and gui["frameMain" .. i] and num ~= i then
				gui["flowMain2"]["v" .. i .. "Main"].caption = {"gui.s" .. i .. "Main"}
				if gui["frameMain" .. i] ~= nil then
					gui["frameMain" .. i].destroy()
				end
				gui["frameMain" .. i .. "S"] = false
			end
			if num == -1 then
				gui["frameMain" .. i .. "S"] = false
			end
		end
	end
end

function closeAllTalents(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil then
		local maxTalents = 6
		for i = 1, maxTalents do
			if gui["tableTalents" .. i .. "S"] and gui["tableTalents" .. i] and num ~= i then
				gui["frameTalentsDet" .. i]["talentsMain" .. i].caption = {"gui.talentsMain" .. i,player.getitemcount("cursed-talent-" .. i)}
				if gui["tableTalents" .. i] ~= nil then
					gui["tableTalents" .. i].destroy()
				end
				gui["tableTalents" .. i .. "S"] = false
			end
			if num == -1 then
				gui["tableTalents" .. i .. "S"] = false
			end
		end
	end
end

function closeAllStats(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil then
		local maxTalents = 8
		for i = 1, maxTalents do
			if gui["tableStats" .. i .. "S"] and gui["tableStats" .. i] and num ~= i then
				gui["frameStatsDet" .. i]["statsMain" .. i].caption = {"bsc.stat" .. i}
				if gui["tableStats" .. i] ~= nil then
					gui["tableStats" .. i].destroy()
				end
				gui["tableStats" .. i .. "S"] = false
			end
			if num == -1 then
				gui["tableStats" .. i .. "S"] = false
			end
		end
	end
end

function closeAllBuilds(num,player)
	local gui = glob.cursed[player.name].gui
	if gui ~= nil then
		local maxBuilds = 6
		for i = 1, maxBuilds do
			if gui["tableBuilds" .. i .. "S"] and gui["tableBuilds" .. i] and num ~= i then
				gui["frameBuildsDet" .. i]["buildsMain" .. i].caption = {"gui.buildsMain" .. i}
				if gui["tableBuilds" .. i] ~= nil then
					gui["tableBuilds" .. i].destroy()
				end
				gui["tableBuilds" .. i .. "S"] = false
			end
			if num == -1 then
				gui["tableBuilds" .. i .. "S"] = false
			end
		end
	end
end

-- function closeAllMain(num,player)
	-- local gui = glob.cursed[player.name].gui
	-- closeAllTalents(-1,player)
	-- closeAllStats(-1,player)
	-- closeAllBuilds(-1,player)
	-- if gui ~= nil and gui.frameMain1S and gui.frameMain1 and num ~= 1 then
		-- -- gui.flowMain2.v1Main.style = "cursed-button"
		-- gui.flowMain2.v1Main.caption = {"gui.s1Main"}
		-- gui.frameMain1.destroy()
		-- gui.frameMain1S = false
	-- end
	-- if gui ~= nil and gui.frameMain2S and gui.frameMain2 and num ~= 2 then
		-- -- gui.flowMain2.v2Main.style = "cursed-button"
		-- gui.flowMain2.v2Main.caption = {"gui.s2Main"}
		-- gui.frameMain2.destroy()
		-- gui.frameMain2S = false 
	-- end
	-- if gui ~= nil and gui.frameMain3S and gui.frameMain3 and num ~= 3 then
		-- -- gui.flowMain2.v3Main.style = "cursed-button"
		-- gui.flowMain2.v3Main.caption = {"gui.s3Main"}
		-- gui.fframeMain3destroy()
		-- gui.frameMain3S = false 
	-- end
	-- if gui ~= nil and gui.frameMain4S and gui.frameMain4 and num ~= 4 then
		-- -- gui.flowMain2.v4Main.style = "cursed-button"
		-- gui.flowMain2.v4Main.caption = {"gui.s4Main"}
		-- gui.frameMain4.destroy()
		-- gui.frameMain4S = false 
	-- end
	-- if gui ~= nil and gui.frameMain5S and gui.frameMain5 and num ~= 5 then
		-- -- gui.flowMain2.v5Main.style = "cursed-button"
		-- gui.flowMain2.v5Main.caption = {"gui.s5Main"}
		-- gui.frameMain5.destroy()
		-- gui.frameMain5S = false 
	-- end
	-- if gui ~= nil and num == -1 then
		-- gui.frameMain1S = false
		-- gui.frameMain2S = false
		-- gui.frameMain3S= false 
		-- gui.frameMain4S = false 
		-- gui.frameMain5S = false 
	-- end
-- end

-- function closeAllTalents(num,player)
	-- local gui = glob.cursed[player.name].gui
	-- if gui ~= nil and gui.tableTalents1S and gui.tableTalents1 and num ~= 1 then
		-- -- gui.frameTalentsDet1.talentsMain1.style = "cursed-button"
		-- gui.frameTalentsDet1.talentsMain1.caption = {"gui.talentsMain1",player.getitemcount("cursed-talent-1")}
		-- gui.tableTalents1.destroy()
		-- gui.tableTalents1S = false
	-- end
	-- if gui ~= nil and gui.tableTalents2S and gui.tableTalents2 and num ~= 2 then
		-- -- gui.frameTalentsDet2.talentsMain2.style = "cursed-button"
		-- gui.frameTalentsDet2.talentsMain2.caption = {"gui.talentsMain2",player.getitemcount("cursed-talent-2")}
		-- gui.tableTalents2.destroy()
		-- gui.tableTalents2S = false
	-- end
	-- if gui ~= nil and gui.tableTalents3S and gui.tableTalents3 and num ~= 3 then
		-- -- gui.frameTalentsDet3.talentsMain3.style = "cursed-button"
		-- gui.frameTalentsDet3.talentsMain3.caption = {"gui.talentsMain3",player.getitemcount("cursed-talent-3")}
		-- gui.tableTalents3.destroy()
		-- gui.tableTalents3S = false
	-- end
	-- if gui ~= nil and gui.tableTalents4S and gui.tableTalents4 and num ~= 4 then
		-- -- gui.frameTalentsDet4.talentsMain4.style = "cursed-button"
		-- gui.frameTalentsDet4.talentsMain4.caption = {"gui.talentsMain4",player.getitemcount("cursed-talent-4")}
		-- gui.tableTalents4.destroy()
		-- gui.tableTalents4S = false
	-- end
	-- if gui ~= nil and gui.tableTalents5S and gui.tableTalents5 and num ~= 5 then
		-- -- gui.frameTalentsDet5.talentsMain5.style = "cursed-button"
		-- gui.frameTalentsDet5.talentsMain5.caption = {"gui.talentsMain5",player.getitemcount("cursed-talent-5")}
		-- gui.tableTalents5.destroy()
		-- gui.tableTalents5S = false
	-- end
	-- if gui ~= nil and gui.tableTalents6S and gui.tableTalents6 and num ~= 6 then
		-- -- gui.frameTalentsDet6.talentsMain6.style = "cursed-button"
		-- gui.frameTalentsDet6.talentsMain6.caption = {"gui.talentsMain6",player.getitemcount("cursed-talent-6")}
		-- gui.tableTalents6.destroy()
		-- gui.tableTalents6S = false
	-- end
	-- if gui ~= nil and num == -1 then
		-- gui.tableTalents1S = false
		-- gui.tableTalents2S = false
		-- gui.tableTalents3S = false
		-- gui.tableTalents4S = false
		-- gui.tableTalents5S = false
		-- gui.tableTalents6S = false
	-- end
-- end

-- function closeAllStats(num,player)
	-- local gui = glob.cursed[player.name].gui
	-- if gui ~= nil and gui.tableStats1S and gui.tableStats1 and num ~= 1 then
		-- -- gui.frameStatsDet1.statsMain1.style = "cursed-button"
		-- gui.frameStatsDet1.statsMain1.caption = {"bsc.stat1"}
		-- gui.tableStats1.destroy()
		-- gui.tableStats1S = false
	-- end
	-- if gui ~= nil and gui.tableStats2S and gui.tableStats2 and num ~= 2 then
		-- -- gui.frameStatsDet2.statsMain2.style = "cursed-button"
		-- gui.frameStatsDet2.statsMain2.caption = {"bsc.stat2"}
		-- gui.tableStats2.destroy()
		-- gui.tableStats2S = false
	-- end
	-- if gui ~= nil and gui.tableStats3S and gui.tableStats3 and num ~= 3 then
		-- -- gui.frameStatsDet3.statsMain3.style = "cursed-button"
		-- gui.frameStatsDet3.statsMain3.caption = {"bsc.stat3"}
		-- gui.tableStats3.destroy()
		-- gui.tableStats3S = false
	-- end
	-- if gui ~= nil and gui.tableStats4S and gui.tableStats4 and num ~= 4 then
		-- -- gui.frameStatsDet4.statsMain4.style = "cursed-button"
		-- gui.frameStatsDet4.statsMain4.caption = {"bsc.stat4"}
		-- gui.tableStats4.destroy()
		-- gui.tableStats4S = false
	-- end
	-- if gui ~= nil and gui.tableStats5S and gui.tableStats5 and num ~= 5 then
		-- -- gui.frameStatsDet5.statsMain5.style = "cursed-button"
		-- gui.frameStatsDet5.statsMain5.caption = {"bsc.stat5"}
		-- gui.tableStats5.destroy()
		-- gui.tableStats5S = false
	-- end
	-- if gui ~= nil and gui.tableStats6S and gui.tableStats6 and num ~= 6 then
		-- -- gui.frameStatsDet6.statsMain6.style = "cursed-button"
		-- gui.frameStatsDet6.statsMain6.caption = {"bsc.stat6"}
		-- gui.tableStats6.destroy()
		-- gui.tableStats6S = false
	-- end
	-- if gui ~= nil and gui.tableStats7S and gui.tableStats7 and num ~= 7 then
		-- -- gui.frameStatsDet7.statsMain7.style = "cursed-button"
		-- gui.frameStatsDet7.statsMain7.caption = {"bsc.stat7"}
		-- gui.tableStats7.destroy()
		-- gui.tableStats7S = false
	-- end
	-- if gui ~= nil and gui.tableStats8S and gui.tableStats8 and num ~= 8 then
		-- -- gui.frameStatsDet8.statsMain8.style = "cursed-button"
		-- gui.frameStatsDet8.statsMain1.caption = {"bsc.stat8"}
		-- gui.tableStats8.destroy()
		-- gui.tableStats8S = false
	-- end
	-- if gui ~= nil and num == -1 then
		-- gui.tableStats1S = false
		-- gui.tableStats2S = false
		-- gui.tableStats3S = false
		-- gui.tableStats4S = false
		-- gui.tableStats5S = false
		-- gui.tableStats6S = false
		-- gui.tableStats7S = false
		-- gui.tableStats8S = false
	-- end
-- end

-- function closeAllBuilds(num,player)
	-- local gui = glob.cursed[player.name].gui
	-- if gui ~= nil and num == -1 then
		-- gui.tableBuilds1S = false
		-- gui.tableBuilds2S = false
		-- gui.tableBuilds3S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds1S and gui.tableBuilds1 and num ~= 1 then
		-- -- gui.frameBuildsDet1.buildsMain1.style = "cursed-button"
		-- gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		-- gui.tableBuilds1.destroy()
		-- gui.tableBuilds1S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds2S and gui.tableBuilds2 and num ~= 2 then
		-- -- gui.frameBuildsDet2.buildsMain2.style = "cursed-button"
		-- gui.frameBuildsDet2.buildsMain2.caption = {"gui.buildsMain2"}
		-- gui.tableBuilds2.destroy()
		-- gui.tableBuilds2S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds3S and gui.tableBuilds3 and num ~= 3 then
		-- -- gui.frameBuildsDet3.buildsMain3.style = "cursed-button"
		-- gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		-- gui.tableBuilds3.destroy()
		-- gui.tableBuilds3S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds4S and gui.tableBuilds4 and num ~= 4 then
		-- -- gui.frameBuildsDet4.buildsMain4.style = "cursed-button"
		-- gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		-- gui.tableBuilds4.destroy()
		-- gui.tableBuilds4S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds5S and gui.tableBuilds5 and num ~= 5 then
		-- -- gui.frameBuildsDet5.buildsMain5.style = "cursed-button"
		-- gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		-- gui.tableBuilds5.destroy()
		-- gui.tableBuilds5S = false
	-- end
	-- if gui ~= nil and gui.tableBuilds6S and gui.tableBuilds6 and num ~= 6 then
		-- -- gui.frameBuildsDet6.buildsMain6.style = "cursed-button"
		-- gui.frameBuildsDet1.buildsMain1.caption = {"gui.buildsMain1"}
		-- gui.tableBuilds6.destroy()
		-- gui.tableBuilds6S = false
	-- end
-- end
