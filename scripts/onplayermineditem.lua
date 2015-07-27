module("onplayermineditem", package.seeall)

function main(event)
	if remover.item and remover.item == true then
		local player = game.getplayer(event.playerindex)
		player.removeitem(event.itemstack)
		remover.item = nil
	elseif insertar.tree then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertar.tree)}
		if glob.cursed[player.name].opt[2] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertar.tree, game.getlocaliseditemname(event.itemstack.name)}})
		end
		game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying+", event.itemstack.count * insertar.tree, game.getlocaliseditemname(event.itemstack.name),player.getitemcount(event.itemstack.name)} })
		insertar.tree = nil
	elseif insertar.resource then
		local player = game.getplayer(event.playerindex)
		player.insert{name=event.itemstack.name,count=(event.itemstack.count * insertar.resource)}
		if glob.cursed[player.name].opt[1] == true then
			player.print({"msg.cursed",{"msg.item-bonus",event.itemstack.count * insertar.resource, game.getlocaliseditemname(event.itemstack.name)}})
		end
		game.createentity({name="flying-text", position=player.position, text={"msg.item-bonus-flying+", event.itemstack.count * insertar.resource, game.getlocaliseditemname(event.itemstack.name),player.getitemcount(event.itemstack.name)} })
		insertar.resource = nil
	end
end