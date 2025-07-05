local Object = require("src.object")

local Player = Object:new()

local img = love.graphics.newImage("assets/imgs/player.png")

function Player:init()
    self.w = img:getWidth()
    self.h = img:getHeight()

    self.x = Res.w/2
    self.y = Res.h/2

    self.prop = {
        ["player"] = true,
    }
end

function Player:draw()
    love.graphics.draw(img, self.x, self.y)
end

function Player:update(dt)
    if Input.jump.pressed then
        print(dt)
    end
end

return Player