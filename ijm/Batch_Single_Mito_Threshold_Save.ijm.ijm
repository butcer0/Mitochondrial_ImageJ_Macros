//SplitChannelMacro

        inputFolder= getDirectory("Choose a Directory");
        print(inputFolder);
        thresholdedFolder = inputFolder + "/thresholded/";
        images= getFileList(inputFolder);
        File.makeDirectory(thresholdedFolder);

        for (i=0; i<images.length; i++) {
                setBatchMode(true); //batch mode
                inputPath= inputFolder + images[i];
                open (inputPath);
                imagesName=getTitle();
                print("Splitting Image: " + imagesName);
                run("3D Threshold", "subtract rolling=1 enhance max=1.40 scale_0=2.600 from=0.50 to=0.80 adjust gamma=0.90 method=[Weighted Mean] block=1.150 c-value=9 despeckle remove fill");
                selectWindow(imagesName + " thresholded");
                saveAs("Tiff", thresholdedFolder + imagesName + " thresholded.tiff");
                close();
                selectWindow(imagesName);
                close();
                write("Conversion Complete");
       
}
setBatchMode(false);