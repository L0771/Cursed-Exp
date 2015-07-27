module("refreshTrees", package.seeall)

function main()
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