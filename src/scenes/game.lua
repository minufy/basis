local Scene = require("src.scene")

local Game = Scene:new()

local Player = require("src.objects.player")

function Game:init()
    self:add(Player)

    self.camera_shake = {
        dur = 0,
        x = 0,
        y = 0,
    }
    self.camera = {
        x = 0,
        y = 0,
    }
end

function Game:draw()
    love.graphics.push()

    if self.camera_shake.dur > 0.1 then
        love.graphics.translate(self.camera_shake.x, self.camera_shake.y)
    end

    Res:apply()
    
    for _, object in pairs(self.objects) do
        object:draw()
    end

    love.graphics.pop()
end

function Game:shake(dur)
    self.camera_shake.dur = dur
end

function Game:update(dt)
    if self.camera_shake.dur > 0.1 then
        self.camera_shake.x = math.random(-self.camera_shake.dur, self.camera_shake.dur)
        self.camera_shake.y = math.random(-self.camera_shake.dur, self.camera_shake.dur)
    end
    self.camera_shake.dur = self.camera_shake.dur+(0-self.camera_shake.dur)*0.2*dt

    for _, object in pairs(self.objects) do
        object:update(dt)
    end
end

return Game