--[[ SkateMOTD ]]--
--[[ Client Side Files ]]--
AddCSLuaFile('sh_config.lua')
AddCSLuaFile('lib/sh_colors.lua')
--[[ Includes ]]--
include('sh_config.lua')

--[[ Chatcommand ]]--
function openSMOTD(ply, text)
	for k,v in pairs(SMOTD.OpenText) do
		if text:lower():find( "^[/!]"..v.."?$" ) then
			ply:ConCommand(SMOTD.OpenCommand)
		end
	end
end

hook.Add("PlayerSay", "openSMotD", openSMotD)

--[[ Open on Spawn ]]--
function openSMOTDSpawn(ply)
	if SMOTD.OpenOnFirstSpawn then
		ply:Command(SMOTD.OpenCommand)
	end
end

hook.Add("PlayerInitialSpawn", "onSpawn", onSpawnMOTD)