local cjson = require "cjson"

ngx.log(ngx.ALERT, "ip add ====> ", ngx.var.remote_addr)
ngx.say(cjson.encode({
    info = "ne sangati cheptaa aagu",
    allowed23 = "localhost (or) 127.0.0.1 aithe okay",
    denied23 = "10.0.54.240:8080/allowedIPs ---> idi try cheyyi ra"
}))