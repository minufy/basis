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