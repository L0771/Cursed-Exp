module("changeVersion", package.seeall)

function main(player,noModule)
	local version = glob.cursed[player.name].aux.version
	if version < 000009 then
		if player.character then glob.cursed[player.name].aux.maxhealth = player.character.prototype.maxhealth else glob.cursed[player.name].aux.maxhealth = 100 end
	end
	if version < 000010 then
		playerlistold = nil
		if not glob.cursed.others then
			glob.cursed.others = {}
			glob.cursed.others.blood = glob.cursed.blood
			glob.cursed.blood = nil
			glob.cursed.others.tanks = glob.cursed.tanks
			glob.cursed.tanks = nil
			glob.cursed.others.runday = glob.cursed.runday
			glob.cursed.runday = nil
			glob.cursed.others.runday = true
		end
	end
	if version < 000013 then
		refreshTrees.main()
	end
	if version < 000101 then
		if glob.cursed[player.name].gui and glob.cursed[player.name].gui.tableMainS then
			if player.gui.left.tableMain ~= nil then
				glob.cursed[player.name].gui.tableMain.destroy()
			end
		end
		glob.cursed[player.name].aux.tomb = nil
		glob.cursed[player.name].talents[3][5] = {now,max}
		glob.cursed[player.name].talents[3][5].now = 0
		glob.cursed[player.name].talents[3][5].max = 2
		glob.cursed[player.name].talents[3][6] = {now,max}
		glob.cursed[player.name].talents[3][6].now = 0
		glob.cursed[player.name].talents[3][6].max = datos.maxWall - 2
		glob.cursed[player.name].talents[6] = {}
		glob.cursed[player.name].talents[6][1] = {now}
		glob.cursed[player.name].talents[6][1].now = 0
		glob.cursed[player.name].talents[6][2] = {now}
		glob.cursed[player.name].talents[6][2].now = 0
		glob.cursed[player.name].aux.bodynow = nil
		glob.cursed[player.name].aux.bodies = {}
		if player.character then
			glob.cursed[player.name].aux.bodynow = #glob.cursed[player.name].aux.bodies + 1
			glob.cursed[player.name].aux.bodies[glob.cursed[player.name].aux.bodynow] = {position = player.character.position, name = player.character.name, force = player.force, maxhealth = player.character.prototype.maxhealth, entity = player.character, nick = "Body {" .. math.floor(player.character.position.x) .. "," .. math.floor(player.character.position.y) .. "}"}
		end
		glob.cursed[player.name].aux.connected = true
		glob.cursed[player.name].walls = {}
		setBase.main(player)
	end
	if version < 000200 then
		glob.cursed[player.name].talents[2][1].max = datos.maxTool
		glob.cursed[player.name].talents[2][2].max = datos.maxArmor
		glob.cursed[player.name].talents[2][3].max = datos.maxWeapon1
		glob.cursed[player.name].talents[3][2].max = datos.maxMine - 2
		glob.cursed[player.name].talents[3][4].max = datos.maxTurret - 2
		glob.cursed[player.name].talents[3][6].max = datos.maxWall - 2
		glob.cursed[player.name].talents[5][7].max = datos.maxVault
		refreshResources.main(noModule)
	end
	if version < 000204 then
		glob.cursed[player.name].opt[9] = false
	end
	if version < 000205 then
		glob.cursed[player.name].fishers = {}
		glob.cursed[player.name].talents[3][7] = {now,max}
		glob.cursed[player.name].talents[3][7].now = 0
		glob.cursed[player.name].talents[3][7].max = 2
		glob.cursed[player.name].talents[3][8] = {now,max}
		glob.cursed[player.name].talents[3][8].now = 0
		glob.cursed[player.name].talents[3][8].max = datos.maxFisher - 2
	end
	if version < 000300 then
		local talents = glob.cursed[player.name].talents
		local retornar = 0
		if talents[4][1] ~= nil then retornar = retornar + talents[4][1].now end
		if talents[4][2] ~= nil then retornar = retornar + talents[4][2].now end
		if talents[4][3] ~= nil then retornar = retornar + talents[4][3].now end
		if talents[4][4] ~= nil then retornar = retornar + talents[4][4].now end
		if talents[4][5] ~= nil then retornar = retornar + talents[4][5].now end
		if talents[4][6] ~= nil then retornar = retornar + talents[4][6].now end
		if talents[4][7] ~= nil then retornar = retornar + talents[4][7].now end
		if talents[4][8] ~= nil then retornar = retornar + talents[4][8].now end
		if talents[4][9] ~= nil then retornar = retornar + talents[4][9].now end
		if talents[4][10] ~= nil then retornar = retornar + talents[4][10].now end
		talents[4] = {}
		talents[4][1] = {now = 0}
		talents[4][2] = {now = 0}
		talents[4][3] = {now = 0}
		talents[4][4] = {now = 0}
		talents[4][5] = {now = 0}
		talents[4][6] = {now = 0}
		if player.character and retornar > 0 then
				if player.caninsert({name="cursed-talent-4",count=retornar}) then
					player.insert({name="cursed-talent-4",count=retornar})
				else
					game.createentity{name = "item-on-ground", position = player.character.position, stack = {name = "cursed-talent-4", count = retornar}}
				end
		end
		glob.cursed.others.generators = {}
		talents[3][2] = {now = talents[3][2].now}
		talents[3][4] = {now = talents[3][4].now}
		talents[3][6] = {now = talents[3][6].now}
		talents[3][8] = {now = talents[3][8].now}
		glob.cursed[player.name].talents = talents
		functions_classes.classBase(player.name)
	end
	resetgui.main(player)
	if remote.interfaces["cursed-classes"] then
		functions_classes.loadClasses()
	end
	if remote.interfaces["cursed-classes"] and remote.call("cursed-classes","readclassbase","cursed") == "This base don't exists" then
		functions_classes.loadClasses()
	end
	glob.cursed[player.name].aux.version = datos.currentVersion
end