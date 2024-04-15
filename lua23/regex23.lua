local cjson = require"cjson"
local str_A = "xpl_2323"
local str_B = "doesnt start with xpl"
local str_C = "XPL323242"

local function regex11(str11, str12, str13)
    local return23 = {
        ngx.re.match(str11, '^xpl', "i"),
        ngx.re.match(str12, '^xpl', "i"),
        ngx.re.match(str13, '^xpl', "i")
    }
    return return23
end

local resp = regex11(str_A, str_B, str_C)
ngx.say(cjson.encode({resp}))
