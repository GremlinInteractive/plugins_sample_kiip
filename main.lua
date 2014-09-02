--
-- Abstract: Kiip plugin sample app
--
-- Version: 1.0
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2014 Gremlin Interactive™. All Rights Reserved.
--

-- Related Kiip documentation: http://docs.kiip.com/en/

-- Require the Kiip plugin
local kiip = require( "plugin.kiip" )
-- Require the widget library
local widget = require("widget")

-- Change the background color
display.setDefault( "background", 1,.63,.05 )

-- Set banner width to a very high level to support retina screens; an image can overlay
local bannerWidth = 3000
local bannerHeight = 70

-- Initialise the kiip library
kiip.init
{
	appKey = "Insert_Your_Kiip_App_ID_Here",
	appSecret = "Insert_Your_Kiip_App_Secret_Here",
	email = "User_email_here@userEmail.com",
	gender = "Female",
	birthday = "05/01/1970",
	alias = "Player_Alias_Here",
	listener = function( event )
		for k, v in pairs( event ) do
			print( k, v )
		end
	end
}

-- Button to save a moment
local saveMomentButton = widget.newButton
{
	defaultFile = "images/button.png",
    overFile = "images/button_on.png",
    fontSize = 15,
    width = 150, 
    height = 40,
    labelColor =
    {
    	default = { 1 },
    	over = { 1 },
    },
    label = "Show me a reward!",
    onRelease = function( event )
    	-- Save a kiip moment
    	kiip.saveMoment
    	{
    		momentName = "A Super Prize!",
    		value = 5,
    		listener = function( event )
    			-- Print the event table items
    			for k, v in pairs( event ) do
    			  print( k, ":", v )
    			end
    		end,
    	}
    end
}
saveMomentButton.x = display.contentCenterX
saveMomentButton.y = display.contentCenterY
