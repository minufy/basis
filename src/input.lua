Input = {}

local function new(keys)
    return {
        keys = keys,
        pressed = false,
        released = false,
        down = false,
        up = true,
    }
end

Input.mb = {
    new(),
    new(),
    new(),
}
Input.wheel = new()

Input.console_ctrl = new({"lctrl"})
Input.console_reload = new({"1"})

function UpdateInputs()
    for i, action in pairs(Input) do
        if action.keys then
            local down = false
            for i, key in ipairs(action.keys) do
                down = down or love.keyboard.isDown(key)
            end
            local up = not down
            action.pressed = down and not action.down
            action.released = up and not action.up
            action.down = down
            action.up = up
        end
    end

    for i=1, 3 do
        local down = love.mouse.isDown(i)
        local up = not down
        Input.mb[i].pressed = down and not Input.mb[i].down
        Input.mb[i].released = up and not Input.mb[i].up
        Input.mb[i].down = down
        Input.mb[i].up = up
    end
end

function UpdateWheelInput()
    Input.wheel.up = false
    Input.wheel.down = false
end

function love.wheelmoved(x, y)
    if y > 0 then
        Input.wheel.up = true
    else
        Input.wheel.down = true
    end
end