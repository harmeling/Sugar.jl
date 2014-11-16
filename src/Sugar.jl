module Sugar
# author: Stefan Harmeling
# date  : 2014-11-16

using Color, Images

export imagesc

scale0_1(A::Array) = (A - minimum(A))./(maximum(A)-minimum(A))
scale1_255(A::Array) = 254 * scale0_1(A) + 1
cmblues   = colormap("Blues", 255)
cmoranges = colormap("Oranges", 255)
imagesc(x, cm=cmblues) = ImageCmap(iround(scale1_255(x')), cm)

end # module
