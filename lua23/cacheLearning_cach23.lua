local cjson = require "cjson"
local time = os.date("*t")
ngx.say(cjson.encode({
    currTime = time.hour .. ":" .. time.min .. ":" .. time.sec
}))

-- print(time.hour .. ":" .. time.min .. ":" .. time.sec)

