LuaJIT
- different to Lua

======================================================================
Lua code 
    not interpreted directly... but compiled into ByteCode by <Lua compiler>
    then this <ByteCode> is executed by <Lua virtual machine>

`3 entities`
Lua compiler
Lua virtual machine
ByteCode
======================================================================

LuaJIT runtime contains these entities
- assembly implementation of Lua interpreter
- JIT compiler (which can generate machine code directly)
- STEPS
    1st step        Lua code --- compiled into ---> byte code       (same as standard Lua)
    2nd step        JIT compiler  --- compile the hot function ---> machine code for target architecture

- summary = make as much Lua code available as possible for machine code generation by JIT compiler      
======================================================================

in Lua, variables are global by default and are placed in a table named _G

======================================================================

Lua's special features
- index starts from 1
- table is the only data structure
- .. to concatenate
- all variables are global by default


LuaJIT
- tightly integrated with FFI (foreign function interface)
- allows to use C external functions directly in lua code
- we can use FFI to call the C functions of NGINX and OpenSSL 
- In Lua, you can use the Lua C API to call C functions     
    https://chsasank.com/lua-c-wrapping.html
- In LuaJIT, you can use FFI... for using C functions
======================================================================