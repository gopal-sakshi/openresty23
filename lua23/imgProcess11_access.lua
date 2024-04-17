-- local crypto = require "crypto"
-- sudo luarocks install luacrypto
-- https://luarocks.org/modules/starius/luacrypto
-- https://github.com/starius/luacrypto            --- THIS "crypto" package is deprecated; use luaossl
-- sudo luarocks install luaossl
-- see lua23 repo and search for luaossl


local player = ngx.decode_base64(ngx.var.player23)
print("rcvd player13 ===> ", player)