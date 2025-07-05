Camera = {}
Camera.ox = 0
Camera.oy = 0
Camera.tx = 0
Camera.ty = 0
Camera.x = 0
Camera.y = 0
Camera.dx = 0.1
Camera.dy = 0.1
Camera.shaker = {}
Camera.shaker.d = 0.2
Camera.shaker.x = 0
Camera.shaker.y = 0
Camera.shaker.dur = 0

function Camera:set(x, y)
    self.tx = x
    self.ty = y
end

function Camera:offset(x, y)
    self.ox = x
    self.oy = y
end

function Camera:shake(dur)
    self.shaker.dur = dur
end

function Camera:apply()
    if self.shaker.dur > 0.1 then
        love.graphics.translate(self.shaker.x, self.shaker.y)
    end
    Res.x = self.ox-self.x
    Res.y = self.ox-self.y
end

function Camera:update(dt)
    if self.shaker.dur > 0.1 then
        self.shaker.x = math.random(-self.shaker.dur, self.shaker.dur)
        self.shaker.y = math.random(-self.shaker.dur, self.shaker.dur)
    end
    self.shaker.dur = self.shaker.dur+(0-self.shaker.dur)*self.shaker.d*dt
    
    self.x = self.x+(self.tx-self.x)*self.dx*dt
    self.y = self.y+(self.ty-self.y)*self.dy*dt
end