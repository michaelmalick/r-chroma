#' @title Create sequential color palettes using the HCL color space
#'
#' @description
#'     \code{spal} creates sequential color palettes using the HCL color space.
#'     Sequential color palettes are composed of a gradient of colors where the
#'     gradient can include a range of hues, luminance values, or chroma values.
#'     Sequential color palettes are suitable for encoding continuous variables
#'     where either low or high values are of importance, but not both.
#'
#' @param n
#'     number of colors to create
#' @param hue.start
#'     starting hue value, should be in the interval [0, 360]
#' @param hue.end
#'     ending hue value, should be in the interval [0, 360].
#' @param chroma
#'     vector of length 2 giving the start and end bounds for the range of chroma
#'     values
#' @param luminance
#'     vector of length 2 giving the start and end bounds for the range of
#'     luminance values
#' @param power
#'     parameter to control how chroma and luminance increase/decrease
#' @param alpha
#'     transparency level defined on the interval [0, 1] where 0 =
#'     transparent and 1 = opaque
#' @param fixup
#'     logical, should RGB value be corrected (see \code{\link{hcl}}
#'
#' @return \code{spal} returns a vector of hex colors
#'
#' @seealso \code{\link{hcl}} \code{\link{qpal}} \code{\link{dpal}}
#'
#' @export
#'
#' @author Michael Malick
#'
#' @examples
#' plotpal(spal(140))
#' plotpal(spal(140, luminance = c(20, 80)))
#' plotpal(spal(140, hue.start = 235, hue.end = 70))
#' plotpal(spal(140, hue.start = 235, hue.end = 70, luminance = c(20, 80)))
#'
#' image(t(volcano)[ncol(volcano):1,], col = spal(100))
#' image(t(volcano)[ncol(volcano):1,], col = spal(100, hue.end = 70))
#'
#' plotpal(spal(140, power = 0.8))
#' plotpal(spal(140, power = 1))
#' plotpal(spal(140, power = 1.3))
#' plotpal(spal(140, power = 1.5))
#'
#' plotpal(spal(140, hue.start = 260, chroma = c(80, 0),
#'     luminance = c(30, 90), power = 1.5))
#'
spal <- function(n,
                 hue.start = 235,
                 hue.end = NULL,
                 luminance = c(30, 85),
                 chroma = c(90, 100),
                 power = 1,
                 alpha = 1,
                 fixup = TRUE) {


    val   <- seq(1, 0, length.out = n)
    l.seq <- luminance[2] - diff(luminance) * val^power
    c.seq <- chroma[2] - diff(chroma) * val^power

    if(is.null(hue.end)) {
        co <- grDevices::hcl(h = hue.start, l = l.seq, c = c.seq,
                             alpha = alpha, fixup = fixup)
    } else {
        co <- qpal(n = n, hue.start = hue.start, hue.end = hue.end,
                   luminance = l.seq, chroma = c.seq,
                   alpha = alpha, fixup = fixup)
    }

    return(co)
}
