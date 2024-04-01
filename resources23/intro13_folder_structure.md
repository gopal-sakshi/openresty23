openresty -V        (capital V)

nginx version: openresty/1.25.3.1
built with OpenSSL 1.1.1w  11 Sep 2023
TLS SNI support enabled
configure arguments: 
    --prefix=/usr/local/openresty/nginx
    --add-module=../ngx_devel_kit-0.3.3 
    --add-module=../echo-nginx-module-0.63 
    --add-module=../xss-nginx-module-0.06 
    ...
    --with-pcre-jit 
    --with-stream 
    --with-stream_ssl_module 
    --with-stream_ssl_preread_module --with-http_v2_module --without-mail_pop3_module --without-mail_imap_module 

=====================================================================================

ll /usr/local/openresty
- <bin, nginx, luajit>, lualib, openssl, pcre, site, zlib

`bin` folder
- contains openresty "CLI resty" and core executable "openresty" (which is a soft link to nginx)

`nginx, luajit`
- store nginx/luaJIT executable files & dependencies

`lualib`
- ngx = contains Lua codes from <lua-resty-core> project
- resty = contains Lua code from <lua-resty-*> projects
=====================================================================================


OpenResty
- it is not based on Lua
- it is based on LuaJIT
- earlier versions came with both Lua, LuaJIT... but lua is slowly getting deprecated

=====================================================================================