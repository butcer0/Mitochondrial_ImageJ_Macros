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
		saveAs("Tiff", inputFolder+ "/" + saveName+".tif");

		selectWindow(saveName+".tif");
		close();
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
