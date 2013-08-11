-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

halfW = display.contentWidth
halfH = display.contentHeight

print ("halfW: ",halfW)
print ("halfH: ",halfH)

-- ************************
-- Texto que cambia de color
-- ************************
local myTextObject = display.newText( "Hello World!", 10, 10, "Arial", 40 )

display.setDefault( "textColor", 150, 150, 150 )

myTextObject:setTextColor( 255, 0, 0 )

function screenTap()
    local r = math.random( 0, 255 )
    local g = math.random( 0, 255 )
    local b = math.random( 0, 255 )
    myTextObject:setTextColor( r, g, b )
end

display.currentStage:addEventListener( "tap", screenTap )

-- ************************
-- Fisica de la animaicon
-- ************************

local physics = require( "physics" )
physics.start()

-- Cubo
function creacubo()
	crate = display.newImageRect( "crate.png", 90, 90 )
	-- crate.x, crate.y = 160, -100
	crate.x = math.random( 20, halfW-20 )
	crate.y  = math.random( 0, 20 )
	crate.rotation = 15
	physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.3 } )
end

creacubo()		-- Al menos un cubo

-- Suelo estatico, dentro de una caja mas peequeña (imagen ground.png muy grande)
local ground = display.newImage( "ground.png" )
ground.x = 0; ground.y = halfH/1.5
local grassShape = {-halfW,		(halfH/1.5)/2.0,
					halfW,		(halfH/1.5)/2.0,
					halfW,		halfH,
					-halfW,		halfH }
-- Shape value in the form of an array with the shape vertices: {x1,y1,x2,y2,...,xn,yn}
physics.addBody( ground, "static", { friction=0.3, shape=grassShape } )

-- Nube que no es objeto
local sky = display.newImage( "cloud.png" )
sky.x = halfW/2; sky.y = halfH/5

display.currentStage:addEventListener( "tap", creacubo )