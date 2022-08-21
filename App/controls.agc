// File: controls.agc
// Created: 22-08-20

function createControlButtons()
	AddVirtualButton(4,1559,200,70)
	AddVirtualButton(5,1759,200,70)
	
	AddVirtualButton(6,1559,335,70)
	AddVirtualButton(7,1759,335,70)
	
	AddVirtualButton(8,1559,470,70)
	AddVirtualButton(9,1759,470,70)
	
	for i = 4 to 9
		SetVirtualButtonVisible(i,0)
	next i
	
	global text1 as integer
	global text2 as integer
	global text3 as integer
	
	text1=0
	text2=0
	text3=0
	
	createText(1,str(text1))
	SetTextColor(1,71,72,82,255)
	SetTextSize(1,50)
	SetTextAlignment(1,1)
	setTextPosition(1,1660,170)
	
	createText(2,str(text2))
	SetTextColor(2,71,72,82,255)
	SetTextSize(2,50)
	SetTextAlignment(2,1)
	setTextPosition(2,1660,303)
	
	createText(3,str(text3))
	SetTextColor(3,71,72,82,255)
	SetTextSize(3,50)
	SetTextAlignment(3,1)
	setTextPosition(3,1660,435)
endfunction

function updateControlButtons()
	total=text1+text2+text3
	
	totalRoof = text1
	totalGreen = text2+text3
	
	if GetVirtualButtonPressed(4)
		if text1 > 0
			text1=text1-5
		endif
	elseif GetVirtualButtonPressed(5)
		if totalRoof < 100
			text1=text1+5
		endif
	endif
	
	if GetVirtualButtonPressed(6)
		if text2 > 0
			text2=text2-5
		endif
	elseif GetVirtualButtonPressed(7)
		if totalGreen < 100
			text2=text2+5
		endif
	endif
	
	if GetVirtualButtonPressed(8)
		if text3 > 0
			text3=text3-5
		endif
	elseif GetVirtualButtonPressed(9)
		if totalGreen < 100
			text3=text3+5
		endif
	endif
	
	SetTextString(1,str(text1)+'%')
	SetTextString(2,str(text2)+'%')
	SetTextString(3,str(text3)+'%')
endfunction