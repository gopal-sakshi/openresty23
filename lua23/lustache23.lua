local readfile12 = require "../lua23/gop_utils23" . readfile23
local lustache = require "lustache"
local template23 = readfile12("files23/assets23/index11.mustache")
print("template23 =========> ", template23)
local stadium_name = 'Santiago Bernabeu'
-- sudo luarocks install lustache

local headers23 = ngx.req.get_headers()["edo-oka-header"]
print("rcvd header ---------> ", headers23)

--- set response header here        (OR)    nginx.conf "default_type"
ngx.header["Content-Type"] = "text/html"
ngx.say(lustache:render(template23, {
    ["clubName"] = "RealMadridCF",
    ["manager23"] = "Carlo Ancelotti",
    ["stadium23"] = stadium_name
}))

