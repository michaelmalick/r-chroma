#' @title Create divergent color palettes using the HCL color space
#' 
#' @description
#'     \code{dpal} creates divergent color palettes using the HCL color space. 
#'     Divergent color palettes consist of a gradient that goes from dark to
#'     light to dark where both ends of the gradient are a separate hue.
#'     Divergent color palettes  are suitable when low and high values are of 
#'     importance, but middle range values are less important.
#' 
#' @param n 
#'     number of colors to create
#' @param hue 
#'     vector of length 2 giving the first and second hues to use
#' @param chroma 
#'     chroma value for palette
#' @param 
#'     luminance vector of length 2 giving the start and end bounds for the
#'     range of luminance values
#' @param power 
#'     parameter to control how chroma and luminance increase/decrease
#' @param alpha 
#'     transparency level defined on the interval [0, 1] where 0 =
#'     transparent and 1 = opaque
#' @param fixup 
#'     logical, should RGB value be corrected (see \code{\link{hcl}}
#' 
#' @return \code{dpal} returns a vector of hex colors
#' 
#' @seealso \code{\link{hcl}} \code{\link{qpal}} \code{\link{spal}}
#' 
#' @export
#'
#' @author Michael Malick
#' 
#' @examples
#' plotpal(dpal(200))
#' plotpal(dpal(200, luminance = c(30, 90)))
#' plotpal(dpal(200, luminance = c(30, 90), power = 2))
#' plotpal(dpal(200, luminance = c(30, 90), power = 0.8))
#' plotpal(dpal(200, hue = c(100, 240)))
#' plotpal(dpal(200, hue = c(40, 240), luminance = c(30, 90)))
#' 
#' mat <- matrix(c(rnorm(100), rnorm(100) + 1, rnorm(100) + 2, 
#'     rnorm(100) + 3),
#'               ncol = 4) 
#' image(z = mat, col = dpal(200), axes = FALSE)
#' box()
#' 
dpal <- function(
    n,
    hue = c(260, 0),
    chroma = 80,
    luminance = c(25, 100),
    power = 1.3,
    alpha = 1,
    fixup = TRUE) {

    val   <- seq(1, -1, length.out = n)
    l.seq <- luminance[2] - diff(luminance) * abs(val)^power
    c.seq <- chroma * abs(val)^power
    h.seq <- ifelse(val > 0, hue[1], hue[2])
    co    <- hcl(l = l.seq, c = c.seq, h = h.seq, alpha = alpha, fixup = fixup)

    return(co)

}
