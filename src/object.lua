local Object = {}

function Object:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Object:init()
    
end

function Object:update(dt)
  -- update object properties
end

function Object:draw()
  -- draw object on screen
end

return Object