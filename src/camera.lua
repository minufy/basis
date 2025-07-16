Camera = {}
Camera.offset_x = 0
Camera.offset_y = 0
Camera.target_x = 0
Camera.target_y = 0
Camera.x = 0
Camera.y = 0
Camera.damp_x = 0.1
Camera.damp_y = 0.1
Camera.shake = {}
Camera.shake.damp = 0.1
Camera.shake.x = 0
Camera.shake.y = 0
Camera.shake.duration = 0

function Camera:set(x, y)
    self.target_x = x
    self.target_y = y
end

function Camera:offset(x, y)
    self.offset_x = x
    self.offset_y = y
    self.x = self.offset_x-self.target_x
    self.y = self.offset_y-self.target_y
end

function Camera:set_shake(dur)
    self.shake.duration = dur
end

function Camera:start()
    love.graphics.push()
    if self.shake.duration > 0.1 then
        love.graphics.translate(self.shake.x, self.shake.y)
    end
    love.graphics.translate(self.x, self.y)
end

function Camera:stop()
    love.graphics.pop()
end

function Camera:update(dt)
    if self.shake.duration > 0.1 then
        self.shake.x = math.random(-self.shake.duration, self.shake.duration)
        self.shake.y = math.random(-self.shake.duration, self.shake.duration)
    end
    self.shake.duration = self.shake.duration+(0-self.shake.duration)*self.shake.damp*dt
    
    self.x = self.x+(self.offset_x+self.target_x-self.x)*self.damp_x*dt
    self.y = self.y+(self.offset_y+self.target_y-self.y)*self.damp_y*dt
end