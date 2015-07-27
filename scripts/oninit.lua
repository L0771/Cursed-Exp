module("oninit", package.seeall)

function main(noModule)
	local cursedTree = {
	["name"] = "cursed-tree",
	["states"] = { "cursed-tree-00", "cursed-tree-01", "cursed-tree-02", "cursed-tree-03", "cursed-tree-04" },
	["output"] = {"cursed-heart", 1},
	["efficiency"] = { ["grass"] = 0.50, ["grass-medium"] = 0.50, ["grass-dry"] = 0.45, ["dirt"] = 0.35, ["dirt-dark"] = 0.55, ["hills"] = 0.25, ["sand"] = 0.75, ["sand-dark"] = 0.75, ["other"] = 0 },
	["basicGrowingTime"] = 6250,
	["randomGrowingTime"] = 12500,
	["fertilizerBoost"] = 1,
	}
	if remote.interfaces.treefarm_interface and remote.interfaces.treefarm_interface.getSeedTypesData then
		remote.call("treefarm_interface", "addSeed", cursedTree)
	elseif remote.interfaces.treefarm and remote.interfaces.treefarm.getSeedTypesData then
		remote.call("treefarm", "addSeed", cursedTree)
	end
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
	refreshTrees.main()
	refreshResources.main(noModule)
	if remote.interfaces["cursed-classes"] then
		functions_classes.loadClasses()
	end
end