module("oninit", package.seeall)

function main(noModule)
	functions_trees.AddTreeDB()
	if not glob.cursed then
		glob.cursed = {}
	end
	local cursed = glob.cursed
	for k,v in pairs(game.players) do
		if cursed[v.name] == nil then
			resetall.main(v,nil)
			if v.character and glob.cursed[v.name].aux.bodynow == nil then
				glob.cursed[v.name].aux.bodynow = #glob.cursed[v.name].aux.bodies + 1
				glob.cursed[v.name].aux.bodies[glob.cursed[v.name].aux.bodynow] = {position = v.character.position, name = v.character.name, force = v.force, maxhealth = v.character.prototype.maxhealth, entity = v.character, nick = "Body {" .. math.floor(v.character.position.x) .. "," .. math.floor(v.character.position.y) .. "}"} 
			end
		end
	end
	glob.cursed.others = {}
	glob.cursed.others.blood = {}
	glob.cursed.others.tanks = {}
	glob.cursed.others.generators = {}
	glob.cursed.others.runday = true
	functions_trees.refreshTrees()
	refreshResources.main(noModule)
	if remote.interfaces["cursed-classes"] then
		functions_classes.loadClasses()
	end
end