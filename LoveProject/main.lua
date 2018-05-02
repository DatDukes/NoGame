img = nil
body = nil
world = nil
p = {x = 0; y = 0}

function love.load()
   love.graphics.setColor(1,1,1)
   img = love.graphics.newImage('sprite/Leaf_1.png')
   world = love.physics.newWorld(0,9.5,false)
   body = love.physics.newBody(world,x,y,'dynamic')
end

function love.update(dt)
	p.x = p.x + dt;
	world:update(dt)
	
end

function love.draw()
	love.graphics.setColor(1,1,1)
	love.graphics.draw(img,body:getX(),body:getY(),0,0.2,0.2)
end