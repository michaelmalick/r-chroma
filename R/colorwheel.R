#' @title Visualize color palettes using a color wheel
#' 
#' @description
#'     \code{colorwheel} allows you to easily visualize a color palette by
#'     plotting all hues for the specified specified chroma and luminance 
#'     values using a color wheel
#' 
#' @param chroma 
#'     chroma value for palette
#' @param luminance 
#'     luminance value for palette
#' @param labels 
#'     logical, should degree labels be shown
#' @param alpha 
#'     transparency level defined on the interval [0, 1] where 
#'     0 = transparent and 1 = opaque
#' @param fixup 
#'     logical, should RGB value be corrected (see \code{\link{hcl}}
#' 
#' @return \code{colorwheel} returns a pie chart showing the specified colors
#' 
#' @seealso \code{\link{qpal}} \code{\link{dpal}} \code{\link{spal}}
#' 
#' @export
#' 
#' @examples
#' colorwheel()
#' colorwheel(chroma = 50, luminance = 60)
#' colorwheel(chroma = 100, luminance = 75)
#' colorwheel(chroma = 100, luminance = 25)
#' colorwheel(chroma = 100, luminance = 0)
#' colorwheel(chroma = 0, luminance = 50)
#' 
#' par(mfrow = c(4, 3), mar = c(2, 0, 1.5, 0))
#' for(i in seq(0, 100, 10))
#'    colorwheel(chroma = i, labels = TRUE, fixup = TRUE)
#' 
#' par(mfrow = c(3, 3), mar = c(2, 0, 1.5, 0))
#' for(i in seq(20, 100, 10))
#'     colorwheel(luminance = i, labels = TRUE)
#' 
colorwheel <- function(chroma = 100, luminance = 60, labels = TRUE,
    alpha = 1, fixup = TRUE) {

    n <- 100
    cols <- qpal(100, hue.start = 0, chroma = chroma, luminance = luminance,
        alpha = alpha, fixup = fixup)    
    pie(rep(1, n), col = cols, border = cols, labels = NA, clockwise = TRUE)
    title(paste("C =", chroma, "  L =", luminance), line = 0.5)
    if(labels){
        text(0, 0.99, "0")
        text(0.99, 0, "90")
        text(0, -0.99, "180")
        text(-0.99, 0, "270") 
    }
    segments(x0 = -0.8, x1 = 0.8, y0 = 0, y1 = 0, col = "white")
    segments(x0 = 0, x1 = 0, y0 = -0.8, y1 = 0.8, col = "white")

}



