---@diagnostic disable: duplicate-set-field
require("src.camera")
require("src.input")
require("src.res")
require("src.sm")
require("src.timer")
require("src.utils")
require("src.assets")

Object = require("src.object")

local lurker = require("modules.lurker")
lurker.postswap = function(f) Log:log("File " .. f .. " was swapped") end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    
    FONT = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 20)
    love.graphics.setFont(FONT)

    LoadAssets()

    Res:init()
    SM:init()
end

function love.draw()
    Res:before()
    SM:draw()
    Res:after()
    
    Log:draw()
end

function love.update(dt)
    dt = math.min(1.5, dt*60)
    
    if CONSOLE then
        lurker.update()
        CheckReload()
    end
    
    UpdateInputs()
    Timer:update(dt)
    SM:update(dt)
    Log:update(dt)
end

function CheckReload()
    if Input.console_ctrl.down and Input.console_reload.pressed then
        LoadAssets()
        Log:log("reload complete.")
    end
end

function love.resize(w, h)
    Res:resize(w, h)
end