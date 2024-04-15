================================================================
OpenResty features
- coroutine implements `synchronous non-blocking` programming
    synchronous = execute sequentially 

`sync vs async`
    local res, err  = query-mysql(sql)
    local value, err = query-redis(key)

within the same request
    if we have to wait for the query result of MySQL to return before continuing to query Redis, that is synchronous; 
    if we don't need to wait for the return of MySQL and we can continue to query Redis, then it is asynchronous.


`blocking vs non-blocking`
    blocking === blocking the OS thread
assume it takes 10s to query MySQL. 
If within this 10s, the OS's resources (CPU) are idle & foolishly waiting for the return, that is blocking; 
if the CPU takes the opportunity to process other connections request, that is non-blocking.


- dynamics
    NGINX require us to modify the configuration file on disk and reload it for any changes to take effect 
    OpenResty is controlled by the scripting language Lua
    lua-nginx-module ===> we can dynamically control routes, upstreams, SSL certificates, requests, responses
================================================================
How OpenResty works
- 