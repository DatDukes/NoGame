-- Spatialization matrix --
spm = {}
spm.__index = spm

setmetatable(spm,
{
    __index = vec2,
    __call = function (cls, ...)
        self = setmetatable({}, cls)
        self:init(...)
        return self
    end
})

function spm:init(x, y, rot)
    vec2.init(self, x, y)
    self.r = rot
end

-- Vector --
vec2 = {}
vec2.__index = vec2

setmetatable(vec2,
{
    __call = function(cls, ...)
        self = setmetatable({}, cls)
        self:init(...)
        return self
    end
})

function vec2:init(x, y)
    self.x = x
    self.y = y
end