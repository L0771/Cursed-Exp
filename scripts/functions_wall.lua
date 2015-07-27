module("functions_wall", package.seeall)


function delWall(player,wall,num,side)
	local walls = glob.cursed[player.name].walls
	local all = {}
	all.pipes1 = {} -- pipesyp
	if side == nil or side ~= "yp" then
		all.pipes1 = game.findentitiesfiltered{area = {{math.floor(wall.position.x),math.floor(wall.position.y) - 1},{math.ceil(wall.position.x),math.ceil(wall.position.y) - 1}},type = "pipe"}
	end
	all.pipes2 = {} -- pipesxp
	if side == nil or side ~= "xp" then
		all.pipes2 = game.findentitiesfiltered{area = {{math.floor(wall.position.x) + 1,math.floor(wall.position.y)},{math.ceil(wall.position.x) + 1,math.ceil(wall.position.y)}},type = "pipe"}
	end
	all.pipes3 = {} -- pipesyn
	if side == nil or side ~= "yn" then
		all.pipes3 = game.findentitiesfiltered{area = {{math.floor(wall.position.x),math.floor(wall.position.y) + 1},{math.ceil(wall.position.x),math.ceil(wall.position.y) + 1}},type = "pipe"}
	end
	all.pipes4 = {} -- pipesxn
	if side == nil or side ~= "xn" then
		all.pipes4 = game.findentitiesfiltered{area = {{math.floor(wall.position.x) - 1,math.floor(wall.position.y)},{math.ceil(wall.position.x) - 1,math.ceil(wall.position.y)}},type = "pipe"}
	end
	
	for n = 1, 4 do
		for i = 1,#all["pipes" .. n] do
			if string.sub(all["pipes" .. n][i].name,1,12) == "cursed-wall-" then
				local pipe = searchPipe(all["pipes" .. n][i])
				local invi = nil
				local store = nil
				if pipe ~= nil then
					local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
					local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
					
					local pipeid = oldpipe.name
					local idchar = string.sub(pipeid,12 + n,12 + n)
					if idchar == "1" then
						local oldhp = oldpipe.health
						local position = oldpipe.position
						local fluid
						if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
							fluid = oldpipe.fluidbox[1].amount
						end
					
						oldpipe.destroy()
						nexpipename = "cursed-wall-"
						for l = 1, 4 do
							if l == n then
								nexpipename = nexpipename .. "0"
							else
								nexpipename = nexpipename .. string.sub(pipeid,12 + l,12 + l)
							end
						end
						newpipe[pipe[4]] = game.createentity{name=nexpipename,position=position, force=player.force}
						newpipe[pipe[4]].health = oldhp
						if fluid and fluid > 0 then
							newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
						end
					end
				elseif string.sub(all["pipes" .. n][i].name,13,17) == "i1010" then
					for j = 1, #walls do
						if all["pipes" .. n][i].equals(walls[j].invi.yn) then
							invi = walls[j].invi.yn
							store = walls[j].storage
						elseif all["pipes" .. n][i].equals(walls[j].invi.yp) then
							invi = walls[j].invi.yp
							store = walls[j].storage
						end
					end
				elseif string.sub(all["pipes" .. n][i].name,13,17) == "i0101" then
					for j = 1, #walls do
						if all["pipes" .. n][i].equals(walls[j].invi.xn) then
							invi = walls[j].invi.xn
							store = walls[j].storage
						elseif all["pipes" .. n][i].equals(walls[j].invi.xp) then
							invi = walls[j].invi.xp
							store = walls[j].storage
						end
					end
				end
				if invi ~= nil then
					invi.active = false
					if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type == "living-mass" then
						if (store.fluidbox[1] == nil or (store.fluidbox[1] ~= nil and store.fluidbox[1].type ~= "living-mass")) then
							store.fluidbox[1] = {type = "living-mass", amount = invi.fluidbox[1].amount, temperature = 30}
						else
							store.fluidbox[1] = {type = "living-mass", amount = store.fluidbox[1].amount + invi.fluidbox[1].amount, temperature = 30}
						end
						invi.fluidbox[1] = nil
					end
				end
			end
		end
	end
	local fluid = wall.health
	if wall.fluidbox[1] ~= nil and wall.fluidbox[1].type == "living-mass" then
		fluid = fluid + wall.fluidbox[1].amount
	end
	if fluid > 0 then
		if (walls[num].storage.fluidbox[1] == nil or (walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type ~= "living-mass")) then
			walls[num].storage.fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
		else
			walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount + fluid, temperature = 30}
		end
	end
	if wall.valid then
		wall.destroy()
	end
	maxFluidStorage(player.name,num)
end

