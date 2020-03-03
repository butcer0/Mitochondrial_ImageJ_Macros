//SplitChannelMacro

        inputFolder= getDirectory("Choose a Directory");
//        print(inputFolder);
        resultsFolder = inputFolder + "/results/";
        images= getFileList(inputFolder);
        File.makeDirectory(resultsFolder);

        for (i=0; i<images.length; i++) {
                setBatchMode(true); //batch mode
                inputPath= inputFolder + images[i];
                open (inputPath);
                imagesName=images[i];
                print("MitoMapping Image: " + imagesName);               
                selectWindow(images[i]);
				makeRectangle(100, 100, 800, 800);
				run("Yeast MitoMap_NoGui");
					
                saveAs("Results", resultsFolder + imagesName + ".csv");
                close();
                selectWindow(imagesName);
                close();
                write("Analysis Complete");
       
}
setBatchMode(false);