module("files", package.seeall)
require("encrypt")

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