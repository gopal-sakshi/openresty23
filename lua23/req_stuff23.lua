local req_body          = ngx.req.get_body_data()
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
if ngx.req.get_method() ~= 'GET' then
    ngx.req.read_body()         --- first we have to read_body(); only then get_body_data() WORKS
    local body23 = ngx.req.get_body_data()
    ngx.log(ngx.NOTICE, "rcvd body ---------> ", body23)
end

------------------------------------------------------------

local getUpstreamData = function ()
    local httpc = require("resty.http").new()
    local res, err = httpc:request_uri("https://dummy.restapiexample.com/api/v1/employees", {
        method = "GET"
    })
    if not res then
        ngx.log(ngx.ERR, "request failed: ", err)
        return
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
    return body
end

ngx.say(cjson.encode(getUpstreamData()))


