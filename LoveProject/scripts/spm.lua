require("scripts/class")

-- Spatialization matrix --
spm = class({})

function spm:_init(x, y, rot, sx, sy)
    self.pos = vec2(x, y)
    self.scl = vec2(sx, sy)
    self.r = rot
end

-- Vector --
vec2 = class({})

function vec2:_init(x, y)
    self.x = x
    self.y = y
end