module("changeVersion", package.seeall)
require("refreshResources")
require("refreshTrees")
require("resetgui")
require("setBase")

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
		glob.cursed[player.name].talents[3][6].max = maxWall - 2
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
	resetgui.main(player)
	glob.cursed[player.name].aux.version = currentVersion
end