local Object = require("src.object")

local Scene = Object:new()

function Scene:add(object, ...)
    local o = object:new()
    o.sc = self
    o.prop = {}
    o:init(...)
    table.insert(self.objects, o)
    return o
end

function Scene:remove(object)
    for i, o in ipairs(self.objects) do
        if o == object then
            table.remove(self.objects, i)
            return
        end
    end
end

function Scene:check_col(a, b)
    return a.x < b.x+b.w and
            b.x < a.x+a.w and
            a.y < b.y+b.h and
            b.y < a.y+a.h
end

function Scene:check_dist(a, b, d)
    local ax = a.x+a.w/2
    local ay = a.y+a.h/2
    local bx = b.x+b.w/2
    local by = b.y+b.h/2
    return math.sqrt((ax-bx)^2+(ay-by)^2) <= d
end

function Scene:col(a, prop)
    for i, b in ipairs(self.objects) do
        if b.prop[prop] then
            if a ~= b and self:check_col(a, b) then
                return b
            end
        end
    end
    return nil
end

function Scene:dist(a, prop, d)
    for i, b in ipairs(self.objects) do
        if b.prop[prop] then
            if a ~= b and self:check_dist(a, b, d) then
                return b
            end
        end
    end
    return nil
end

function Scene:move_x(a, x, prop)
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

function Scene:move_y(a, y, prop)
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

return Scene