local Scene = require("src.scene")

local Game = Scene:new()

local Sample = require("src.objects.sample")

function Game:init()
    self:add(Sample)
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