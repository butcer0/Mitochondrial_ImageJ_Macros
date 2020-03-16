//DirectoryMitoAuto

        inputFolder= getDirectory("Choose a Directory");
//        print(inputFolder);
        resultsFolder = inputFolder + "/resultsFolder/";
        images= getFileList(inputFolder);
        File.makeDirectory(resultsFolder);

        for (i=0; i<images.length; i++) {
//                setBatchMode(true); //batch mode
                inputPath= inputFolder + images[i];
//                print("opening: " + inputPath);
                open(inputPath);
                imagesName=getTitle();
                print("Analyzing Image: " + imagesName);
                selectWindow(imagesName);
                makeRectangle(100, 100, 800, 800);
                run("Yeast MitoMap_NoGui");
                selectWindow(imagesName);
                close();
                selectWindow("2D Analysis Data - per Mito");
                saveAs("Results", resultsFolder + imagesName + " results.csv");
                run("Clear Results");                
                write("Analysis Complete");

}
//setBatchMode(false);