function addWall(player,num,side,position,name)
	local walls = glob.cursed[player.name].walls
	walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].storage.fluidbox[1].amount - 100, temperature = 30}
	if walls[num].invi.xp.fluidbox[1] ~= nil and walls[num].invi.xp.fluidbox[1].type ~= "living-mass" then
		walls[num].invi.xp.fluidbox[1] = nil
	end
	walls[num].invi.xp.active = true
	-- walls[num].sides["wall" .. side][#walls[num].sides["wall" .. side] + 1] = game.createentity{name="cursed-wall-" .. name,position=position, force=player.force}
	-- local wall = walls[num].sides["wall" .. side][#walls[num].sides["wall" .. side]]
	
	local all = {}
	all.pipes1 = game.findentitiesfiltered{area = {{math.floor(position.x),math.floor(position.y) + 1},{math.ceil(position.x),math.ceil(position.y) + 1}},type = "pipe"}
	all.pipes2 = game.findentitiesfiltered{area = {{math.floor(position.x) - 1,math.floor(position.y)},{math.ceil(position.x) - 1,math.ceil(position.y)}},type = "pipe"}
	all.pipes3 = game.findentitiesfiltered{area = {{math.floor(position.x),math.floor(position.y) - 1},{math.ceil(position.x),math.ceil(position.y) - 1}},type = "pipe"}
	all.pipes4 = game.findentitiesfiltered{area = {{math.floor(position.x) + 1,math.floor(position.y)},{math.ceil(position.x) + 1,math.ceil(position.y)}},type = "pipe"}
	for n = 1, 4 do
		for i = 1,#all["pipes" .. n] do
			if string.sub(all["pipes" .. n][i].name,1,12) == "cursed-wall-" then
				local pipe = searchPipe(all["pipes" .. n][i])
				if pipe ~= nil then
					local oldpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]][pipe[4]]
					local newpipe = glob.cursed[pipe[1]].walls[pipe[2]].sides[pipe[3]]
					
					local pipeid = oldpipe.name
					local idchar
					if n == 1 or n == 2 then
						idchar = string.sub(pipeid,12 + (n+2),12 + (n+2))
					elseif n == 3 or n == 4 then
						idchar = string.sub(pipeid,12 + (n-2),12 + (n-2))
					end
					if idchar == "0" then
						local oldhp = oldpipe.health
						local positionpipe = oldpipe.position
						local fluid
						if oldpipe.fluidbox[1] ~= nil and oldpipe.fluidbox[1].type == "living-mass" then
							fluid = oldpipe.fluidbox[1].amount
						end
					
						oldpipe.destroy()
						local nexpipename = "cursed-wall-"
						for l = 1, 2 do
							if (l+2) == n then
								nexpipename = nexpipename .. "1"
							else
								nexpipename = nexpipename .. string.sub(pipeid,12 + l,12 + l)
							end
						end
						for l = 3, 4 do
							if (l-2) == n then
								nexpipename = nexpipename .. "1"
							else
								nexpipename = nexpipename .. string.sub(pipeid,12 + l,12 + l)
							end
						end
						
						newpipe[pipe[4]] = game.createentity{name=nexpipename,position=positionpipe, force=player.force}
						newpipe[pipe[4]].health = oldhp
						if fluid and fluid > 0 then
							newpipe[pipe[4]].fluidbox[1] = {type = "living-mass", amount = fluid, temperature = 30}
						end
					end
				elseif string.sub(all["pipes" .. n][i].name,13,17) == "i1010" then
					for j = 1, #walls do
						if all["pipes" .. n][i].equals(walls[j].invi.yn) then
							invi = walls[j].invi.yn
						elseif all["pipes" .. n][i].equals(walls[j].invi.yp) then
							invi = walls[j].invi.yp
						end
					end
				elseif string.sub(all["pipes" .. n][i].name,13,17) == "i0101" then
					for j = 1, #walls do
						if all["pipes" .. n][i].equals(walls[j].invi.xn) then
							invi = walls[j].invi.xn
						elseif all["pipes" .. n][i].equals(walls[j].invi.xp) then
							invi = walls[j].invi.xp
						end
					end
				end
				if invi ~= nil then
					invi.active = true
					if invi.fluidbox[1] ~= nil and invi.fluidbox[1].type ~= "living-mass" then
						invi.fluidbox[1] = nil
					end
				end
			end
		end
	end
	
	local nexpipename = "cursed-wall-"
	for i = 1, 4 do
		if #all["pipes" .. i] > 0 then
			nexpipename = nexpipename .. "1"
		else
			nexpipename = nexpipename .. "0"
		end
	end
	walls[num].sides["wall" .. side][#walls[num].sides["wall" .. side] + 1] = game.createentity{name=nexpipename,position=position, force=player.force}
	maxFluidStorage(player.name,num)
end

function searchPipe(pipe)
	local cursed = glob.cursed
	for k,v in pairs(cursed) do
		if k ~= "others" then
			local walls = v.walls
			for i = 1, #walls do
				for pos,sides in pairs(walls[i].sides) do
					for j = 1, #sides do
						if sides[j] and sides[j].equals(pipe) then
							return {k,i,pos,j,sides[j]}
						end
					end
				end
			end
		end
	end
end

function maxFluidStorage(playername,num, dif)
	local walls = glob.cursed[playername].walls
	if walls[num].storage.fluidbox[1] ~= nil and walls[num].storage.fluidbox[1].type == "living-mass" then
		if dif == nil then
			if walls[num].storage.fluidbox[1].amount > walls[num].maxmass + 10 then
				walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].maxmass + 10, temperature = 30}
			end
		else
			if walls[num].storage.fluidbox[1].amount > walls[num].maxmass + dif then
				walls[num].storage.fluidbox[1] = {type = "living-mass", amount = walls[num].maxmass + dif, temperature = 30}
			end
		end
	else
		walls[num].storage.fluidbox[1] = nil
	end
end