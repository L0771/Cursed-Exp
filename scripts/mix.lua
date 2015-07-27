module("mix", package.seeall)

function round(num,dec)
	if dec ~= 0 then
		num = num * (10 ^ dec)
	end
	num = math.floor(num)
	if dec ~= 0 then
		num = num / (10 ^ dec)
	end
	return num
end

function getplayerbyname(name)
	return game.getplayer(name)
end

function globalPrint(text)
	local players = game.players
	for i=1, #players do
		players[i].print(text)
	end
end

function getowner(build,type)
	if type == "drill" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.mines then
				for i = 1, #v.mines do
					if v.mines[i] and v.mines[i].entity and v.mines[i].entity.valid and build.equals(v.mines[i].entity) then
						return k
					end
				end
			end
		end
	elseif type == "turret" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.turrets then
				for i = 1, #v.turrets do
					if v.turrets[i] ~= nil and v.turrets[i].entity ~= nil and build.equals(v.turrets[i].entity) then
						return k
					end
				end
			end
		end
	elseif type == "wall" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.walls then
				for i = 1, #v.walls do
					if v.walls[i] ~= nil and v.walls[i].chest ~= nil and build.equals(v.walls[i].chest) then
						return k
					end
				end
			end
		end
	elseif type == "fisher" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.fishers then
				for i = 1, #v.fishers do
					if v.fishers[i] ~= nil and v.fishers[i].entity ~= nil and build.equals(v.fishers[i].entity) then
						return k
					end
				end
			end
		end
	elseif type == "pipe" then
		local cursed = glob.cursed
		for k,v in pairs(cursed) do
			if k ~= "others" and v.walls then
				for i = 1, #v.walls do
					for n,m in pairs(v.walls[i].sides) do
						for j = 1, #m do
							if m[j] ~= nil and build.equals(m[j]) then
								return k
							end
						end
					end
				end
			end
		end
	end
end