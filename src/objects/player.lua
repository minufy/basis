---@class Player:BaseObject
local Player = BaseObject:new()

function Player:init()
    BaseObject.init(self)
    self.w = Images.player:getWidth()
    self.h = Images.player:getHeight()

    self.x = Res.w/2
    self.y = Res.h/2
    
    self.prop = {
        player = true,
    }
end

function Player:draw()
    love.graphics.draw(Images.player, self.x, self.y)
end

function Player:update(dt)
end

return Player