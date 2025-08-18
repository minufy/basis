---@class BaseObject:Object
local BaseObject = Object:new()

function BaseObject:init()
    self.x = 0
    self.y = 0
    self.z = 0
    
    self.w = TILE_SIZE
    self.h = TILE_SIZE
    
    self.id = 0
    self.sc = nil
    self.prop = {}
end

return BaseObject