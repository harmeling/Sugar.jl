module Sugar
# author      : Stefan Harmeling
# date        : 2014-11-16
# description : convenience function, aka syntactic sugar

using Color, Images, Gadfly, DataFrames

import Gadfly.plot
export imagesc, plot, cmblues, cmoranges

## syntactic sugar for Images.jl
using Color, Images
scale0_1(A::Array) = (A - minimum(A))./(maximum(A)-minimum(A))
scale1_255(A::Array) = 254 * scale0_1(A) + 1
cmblues   = colormap("Blues", 255)
cmoranges = colormap("Oranges", 255)
imagesc(x; cm=cmblues, minsize=100, zoom=iceil(minsize ./ [size(x)...])) = ImageCmap(kron(iround(scale1_255(x)), ones(zoom[1],zoom[2])), cm)

##  syntactic sugar for Gadfly.jl
#   plot(v, w)  plots vector w against vector v
#   plot(w)     plots vector w against [1:length(w)]
#   plot(v, A)  plots columns of A against vector v
#   plot(A)     plots columsn of A against [1:size(A,1)]
plot(v::Vector, w::Vector, elements...; mapping...) = 
    plot(x=v, y=w, elements...; mapping...)
plot(w::Vector, elements...; mapping...) = 
    plot([1:length(w)], w, elements...; mapping...)
plot(v::Vector, A::Matrix, elements...; mapping...) = 
    plot(vcat([DataFrame(x=v, y=A[:,i], color="$i")  for i in 1:size(A,2)]...), x="x", y="y", color="color", Geom.line, elements...; mapping...)
plot(A::Matrix, elements...; mapping...) = 
    plot([1:size(A,1)], A, elements...; mapping...)

end # module
