setBatchMode(true);
  //run("T1 Head (2.4M, 16-bits)");
  
  stack1 = getImageID;
  stack2 = 0;
  n = 36;
  for (i=0; i<n; i++) {
    showProgress(i, n);
    selectImage(stack1);
    angle_y = i * 10;
    run("Volume Viewer", "display_mode=4 scale=1.2 axes=0 interpolation=2 bg_r=51 bg_g=51 bg_b=51 sampling=9.0 lut=4 useLight=1 objectLightValue=0.85 ambientValue=0.4 diffuseValue=0.5 specularValue=0.5 shineValue=90 angle_x=0 angle_z=0 angle_y="+ angle_y );
    run("Copy");
    w=getWidth; h=getHeight;
    close();     
    if (stack2==0) {
      newImage("Plots", "RGB", w, h, 1);
      stack2 = getImageID;
    } else {
      selectImage(stack2);
      run("Add Slice");
    }
    run("Paste");
  }
  setSlice(1);
  run("Select None");
  setBatchMode(false);