local cjson = require "cjson"
ngx.status  = ngx.HTTP_OK
ngx.say(cjson.encode({
    clubName = "RealMadrid",
    isUclWinner = true,
    uclTitle = 14,
    servedFrom = "json file"
}))
return ngx.exit(ngx.HTTP_OK)