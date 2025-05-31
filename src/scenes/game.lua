local Scene = require("src.scene")

local Game = Scene:new()

local Sample = require("src.objects.sample")

function Game:init()
    self:add(Sample)
end

function Game:draw()
    love.graphics.setBackgroundColor(0.5, 0.5, 1)
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