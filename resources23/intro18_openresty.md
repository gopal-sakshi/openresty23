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
- nginx + lua module + stuff
- code looks sequential, but its asynchronous
- developer dont need to use any async mechanisms (nginx lua API does everything for us)
    when an app performs I/O operation, the execution thread isnt waiting on the operation
    instead, the execution thread remembers the context of current request and picks come other task to process

Why OpenResty
- it excels in handling large large number of requests -- with minimal CPU, high I/O
- other web servers
    Apache                  maps process per each connection
    JVM based web server    maps new thread per connection

- nginx/openresty
    doesnt fork a process (or) thread per request/connection
    memory efficiency
- OpenResty is single threaded; 
    it creates a new lua coroutine to keep the context of request 
    so the memory consumption is much cheaper than new process or thread.
- Using OpenResty, CPU saves resources by 
    avoiding the creation & destruction of new processes 
    avoiding the creation & destruction of new threads per connection
    avoiding switching between these threads.
- many server properties -- we can easily configure them in <nginx.conf> file
    limit number of requests,
    request timeouts
    request body size limits
    security parameters
- we can use C library functions (foreign function interface -- FFI) inside Lua code
- <strong ecosystem>
    see `intro19_openresty_libraries.md`
- OpenResty Package Manager
    install (or) uninstall the desired library

Why not OpenResty
- its not your typical webserver
- it cant handle high intensity CPU computations (image processing, machine learning)
    nodeJs also ---> dont use node as webserver if you want to do intensive CPU stuff (as it blocks other requests)
    or if you insist to use nodejs -- spawn new child process to handle high CPU stuff -- so main process remains unblocked and can continue accepting requests
- 

==================================================================================
`Apache`
- Apache has a process for each connection it accepts. 
- This process is not spawned and terninated for each request, 
    as soon as the request is finished, the process receives another connection to handle.

Read this
https://stackoverflow.com/questions/15217524/what-is-the-difference-between-thread-per-connection-vs-thread-per-request

==================================================================================