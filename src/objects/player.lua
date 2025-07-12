local Object = require("src.object")

---@class Player:Object
local Player = Object:new()

function Player:init()
    self.w = Images["player"]:getWidth()
    self.h = Images["player"]:getHeight()

    self.x = Res.w/2
    self.y = Res.h/2

    self.prop = {
        ["player"] = true,
    }
end

function Player:draw()
    love.graphics.draw(Images["player"], self.x, self.y)
end

function Player:update(dt)
    if Input.jump.pressed then
        print(dt)
    end
end

return Player