module("refreshResources", package.seeall)

function main(noModule)
	local resource = {}
	local entityprototypes = game.entityprototypes
	for _,v in pairs(entityprototypes) do
		if v.type == "resource" and v.resourcecategory == "basic-solid" and not noModule[v.name] then
			resource[v.name] = {min = v.minimumresourceamount}
		end
	end
	glob.cursed.others.resources = resource
end