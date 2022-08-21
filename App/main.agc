// Project: ↯$ by Bryce Cronin
// Created: 22-08-20

#include 'properties.agc'
#include 'map.agc'
#include 'controls.agc'
#include 'estimates.agc'

global time as float
time=timer()
global sinWave as float

global helpText as integer
helpText=0

setProperties()
loadMap()
createMapButtons()
createControlButtons()
createEstimatesPanel()

sprHelpText=createSprite(loadImage('6_Help.png'))

helpSprite1 = createSprite(loadImage('helpSprite.png'))
SetSpritePosition(helpSprite1,1705,55)
helpSprite2 = createSprite(loadImage('helpSprite.png'))
SetSpritePosition(helpSprite2,1720,570)
setSpriteDepth(helpSprite1,0)
SetSpriteVisible(helpSprite1,0)
SetSpriteVisible(helpSprite2,0)

do
	updateMap()
	updateControlButtons()
	updateEstimates()
	
	sinWave = abs(sinrad(timer()*3.5))
	
	if getSpriteHit(GetRawMouseX(),getRawMouseY()) = helpSprite1 or getSpriteHit(GetRawMouseX(),getRawMouseY()) = helpSprite2
		setSpriteVisible(sprHelpText,1)
	else
		setSpriteVisible(sprHelpText,0)
	endif
	
	
	mapX1 = 33
	mapX2 = 1412
	mapY1 = 33
	mapY2 = 1048
	
	greenSpriteX1 = ((mapX1 + mapX2)/2) - ((text2+text3+0.01)/100.00)*(mapX2-mapX1)/2
	greenSpriteX2 = ((mapX1 + mapX2)/2) + ((text2+text3+0.01)/100.00)*(mapX2-mapX1)/2
	greenSpriteY1 = ((mapY1 + mapY2)/2) - ((text2+text3+0.01)/100.00)*(mapY2-mapY1)/2
	greenSpriteY2 = ((mapY1 + mapY2)/2) + ((text2+text3+0.01)/100.00)*(mapY2-mapY1)/2
	
	roofSpriteX1 = ((mapX1 + mapX2)/2) - ((text1+0.01)/100.00)*(mapX2-mapX1)/2
	roofSpriteX2 = ((mapX1 + mapX2)/2) + ((text1+0.01)/100.00)*(mapX2-mapX1)/2
	roofSpriteY1 = ((mapY1 + mapY2)/2) - ((text1+0.01)/100.00)*(mapY2-mapY1)/2
	roofSpriteY2 = ((mapY1 + mapY2)/2) + ((text1+0.01)/100.00)*(mapY2-mapY1)/2

	
	setSpriteScissor(spr3,greenSpriteX1, greenSpriteY1, greenSpriteX2, greenSpriteY2)
	setSpriteScissor(spr4,roofSpriteX1, roofSpriteY1, roofSpriteX2, roofSpriteY2)
	
    Sync()
loop
