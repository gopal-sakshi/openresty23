local ffi = require("ffi")
ffi.cdef[[
    int printf(const char *fmt, ...);
]]
ffi.C.printf("Hello %s!", "world\n")

-- luajit lua23/luajit23.lua
-- with just few lines of code, we can use C's printf function directly from Lua
-- In Lua, you can use the Lua C API to call C functions, 
    -- in LuaJIT, you can use FFI. For OpenResty.



-- OpenResty chooses LuaJIT rather than standard Lua for performance reasons 