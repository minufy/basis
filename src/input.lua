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
Input.mouse_l = new()
Input.mouse_r = new()

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
    Input.mouse_l.pressed = down and not Input.mouse_l.down
    Input.mouse_l.released = up and not Input.mouse_l.up
    Input.mouse_l.down = down
    Input.mouse_l.up = up

    local down = love.mouse.isDown(2)
    local up = not down
    Input.mouse_r.pressed = down and not Input.mouse_r.down
    Input.mouse_r.released = up and not Input.mouse_r.up
    Input.mouse_r.down = down
    Input.mouse_r.up = up
end