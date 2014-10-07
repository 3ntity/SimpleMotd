include('sh_config.lua')


 	













---------------------------------------------------------------------------------------------------------------------------------------------------------
																		--Main Frame (Shell)
---------------------------------------------------------------------------------------------------------------------------------------------------------

			local MotdMain = vgui.Create( "DFrame" )
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
				MotdMain:Close()
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

local buttons = {}

for k,v in pairs (MotdButtons) do 
	buttons[k] = vgui.Create("DButton", MotdNav)
		buttons[k]:SetSize(100, 100)
		buttons[k]:SetPos( 00, (k-1) * 100)
		buttons[k].Hover = false 
		buttons[k]:SetText(buttons[k])
		buttons[k].Paint =  function()
			draw.RoundedBox( 0, 0, 0, buttons[k]:GetWide(), buttons[k]:GetTall(), Color( 46,54,65, 255 ) )
			end
			buttons[k].OnCursorEntered = function()	
							surface.PlaySound("garrysmod/ui_return.wav")
							buttons[k].Paint = function()
							draw.RoundedBox( 0, 0, 0, buttons[k]:GetWide(), buttons[k]:GetTall(), Color( 255, 255, 255, 255 ) )
						end
				end

				buttons[k].OnCursorExited = function()
							buttons[k].Paint = function()
							draw.RoundedBox( 2, 0, 0, buttons[k]:GetWide(), buttons[k]:GetTall(), Color( 46,54,65, 255 ) )
						end
				end


	buttons[k].DoClick = function()
		
	end
end






---------------------------------------------------------------------------------------------------------------------------------------------------------
																		--Credits
---------------------------------------------------------------------------------------------------------------------------------------------------------
	local CreditTitle = vgui.Create( "DLabel", MotdMain )
	CreditTitle:SetPos( 140, 60 )
	CreditTitle:SetText( "Simple MOTD Credits" )
	CreditTitle:SetFont("Title")
	CreditTitle:SizeToContents()
	CreditTitle:SetTextColor(Color(46,54,65,255))

	local DFrame1 = vgui.Create('DPanel', body)
		DFrame1:SetSize(420, 250)
		DFrame1:Center()
		DFrame1.Paint = function()
			draw.DrawText("Welcome to simple MOTD!","Body",DFrame1:GetWide()/2,20,Color(47,0,255,200),TEXT_ALIGN_CENTER) 
			draw.SimpleText("1.) A small MOTD addon free by _Entity.","Body",DFrame1:GetWide()/2,80,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("2.) My Steam Name is -Skate","Body",DFrame1:GetWide()/2,100,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("3.) I also make custom MOTD's for cheap prices!","Body",DFrame1:GetWide()/2,120,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("4.) Please report any bugs!","Body",DFrame1:GetWide()/2,140,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("5.) Enjoy!","Body",DFrame1:GetWide()/2,160,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.SimpleText("-Skate","Body",DFrame1:GetWide()/2,200,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.DrawText("Made by -Skate STEAM_0:1:60087059","Body",DFrame1:GetWide()/2,220,Color(255,255,255,200),TEXT_ALIGN_CENTER)
			draw.DrawText("Time: "..os.date( "%I:%M:%S" ),"Body",12,10,color_white,TEXT_ALIGN_LEFT)
	end 







---------------------------------------------------------------------------------------------------------------------------------------------------------
																		--Fonts
---------------------------------------------------------------------------------------------------------------------------------------------------------

	// FONTS
	surface.CreateFont( "Title", {
		font = "Asap-Bold",
		size = 30,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = false,
	} )


	surface.CreateFont( "Body", {
		font = "BreeSerif-Regular",
		size = 18,
		weight = 500,
		blursize = 0,
		scanlines = 0,
		antialias = true,
		underline = false,
		italic = false,
		strikeout = false,
		symbol = false,
		rotary = false,
		shadow = false,
		additive = false,
		outline = false,
	} )












usermessage.Hook( "SkateMOTD", MotdShell )