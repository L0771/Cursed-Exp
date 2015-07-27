module("onplayermineditem", package.seeall)

function main(event)
	if remover.item and remover.item == true then
		local player = game.getplayer(event.playerindex)
		player.removeitem(event.itemstack)
		remover.item = nil
	elseif insertitemtree then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertitemtree)}
		if glob.cursed[player.name].opt[2] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertitemtree, game.getlocaliseditemname(event.itemstack.name)}})
		end
		game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying", event.itemstack.count * insertitemtree, game.getlocaliseditemname(event.itemstack.name)} })
		insertitemtree = nil
	elseif insertitemresource then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertitemresource)}
		if glob.cursed[player.name].opt[1] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertitemresource, game.getlocaliseditemname(event.itemstack.name)}})
		end
		game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying", event.itemstack.count * insertitemresource, game.getlocaliseditemname(event.itemstack.name)} })
		insertitemresource = nil
	end
end