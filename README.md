# Sugar.jl

[![Build Status](https://travis-ci.org/harmeling/Sugar.jl.svg?branch=master)](https://travis-ci.org/harmeling/Sugar.jl)

This package provides a couple of convenience functions that I found useful to have.  Feel free to move any of the code into other packages, if you find it useful!

## Installation

To install this package you run

```
julia> Pkg.clone("git://github.com/harmeling/Sugar.jl.git/")
```

## `imagesc` based on `Images.jl`

To get a quick impression of a matrix it is often good to get a visual
impression of it.  This is what `imagesc` does.  It converts it to an
Image that is shown using the excellent `Images.jl` package.  E.g.

```
imagesc(randn(100,120))
```

## Really simple plotting of vectors and matrices with `Gadfly.jl`

```
plot(v, w)  # plots vector w against vector v
plot(w)     # plots vector w against [1:length(w)]
plot(v, A)  # plots columns of A against vector v
plot(A)     # plots columsn of A against [1:size(A,1)]
```
