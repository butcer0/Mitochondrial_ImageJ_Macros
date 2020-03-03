// In ImageJ 1.45s and later, arrays can automatically
// expand in size as needed. Note that macros that
// use auto-expanding arrays will not be compatible
// with the Image 2.0 macro language.

  requires("1.45s");
  setOption("ExpandableArrays", true);
  cars = newArray;
  cars[0] = "Saab";
  cars[1] = "Volvo";
  cars[2] = "BMW";
  cars[4] = "Ford";
  for (i=0; i<cars.length; i++)
      print(cars[i]);

// Here is an alternative method that works with earlier
// versions of ImageJ and is compatible with ImageJ 2.0.
  cars = newArray(0);
  cars = append(cars, "Fiat");
  cars = append(cars, "Lancia");
  cars = append(cars, "Ferrari");
  cars = append(cars, "Maserati");
  print("");
  for (i=0; i<cars.length; i++)
      print(cars[i]);

  function append(arr, value) {
     arr2 = newArray(arr.length+1);
     for (i=0; i<arr.length; i++)
        arr2[i] = arr[i];
     arr2[arr.length] = value;
     return arr2;
  }