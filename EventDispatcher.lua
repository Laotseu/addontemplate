
local myname, ns = ...
local _G = getfenv(0)

local select = _G.select


local f = _G.CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if ns[event] then return ns[event](ns, event, ...) end end)


function ns:RegisterEvent(...) for i=1,select("#", ...) do f:RegisterEvent((select(i, ...))) end end
function ns:UnregisterEvent(...) for i=1,select("#", ...) do f:UnregisterEvent((select(i, ...))) end end
ns.RegisterEvents, ns.UnregisterEvents = ns.RegisterEvent, ns.UnregisterEvent
