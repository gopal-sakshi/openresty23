local http              = require "resty.http"     --- sudo opm get ledgetech/lua-resty-http
local cjson             = require "cjson"

------------------------------------------------------------
local ipaddrs               = ngx.var.remote_addr
local method23              = ngx.req.get_method()
local headers23             = ngx.req.get_headers()["edo-oka-header"]
local args23                = ngx.req.get_uri_args()

ngx.log(ngx.ALERT, "ip add ====> ", ipaddrs)
print("rcvd method ---------> ", method23)
ngx.log(ngx.INFO, "rcvd header ---------> ", headers23)
ngx.log(ngx.DEBUG, "rcvd args ---------> ", args23["position12"])
local body23 = { }
if ngx.req.get_method() ~= 'GET' then
    ngx.req.read_body()         --- first we have to read_body(); only then get_body_data() WORKS
    body23["dataContent"] = ngx.req.get_body_data()
    ngx.log(ngx.NOTICE, "rcvd body ---------> ", body23.__tostring)
elseif ngx.req.get_method() == 'GET' then
    body23["dataContent"] = '{"name": "RMA", "stadium": "Bernabeu" }'
end

------------------------------------------------------------

local getUpstreamData = function ()
    local httpc = require("resty.http").new()
    local url1 = 'https://dummyjson.com/products/1'
    local url2 = 'https://dummy.restapiexample.com/api/v1/employees'
    local res, err = httpc:request_uri(url1, {
        method = "GET"
    })
    if not res then
        ngx.log(ngx.ERR, "request failed: ", err)
        return ""
    end
    -- At this point, the entire request/response is complete and the connection
    -- will be closed or back on the connection pool.   
    -- The `res` table contains ==> `status`, `headers` `body` fields.
    local status = res.status
    local length = res.headers["Content-Length"]
    local body   = res.body
    print("upstream rcvd status ====> ", status)
    print("upstream rcvd length ====> ", length)
    -- print("upstream rcvd body ======> ", body)
    return body and body or ""          --- getUpstreamData must always return string for cjson.decode() to WORK
end

print("typeof body23 =========> ", type(body23))                                --- table
print("typeof body23__tostring =========> ", type(body23.__tostring))           --- nil ???
print("typeof body23[dataContent]=========> ", type(body23.dataContent))        --- string 

ngx.header["content-type"] = 'application/json'
ngx.say(cjson.encode({
    upstreamData = cjson.decode(getUpstreamData()),
    reqBody = body23,
    notAtString = cjson.decode(body23.dataContent),
    typeofDataContent = type(body23.dataContent),
    typeofReqBody = type(body23)
}))


