require("src.assets")
require("src.camera")
require("src.input")
require("src.res")
require("src.sm")
require("src.timer")
require("src.utils")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")

    FONT = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 20)
    love.graphics.setFont(FONT)

    Res:init()
    SM:init()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
end

function love.update(dt)
    dt = math.min(1.5, dt*60)
    UpdateInputs()
    Timer:update(dt)
    SM:update(dt)
end

function love.resize(w, h)
    Res:resize(w, h)
end