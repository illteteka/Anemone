local instances = {}

--[[
	Load all instances into the game
	Should only happen once
]]
function instances.load()
	
	obj_guy = require "objects.guy"
	obj_guy.init()

	obj_blueguy = require "objects.blueguy"
	obj_blueguy.init()

	--[[
		Add every instance that needs to be cleared to this list
		Switching levels will destroy all non persistent objects
	]]
	instances.list = {obj_guy, obj_blueguy}

end

--[[
	Remove all active objects from the scene
]]
function instances.clear()

	local i = 1
	while i <= #instances.list do

		instances.list[i].init()
		i = i + 1
	end

end

return instances