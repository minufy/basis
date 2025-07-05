SM = {}

function SM:init()
    self:load_scene("game")
end

function SM:load_scene(name)
    self.scene = require("src.scenes."..name)()
end

function SM:draw()
    love.graphics.push()
    
    self.scene:draw()

    love.graphics.pop()
end

function SM:update(dt)
    self.scene:update(dt)
end