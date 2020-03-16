firstImageTitle = displayTitles();
unwantedParts = getUnwantedTitle(firstImageTitle);
substringAndSave(unwantedParts);

function substringAndSave(unwantedParts) {
  
  list = getList("image.titles");
  if (list.length==0)
     print("No image windows are open");
  else {
  	 inputFolder= getDirectory("Choose a Directory");
     for (i=0; i<list.length; i++){
		imageName = list[i];
		saveName = removeUnwantedText(imageName, unwantedParts);
		print("saving: " + saveName);

		selectWindow(imageName);
		autoContrast();
		
		saveAs("Tiff", inputFolder+ "/" + saveName+".tif");

		selectWindow(saveName+".tif");
		//threshold();
		//hresholdSaveAndAnalyze()
		//selectWindow(saveName+".tif");
		close();
		//selectWindow(saveName+".tif thresholded");
		//saveAs("Tiff", inputFolder+ "/" + saveName+"_thresholded.tif");
		//close();
     }
 	}
}

function removeUnwantedText(originalText, unwantedParts) {
	resultText = originalText;
	for (i=0; i<unwantedParts.length; i++){
		len1=lengthOf(resultText);
		len2=lengthOf(unwantedParts[i]);
		len3=indexOf(resultText,unwantedParts[i]);
		string1=substring(resultText, len2+len3,len1);
		string2=substring(resultText, 0,len3);
		resultText=string2+string1;
	}
	return resultText;
}

function getUnwantedTitle(defaultText) {
	unwantedPrefix = defaultText;
	unwantedSuffix = defaultText;
	
	Dialog.create("Remove Text from Image Title");
	Dialog.addString("Prefix:", unwantedPrefix);
	Dialog.addString("Suffix:", unwantedSuffix);
	Dialog.show();
	unwantedPrefix = Dialog.getString();
	unwantedSuffix = Dialog.getString();
	print("Removing "+unwantedPrefix + "..." + unwantedSuffix+ " from Titles");

	unwantedParts = newArray(2);
	unwantedParts[0] = unwantedPrefix;
	unwantedParts[1] = unwantedSuffix;

	Dialog.create("Title Preview");
	previewTitle = removeUnwantedText(defaultText, unwantedParts);
	Dialog.addMessage(previewTitle);
	Dialog.addMessage("Press OK to continue...");
	Dialog.show();
	
	return unwantedParts;
}

function displayTitles() {
	// Displays the titles of image and non-image windows.
  firstImageTitle = "";
  list = getList("image.titles");
  if (list.length==0)
     print("No image windows are open");
  else {
     print("Image windows:");
     firstImageTitle = list[0];
     for (i=0; i<list.length; i++)
        print("   "+list[i]);
  }
 print("");

 list = getList("window.titles");
  if (list.length==0)
     print("No non-image windows are open");
  else {
     print("Non-image windows:");
     for (i=0; i<list.length; i++)
        print("   "+list[i]);
  }
  print("");

  return firstImageTitle;
}

// helper functions
function append(arr, value) {
	arr2 = newArray(arr.length+1);
	for (i=0; i<arr.length; i++)
    	arr2[i] = arr[i];
	arr2[arr.length] = value;
	return arr2;
}

function autoContrast() {
	selectBrightestSlice();
	run("Enhance Contrast", "saturated=0.35");
	run("Apply LUT", "stack");
	setSlice(1);
}

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
	print("Setting to brightest slice: "+ brightestSlice);
	setSlice(brightestSlice);
}

function thresholdSaveAndAnalyze() {
	run("3D Threshold", "subtract rolling=1 sigma enhance max=1.40 scale scale_0=2.600 from=0.50 to=0.80 adjust gamma=0.90 method=[Weighted Mean] block=1.250 c-value=10 despeckle remove fill automatically");
}

function threshold() {
	run("3D Threshold", "subtract rolling=1 sigma enhance max=1.40 scale scale_0=2.600 from=0.50 to=0.80 adjust gamma=0.90 method=[Weighted Mean] block=1.250 c-value=10 despeckle remove fill");
}


