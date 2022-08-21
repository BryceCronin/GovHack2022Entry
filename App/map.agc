// File: map.agc
// Created: 22-08-20

function loadMap()
	global spr1
	global spr2
	global spr3
	global spr4
	global spr5
	
	global img2syd
	global img2cbr
	global img2dbo
	
	global img3syd
	global img3cbr
	global img3dbo
	
	global img4syd
	global img4cbr
	global img4dbo
	
	//Background
	spr1 = createSprite(loadImage('1_Bg.png'))
	//Map Base
	img2syd = loadImage('2_SYD.png')
	img2cbr = loadImage('2_CBR.png')
	img2dbo = loadImage('2_DBO.png')
	spr2 = createSprite(img2syd)
	//Map Green
	img3syd = loadImage('3_SYD.png')
	img3cbr = loadImage('3_CBR.png')
	img3dbo = loadImage('3_DBO.png')
	spr3 = createSprite(img3syd)
	//Map Buildings
	img4syd = loadImage('4_SYD.png')
	img4cbr = loadImage('4_CBR.png')
	img4dbo = loadImage('4_DBO.png')
	spr4 = createSprite(img4syd)
	//Overlay
	spr5 = createSprite(loadImage('5_Overlay.png'))
	
	global currentCity
	currentCity = 0 //0=syd,1=cbr,2=dbo
endfunction

function createMapButtons()
	AddVirtualButton(1,850,80,200)
	AddVirtualButton(2,850+225,80,200)
	AddVirtualButton(3,850+225+225,80,200)
	
	SetVirtualButtonVisible(1,0)
	SetVirtualButtonVisible(2,0)
	SetVirtualButtonVisible(3,0)
	
	global sprMapIndicator
	sprMapIndicator = createSprite(LoadImage('mapIndicator.png'))
endfunction

function updateMap()	
	if GetVirtualButtonPressed(1)
		currentCity=0
		setSpriteImage(spr2,img2syd)
		setSpriteImage(spr3,img3syd)
		setSpriteImage(spr4,img4syd)
		SetSpritePosition(sprMapIndicator,0,0)
	elseif GetVirtualButtonPressed(2)
		currentCity=1
		setSpriteImage(spr2,img2cbr)
		setSpriteImage(spr3,img3cbr)
		setSpriteImage(spr4,img4cbr)
		SetSpritePosition(sprMapIndicator,0+225,0)
	elseif GetVirtualButtonPressed(3)
		currentCity=2
		setSpriteImage(spr2,img2dbo)
		setSpriteImage(spr3,img3dbo)
		setSpriteImage(spr4,img4dbo)
		SetSpritePosition(sprMapIndicator,0+450,0)
	endif
	
	//calculate opacity of solar
	global solarPercent as integer
	if text1 > 0
		solarPercent=((text1*2))+(abs(sinWave)*55)
	elseif text1 < 1
		solarPercent = 0
	endif
	
	//calculate opacity of greenspace
	global greenPercent as integer
	if text2+text3 > 0
		greenPercent=((text2+text3)*2)+(abs(sinWave)*55)
	elseif text2+text3 < 1
		greenPercent = 0
	endif
	
	
	setSpriteColor(spr4,1,90,254,solarPercent) //rgb(61, 90, 254)
	setSpriteColor(spr3,118,255,3,greenPercent) //rgb(118, 255, 3)
	
	
endfunction