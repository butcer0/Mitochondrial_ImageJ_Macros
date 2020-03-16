autoContrast();

function selectBrightestSlice() {
	brightestMean = 0;
	brightestSlice = 1;
	for(i=1; i<nSlices; i++) {
		setSlice(i);
		getStatistics(area, mean);
		if(brightestMean<mean) {
			brightestMean = mean;
			brightestSlice = i;
		}
	}
	print("Setting to brightest slice: "+ brightestSlice)
	setSlice(brightestSlice);
}

function autoContrast() {
	selectBrightestSlice();
	run("Enhance Contrast", "saturated=0.35");
	run("Apply LUT", "stack");
	setSlice(1);
}