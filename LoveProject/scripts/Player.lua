entity = {}
entity.__index = entity

setmetatable(entity,
{
	__call = function(cls,...)
		self = setmetatable({},cls)
		self:init(...)
		return self
	end
})

function entity:init(pos,world,path_sprite)
	self.sprite = love.graphics.newImage(path_sprite)
	self.body = love.physics.newBody(world,pos.x,pos.y,'dynamic')
end

function entity:draw()
	love.graphics.draw(self.sprite,self.body.x,self.body.y)
end
