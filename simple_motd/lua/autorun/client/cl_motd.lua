--[[ SkateMOTD ]]--
--[[ Includes ]]--
include('sh_config.lua')
include('lib/sh_colors.lua')
include('lib/sh_functions.lua')
include('sh_theme.lua')
print("cl loaded")
--[[ Preconfig ]]--
SMOTD.IsOpen = false

function BuildMOTD()
			MotdMain = vgui.Create( "DFrame" )
			MotdMain:SetPos( ScrW()/2-300, ScrH()/2-350 )
			MotdMain:SetSize( 600, 400 )
			MotdMain:SetVisible( true )
			MotdMain:SetDraggable( false )
			MotdMain:ShowCloseButton( false )
			MotdMain.Paint =  function()
			draw.RoundedBox( 2, 0, 0, MotdMain:GetWide(), MotdMain:GetTall(), Color( 255,255, 255, 255 ) )
			end
			MotdMain:MakePopup()	
			MotdMain:MoveTo( ScrW()/2-300, ScrH()/2-200, 3, 0, 1)
			SMOTD.IsOpen = true


			local MotdNav = vgui.Create( "DPanel", MotdMain)
			MotdNav:SetPos( 0, 0 ) 
			MotdNav:SetSize( 100	, 400 ) 
			MotdNav.Paint =  function()
			draw.RoundedBox( 0, 0, 0, MotdNav:GetWide(), MotdNav:GetTall(), Color( 46,54,65, 255 ) )
			end

					local MotdStyleCloseButton = vgui.Create( "DButton", MotdMain )
			MotdStyleCloseButton:SetPos( 570, 0 )
			MotdStyleCloseButton:SetText( "X" )
			MotdStyleCloseButton:SetSize( 30, 25 )
			MotdStyleCloseButton.Paint =  function()
			draw.RoundedBox( 0, 0, 0, MotdStyleCloseButton:GetWide(), MotdStyleCloseButton:GetTall(), Color( 238,17,17, 255 ) )
			end
			MotdStyleCloseButton.DoClick = function()
				if SMOTD.IsOpen then
					MotdMain:Close()
					SMOTD.IsOpen = false
				end
			end


			local body = vgui.Create( "DPanel", MotdMain)
			body:SetPos( 140, 120 ) 
			body:SetSize( 420, 250 ) 
			body.Paint =  function()
			draw.RoundedBox( 0, 0, 0, body:GetWide(), body:GetTall(), Color( 218,228,235, 255 ) )
			end
			
			---------------------------------------------------------------------------------------------------------------------------------------------------------
																		--Nav Menu
---------------------------------------------------------------------------------------------------------------------------------------------------------

/*
	local NavButtonOne = vgui.Create( "DButton", MotdNav )
	NavButtonOne:SetPos( 0, 0 )
	NavButtonOne:SetText( "" )
	NavButtonOne:SetSize( 100, 100 )
	NavButtonOne.Paint =  function()
			draw.RoundedBox( 0, 0, 0, NavButtonOne:GetWide(), NavButtonOne:GetTall(), Color( 46,54,65, 255 ) )
			end
			NavButtonOne.OnCursorEntered = function()
							surface.PlaySound("garrysmod/ui_return.wav")
							NavButtonOne.Paint = function()
							draw.RoundedBox( 0, 0, 0, NavButtonOne:GetWide(), NavButtonOne:GetTall(), Color( 255, 255, 255, 255 ) )
						end
				end

				NavButtonOne.OnCursorExited = function()
							NavButtonOne.Paint = function()
							draw.RoundedBox( 2, 0, 0, NavButtonOne:GetWide(), NavButtonOne:GetTall(), Color( 46,54,65, 255 ) )
						end
				end


	NavButtonOne.DoClick = function()
		print( "Button was clicked!" )
	end
	
*/




---------------------------------------------------------------------------------------------------------------------------------------------------------
																		--Credits
---------------------------------------------------------------------------------------------------------------------------------------------------------
	local CreditTitle = vgui.Create( "DLabel", MotdMain )
	CreditTitle:SetPos( 140, 60 )
	CreditTitle:SetText( "Simple MOTD Credits" )
	CreditTitle:SetFont("SMOTD_Title")
	CreditTitle:SizeToContents()
	CreditTitle:SetTextColor(Color(46,54,65,255))

	local DFrame1 = vgui.Create('DPanel', body)
		DFrame1:SetSize(420, 250)
		DFrame1:Center()
		DFrame1.Paint = function()
			draw.DrawText("Welcome to simple MOTD!","SMOTD_Body",DFrame1:GetWide()/2,20,Color(47,0,255,200),TEXT_ALIGN_CENTER) 
			draw.SimpleText("1.) A small MOTD addon free by _Entity.","SMOTD_Body",DFrame1:GetWide()/2,80,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("2.) My Steam Name is -Skate","SMOTD_Body",DFrame1:GetWide()/2,100,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("3.) I also make custom MOTD's for cheap prices!","SMOTD_Body",DFrame1:GetWide()/2,120,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("4.) Please report any bugs!","SMOTD_Body",DFrame1:GetWide()/2,140,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("5.) Enjoy!","SMOTD_Body",DFrame1:GetWide()/2,160,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("-Skate","SMOTD_Body",DFrame1:GetWide()/2,200,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.DrawText("Made by -Skate STEAM_0:1:60087059","SMOTD_Body",DFrame1:GetWide()/2,220,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.DrawText("Time: "..os.date( "%I:%M:%S" ),"SMOTD_Body",12,10,color_white,TEXT_ALIGN_LEFT)
	end 
end

--[[ Concommand ]]--
concommand.Add(SMOTD.OpenCommand, function(ply)
	if SMOTD.IsOpen then
		MotdMain:Close()
		SMOTD.IsOpen = false
	else
		BuildMOTD()
		SMOTD.IsOpen = true
	end
end)