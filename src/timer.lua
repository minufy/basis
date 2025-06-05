Timer = {}

function AddTimer(time, action)
    table.insert(Timer, {
        time = time,
        timer = 0,
        action = action,
    })
end

function UpdateTimers(dt)
    for i, item in pairs(Timer) do
        item.timer = item.timer+dt
        if item.timer >= item.time then
            item.action()
            table.remove(Timer, i)
        end
    end
end