require('entity')

player = {}
player.__index = player

setmetatable(player
{
	__index = entity,
	__call = function(cls,...)
		self = setmetatable({},cls)
		self:init(...)
		return player
	end
})