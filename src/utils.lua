function rgb(r, g, b)
    return {r/255, g/255, b/255}
end

function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end

function alpha(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end

function ResetColor()
    love.graphics.setColor({1, 1, 1})
end

function Sign(x)
    if x > 0 then
        return 1
    elseif x < 0 then
        return -1
    end
    return 0
end

Log = {}
Log.last_log = ""
Log.alpha = 0

function Log:log(log)
    log = os.date().." : "..tostring(log)
    self.last_log = log
    self.alpha = 1
    print(log)
end

function Log:draw()
    love.graphics.setFont(FONT)
    love.graphics.setColor(0, 0, 0, self.alpha/10)
    love.graphics.print(self.last_log, 1, 1)
    love.graphics.setColor(1, 1, 1, self.alpha)
    love.graphics.print(self.last_log)
    ResetColor()
end

function Log:update(dt)
    self.alpha = math.max(self.alpha-dt/100, 0)
end