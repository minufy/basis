Res = {}
Res.w = 1280/2
Res.h = 720/2

function Res:init()
    local w, h = love.graphics.getDimensions()
    self:resize(w, h)
    self.canvas = love.graphics.newCanvas(self.w, self.h)
end

function Res:before()
    love.graphics.setCanvas(self.canvas)
    love.graphics.setBlendMode("alpha")
    love.graphics.clear()
end

function Res:after()
    love.graphics.setCanvas()
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.canvas, 0, 0, 0, self.zoom, self.zoom)
end

function Res:getX()
    return love.mouse.getX()/self.zoom-Camera.x
end

function Res:getY()
    return love.mouse.getY()/self.zoom-Camera.y
end

function Res:resize(w, h)
    self.zoom = w/self.w
end