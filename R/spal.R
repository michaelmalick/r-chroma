#' @title Create sequential color palettes using the HCL color space
#'
#' @description
#' \code{spal} creates sequential color palettes using the HCL color space. 
#' Sequential color palettes are composed of a gradient of colors where the
#' gradient can include a range of hues, luminance values, or chroma values.
#' Sequential color palettes are suitable for encoding continuous variables
#' where either low or high values are of importance, but not both.
#'
#' @param n number of colors to create
#' @param hue.start starting hue value, should be in the interval [0, 360]
#' @param hue.end ending hue value, should be in the interval [0, 360].
#' @param chroma vector of length 2 giving the start and end bounds for the
#' range of chroma values
#' @param luminance vector of length 2 giving the start and end bounds for the
#' range of luminance values
#'
#' @return \code{spal} returns a vector of hex colors
#'
#' @seealso \code{\link{hcl}} \code{\link{qpal}} \code{\link{dpal}}
#'
#' @export
#'
#' @examples
#' plotpal(spal(140))
#' plotpal(spal(140, luminance = c(20, 80)))
#' plotpal(spal(140, hue.start = 235, hue.end = 70))
#' plotpal(spal(140, hue.start = 235, hue.end = 70, luminance = c(20, 80)))
#' 
#' image(t(volcano)[ncol(volcano):1,], col = spal(100))
#' image(t(volcano)[ncol(volcano):1,], col = spal(100, hue.end = 70))

spal <- function(
    n,
    hue.start = 235,
    hue.end = NULL,
    luminance = c(30, 85),
    # luminance = c(85, 30),
    chroma = c(90, 100)) {
    
    if(is.null(hue.end)) {
        co <- hcl(h = hue.start, l = seq(luminance[1], luminance[2], 
            length.out = n), c = chroma)
    } else {
        co <- qpal(n = n, hue.start = hue.start, hue.end = hue.end, 
            luminance = seq(luminance[1], luminance[2], length.out = n), 
            chroma = seq(chroma[1], chroma[2], length.out = n))
    }

    return(co)
}
