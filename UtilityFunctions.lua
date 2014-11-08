
local myname, ns = ...
local _G = getfenv(0)

local myfullname = _G.GetAddOnMetadata(myname, "Title")
local myfullname = _G.GetAddOnMetadata(myname, "Title")
local default_channel = nil
function ns:setDefaultChanelForPrint()
	default_channel = nil
	for i=1, _G.NUM_CHAT_WINDOWS do
		local name = _G.GetChatWindowInfo(i)
		if name and (name:lower() == myname:lower() or name:lower() == myfullname:lower())then
			default_channel = i
		end
	end
	for i=1, _G.NUM_CHAT_WINDOWS do
		local name = _G.GetChatWindowInfo(i)
		if name and name:lower() == 'output' then
			default_channel = i
		end
	end
end

function ns.Print(message, ...)
	if default_channel then
		_G["ChatFrame"..default_channel]:AddMessage(("|cff00dbba"..myfullname.."|r: "..message):format(...));
	else
		_G.SELECTED_CHAT_FRAME:AddMessage(("|cff00dbba"..myfullname.."|r: "..message):format(...))
	end
end

local debugf = _G.tekDebug and _G.tekDebug:GetFrame(myname)
function ns.Debug(...) if debugf then debugf:AddMessage(string.join(", ", _G.tostringall(...))) end end

function ns.err(msg, ...) _G.geterrorhandler()(msg:format(_G.tostringall(...)) .. " - " .. _G.time()) end
