local Scene = require("src.scene")

---@class Game:Scene
local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    self:add_layer(self:add(Player))
end

function Game:draw()
    Camera:start()
    self:draw_layer(1)
    Camera:stop()
    love.graphics.print("Test")
end

function Game:update(dt)
    
end

return Game