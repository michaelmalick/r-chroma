# chroma
*An R package for creating consistent color palettes using the HCL color space*


# Overview
The `chroma` package provides tools that make it easier to create color palettes
for R graphics using the Hue-Chroma-Luminance (HCL) color space. The HCL color
space is derived from the [CIE-LUV](https://en.wikipedia.org/wiki/CIELUV) color
space by applying a polar coordinate transformation (see
[here](http://www.r-project.org/conferences/DSC-2003/Proceedings/Ihaka.pdf) and
[here](https://www.sciencedirect.com/science/article/pii/S0167947308005549?np=y)
for details).

The `chroma` package has three functions to create color palettes: 

  - `qpal`: create qualitative color palettes
    - Qualitative color palettes consist of a set of discrete colors that are
      suitable for categorical data such as barcharts or distinguishing groups
      in a scatterplot.

  - `dpal`: create divergent color palettes
    - Divergent color palettes consist of a gradient that goes from dark to
      light to dark where both ends of the gradient are a separate hue.
      Divergent color palettes  are suitable when low and high values are of
      importance, but middle range values are less important.


  - `spal`: create sequential color palettes
    - Sequential color palettes are composed of a gradient of colors where the
      gradient can include a range of hues, luminance values, or chroma values.
      Sequential color palettes are suitable for encoding continuous variables
      where either low or high values are of importance, but not both.


# Installation
The `chroma` package is not on CRAN, but can be installed from R using:

    install.packages("devtools")
    library(devtools)
    install_github(repo = "michaelmalick/r-chroma")
    library(chroma)


# License 
The `chroma` package is [MIT/X11](http://opensource.org/licenses/MIT) licensed.
Copyright (c) 2014-2015 Michael Malick

