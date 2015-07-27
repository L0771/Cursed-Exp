module("resettalents", package.seeall)

function main(player,isoption)
	local mines = glob.cursed[player.name].mines
	if mines then
		local n = #mines
		for i = 1, #mines do
			if mines[n].entity and mines[n].entity.valid then
				mines[n].entity.destroy()
			end
			table.remove(mines,n)
			n = n - 1
		end
	end
	mines = {}
	glob.cursed[player.name].mines = mines
	local turrets = glob.cursed[player.name].turrets
	if turrets then
		local n = #turrets
		for i = 1, #turrets do
			turrets[n].entity.destroy()
			table.remove(turrets,n)
			n = n - 1
		end
	end
	turrets = {}
	glob.cursed[player.name].turrets = turrets
	local walls = glob.cursed[player.name].walls
	if walls ~= nil then
		local n = #walls
		for i = 1, #walls do
			walls[n].entity.destroy()
			table.remove(walls,n)
			n = n - 1
		end
	end
	walls = {}
	glob.cursed[player.name].walls = walls
	local fishers = glob.cursed[player.name].fishers
	if fishers then
		local n = #fishers
		for i = 1, #fishers do
			fishers[n].entity.destroy()
			table.remove(fishers,n)
			n = n - 1
		end
	end
	fishers = {}
	glob.cursed[player.name].fishers = fishers
	local talents = {}
	talents[1] = {}
	talents[1][1] = {now,max}
	talents[1][1].now = 0
	talents[1][1].max = 7
	talents[1][2] = {now,max}
	talents[1][2].now = 0
	talents[1][2].max = 7
	talents[1][3] = {now,max}
	talents[1][3].now = 0
	talents[1][3].max = 1
	talents[1][4] = {now,max}
	talents[1][4].now = 0
	talents[1][4].max = 1
	talents[1][5] = {now}
	talents[1][5].now = 0
	talents[1][6] = {now}
	talents[1][6].now = 0
	talents[1][7] = {now}
	talents[1][7].now = 0
	talents[1][8] = {now}
	talents[1][8].now = 0
	talents[1][9] = {now}
	talents[1][9].now = 0
	talents[1][10] = {now}
	talents[1][10].now = 0
	talents[2] = {}
	talents[2][1] = {now,max}
	talents[2][1].now = 1
	talents[2][1].max = datos.maxTool
	talents[2][2] = {now,max}
	talents[2][2].now = 1
	talents[2][2].max = datos.maxArmor
	talents[2][3] = {now,max}
	talents[2][3].now = 1
	talents[2][3].max = datos.maxWeapon1
	talents[3] = {}
	talents[3][1] = {now,max}
	talents[3][1].now = 0
	talents[3][1].max = 2
	talents[3][2] = {now}
	talents[3][2].now = 0
	talents[3][3] = {now,max}
	talents[3][3].now = 0
	talents[3][3].max = 2
	talents[3][4] = {now}
	talents[3][4].now = 0
	talents[3][5] = {now,max}
	talents[3][5].now = 0
	talents[3][5].max = 2
	talents[3][6] = {now}
	talents[3][6].now = 0
	talents[3][7] = {now,max}
	talents[3][7].now = 0
	talents[3][7].max = 2
	talents[3][8] = {now}
	talents[3][8].now = 0
	talents[4] = {}
	talents[4][1] = {now}
	talents[4][1].now = 0
	talents[4][2] = {now}
	talents[4][2].now = 0
	talents[4][3] = {now}
	talents[4][3].now = 0
	talents[4][4] = {now}
	talents[4][4].now = 0
	talents[4][5] = {now}
	talents[4][5].now = 0
	talents[4][6] = {now}
	talents[4][6].now = 0
	talents[4][7] = {now}
	talents[4][7].now = 0
	talents[4][8] = {now}
	talents[4][8].now = 0
	talents[4][9] = {now}
	talents[4][9].now = 0
	talents[4][10] = {now}
	talents[4][10].now = 0
	talents[5] = {}
	talents[5][4] = {now}
	talents[5][4].now = 0
	talents[5][6] = {now}
	talents[5][6].now = 0
	talents[5][7] = {now,max}
	talents[5][7].now = 0
	talents[5][7].max = datos.maxVault
	talents[5][8] = {now}
	talents[5][8].now = 0
	talents[6] = {}
	talents[6][1] = {now}
	talents[6][1].now = 0
	talents[6][2] = {now}
	talents[6][2].now = 0
	glob.cursed[player.name].talents = talents
	removeItems.axes(player)
	if player.character then player.insert({name="cursed-axe-"..talents[2][1].now,count=1}) end
	removeItems.armors(player)
	if player.character then player.insert({name="cursed-armor-"..talents[2][2].now,count=1}) end
	removeItems.bows(player)
	if player.character then player.insert({name="cursed-weapon1-"..talents[2][3].now,count=1}) end
	if not isoption then
		if player.character then player.insert({name="cursed-ammo1-1",count=10}) end
		player.insert({name="cursed-talent-1",count=10})
		player.insert({name="cursed-talent-2",count=1})
	end
end