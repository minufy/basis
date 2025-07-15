local Scene = require("src.scene")

---@class Game:Scene
local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    self:add(Player)
end

function Game:draw()
    Camera:start()
    love.graphics.setColor(rgb(255, 179, 179))
    self:draw_layer(1)
    ResetColor()
    Camera:stop()
    love.graphics.setColor(rgb(52, 255, 191))
    love.graphics.print("Test")
    ResetColor()
end

function Game:update(dt)
    
end

return Game