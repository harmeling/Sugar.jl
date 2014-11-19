module Sugar
# author      : Stefan Harmeling
# date        : 2014-11-16
# description : convenience function, aka syntactic sugar

using Color, Images, Gadfly, DataFrames

import Gadfly.plot
export imagesc, plot

## syntactic sugar for Images.jl
using Color, Images
scale0_1(A::Array) = (A - minimum(A))./(maximum(A)-minimum(A))
scale1_255(A::Array) = 254 * scale0_1(A) + 1
cmblues   = colormap("Blues", 255)
cmoranges = colormap("Oranges", 255)
imagesc(x; cm=cmblues, minsize=100, zoom=iceil(minsize ./ [size(x)...])) = ImageCmap(kron(iround(scale1_255(x')), ones(zoom[2],zoom[1])), cm)

##  syntactic sugar for Gadfly.jl
#   plot(v, w)  plots vector w against vector v
#   plot(w)     plots vector w against [1:length(w)]
#   plot(v, A)  plots columns of A against vector v
#   plot(A)     plots columsn of A against [1:size(A,1)]
plot(v::Vector, w::Vector) = plot(x=v, y=w)
plot(w::Vector) = plot([1:length(w)], w)
plot(v::Vector, A::Matrix) = plot(vcat([DataFrame(x=v, y=A[:,i], color="$i")  for i in 1:size(A,2)]...), x="x", y="y", color="color", Geom.line)
plot(A::Matrix) = plot([1:size(A,1)], A)

end # module
