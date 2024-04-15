local ck = require "resty.cookie"   --- sudo opm get thapakazi/lua-resty-cookie
local cookie, err = ck:new()
if not cookie then
    ngx.log(ngx.ERR, err)
    return
end

local function getOneCookie()
    local field, err11 = cookie:get("pass23")
    if not field then
        ngx.log(ngx.ERR, err)
        ngx.say("em cookie ledu bhayya")
        --- use this to denyAccess (or) showErrorMsg if cookie is not sent by client
        return
    else
        -- document.cookie="pass23=edo_oka_password"        --- type this in google chrome dev tools console
        ngx.say("pass23", " => ", field)
        return
    end
end

local function getAllCookies()
    local fields, err12 = cookie:get_all()
    if not fields then
        ngx.log(ngx.ERR, err)
    return
    end
    for k, v in pairs(fields) do
        ngx.say(k, " => ", v)
    end
end

local function setOneCookie()
    local ok, err13 = cookie:set({
        key = "peru", value = "apparao",
        -- path = "/", domain = "apparao23.com",
        -- secure = true, httponly = true, expires = "Wed, 09 Jun 2024 10:18:14 GMT",
        -- max_age = 50, samesite = "Strict", extension = "a4334aebaec"
    })
    if not ok then
        ngx.log(ngx.ERR, err)
        return
    end
end

local function setAnotherCookie()
    local ok, err14 = cookie:set({
        key = "vayassu", value = "48_"..os.time(),
    })

    if not ok then
        ngx.log(ngx.ERR, err)
        return
    end
end

local type23 = ngx.var.type23;
local respTail23 = "rcvd type ====> "..type23        --- it seems we can use multiple ngx.say() ???

if type23 == 'getOne' then
    getOneCookie()
elseif type23 == 'getAll' then
    getAllCookies()
elseif type23 == 'set' then
    setOneCookie()
    setAnotherCookie()
    ngx.say("paina rendu functions, just cookies set chestaayi anthe... response nene istaa")
else
    ngx.say("proper cookie type pampu maastaaru")
end






