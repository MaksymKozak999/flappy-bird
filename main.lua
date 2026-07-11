push = require 'push'
class = require 'class'
require 'Bird'

WINDOW_WIDTH = 1280 
WINDOW_HEIGHT = 735

VIRTUAL_WIDTH = 423
VIRTUAL_HEIGHT = 243

backgroundScroll = 0
backgroundScrollSpeed = 60
backgroundLoopingPoint = 498

math.randomseed(os.time())

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    background = love.graphics.newImage('background.png')

    love.window.setTitle('Flappy')

    largeFont = love.graphics.newFont('Minecraft.ttf', 15)
    smallFont = love.graphics.newFont('Minecraft.ttf', 10)

    largeFont:setFilter('nearest', 'nearest')
    smallFont:setFilter('nearest', 'nearest')

    bird = Bird()

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })
end 

function love.resize(w, h)
    push:resize(w, h)
end 

function love.keypressed(key)

    if key == 'escape' then 
        love.event.quit()
    end

end

function love.update(dt)
    backgroundScroll = (backgroundScroll + backgroundScrollSpeed * dt) % backgroundLoopingPoint

    bird:update(dt)
end

function love.draw()
    push:start()
    love.graphics.setFont(largeFont)
    love.graphics.draw(background, -backgroundScroll, 0)
    displayFPS()
    bird:render()
    push:finish()
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print(tostring(love.timer.getFPS()), 25, 10)
    love.graphics.setColor(1,1,1,1)
end