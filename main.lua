require("src.utils")
require("src.input")
require("src.res")
require("src.sm")

local canvas

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")

    FONT = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 20)
    love.graphics.setFont(FONT)
    
    Res:init()
    SM:init()
    
    canvas = love.graphics.newCanvas(Res.w, Res.h)
end

function love.draw()
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    
    SM:draw()
    
    love.graphics.setCanvas()
    love.graphics.draw(canvas, 0, 0, 0, Res.zoom, Res.zoom)
end

function love.update(dt)
    dt = dt*60
    if dt > 1.5 then
        dt = 1.5
    end
    UpdateInputs()
    SM:update(dt)
end