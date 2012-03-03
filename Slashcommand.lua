
local myname, ns = ...
local _G = getfenv(0)


_G["SLASH_".. myname:upper().."1"] = _G.GetAddOnMetadata(myname, "X-LoadOn-Slash")
_G.SlashCmdList[myname:upper()] = function(msg)
	-- Do crap here
end
