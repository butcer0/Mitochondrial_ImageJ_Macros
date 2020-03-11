//resultsName = getTitle();
//saveAs("Tiff", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/z-images results"+imageName+".csv");

//		resultsName = getTitle();
// 		unwanted_part = ".tif thresholded.tif";
//		len1=lengthOf(resultsName);
//		len2=lengthOf(unwanted_part);
//		len3=indexOf(resultsName,unwanted_part);
////		print("lengths: "+ len1 + "" + len2 + "" + len3);
//		string1=substring(resultsName, len2+len3,len1);
//		string2=substring(resultsName, 0,len3);
//		saveName=string2+string1;
//		print("saving: " + saveName);

	list = getList("window.titles");
  if (list.length==0)
     print("No non-image windows are open");
  else {
//     print("Non-image windows:");
     for (i=0; i<list.length; i++){
      	if(list[i] == "Log"){
      		continue;
      	}
//        print("   "+list[i]);
        resultsName = list[i];
//        print("ResultsName: "+resultsName);
//        selectWindow(resultsName);
//        saveAs("Results", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/z-images results/" + resultsName+".csv");
		unwanted_part = ".tif thresholded.tif";
		len1=lengthOf(resultsName);
		len2=lengthOf(unwanted_part);
		len3=indexOf(resultsName,unwanted_part);
//		print("lengths: "+ len1 + "" + len2 + "" + len3);
		string1=substring(resultsName, len2+len3,len1);
		string2=substring(resultsName, 0,len3);
		saveName=string2+string1;      
//		print(saveName);
		  
		selectWindow(list[i]);
		saveAs("Results", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/z-images results/" + resultsName+".csv");
		selectWindow(saveName+".csv");
     	close();
     	close();
     }
  }
		
		
//		close();