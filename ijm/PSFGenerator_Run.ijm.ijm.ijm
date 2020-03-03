import net.imagej.ops.AbstractOpTest;
import net.imglib2.Dimensions;
import net.imglib2.FinalDimensions;
import net.imglib2.img.Img;
import net.imglib2.type.numeric.real.DoubleType;

double NA = 1.4; // numerical aperture
double lambda = 610E-09; // wavelength
double ns = 1.33; // specimen refractive index
double ni = 1.5; // immersion refractive index, experimental
double resLateral = 100E-9; // lateral pixel size
double resAxial = 250E-9; // axial pixel size
double pZ = 2000E-9D; // position of particle

DoubleType type = new DoubleType(); // pixel type of created kernel
Dimensions dims = new FinalDimensions(256, 256); //dimensions

Img<DoubleType> kernel = ops.create().kernelDiffraction(dims, NA, lambda, ns, ni, resLateral, resAxial, pZ, type);