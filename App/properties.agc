// File: properties.agc
// Created: 22-08-20

function setProperties()
	// show all errors⚡
	SetErrorMode(2)
	
	// set window properties
	SetWindowTitle( "↯$" )
	SetWindowSize( 1920, 1080, 0 )
	SetWindowAllowResize( 1 ) // allow the user to resize the window
	
	// set display properties
	SetVirtualResolution( 1920, 1080 ) // doesn't have to match the window
	SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
	SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
	SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
	UseNewDefaultFonts( 1 )
	SetClearColor(255,255,255)
	SetPrintColor(0,0,0)
endfunction