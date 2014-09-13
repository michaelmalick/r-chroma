#' Create consistent color palettes using the HCL color space
#'
#' Chroma provides tools that make it easier to create color palettes for R
#' graphics using the Hue-Chroma-Luminance (HCL) color space. The HCL color
#' space is derived from the CIE-LUV color space by applying a polar coordinate
#' transformation. 
#'
#' Chroma has three functions to create color palettes: \code{qpal}, \code{dpal},
#' and \code{spal}. The \code{qpal} function creates qualitative color palettes
#' that are suitable for categorical data, such as colors of bars in barplots or
#' point colors in scatterplots. The \code{dpal} function creates divergent color
#' palettes, which are suitable when low and high values are of importance, but
#' middle range values are less important. The \code{spal} function creates
#' sequential color palettes, which are primary used for continous variables
#' where either low or high values are of importance, but not both.
#' 
#' @docType package
#' @name chroma
NULL
