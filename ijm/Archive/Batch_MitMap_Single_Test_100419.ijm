//DirectoryMitoAuto

//        inputFolder= getDirectory("Choose a Directory");
//        resultsFolder = inputFolder + "/resultsFolder/";
//        images= getFileList(inputFolder);
//        File.makeDirectory(resultsFolder);
//
//        for (i=0; i<images.length; i++) {
//setBatchMode(true); //batch mode
//                inputPath= inputFolder + images[i];
//                open(inputPath);
				open();
				setBatchMode(true); //batch mode
                imagesName=getTitle();
                print("Analyzing Image: " + imagesName);
                selectWindow(imagesName);
                makeRectangle(100, 100, 200, 200);
                run("Yeast MitoMap_NoGui");
                selectWindow(imagesName);
                close();
//	    		resultsName = "Yeast_MitoMap_NoGui : "+imagesName+" (189.39,189.39)";
//                selectWindow(resultsName);
//                saveAs("Results", resultsFolder + imagesName + ".csv");        
				print("Saved");
				run("Close All");
				run("Collect Garbage");
				setBatchMode(false);
//}
write("Analysis Complete");
//                setBatchMode(false);