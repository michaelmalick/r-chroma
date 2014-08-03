#' @title Create qualitative color palette using the HCL colorspace
#'
#' @description
#' \code{qpal} creates qualitative color palettes using the HCL colorspace.
#'
#' @param n number of colors to create
#' @param hue.start starting hue value, should be in the interval [0, 360]
#' @param hue.end ending hue value, should be in the interval [0, 360].
#' @param chroma chroma value, range of possible value depends on hue and
#' luminance values.
#' @param luminance luminance value, should be in the interval [0, 100].
#' @param direction to travel around the color wheel. 1 = clockwise -1 =
#' counterclockwise.
#'
#' @return \code{qpal} returns a vector of hex colors
#'
#' @seealso \code{\link{hcl}} \code{\link{dpal}} \code{\link{spal}}
#'
#' @examples
#' plotpal(qpal(5))
#' plotpal(qpal(5, hue.start = 0))
#' plotpal(qpal(5, hue.start = 140))
#' plotpal(qpal(10, hue.start = 0, hue.end = 240))
#' plotpal(qpal(10, hue.start = 0, hue.end = 100))
#' plotpal(qpal(10, hue.start = 235, hue.end = 10))
#' plotpal(qpal(10, hue.start = 235, hue.end = 10, dir = -1))
#' plotpal(qpal(5, chroma = 60))
#' plotpal(qpal(5, chroma = 20))
#' plotpal(qpal(5, luminance = 30))
#' plotpal(qpal(5, luminance = 80))

qpal <- function(
    n,
    hue.start = 235,
    hue.end = NULL,
    chroma = 100,
    luminance = 60,
    direction = 1) {


    if(hue.start > 360)
        stop("hue.start can't be greater then 360")
    
    if(!is.null(hue.end))
        if(hue.end > 360)
            stop("hue.end can't be greater then 360")


    # Calculate hue.end if not specified 
    if(is.null(hue.end)) {
        hue.end <- hue.start - 360/n
        if(hue.end < 0)
            hue.end <- 360 + hue.end
    }

    # Determine if sequence wraps from 360 back to 0
    wrap <- ifelse((hue.end <= hue.start & hue.start != 0), TRUE, FALSE)
       
    if(wrap == FALSE)
        angles  <- seq(hue.start, hue.end, length.out = n)
    
    if(wrap == TRUE) {
        dem    <- ifelse(n == 1, 1, (n-1))
        space  <- ((360 - hue.start) + hue.end) / dem
        ang1   <- seq(hue.start, 359, space)
        ang2.s <- (360 - max(ang1))
        ang2   <- seq(space - ang2.s, hue.end + 1, space)
        angles <- c(ang1, ang2)
    } 
    
    co <- hcl(h = angles, l = luminance, c = chroma)

    if(n == 1)
        co <- co[1]

    if(direction == -1)
        co <- rev(co)

    return(co)
    
}
