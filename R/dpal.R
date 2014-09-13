#' @title Create divergent color palettes using the HCL color space
#'
#' @description
#' \code{dpal} creates divergent color palettes using the HCL color space. 
#' Divergent color palettes consist of a gradient that goes from dark to light 
#' to dark where each end of the gradient is a seperate hue.
#' Divergent color palettes  are suitable when low and high values are of 
#' importance, but middle range values are less important.
#'
#' @param n number of colors to create
#' @param hue vector of length 2 giving the first and second hues to use
#' @param chroma vector of length 2 giving the start and end bounds for the
#' range of chroma values
#' @param luminance vector of length 2 giving the start and end bounds for the
#' range of luminance values
#'
#' @return \code{dpal} returns a vector of hex colors
#'
#' @seealso \code{\link{hcl}} \code{\link{qpal}} \code{\link{spal}}
#'
#' @export
#'
#' @examples
#' plotpal(dpal(200))
#' plotpal(dpal(200, hue = c(100, 240)))
#' plotpal(dpal(200, hue = c(40, 240), c = c(40, 100)))
#'
#' mat <- matrix(c(rnorm(100), rnorm(100) + 1, rnorm(100) + 2, rnorm(100) + 3),
#'               ncol = 4) 
#' image(z = mat, col = dpal(200), axes = FALSE)
#' box()

dpal <- function(
    n,
    hue = c(0, 235),
    chroma = c(0, 60),
    luminance = c(25, 100)) {

    l.seq <- seq(luminance[1], luminance[2], length.out = n/2)
    c.seq <- seq(chroma[2], chroma[1], length.out = n/2)
    co1   <- hcl(h = hue[1], l = l.seq, c = c.seq)
    co2   <- hcl(h = hue[2], l = l.seq, c = c.seq)
    co    <- c(co1, rev(co2))

    return(co)

}
