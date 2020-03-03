imageName=getTitle();
run("Split Channels");
selectWindow("C2-"+imageName);
close();
selectWindow("C3-"+imageName);
close();
selectWindow("C1-"+imageName);

saveAs("Tiff", "C:/Users/Erik.Butcher/Google Drive (butcer@alumni.wfu.edu)/Harvard/Opthamology Research/Lab Data/Daisy Mitochondrial/091919/Data/Images/"+imageName+"_red.tif");
