local Scene = require("src.scene")

local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    self:add(Player)
end

function Game:draw()
    for _, object in pairs(self.objects) do
        object:draw()
    end
end

function Game:update(dt)
    for _, object in pairs(self.objects) do
        object:update(dt)
    end
end

return Game