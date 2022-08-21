// File: estimates.agc
// Created: 22-08-20

function createEstimatesPanel()
	createText(4,"test\ntest\n")
	SetTextPosition(4,1490,660)
	setTextColor(4,71,72,82,255)
	setTextSize(4,28)
	
	global roofAreaSyd as float
	global greenAreaSyd as float
	global roofAreaCbr as float
	global greenAreaCbr as float
	global roofAreaDbo as float
	global greenAreaDbo as float
	roofAreaSyd = 0.62
	greenAreaSyd = 0.889
	roofAreaCbr = 0.27
	greenAreaCbr = 1.66
	roofAreaDbo = 0.18
	greenAreaDbo = 0.55
	
	global totalRooftopArea as float
	global totalGreenspaceArea as float
	global totalRooftopAreaUsed as float
	global totalGreenspaceAreaUsed as float
	
	global totalSolarRoofArea as float
	global totalSolarGreenArea as float
	global totalWindGreenArea as float
	
	global totalEnergyRequired as integer
	global avgHouseDemand as integer
	global avgHouseSize as float
	avgHouseDemand = 5000 // kWh/yr
	avgHouseSize = 0.000185 // km^2
	
	global totalSolarEnergy as integer
	global totalTurbineEnergy as integer
	
endfunction

function updateEstimates()
	strTotalRooftopArea as string
	strTotalGreenspaceArea as string
	strTotalEnergyRequired as string
	strTotalSolarEnergy as string
	strTotalTurbineEnergy as string
	strTotalRenewableEnergy as string
	strTotalFossilEnergy as string
	strCostToImplement as string
	strSavings as string
	strOnTrack as string
	strLandRemoved as string
	
	if currentCity = 0
		totalRooftopArea = roofAreaSyd
		totalGreenspaceArea = greenAreaSyd
	elseif currentCity = 1
		totalRooftopArea = roofAreaCbr
		totalGreenspaceArea = greenAreaCbr
	elseif currentCity = 2
		totalRooftopArea = roofAreaDbo
		totalGreenspaceArea = greenAreaDbo
	endif
	
	totalRooftopAreaUsed = (text1/100.00)*totalRooftopArea
	totalGreenspaceAreaUsed = (((text2+text3))/100.00)*totalGreenspaceArea
	
	totalSolarRoofArea = (text1/100.00)*totalRooftopArea
	totalSolarGreenArea= (text2/100.00)*totalGreenspaceArea
	totalWindGreenArea = (((text3))/100.00)*totalGreenspaceArea

	totalEnergyRequired = ((totalRooftopArea / avgHouseSize) * avgHouseDemand) / 1000 //mWh/year
	
	metresSquareSolar as float
	metresSquareTurbine as float
	metresSquareSolar = (((text1/100.00)*totalRooftopArea) + ((text2/100.00)*totalGreenspaceArea)) * 1000
	metresSquareTurbine = ((text3/100.00)*totalGreenspaceArea) * 1000
	
	totalSolarEnergy = 0.50 * metresSquareSolar
	totalTurbineEnergy = 10.00 * metresSquareTurbine
	totalRenewableEnergy = ((20/100)*totalEnergyRequired) + (totalSolarEnergy + totalTurbineEnergy) + ((totalEnergyRequired - totalRenewableEnergy)/100) * 20
	totalFossilEnergy = (totalEnergyRequired - totalRenewableEnergy) - (((totalEnergyRequired - totalRenewableEnergy)/100) * 20)
	
	costTurbine as integer
	costTurbine = (totalWindGreenArea) * (10000000 * 10)
	costSolar as integer
	costSolar = (totalSolarGreenArea + totalSolarRoofArea) * (12500000 *10)  //Estimate from: https://www.quora.com/What-would-it-cost-to-build-a-solar-energy-plant-that-has-1-sq-km-of-solar-panels-excluding-land
	
	//onTrack = (totalEnergyRequired - totalRenewableEnergy)
	onTrack as string
	if totalRenewableEnergy > totalFossilEnergy*2
		onTrack="Yes"
	elseif totalRenewableEnergy > totalFossilEnergy
		onTrack="Maybe"
	else
		onTrack="No"
	endif
	
	//Strings
	strTotalRooftopArea="Rooftops: " + str(totalRooftopArea,2) + "km" + chr(178) + " (" + str(totalRooftopAreaUsed,2) + "km" + chr(178) +" used)"
	strTotalGreenspaceArea="Greenspace: " + str(totalGreenspaceArea,2) + "km" + chr(178) + " (" + str(totalGreenspaceAreaUsed,2) + "km" + chr(178) +" used)"
	
	strTotalEnergyRequired="Total energy required: " + str(totalEnergyRequired) + " mWh/yr"
	strTotalRenewableEnergy="Renewables total: " + str(totalRenewableEnergy) + " mWh/yr"
	strTotalSolarEnergy="   Solar: " + str(totalSolarEnergy+(((totalEnergyRequired - totalRenewableEnergy)/100) * 20)/2) + " mWh/yr"
	strTotalTurbineEnergy="   Wind turbines: " + str(totalTurbineEnergy+(((totalEnergyRequired - totalRenewableEnergy)/100) * 20)/2) + " mWh/yr"
	strTotalFossilEnergy="Fossil fuels total: " + str(totalFossilEnergy) + " mWh/yr"
	
	strCostToImplement="Total cost of technology: $" + str(costTurbine+costSolar)
//~	strSavings="Savings/year: $" + "[TO DO]"
	
	strLandRemoved="Total greenspace removed: " + str(totalGreenspaceAreaUsed,2)+ "km" + chr(178)
	strOnTrack="On track for Net Zero by 2050: " + onTrack
	
	//Output string
	setTextString(4,strTotalRooftopArea+chr(10)+strTotalGreenspaceArea+chr(10)+chr(10)+strTotalEnergyRequired+chr(10)+strTotalRenewableEnergy+chr(10)+strTotalSolarEnergy+chr(10)+strTotalTurbineEnergy+chr(10)+strTotalFossilEnergy+chr(10)+chr(10)+strCostToImplement+chr(10)+strLandRemoved+chr(10)+strOnTrack)
endfunction