local love = require "love"

local game = {
    difficulty = 1,
    state = {
        menu = false,
        paused = true,
        running = false,
        ended = false,
    }
}

local player = {
    radius = 20,
    x = 30,
    y = 30
}

local enemies = {}

function love.load()
    love.window.setTitle("Save the ball")
    love.mouse.setVisible(false)
end

function love.update()
    player.x, player.y = love.mouse.getPosition()
end

function love.draw()
    love.graphics.printf("FPS: " .. love.timer.getFPS(), 
    love.graphics.newFont(16), 
    10, 
    love.graphics.getHeight() - 30, 
    love.graphics.getWidth())

    if game.state["running"] then
        love.graphics.circle("fill", player.x, player.y, player.radius)
    end

    if not game.state["running"] then
        love.graphics.circle("fill", player.x, player.y, player.radius/2)
    end
end