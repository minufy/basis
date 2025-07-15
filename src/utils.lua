function rgb(r, g, b)
    return {love.math.colorFromBytes(r, g, b)}
end
function rgba(r, g, b, a)
    return {love.math.colorFromBytes(r, g, b, a)}
end
function a(rgb, a)
    return {rgb[1], rgb[2], rgb[3], a}
end
function ResetColor()
    love.graphics.setColor(1, 1, 1)
end