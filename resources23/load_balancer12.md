`generic hash`
- instead of using clientIP as hash - we use something else
- hash $request_uri consistent;

`ip_hash`
- The server to which a request is sent is determined from the client IP address
- the first three octets of the IPv4 address used to calculate the hash value
- guarantees that requests from the same address get to the same server unless it isnt available.


`least_conn`
- A request is sent to the server with the least number of active connections

`Least Time` (NGINX Plus only)
- NGINX Plus selects the server with 
    the lowest average latency
    the lowest number of active connections


`Server Weights`
- server with IP address 192.0.0.1 is backup server 
```conf
    server backend1.example.com weight=5;
    server backend2.example.com;
    server 192.0.0.1 backup;
```        
- it does not receive requests unless both of the other servers are unavailable.
- out of every 6 requests ==> 5 are sent to "backend1" & 1 request to "backend2"


`round robin`
- default algorithm --- just dont specify any load balancer algorithm
- it defaults to round robin