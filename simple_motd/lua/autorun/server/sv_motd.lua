--[[ SkateMOTD ]]--
--[[ Client Side Files ]]--
AddCSLuaFile('sh_config.lua')
--[[ Includes ]]--
include('sh_config.lua')

--[[ Chatcommand ]]--
function openSMOTD(ply, text)
	if text:lower():find( "^[/!]motd?$" ) then
		ply:ConCommand(SMOTD.OpenCommand)
	end
end

hook.Add("PlayerSay", "openSMotD", openSMotD)

--[[ Open on Spawn ]]--
function openSMOTDSpawn(ply)
	ply:Command(SMOTD.OpenCommand)
end

hook.Add("PlayerInitialSpawn", "onSpawn", onSpawnMOTD)