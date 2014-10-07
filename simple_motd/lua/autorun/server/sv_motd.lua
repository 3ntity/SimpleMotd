include ('sh_config.lua')
AddCSLuaFile('sh_config.lua')

local function OpenMenu( ply )
if OpenOnLoad == true then
umsg.Start( "SkateMOTD", ply )
umsg.End()
end
end
hook.Add( "PlayerInitialSpawn", "OpenMotdOnLoad", OpenMenu )

-- Console Command
local function OpenMotdOnConsoleCommand( ply )
	umsg.Start( "SkateMOTD", ply )
	umsg.End()
end
concommand.Add( "SimpleMotd", OpenMotdOnConsoleCommand )

-- Chat Command
local function OpenMotdOnCommand( ply, command, team )
	for k,v in pairs(OpenCommands) do
	if command == v then
	OpenMotdOnConsoleCommand( ply )
	end
end
end
hook.Add( "PlayerSay", "OpenMotdOnCommand", OpenMotdOnCommand )