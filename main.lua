---@diagnostic disable: duplicate-set-field
require("src.camera")
require("src.input")
require("src.log")
require("src.res")
require("src.sm")
require("src.timer")
require("src.utils")

Object = require("src.object")
BaseObject = require("src.objects.base_object")

local lurker = require("modules.lurker")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineStyle("rough")
    
    FONT = love.graphics.newFont("assets/fonts/Galmuri9.ttf", 20)
    love.graphics.setFont(FONT)

    TILE_SIZE = 32

    require("src.assets")
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
        CheckReload()
    end
    
    UpdateInputs()
    Timer:update(dt)
    SM:update(dt)
    Log:update(dt)
    UpdateWheelInput()
end

function CheckReload()
    if Input.console_ctrl.down and Input.console_reload.pressed then
        LoadAssets()
        lurker.scan()
        Log:log("reload complete.")
    end
end

function love.resize(w, h)
    Res:resize(w, h)
end

function love.wheelmoved(x, y)
    if y > 0 then
        Input.wheel.up = true
    else
        Input.wheel.down = true
    end
end