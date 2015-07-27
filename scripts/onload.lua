module("onload", package.seeall)
require("changeVersion")
require("mix")
require("resetall")
require("resetgui")


function main(noModule)
	local cursed = glob.cursed
	for _,v in ipairs(game.players) do
		if v.name == "" then
			globalPrint("Use a nick in Options > Others > Multiplayer Username, now crash :c")
			v.insert({name = "cursed-tree-00",count = 0})
		end
		if cursed[v.name] == nil then
			resetall.main(v,nil)
		else
			if cursed[v.name].aux.version ~= nil and cursed[v.name].aux.version ~= currentVersion then
				changeVersion.main(v,noModule)
			end
			local mines = cursed[v.name].mines
			for i = 1, #mines do
				if mines[i].entity and mines[i].entity.valid then
					mines[i].entity.active =  mines[i].active
				end
				mines[i].active2 = true
			end
			local turrets = cursed[v.name].turrets
			for i = 1, #turrets do
				turrets[i].entity.active =  turrets[i].active
				turrets[i].active2 = true
			end
		end
		if not v.gui.left.flowMain then
			resetgui.main(v)
		end
	end
	for k,v in ipairs(cursed) do
		local player = mix.getplayerbyname(k)
		if player == nil and v.aux.connected == true then
			local mines = v.mines
			for i = 1, #mines do
				if mines[i].entity and mines[i].entity.valid then
					mines[i].entity.active =  false
				end
				mines[i].active2 = false
			end
			v.mines = mines
			
			local turrets = v.turrets
			for i = 1, #turrets do
				turrets[i].entity.active =  true
				turrets[i].active2 = false
			end
			v.turrets = turrets
			
			local vaultentity = glob.cursed[v.name].aux.vaultentity
			if vaultentity ~= nil then
				local vault = {}
				local inside = vaultentity.getinventory(defines.inventory.chest)
				local n = 1
				for i = 1, #inside do
					if inside[i] ~= nil then
						vault[n] = {name = inside[i].name, count = inside[i].count}
						n = n + 1
					end
				end
				glob.cursed[v.name].aux.vault = vault
				vaultentity.destroy()
				vaultentity = nil
				glob.cursed[v.name].aux.vaultentity = vaultentity
			end
						
			local bodies = v.aux.bodies
			for i = 1, #bodies do
				if bodies[i].entity then
					bodies[i].position = bodies[i].entity.position
					bodies[i].name = bodies[i].entity.name
					bodies[i].force = bodies[i].entity.force
					bodies[i].entity.destroy()
				end
			end
			v.aux.bodies = bodies
			v.aux.connected = false
		elseif v.aux.connected == false then
			local bodies = v.aux.bodies
			for i = 1, #bodies do
				if not bodies[i].entity then
					local position = game.findnoncollidingposition(bodies[i].name, bodies[i].position, 25, 1)
					if position ~= nil then
						bodies[i].entity = game.createentity {name=bodies[i].name, position=position, force=bodies[i].force}
					else
						v.print({"msg.cursed", {"msg.badpositionbody"}})
						glob.cursed[v.name].talents[6][2].now = glob.cursed[v.name].talents[6][2].now + 1
						glob.cursed[v.name].aux.base.insert({name = "cursed-player", count = 1})
					end
				end
			end
			v.aux.bodies = bodies
			v.aux.connected = true
		end
	end
end