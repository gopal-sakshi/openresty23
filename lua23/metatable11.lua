---@diagnostic disable: undefined-global
local cjson = require "cjson"
local emptyArray23 = require("cjson").empty_array_mt

--- use metatable, so that you can return empty object {}
--- if you return nil, cjson.encode ===> throws ERROR

-- -- APPROACH 01
-- local nil23
-- ngx.say(cjson.encode({ nil23 }))                          --- returns { }


-- -- APPROACH 02
-- ngx.say(cjson.encode({
--     nil23["nonExistentValue"]                           ---- ERROR = attempt to index nil value
-- }))


-- -- APPROACH 03
-- ngx.say(cjson.encode({ nil24 }))                        -- WORKS; nil24 isnt defined... still we got { }


-- -- APPROACH 04
local nil25 = { }
setmetatable(nil25, emptyArray23)                       --- nil25 is a table... we added a metatable to it
ngx.say(cjson.encode({ nil25 }))
