//imageName = getTitle();

  list = getList("image.titles");
  if (list.length==0)
     print("No image windows are open");
  else {
     print("Image windows:");
     for (i=0; i<list.length; i++){
        print("   "+list[i]);
		imageName = list[i];
        unwanted_part = "20190911_PGC1b_Siwei.lif - ";
		len1=lengthOf(imageName);
		len2=lengthOf(unwanted_part);
		len3=indexOf(imageName,unwanted_part);
		print("lengths: "+ len1 + "" + len2 + "" + len3);
		string1=substring(imageName, len2+len3,len1);
		string2=substring(imageName, 0,len3);
		saveName=string2+string1;
		print("saving: " + saveName);

		selectWindow(imageName);
		saveAs("Tiff", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/z-images/" + saveName+".tif");

		selectWindow(saveName+".tif");
		close();
     }
 	}
