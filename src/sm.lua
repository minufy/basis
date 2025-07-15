SM = {}

function SM:init()
    self:load_scene("game")
end

function SM:load_scene(name)
    self.scene = require("src.scenes."..name):new()
    self.scene:init_base()
    self.scene:init()
end

function SM:draw()
    self.scene:draw()
end

function SM:update(dt)
    Camera:update(dt)
    self.scene:update_objects(dt)
    self.scene:update(dt)
end