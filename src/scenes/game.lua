local Scene = require("src.scene")

---@class Game:Scene
local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    self:add(Player)
end

function Game:draw()
    Camera:start()

    self:draw_objects()

    Camera:stop()
    
    love.graphics.setColor(rgb(52, 255, 191))
    love.graphics.print("Test")
    ResetColor()
end

function Game:update(dt)
    self:update_objects(dt)
end

return Game
