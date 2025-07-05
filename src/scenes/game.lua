local Scene = require("src.scene")

local Game = Scene:extend()

local Player = require("src.objects.player")

function Game:new()
    self.super:new()
    self:add(Player)
end

function Game:draw()
    Camera:apply()
    Res:apply()
    
    for i, object in pairs(self.objects) do
        object:draw()
    end
end

function Game:update(dt)
    Camera:update(dt)

    for i, object in pairs(self.objects) do
        object:update(dt)
    end
end

return Game