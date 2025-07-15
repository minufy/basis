function rgb(r, g, b)
    return {r/255, g/255, b/255}
end
function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end
function a(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end
function ResetColor()
    love.graphics.setColor(1, 1, 1)
end