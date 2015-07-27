module("functions_trees", package.seeall)

function refreshTrees()
	local arboles = {}
	local trees = nil
	if remote.interfaces.treefarm_interface and remote.interfaces.treefarm_interface.getSeedTypesData then
		trees = remote.call("treefarm_interface", "getSeedTypesData")
	elseif remote.interfaces.treefarm and remote.interfaces.treefarm.getSeedTypesData then
		trees = remote.call("treefarm", "getSeedTypesData")
	end
	if trees then
		local entityprototypes = game.entityprototypes
		for _,v in pairs(trees) do
			if #v.states > 1 then
				for i = 1, #v.states do
					arboles[v.states[i]] = {state = i, total = #v.states}
				end
			end
		end
		for _,v in pairs(entityprototypes) do
			if v.type == "tree" then
				if not arboles[v.name] then
					arboles[v.name] = {state = 0}
				end
			end
		end
	else
		local entityprototypes = game.entityprototypes
		for _,v in pairs(entityprototypes) do
			if v.type == "tree" then
				if not arboles[v.name] then
					arboles[v.name] = {state = -1}
				end
			end
		end
	end
	glob.cursed.others.trees = arboles
end

function AddTreeDB()
	if glob.tf ~= nil and glob.tf.seedPrototypes ~= nil and glob.tf.seedPrototypes["cursed-tree"] ~= nil then
		glob.tf.seedPrototypes["cursed-tree"] = nil
		game.player.print("entro")
	end
	
	local cursedTree = {
	["name"] = "cursed-tree",
	["states"] = { "cursed-tree-00", "cursed-tree-01", "cursed-tree-02", "cursed-tree-03", "cursed-tree-04" },
	["output"] = {"cursed-heart", 1},
	["efficiency"] = { ["grass"] = 1.25, ["grass-medium"] = 1.20, ["grass-dry"] = 1.15, ["dirt"] = 1.05, ["dirt-dark"] = 1.00, ["hills"] = 0.95, ["sand"] = 0.90, ["sand-dark"] = 0.85, ["other"] = 0.80 },
	["basicGrowingTime"] = 3125, -- 6250
	["randomGrowingTime"] = 3125, -- 12500
	["fertilizerBoost"] = 1.2,
	}
	if remote.interfaces.treefarm_interface and remote.interfaces.treefarm_interface.getSeedTypesData then
		local ret = remote.call("treefarm_interface", "addSeed", cursedTree)
		if ret ~= nil then
			mix.globalPrint({"msg.cursed", ret})
			return
		end
		mix.globalPrint({"msg.cursed", cursedTree.name .. " added."})
	end
end
