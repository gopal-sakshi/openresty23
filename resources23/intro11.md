OpenResty 
- enhanced version of Nginx
- by means of addon modules.
- expand nginx into a web app server to handle large number of requests.

- we can simply use 
    nginx + lua-nginx-module
- But its better to use "openresty"
    openresty ====> nginx + lua-nginx-module + other popular nginx/lua modules
=========================================================================

HOW TO RUN


PATH=/usr/local/openresty/nginx/sbin:$PATH
export PATH
nginx -p `pwd`/ -c conf/nginx.conf
---> this uses nginx binary from /usr/local/openresty/nginx/sbin PATH

(OR) dont export and use that nginx direcly

cd config23
/usr/local/openresty/nginx/sbin/nginx -p `pwd` -c conf/nginx.conf

(OR)
/usr/local/openresty/nginx/sbin/nginx -p `pwd`/config23 -c conf/nginx.conf


(OR)    <!-- USE THISSSSSSSSSSSS -->
openresty -p `pwd`/config23 -c conf/nginx.conf                  <!-- to start -->
openresty -p `pwd`/config23 -c conf/nginx.conf -s reload        <!-- to reload -->
openresty -p `pwd`/config23 -c conf/nginx.conf -t               <!-- to test -->
REFER THIS ============> https://nginx.org/en/docs/switches.html


openresty -p `pwd`/config23 -c conf/nginx.conf -V       <!-- to know about nginx paths -->
=========================================================================
shutdown (OR) graceful shutdown (OR) restart

/usr/local/openresty/nginx/sbin/nginx -p `pwd` -c conf/nginx.conf -s reload | stop | quit 
=========================================================================

