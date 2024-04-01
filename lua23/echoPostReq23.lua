local cjson = require "cjson"
local get, post, files = require "resty.reqargs"()
ngx.status  = ngx.HTTP_OK
print("this is post request ===> ", post)
ngx.say(cjson.encode(post))
return ngx.exit(ngx.HTTP_OK)

-- sudo opm get bungle/lua-resty-reqargs
-- luarocks install lua-resty-reqargs
-- https://github.com/bungle/lua-resty-reqargs