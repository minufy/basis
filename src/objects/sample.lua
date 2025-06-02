local Object = require("src.object")

local Sample = Object:new()

local img = love.graphics.newImage("assets/imgs/sample.png")

function Sample:init()
    self.w = img:getWidth()
    self.h = img:getHeight()

    self.x = Res.w/2
    self.y = Res.h/2
    self.cx = self.w/2
    self.cy = self.h/2

    self.tag = "sample"
end

function Sample:draw()
    love.graphics.draw(img, self.x, self.y)
end

function Sample:update(dt)
    if Input.jump.pressed then
        print(dt)
    end
end

return Sample
