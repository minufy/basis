Images = {}
Audio = {}

local function newImage(name)
    local path = "assets/imgs/"..name..".png"
    return love.graphics.newImage(path)
end

local function newAudio(name, volume)
    volume = volume or 0.5
    local path = "assets/audio/"..name..".ogg"
    local audio = {
        source = love.audio.newSource(path, "static")
    }
    audio.source:setVolume(volume)
    function audio:play()
        audio.source:stop()
        audio.source:play()
    end
    return audio
end

Images["player"] = newImage("player")
-- Audio["jump"] = newAudio("jump")