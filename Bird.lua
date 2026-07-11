Bird = class{}

local gravity = 1000

function Bird:init()
    self.image  = love.graphics.newImage('fly.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight() 

    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

    self.dy = 0
end


function Bird:update(dt)

    self.dy = self.dy + gravity * dt

    if love.keyboard.wasPressed('space') then 
        self.dy = -150
    end

    self.y = self.y + self.dy * dt
    
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end