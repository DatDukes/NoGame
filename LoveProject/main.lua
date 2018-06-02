require("scripts/entity")
require("scripts/spm")
require("shader/softBody")

gameViewport = {}
npcs = {}
block = {}
entityShader = nil

function love.load()
   	world = love.physics.newWorld(0, 10, false)
	
	block.body = love.physics.newBody(world, 0 , 235, 'kinematic')
	block.shape = love.physics.newEdgeShape(0, 0, 255, 20)
	block.fixture = love.physics.newFixture(block.body,block.shape)

	entityShader = GetSoftBodyShader();
	
   	player = entity(spm(50 , 0, 0), world, 'sprite/entity.png')
	
	for i = 0, 5, 1 do
		npcs[i] =  entity(spm(50 * i, 20, 45), world, 'sprite/entity.png')
	end

	gameViewport.canvas = love.graphics.newCanvas(256,256)
	gameViewport.canvas:setFilter('nearest','nearest')
end

function renderGame()
	love.graphics.clear()
	player:draw()
	
	for i = 0, #npcs, 1 do
		npcs[i]:draw()
	end
end

function love.update(dt)
	world:update(dt)
	
	gameViewport.scale = love.graphics.getHeight() / 256
	gameViewport.x = (love.graphics.getWidth() - (256 * gameViewport.scale)) / 2
end

function love.draw()
	love.graphics.setShader(entityShader) 
		gameViewport.canvas:renderTo(renderGame)
		love.graphics.draw(gameViewport.canvas,gameViewport.x,0,0,gameViewport.scale,gameViewport.scale)
	love.graphics.setShader() 
end
