local str           = require "resty.string"
local to_hex        = str.to_hex
local escape_uri    = ngx.escape_uri
local resty_random  = require "resty.random"

local gop_utils23 = {}
local file_cache = {}

local function hex_uuid12()
    return escape_uri(resty_random.bytes(16, true))
end
gop_utils23.hex_uuid12 = hex_uuid12

local function readfile23(file_path, opt)
    local file = io.open(file_path, "r")
    if(file ~= nil) then
        local file_content = file:read("*all")
        io.close(file)
        return file_content
    end
end
gop_utils23.readfile23 = readfile23

return gop_utils23