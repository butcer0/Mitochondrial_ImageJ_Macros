// imagej-macro "mitochondria"
// this macro works with plain ImageJ and BioFormats-plugin installed
requires( "1.52h" );
filePath = File.openDialog("");
setOption("BlackBackground", true);
run("Bio-Formats Importer", "open=["+filePath+"] color_mode=Default view=Hyperstack stack_order=XYCZT");
run("Z Project...", "projection=[Sum Slices]");
run("Bandpass Filter...", "filter_large=10 filter_small=1 suppress=None tolerance=5");
setAutoThreshold("Otsu dark no-reset");
run("Convert to Mask");
run("Watershed"); // this operation is optional
exit();
// imagej-macro "maximum"