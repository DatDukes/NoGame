function class(...)
    -- "cls" is the new class
    local cls, bases = {}, {...}

    -- copy base class contents into the new class
    for i, base in ipairs(bases) do
        for k, v in pairs(base) do
            cls[k] = v
        end
    end

    cls.__index, cls.is_a = cls, {[cls] = true}
    for i, base in ipairs(bases) do
        if base.is_a then
            for c in pairs(base.is_a) do
                cls.is_a[c] = true
            end
        end
        cls.is_a[base] = true
    end

    -- the class's __call metamethod
    setmetatable(cls, 
    {
        __call = function (c, ...)
            local instance = setmetatable({}, c)
            local init = instance._init
            if init then 
                init(instance, ...) 
            end
            return instance
        end
    })
    
    -- return the new class table, that's ready to fill with methods
    return cls
end