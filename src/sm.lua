SM = {}

function SM:init()
    self:load_scene("game")
end

function SM:load_scene(name)
    self.scene = require("src.scenes."..name):new()
    self.scene.objects = {}
    self.scene:init()
end

function SM:draw()
    self.scene:draw()
end

function SM:update(dt)
    self.scene:update(dt)
end