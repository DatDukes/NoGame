require("scripts/spm")

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

function entity:init(mtx, world, path_sprite)
	self.sprite = love.graphics.newImage(path_sprite)
	self.body = love.physics.newBody(world, mtx.x, mtx.y, 'dynamic')
	self.body:setAngle(mtx.r)
	self.shape = love.physics.newCircleShape(0,0, self.sprite:getWidth() / 2)
	self.fixture = love.physics.newFixture(self.body,self.shape) 
end

function entity:draw()
	x = self.body:getX()
	y = self.body:getY()
	love.graphics.draw(self.sprite, x, y, self.body:getAngle(),  1, 1, self.sprite:getWidth() / 2, self.sprite:getHeight() / 2)
end
