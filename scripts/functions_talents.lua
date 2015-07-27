module("functions_talents", package.seeall)


function insertTalents(player,tier,amount)
	local opt = glob.cursed[player.name].opt[10]
	local gui = glob.cursed[player.name].gui
	if opt == true and player.caninsert({name = "cursed-talent-" .. tier, count = amount}) then
		player.insert({name="cursed-talent-" .. tier,count=amount})
		if gui ~= nil and gui.frameMain1S then
			gui["frameTalentsDet" .. tier]["talentsMain" .. tier].caption = {"gui.talentsMain" .. tier,player.getitemcount("cursed-talent-" .. tier)}
		end
	else
		local inv = glob.cursed[player.name].inv
		inv.talents["pt" .. tier] = inv.talents["pt" .. tier] + amount
		inv.talents["pt0"] = inv.talents["pt0"] + amount
		if gui ~= nil then
			if gui.frameMain6S then
				gui.tableInv2c0.invMain2c0.caption = {"gui.invMain2c0",inv.talents["pt0"]}
				gui["tableInv2c1"]["invMain2c" .. tier].caption = {"gui.invMain2c" .. tier,inv.talents["pt" .. tier]}
			end
			if gui.frameMain1S then
				local tierm = tier
				if tierm == 4 then
					tierm = 3
				elseif tierm == 3 then
					tierm = 4
				end
				if gui["tableTalents" .. tierm .. "S"] then
					gui["frameTalentsDet" .. tierm]["talentsMain" .. tierm].caption = {"gui.clicked",{"gui.talentsMain" .. tierm,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}}
				else
					gui["frameTalentsDet" .. tierm]["talentsMain" .. tierm].caption = {"gui.talentsMain" .. tierm,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}
				end
			end
		end
	end
end

function insertParts(player,tier,amount)
	local opt = glob.cursed[player.name].opt[10]
	local gui = glob.cursed[player.name].gui
	if opt == true and player.caninsert({name = "cursed-talent-part-" .. tier, count = amount}) then
		player.insert({name="cursed-talent-part-" .. tier,count=amount})
	else
		local inv = glob.cursed[player.name].inv
		inv.parts["pt" .. tier] = inv.parts["pt" .. tier] + amount
		inv.parts["pt0"] = inv.parts["pt0"] + amount
		if gui ~= nil then
			if gui.frameMain6S then
				gui.tableInv1c0.invMain1c0.caption = {"gui.invMain1c0",inv.parts["pt0"]}
				gui["tableInv1c1"]["invMain1c" .. tier].caption = {"gui.invMain1c" .. tier,inv.parts["pt" .. tier]}
			end
		end
	end
end

function removePartsGui(player,tier,amount)
	local gui = glob.cursed[player.name].gui
	local inv = glob.cursed[player.name].inv
	local maxamount = getMaxAmount(player,"cursed-talent-part-" .. tier)
	if amount == nil or (amount ~= nil and amount > inv.parts["pt" .. tier]) then
		amount = inv.parts["pt" .. tier]
	end
	if amount > maxamount then
		amount = maxamount
	end
	if amount > 0 then
		inv.parts["pt" .. tier] = inv.parts["pt" .. tier] - amount
		inv.parts["pt0"] = inv.parts["pt0"] - amount
		if gui ~= nil then
			if gui.frameMain6S then
				if inv.parts["pt0"] == 0 then
					gui.tableInv1c0.invMain1c0.caption = {"gui.invMain1c0",0}
				else
					gui.tableInv1c0.invMain1c0.caption = {"gui.invMain1c0",inv.parts["pt0"]}
				end
				if inv.parts["pt" .. tier] == 0 then
					gui["tableInv1c1"]["invMain1c" .. tier].caption = {"gui.invMain1c" .. tier,0}
				else
					gui["tableInv1c1"]["invMain1c" .. tier].caption = {"gui.invMain1c" .. tier,inv.parts["pt" .. tier]}
				end
			end
		end
	end
	return amount
end

function removeTalentsGui(player,tier,amount)
	local gui = glob.cursed[player.name].gui
	local inv = glob.cursed[player.name].inv
	local maxamount = getMaxAmount(player,"cursed-talent-" .. tier)
	if amount == nil or (amount ~= nil and amount > inv.talents["pt" .. tier]) then
		amount = inv.talents["pt" .. tier]
	end
	if amount > maxamount then
		amount = maxamount
	end
	if amount > 0 then
		inv.talents["pt" .. tier] = inv.talents["pt" .. tier] - amount
		inv.talents["pt0"] = inv.talents["pt0"] - amount
		if gui ~= nil then
			if gui.frameMain6S then
				if inv.talents["pt0"] == 0 then
					gui.tableInv2c0.invMain2c0.caption = {"gui.invMain2c0",0}
				else
					gui.tableInv2c0.invMain2c0.caption = {"gui.invMain2c0",inv.talents["pt0"]}
				end
				if inv.talents["pt" .. tier] == 0 then
					gui["tableInv2c1"]["invMain2c" .. tier].caption = {"gui.invMain2c" .. tier,0}
				else
					gui["tableInv2c1"]["invMain2c" .. tier].caption = {"gui.invMain2c" .. tier,inv.talents["pt" .. tier]}
				end
			end
			if gui.frameMain1S then
				if gui["tableTalents" .. tier .. "S"] then
					gui["frameTalentsDet" .. tier]["talentsMain" .. tier].caption = {"gui.clicked",{"gui.talentsMain" .. tier,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}}
				else
					gui["frameTalentsDet" .. tier]["talentsMain" .. tier].caption = {"gui.talentsMain" .. tier,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}
				end
			end
		end
	end
	return amount
end

function removeTalentsAll(player,tier,amount)
	local gui = glob.cursed[player.name].gui
	local inv = glob.cursed[player.name].inv
	local del = removeTalentsGui(player,tier,amount)
	amount = amount - del
	if amount > 0 then
		del = del + player.removeitem({name="cursed-talent-" .. tier, count= amount})
	end
	if gui ~= nil and gui.frameMain1S then
		if tier == 3 then
			tier = 4
		elseif tier == 4 then
			tier = 3
		end
		if gui["tableTalents" .. tier .. "S"] then
			gui["frameTalentsDet" .. tier]["talentsMain" .. tier].caption = {"gui.clicked",{"gui.talentsMain" .. tier,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}}
		else
			gui["frameTalentsDet" .. tier]["talentsMain" .. tier].caption = {"gui.talentsMain" .. tier,player.getitemcount("cursed-talent-" .. tier) + inv.talents["pt" .. tier]}
		end
	end
	return del
end

function getMaxAmount(player,itemname)
	local maxitem = 2500
	local amount = player.getitemcount(itemname)
	if player.cursorstack ~= nil and player.cursorstack.name == itemname then
		return (maxitem - player.cursorstack.count)
	elseif player.getinventory(defines.inventory.playermain).caninsert({name = "cursed-stack-main", count = 1}) then
		return maxitem
	else
		return (0)
	end
end