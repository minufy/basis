local BaseScene = require("src.scenes.base_scene")

---@class Game:BaseScene
local Game = BaseScene:new()

local Player = require("src.objects.player")

function Game:init()
    BaseScene.init(self)
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
