//AnalyzeSingleMacro

        inputFolder= getDirectory("Choose a Directory");
        print(inputFolder);
        resultsFolder = inputFolder + "/resultsFolder/";
        images= getFileList(inputFolder);
        File.makeDirectory(resultsFolder);

        for (i=0; i<images.length; i++) {
                setBatchMode(true); //batch mode
                inputPath= inputFolder + images[i];
                open (inputPath);
                imagesName=getTitle();
                print("Analyzing Image: " + imagesName);
                run("2D Analysis", "count total mean total_0 mean_0 mean_1 mean_2 branches total_1 mean_3 branch branch_0 mean_4 if=Count perform_0 area perimeter form aspect branches_0 total_2 mean_5 branch_1 branch_2 mean_6 longest mask=None mask_0=Mask second=None second_0=[Channel 2] third=None third_0=[Channel 3] =None to=None then=None");
                selectWindow(imagesName);
                close();
                selectWindow("2D Analysis Data - per Mito");
                saveAs("Results", resultsFolder + imagesName + " results.csv");
                run("Clear Results");                
                write("Conversion Complete");

}
setBatchMode(false);