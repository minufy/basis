local Scene = require("src.scene")

---@class Game:Scene
local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    Scene.init(self)
    self:add(Player)
end

function Game:draw()
    Camera:start()

    self:draw_objects()

    Camera:stop()

    love.graphics.print("Test")
end

function Game:update(dt)
    self:update_objects(dt)
end

return Game
