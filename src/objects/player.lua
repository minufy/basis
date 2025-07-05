local Object = require("modules.classic")

local Player = Object:extend()

local img = love.graphics.newImage("assets/imgs/player.png")

function Player:new()
    self.w = img:getWidth()
    self.h = img:getHeight()

    self.x = 0
    self.y = 0

    self.prop = {
        ["player"] = true,
    }
end

function Player:draw()
    love.graphics.draw(img, self.x, self.y)
    Camera:set(self.x, self.y)
end

function Player:update(dt)
    if Input.jump.pressed then
        print(dt)
    end
end

return Player