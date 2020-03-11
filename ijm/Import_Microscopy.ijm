firstImageTitle = displayTitles();
inputSelections = getUnwantedTitle(firstImageTitle);
substringAndSave(inputSelections);

function getChannel() {
	Dialog.create("Remove Text from Image Title");
	Dialog.addChoice("Mitochondria Channel:", newArray(1, 2, 3));
	Dialog.show();

	channel = Dialog.getChoice();
	return channel;
}


function colorize() {
	run("Cyan Hot");
}

function substringAndSave(inputSelections) {
	unwantedParts = newArray(3);
	unwantedParts[0] = inputSelections[0];
	unwantedParts[1] = inputSelections[1];
	
	channel = inputSelections[2];
	doAutoAdjustContrast = inputSelections[3];

	doColorize = true;
  
	list = getList("image.titles");
	if (list.length==0)
	 print("No image windows are open");
	else {
		 inputFolder = getDirectory("Choose a Directory");
	 for (i=0; i<list.length; i++){
		imageName = list[i];
		cleanedImageName = cleanBadCharacters(imageName);
		saveName = removeUnwantedText(cleanedImageName, unwantedParts, "");
		print("saving: " + saveName);
		selectWindow(imageName);
		splitChannel(imageName, channel);
		rename(saveName);

		if(doAutoAdjustContrast) {
			autoContrast();
		}

		if(doColorize) {
			colorize();
		}
		
		print("saving as:" + " inputFolder" + "/" + saveName+".tif");
		saveAs("Tiff", inputFolder+ "/" + saveName+".tif");
		selectWindow(saveName+".tif");
		close();
	 }
	}
}

function splitChannel(imageName, channel) {
	if(!is("composite")) {
		return;
	}
	
	run("Split Channels");

	if(channel == 1) {
		channels = newArray("C2-", "C3-", "C1-");
	} else if(channel == 2) {
		channels = newArray("C1-", "C3-", "C2-");
	} else {
		channels = newArray("C1-", "C2-", "C3-");
	}
	for (i=0; i<(channels.length - 1); i++) {
		selectWindow(channels[i]+imageName);
		close();
	}

	keptChannel = channels[channels.length-1];
	selectWindow(keptChannel+imageName);
	rename(imageName);
	return imageName;
}

function removeUnwantedText(originalText, unwantedParts, newCharacter) {
	resultText = originalText;
	for (i=0; i<unwantedParts.length; i++){
		len1=lengthOf(resultText);
		len2=lengthOf(unwantedParts[i]);
		len3=indexOf(resultText,unwantedParts[i]);
		if(len3 > -1) {
			string1=substring(resultText, len2+len3,len1);
			string2=substring(resultText, 0,len3);
			resultText=string2+string1;
		}		
	}
	return resultText;
}

function cleanBadCharacters(originalText) {
	unwantedParts = newArray(2);
	unwantedParts[0] = "/";
	unwantedParts[1] = " ";
	resultText = removeUnwantedText(originalText, unwantedParts, "_");
	return resultText;
}

function getUnwantedTitle(defaultText) {
	unwantedPrefix = defaultText;
	unwantedSuffix = defaultText;
	
	Dialog.create("Remove Text from Image Title");
	Dialog.addString("Prefix:", unwantedPrefix);
	Dialog.addString("Suffix:", unwantedSuffix);
	Dialog.addChoice("Mitochondria Channel:", newArray(1, 2, 3));
	Dialog.addCheckbox("Auto Adjust Contrast", false);
	Dialog.show();
	unwantedPrefix = Dialog.getString();
	unwantedSuffix = Dialog.getString();
	channel = Dialog.getChoice();
	doAutoAdjustContrast = Dialog.getCheckbox();
	print("Removing "+unwantedPrefix + "..." + unwantedSuffix+ " from Titles");

	inputSelections = newArray(4);
	inputSelections[0] = unwantedPrefix;
	inputSelections[1] = unwantedSuffix;
	inputSelections[2] = channel;
	inputSelections[3] = doAutoAdjustContrast;
	
	
	Dialog.create("Title Preview");
	previewTitle = removeUnwantedText(defaultText, inputSelections, "");
	Dialog.addMessage(previewTitle);
	Dialog.addMessage("Press OK to continue...");
	Dialog.show();
	
	return inputSelections;
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
	midSlice = nSlices * 0.5;
	setSlice(midSlice);
	run("Enhance Contrast", "saturated=0.35");
	run("Apply LUT", "stack");
	setSlice(1);
}
