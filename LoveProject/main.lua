require('scripts/Player')

gameCanvas = nil
scale = 1
canvasX = 0
player = nil
world = nil

function love.load()
   	world = love.physics.newWorld(0,9.5,false)
   	player = entity({x = 50, y = 50},world,'sprite/entity.png')
	player2 = entity({x = 10, y = 0},world,'sprite/entity.png')

	gameCanvas = love.graphics.newCanvas(256,256)
	gameCanvas:setFilter('nearest','nearest')
end

function renderGame()
	love.graphics.clear()
	player:draw()
	player2:draw()
end

function love.update(dt)
	world:update(dt)
	player.body:applyForce(10,0)
	scale = love.graphics.getHeight() / 256
	canvasX = (love.graphics.getWidth() - (256 * scale)) / 2
end

function love.draw()
	gameCanvas:renderTo(renderGame)
	love.graphics.draw(gameCanvas,canvasX,0,0,scale,scale)
end
