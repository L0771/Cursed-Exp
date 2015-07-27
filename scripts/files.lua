module("files", package.seeall)

function explortForum(playername)
	local info = glob.cursed[playername]
	local text = "[size=180][color=#6A0888]- " .. playername .. " -[/color][/size]\n\n"
	if info.class.name ~= "cursed" then
		text = text .. "[list][*]Class: " .. string.upper((string.sub(info.class.name,1,1))) .. string.lower(string.sub(info.class.name,2)) .. "\n"
	end
	text = text .. "[*]Level: " .. info.stats.general.level .. "\n[list]"
	for k, stat in pairs(info.stats) do
		if k ~= "general" and k~= "range" and k ~= "melee" then
			text = text .. "[*]" .. string.upper((string.sub(k,1,1))) .. string.lower(string.sub(k,2)) .. ": " .. stat.level .. "\n"
		elseif k == "range" then
			text = text .. "[*]Bow: " .. stat.level .. "\n"
		end
	end
	text = text .. "[/list]\n"
	text = text .. "[*]Mines: " .. #info.mines .. "\n"
	if #info.mines then
		text = text .. "[list]"
		for _,mine in ipairs(info.mines) do
			text = text .. "[*]" .. mine.nick .. ": " .. mine.level .. "\n"
		end
		text = text .. "[/list]\n"
	end
	text = text .. "[*]Walls: " .. #info.walls .. "\n"
	if #info.walls then
		text = text .. "[list]"
		for _,wall in ipairs(info.walls) do
			text = text .. "[*]" .. wall.nick .. ": " .. wall.level .. "\n"
		end
		text = text .. "[/list]\n"
	end
	text = text .. "[*]Fishers: " .. #info.fishers .. "\n"
	if #info.fishers then
		text = text .. "[list]"
		for _,fisher in ipairs(info.fishers) do
			text = text .. "[*]" .. fisher.nick .. ": " .. fisher.level .. "\n"
		end
		text = text .. "[/list]\n"
	end
	text = text .. "[/list]"
	text = text .. "[spoiler=Talents][list]\n"
	if info.talents[1][5].now > 0 then
		text = text .. "[*]Mining bonus: " .. info.talents[1][5].now .. "\n"
	end
	if info.talents[1][6].now > 0 then
		text = text .. "[*]Farming bonus: " .. info.talents[1][6].now .. "\n"
	end
	if info.talents[1][7].now > 0 then
		text = text .. "[*]Crafting bonus: " .. info.talents[1][7].now .. "\n"
	end
	if info.talents[1][8].now > 0 then
		text = text .. "[*]Explore bonus: " .. info.talents[1][8].now .. "\n"
	end
	if info.talents[1][9].now > 0 then
		text = text .. "[*]Attack bonus: " .. info.talents[1][9].now .. "\n"
	end
	if info.talents[1][10].now > 0 then
		text = text .. "[*]Defence bonus: " .. info.talents[1][10].now .. "\n"
	end
	if info.talents[2][1].now > 0 then
		text = text .. "[*]Cursed tool: " .. info.talents[2][1].now .. "\n"
	end
	if info.talents[2][2].now > 0 then
		text = text .. "[*]Cursed armor: " .. info.talents[2][2].now .. "\n"
	end
	if info.talents[2][3].now > 0 then
		text = text .. "[*]Cursed bow: " .. info.talents[2][3].now .. "\n"
	end
	if info.talents[3][2].now > 0 then
		text = text .. "[*]Mines bonus: " .. info.talents[3][2].now .. "\n"
	end
	if info.talents[3][4].now > 0 then
		text = text .. "[*]Turrets bonus: " .. info.talents[3][4].now .. "\n"
	end
	if info.talents[3][6].now > 0 then
		text = text .. "[*]Walls bonus: " .. info.talents[3][6].now .. "\n"
	end
	if info.talents[3][8].now > 0 then
		text = text .. "[*]Fishers bonus: " .. info.talents[3][8].now .. "\n"
	end
	if info.talents[4][1].now > 0 then
		text = text .. "[*]Talent part 1 bonus: " .. info.talents[4][1].now .. "\n"
	end
	if info.talents[4][2].now > 0 then
		text = text .. "[*]Talent part 2 bonus: " .. info.talents[4][2].now .. "\n"
	end
	if info.talents[4][3].now > 0 then
		text = text .. "[*]Talent part 3 bonus: " .. info.talents[4][3].now .. "\n"
	end
	if info.talents[4][4].now > 0 then
		text = text .. "[*]Talent part 4 bonus: " .. info.talents[4][4].now .. "\n"
	end
	if info.talents[4][5].now > 0 then
		text = text .. "[*]Talent part 5 bonus: " .. info.talents[4][5].now .. "\n"
	end
	if info.talents[4][6].now > 0 then
		text = text .. "[*]Talent part 6 bonus: " .. info.talents[4][6].now .. "\n"
	end
	if info.talents[5][4].now > 0 then
		text = text .. "[*]HP regen bonus: " .. info.talents[5][4].now .. "\n"
	end
	if info.talents[5][6].now > 0 then
		text = text .. "[*]Damage aura level: " .. info.talents[5][6].now .. "\n"
	end
	if info.talents[5][7].now > 0 then
		text = text .. "[*]Bank level: " .. info.talents[5][7].now .. "\n"
	end
	if info.talents[5][8].now > 0 then
		text = text .. "[*]Drop talents: " .. info.talents[5][8].now .. "\n"
	end
	if info.talents[6][1].now > 0 then
		text = text .. "[*]Revives: " .. info.talents[6][2].now .. "\n"
	end
	if info.talents[6][2].now > 0 then
		text = text .. "[*]Bodies max: " .. info.talents[6][2].now .. "\n"
	end
	text = text .. "[/list][/spoiler]"
	game.makefile("cursed/ToForum - " .. playername .. ".txt",text)
end


function exportSkills(player)
	local stats = glob.cursed[player.name].stats
	text = [[module("statsSaved", package.seeall)
	function import()
	local values = []] .. "["
	encrypt = ""
	for k,v in pairs(stats) do
		encrypt = encrypt .. (stats[k].name or "_") .. ";"
		encrypt = encrypt .. (stats[k].level or "_") .. ";"
		encrypt = encrypt .. (stats[k].exp or "_") .. ";"
		encrypt = encrypt .. (stats[k].next or "_") .. ";"
	end
text = text .. enc.crypt(encrypt,{29, 58, 93, 28, 27}) .. "]" .. [[]

	return values
end]]	
	game.makefile("cursed/saveSkills - " .. player.name .. ".lua",text)
	return "ok"
end

function importSkills(player)
require("saves/saveSkills - " .. player)
	local values = enc.crypt((statsSaved.import()),{29, 58, 93, 28, 27},true)
	
	datos={}
	i=1
	for str in string.gmatch(values, "([^;]+)") do
			datos[i] = str
			i = i + 1
	end
	
	resultado = {}
	for i=1, #datos/4 do
		n = 1
		m = datos[4 * (i - 1) + n]
		resultado[m] = {}
		resultado[m].name = datos[4 * (i - 1) + n]
		n = n + 1
		resultado[m].level = datos[4 * (i - 1) + n]
		n = n + 1
		resultado[m].exp = datos[4 * (i - 1) + n]
		n = n + 1
		resultado[m].next = datos[4 * (i - 1) + n]
	end
	
	for _,v in ipairs(resultado) do
		v.level = tonumber(v.level)
		v.exp = tonumber(v.exp)
		v.next = tonumber(v.next)
	end
	
	glob.cursed[player].stats = resultado
end