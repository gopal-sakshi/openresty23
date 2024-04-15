local _M = {}

local animals23 = {
    dog = 3,
    cat = 4,
    pig = 5,
}

function _M.get_age(name)
    return animals23[name]
end

return _M