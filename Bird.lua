Bird = class{}

function Bird:init()
    self.image  = love.graphics.newImage('sprite.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.x = VIRTUAL_WIDTH / 2 - (self.height / 2)
end

function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end