---@class Object
local Object = {}

---@return Object
function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    
    self.id = 0
    self.z = 0
    self.sc = nil
    self.prop = {}
    
    return o
end


function Object:init()
end

function Object:update(dt)
end

function Object:draw()
end

return Object