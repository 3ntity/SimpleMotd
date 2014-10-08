--[[ SimpleMotd ]]--
--[[ Includes ]]--
--[[ Created by Tomelyr and _3ntity ]]
include('sh_config.lua')
include('lib/sh_colors.lua')
include('lib/sh_functions.lua')
include('sh_theme.lua')

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

	MotdNav = vgui.Create( "DPanel", MotdMain)
	MotdNav:SetPos( 0, 0 ) 
	MotdNav:SetSize( 100	, 400 ) 
	MotdNav.Paint =  function()
		draw.RoundedBox( 0, 0, 0, MotdNav:GetWide(), MotdNav:GetTall(), Color( 46,54,65, 255 ) )
	end

	NavExtra = vgui.Create( "DPanel", MotdMain) -- Just the small bar to the right
	NavExtra:SetPos( 100, 0 ) 
	NavExtra:SetSize( 10	, 400 ) 
	NavExtra.Paint =  function()
		draw.RoundedBox( 0, 0, 0, NavExtra:GetWide(), NavExtra:GetTall(), Color( 42,51,64, 255 ) )
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

	body = vgui.Create( "DPanel", MotdMain)
	body:SetPos( 140, 120 ) 
	body:SetSize( 420, 250 ) 
	body.Paint =  function()
		draw.RoundedBox( 0, 0, 0, body:GetWide(), body:GetTall(), Color( 218,228,235, 255 ) )
	end

	--[[THIS IS WHERE YOU WANT TO ADD YOUR OWN THINGS]]--
	-- I advise you use numbers for the id's. 

	/*--[[Key:]]--
	
	id = A nuber ID. This can be anything. 1 or 5 or 1000. Your Choice.
	x = the x position
	y = the y position
	w = the width of the element. This is your choice. 100 or 50 or 60.... Anything
	h = the height of the element. Same rule as width.
	text = the text of the element. Ie. "Blah" make sure your text is incased in quotation marks!
	page = To be defined
	url = To be defined.



	--*/--

	-- AddNavButton(id, x, y, w, h, text, page)
	-- 
	AddNavButton(1,0,0,100,100, "test")
	AddNavButton(2,0,100,100,100, "test2")
	AddNavButton(3,0,200,100,100, "test3")
	AddNavButton(4,0,300,100,100, "test5")
	AddPage(1)
	AddPage(2)
	AddPage(3)
	AddPage(4)

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
