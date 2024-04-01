local cjson = require "cjson"
local pgmoon = require("pgmoon")
local pg = pgmoon.new({
    host     = "127.0.0.1",
    port     = "5432",
    user     = "postgres",
    password = "",          --- run chese apudu password ivvu
    database = "relations23"
})
assert(pg:connect())
local encode_json = require("pgmoon.json").encode_json
local get, post, files = require "resty.reqargs" ()
assert(pg:query("INSERT INTO lua_table23 (data) VALUES(" .. encode_json(post) .. ");"))
pg:keepalive()
pg         = nil
ngx.status = ngx.HTTP_OK
ngx.say(cjson.encode({ status23 = "saved23", msg23 = post }))
return ngx.exit(ngx.HTTP_OK)
