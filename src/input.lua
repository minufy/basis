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

Input.jump = new({"w", "up", "space"})
Input.lmb = new()
Input.rmb = new()

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
    
    local down = love.mouse.isDown(1)
    local up = not down
    Input.lmb.pressed = down and not Input.lmb.down
    Input.lmb.released = up and not Input.lmb.up
    Input.lmb.down = down
    Input.lmb.up = up

    local down = love.mouse.isDown(2)
    local up = not down
    Input.rmb.pressed = down and not Input.rmb.down
    Input.rmb.released = up and not Input.rmb.up
    Input.rmb.down = down
    Input.rmb.up = up
end