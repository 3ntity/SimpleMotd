include('../sh_config.lua')
--[[Dont Mess With This If You Have No Clue What Your Doing]]--
local Show = {}
--[[ Add Button
	usage: addButton( Position X, Position Y, Wide, Height, Parent Panel, Button caption ) 
	creates an Button  ]]--
function addButton(x,y,w,h,parent,name)
	local button = vgui.Create("DButton", parent)
	button:SetPos(x,y)
	button:SetSize(w,h)
	button:SetText(name)
end


--[[ Cuz of the enter and exit i decide to give the nav button an extra function ]]--
function AddNavButton( id , x , y , w , h , text, page)

	local NavButtonColor = Color( 46,54,65, 255 )
	local NavTextColor = Color(255,255,255,200)
	local NavButtonOne = vgui.Create( "DButton", MotdNav )

	NavButtonOne:SetPos( x, y )
	NavButtonOne:SetText( "" )
	NavButtonOne:SetSize( w, h )
	NavButtonOne.Paint = function()
		draw.RoundedBox( 0, 0, 0, NavButtonOne:GetWide(), NavButtonOne:GetTall(), NavButtonColor )
		draw.SimpleText(text,"SMOTD_Body",NavButtonOne:GetWide()/2,NavButtonOne:GetTall()/2,NavTextColor,TEXT_ALIGN_CENTER)
	end

	NavButtonOne.OnCursorEntered = function()
		surface.PlaySound("garrysmod/ui_return.wav")
		NavButtonColor = Color( 255, 255, 255, 255 )
		NavTextColor = Color(46,54,65, 255)

	end

	NavButtonOne.OnCursorExited = function()
	NavButtonColor = Color( 46,54,65, 255 )
	NavTextColor = Color(255,255,255,200)
	end

	NavButtonOne.DoClick = function()
		print("clicked Button "..id)
	end

end


function AddPage(id) -- Need somesort of UID for the Page VGUI to toggle them.
	local Title = vgui.Create( "DLabel", MotdMain )
	Title:SetPos( 140, 60 )
	Title:SetText( SMOTD.Page.Title[id] )
	Title:SetFont("SMOTD_Title")
	Title:SizeToContents()
	Title:SetTextColor(Color(46,54,65,255))
	
	local DFrame1 = vgui.Create('DLabel', body)
	DFrame1:SetSize(420, 250)
	DFrame1:Center()
	DFrame1:SetTextColor(Color(255,255,255))
	DFrame1:SetText( SMOTD.Page.Text[id] )

	if id == 1 then
		Title:SetVisible( true )
		DFrame1:SetVisible( true )
	else
		Title:SetVisible( false )
		DFrame1:SetVisible( false )
	end
end 
