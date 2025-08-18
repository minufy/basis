---@class Object
local Object = {}

---@return Object
function Object:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Object:init()
end

function Object:update(dt)
end

function Object:draw()
end

return Object