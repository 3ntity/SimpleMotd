--[[ Add Button
	usage: addButton( Position X, Position Y, Wide, Height, Parent Panel, Button caption ) 
	creates an Button  ]]--
function addButton(x,y,w,h,parent,name)
	local button = vgui.Create("DButton", parent)
	button:SetPos(x,y)
	button:SetSize(w,h)
	button:SetText(name)
end

