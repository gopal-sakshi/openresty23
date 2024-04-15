local cjson = require "cjson"
ngx.req.read_body()         --- first we have to read_body(); only then get_body_data() WORKS

--- and or ===> works like a ternary operator
local body23 = ngx.req.get_body_data() and ngx.req.get_body_data() or ""

ngx.say(cjson.encode({
    rcvd23 = cjson.decode(body23)
}))