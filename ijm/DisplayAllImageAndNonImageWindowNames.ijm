// Display Window Titles
//
// Displays the titles of image and non-image windows.

  list = getList("image.titles");
  if (list.length==0)
     print("No image windows are open");
  else {
     print("Image windows:");
     for (i=0; i<list.length; i++)
        print("   "+list[i]);
  }
 print("");

 list = getList("window.titles");
  if (list.length==0)
     print("No non-image windows are open");
  else {
     print("Non-image windows:");
     for (i=0; i<list.length; i++)
        print("   "+list[i]);
  }
  print("");
 