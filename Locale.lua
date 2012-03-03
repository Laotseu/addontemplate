
local myname, ns = ...
local _G = getfenv(0)

ns.L = _G.setmetatable({}, {__index=function(t,i) return i end})

