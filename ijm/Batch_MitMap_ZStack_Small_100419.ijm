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
                makeRectangle(100, 100, 200, 200);
                run("Yeast MitoMap_NoGui");
                selectWindow(imagesName);
                close();
	    		resultsName = "Yeast_MitoMap_NoGui : "+imagesName+" (75.76,75.76)";
                selectWindow(resultsName);
                saveAs("Results", resultsFolder + imagesName + ".csv");        
				run("Close All");
				run("Collect Garbage");
}
write("Analysis Complete");
setBatchMode(false);