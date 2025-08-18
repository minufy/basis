---@class BaseScene:Object
local BaseScene = Object:new()

function BaseScene:init()
    self.objects = {}
    self.id = 0
end

function BaseScene:update_objects(dt)
    for i = #self.objects, 1, -1 do
        if self.objects[i].prop.remove then
            table.remove(self.objects, i)
        else
            self.objects[i]:update(dt)
        end
    end
end

function BaseScene:draw_objects()
    self:sort_z()
    for i, object in pairs(self.objects) do
        object:draw()
    end
end

function BaseScene:add(object, ...)
    local o = object:new()
    o:init(...)
    o.sc = self
    o.id = self.id
    self.id = self.id+1
    table.insert(self.objects, o)
    return o
end

function BaseScene:check_col(a, b)
    return a.x < b.x+b.w and
            b.x < a.x+a.w and
            a.y < b.y+b.h and
            b.y < a.y+a.h
end

function BaseScene:check_dist(a, b, d)
    local ax = a.x+a.w/2
    local ay = a.y+a.h/2
    local bx = b.x+b.w/2
    local by = b.y+b.h/2
    return math.sqrt((ax-bx)^2+(ay-by)^2) <= d
end

function BaseScene:col(a, prop)
    for i, b in ipairs(self.objects) do
        if b.prop[prop] then
            if a ~= b and self:check_col(a, b) then
                return b
            end
        end
    end
    return nil
end

function BaseScene:dist(a, prop, d)
    for i, b in ipairs(self.objects) do
        if b.prop[prop] then
            if a ~= b and self:check_dist(a, b, d) then
                return b
            end
        end
    end
    return nil
end

function BaseScene:move_x(a, x, prop)
    a.x = a.x+x
    local col = self:col(a, prop)
    if col then
        if x > 0 then
            a.x = col.x-a.w
        else
            a.x = col.x+col.w
        end
    end
    return col
end

function BaseScene:move_y(a, y, prop)
    a.y = a.y+y
    local col = self:col(a, prop)
    if col then
        if y > 0 then
            a.y = col.y-a.h
        else
            a.y = col.y+col.h
        end
    end
    return col
end

function BaseScene:sort_z()
    local o = #self.objects
    table.sort(self.objects, function(a, b)
        return a.z*o+a.id < b.z*o+b.id
    end)
end

return BaseScene