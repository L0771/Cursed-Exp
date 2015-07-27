module("refreshRecipes", package.seeall)

function main()
	local recipes = {}
	local forcerecipes = game.player.force.recipes
	for _,v in pairs(forcerecipes) do
		recipes[v.name] = {value = recipes[v.name].energy_required}
	end
	glob.cursed.others.recipes = recipes
end