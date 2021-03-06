//DirectoryMitoAuto

        inputFolder= getDirectory("Choose a Directory");
        resultsFolder = inputFolder + "/resultsFolder/";
        images= getFileList(inputFolder);
        File.makeDirectory(resultsFolder);

        for (i=0; i<images.length; i++) {
				setBatchMode(true); //batch mode
                inputPath= inputFolder + images[i];
                open(inputPath);
                imagesName=getTitle();
                print("Analyzing Image: " + imagesName);
                selectWindow(imagesName);
                makeRectangle(100, 100, 600, 600);
                run("Yeast MitoMap_NoGui");
                selectWindow(imagesName);
                close();
	    		resultsName = "Yeast_MitoMap_NoGui : "+imagesName+" (151.52,151.52)";
                selectWindow(resultsName);
                saveAs("Results", resultsFolder + imagesName + ".csv");        
				run("Close All");
				run("Collect Garbage");
				print("Analyzing " + imagesName + " Complete");
}
write("Analysis Complete");
setBatchMode(false);