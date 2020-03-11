imageName=getTitle();
run("Split Channels");
selectWindow("C1-"+imageName);
close();
selectWindow("C3-"+imageName);
close();
selectWindow("C2-"+imageName);

saveAs("Tiff", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/Images/"+imageName+"_green.tif");
selectWindow(imageName+"_green.tif");
close();
