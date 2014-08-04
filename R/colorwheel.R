#' @title Show color palette in a barplot
#'
#' @description
#' \code{plotpal} allows you to easily visualize a color palette by plotting the
#' specified palette using a barchart
#'
#' @param colors vector of hex colors
#' @param hex.labels logical, should the colors hex label be shown on the plot
#'
#' @return \code{plotpal} returns a barchart showing the specified colors
#'
#' @seealso \code{\link{qpal}} \code{\link{dpal}} \code{\link{spal}}
#'
#' @examples
#' plotpal(qpal(10))
#' plotpal(qpal(100))
#' plotpal(c("#00A0ED", "#F15A8F", "#4FA500"))

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

colorwheel()
colorwheel(label = TRUE)
colorwheel(chroma = 50, luminance = 60)
colorwheel(chroma = 100, luminance = 75)
colorwheel(chroma = 100, luminance = 25)
colorwheel(chroma = 100, luminance = 0)
colorwheel(chroma = 0, luminance = 60)


par(mar = c(1, 0, 1.5, 0))
colorwheel()

par(mfrow = c(4, 3), mar = c(2, 0, 1.5, 0))
for(i in seq(0, 100, 10))
    colorwheel(chroma = i, labels = TRUE, fixup = TRUE)

par(mfrow = c(4, 3), mar = c(2, 0, 1.5, 0))
for(i in seq(0, 100, 10))
    colorwheel(chroma = i, labels = TRUE, fixup = FALSE)


par(mfrow = c(3, 3), mar = c(2, 0, 1.5, 0))
for(i in seq(20, 100, 10))
    colorwheel(luminance = i, labels = TRUE)

par(mfrow = c(3, 4), mar = c(2, 0, 1.5, 0))
for(i in seq(10, 100, 10))
    colorwheel(luminance = i, labels = TRUE, fixup = FALSE)
