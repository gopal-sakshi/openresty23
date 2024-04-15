local crypto = require "crypto"                 --- sudo luarocks install luacrypto
local player = ngx.decode_base64(ngx.var.player23)
print("rcvd player ===> ", player)