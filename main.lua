--
-- Abstract: Kiip plugin sample app
--
-- Version: 1.0
--
--[[
//
The MIT License (MIT)

Copyright (c) 2014 Ladeez First Media

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
// ----------------------------------------------------------------------------
--]]
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
