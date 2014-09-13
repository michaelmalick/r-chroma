#' @title Create qualitative color palettes using the HCL color space
#'
#' @description
#' \code{qpal} creates qualitative color palettes using the HCL color space.
#' Qualitative color palettes consist of a set of discrete colors that
#' are suitable for categorical data such as barcharts or distinguishing groups 
#' in a scatterplot.
#'
#' @param n number of colors to create
#' @param hue.start starting hue value, should be in the interval [0, 360]
#' @param hue.end ending hue value, should be in the interval [0, 360].
#' @param chroma chroma value, range of possible value depends on hue and
#' luminance values.
#' @param luminance luminance value, should be in the interval [0, 100].
#' @param direction to travel around the color wheel. 1 = clockwise -1 =
#' counterclockwise.
#' @param alpha numeric vector of values in the range [0,1] for alpha
#' transparency channel (0 means transparent and 1 means opaque)
#' @param fixup a logical value which indicates whether the resulting RGB values 
#' should be corrected to ensure that a real color results. if fixup is FALSE 
#' RGB components lying outside the range [0,1] will result in an NA value
#'
#' @return \code{qpal} returns a vector of hex colors
#'
#' @seealso \code{\link{hcl}} \code{\link{dpal}} \code{\link{spal}}
#'
#' @export
#'
#' @examples
#' plotpal(qpal(5))
#' plotpal(qpal(5, hue.start = 0))
#' plotpal(qpal(5, alpha = 0.5))
#' plotpal(qpal(5, hue.start = 140))
#' plotpal(qpal(10, hue.start = 0, hue.end = 240))
#' plotpal(qpal(10, hue.start = 0, hue.end = 100))
#' plotpal(qpal(10, hue.start = 235, hue.end = 10))
#' plotpal(qpal(10, hue.start = 235, hue.end = 10, dir = -1))
#' plotpal(qpal(5, chroma = 60))
#' plotpal(qpal(5, chroma = 20))
#' plotpal(qpal(5, luminance = 30))
#' plotpal(qpal(5, luminance = 80))
#' plotpal(qpal(100, luminance = seq(25, 90, length = 100)))
#'
#' y1 <- rnorm(100)
#' y2 <- rnorm(100) + 2
#' y3 <- rnorm(100) + 4
#' mycol <- qpal(3)
#' plot(y1, type = "l", col = mycol[1], ylim = c(-3, 7))
#' lines(y2, col = mycol[2])
#' lines(y3, col = mycol[3])
#'
#' mycol <- qpal(3, chroma = 90, luminance = 60)
#' plot(iris$Sepal.Length[iris$Species == "setosa"], 
#'     iris$Sepal.Width[iris$Species == "setosa"], 
#'     col = mycol[1], pch = 19, ylim = c(2, 5), xlim = c(4, 8),
#'     ylab = "Sepal width", xlab = "Sepal length")
#' points(iris$Sepal.Length[iris$Species == "virginica"], 
#'     iris$Sepal.Width[iris$Species == "virginica"],
#'     col = mycol[2], pch = 19)
#' points(iris$Sepal.Length[iris$Species == "versicolor"], 
#'     iris$Sepal.Width[iris$Species == "versicolor"], 
#'     col = mycol[3], pch = 19)
#'
#' mycol <- qpal(3, alpha = 0.2)
#' plot(rnorm(300), col = mycol[1], pch = 19)
#' points(rnorm(300), col = mycol[2], pch = 19)
#' points(rnorm(300), col = mycol[3], pch = 19)

qpal <- function(
    n,
    hue.start = 235,
    hue.end = NULL,
    chroma = 100,
    luminance = 60,
    direction = 1,
    alpha = 1,
    fixup = TRUE) {


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
    
    co <- hcl(h = angles, l = luminance, c = chroma, alpha = alpha, 
        fixup = fixup)

    if(n == 1)
        co <- co[1]

    if(direction == -1)
        co <- rev(co)

    return(co)
    
}
