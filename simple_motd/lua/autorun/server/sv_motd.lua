--[[ SimpleMotd ]]--
--[[ Client Side Files ]]--
AddCSLuaFile('sh_config.lua')
AddCSLuaFile('sh_theme.lua')
AddCSLuaFile('lib/sh_colors.lua')
AddCSLuaFile('lib/sh_functions.lua')
--[[ Includes ]]--
include('sh_config.lua')

print("sv loaded")
--[[ Chatcommand ]]--
function openSMOTD(ply, text)
	local newtext = text:lower()
	local newtext = string.Trim(newtext, "!")
	local newtext = string.Trim(newtext, "/")
	for k,v in pairs(SMOTD.OpenText) do
		if newtext == v then
			ply:ConCommand(SMOTD.OpenCommand)
		end
	end
end

hook.Add("PlayerSay", "openSMotD", openSMOTD)

--[[ Open on Spawn ]]--
function openSMOTDSpawn(ply)
	if SMOTD.OpenOnFirstSpawn then
		ply:ConCommand(SMOTD.OpenCommand)
	end
end

hook.Add("PlayerInitialSpawn", "onSpawn", openSMOTDSpawn)
