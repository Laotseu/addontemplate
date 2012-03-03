
local myname, ns = ...
local _G = getfenv(0)

local myfullname = _G.GetAddOnMetadata(myname, "Title")
function ns.Print(...) print("|cFF33FF99".. myfullname.. "|r:", ...) end

local debugf = _G.tekDebug and _G.tekDebug:GetFrame(myname)
function ns.Debug(...) if debugf then debugf:AddMessage(string.join(", ", _G.tostringall(...))) end end

function ns.err(msg, ...) _G.geterrorhandler()(msg:format(_G.tostringall(...)) .. " - " .. _G.time()) end
