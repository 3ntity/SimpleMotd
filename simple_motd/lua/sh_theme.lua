--[[ Init Theme Tables ]]--
SMOTD.Theme = {}

--[[ Includes ]]--
include('sh_config.lua')
include('lib/sh_colors.lua')

--[[ Theme ]]--


--[[ Fonts ]]--
/* We should swap the fonts to something that is working good on all OS  or at least avaible at all. ~Tomelyr */
surface.CreateFont( "SMOTD_Title", {
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

surface.CreateFont( "SMOTD_Body", {
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
