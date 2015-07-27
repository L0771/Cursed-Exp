module("onrobotbuiltentity", package.seeall)

function main(event)
	if event.createdentity.name == "cursed-drill-1" then
		event.createdentity.destroy()
	elseif event.createdentity.name == "cursed-turret-1" then
		event.createdentity.destroy()
	elseif event.createdentity.name == "cursed-fisher-1" then
		event.createdentity.destroy()
	elseif event.createdentity.name == "cursed-blood-tank-1" then
		local tanks = glob.cursed.others.tanks
		for i = 1, #tanks do
			if not tanks[i].entity.valid then
				tanks[i] = {entity = event.createdentity}
				return
			end
		end
		tanks[#tanks + 1] = {entity = event.createdentity}
	elseif event.createdentity.name == "cursed-donation" then
		event.createdentity.destroy()
	elseif string.sub(event.createdentity.name,1,12) == "cursed-vault" then
		event.createdentity.destroy()
	elseif event.createdentity.name == "cursed-generator-0" then
		local generators = glob.cursed.others.generators
		event.createdentity.destructible = false
		for i = 1, #generators do
			if not generators[i].accumulator.valid then
				local chest = game.createentity {name="cursed-generator", position={ x = event.createdentity.position.x, y = event.createdentity.position.y }, force=game.forces.player}
				generators[i] = {accumulator = event.createdentity, chest = chest, rank = 0}
				return
			end
		end
		local chest = game.createentity {name="cursed-generator", position={ x = event.createdentity.position.x, y = event.createdentity.position.y }, force=game.forces.player}
		generators[#generators + 1] = {accumulator = event.createdentity, chest = chest, rank = 0}
	elseif string.sub(event.createdentity.name,1,16) == "cursed-wall-base" then
		event.createdentity.destroy()
	end
end