Res = {}
Res.w = 1280/2
Res.h = 720/2
Res.x = 0
Res.y = 0

function Res:init()
    local w, h = love.graphics.getDimensions()
    self.zoom = w/self.w
end

function Res:getX()
    return love.mouse.getX()/self.zoom-self.x
end

function Res:getY()
    return love.mouse.getY()/self.zoom-self.y
end

function Res:apply()
    love.graphics.translate(self.x, self.y)
end