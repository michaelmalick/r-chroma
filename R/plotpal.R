#' @title Visualize color palette in a barplot
#' 
#' @description
#'     \code{plotpal} allows you to easily visualize a color palette by plotting
#'     the specified palette using a barchart
#' 
#' @param colors 
#'     vector of hex colors
#' @param hex.labels 
#'     logical, should the colors hex label be shown on the plot
#' @param space
#'      numeric giving space between color bars
#' @param border
#'      color of borders for bars
#' 
#' @return \code{plotpal} returns a barchart showing the specified colors
#' 
#' @seealso \code{\link{qpal}} \code{\link{dpal}} \code{\link{spal}}
#' 
#' @export
#'
#' @author Michael Malick
#' 
#' @examples
#' plotpal(qpal(10))
#' plotpal(qpal(100))
#' plotpal(c("#00A0ED", "#F15A8F", "#4FA500"))
#' plotpal(qpal(10), border = "grey50", space = 0)
#' 
plotpal <- function(colors, hex.labels = FALSE, space = NULL, border = colors) {

    n <- length(colors)

    if(hex.labels)
        labels <- colors
    else
        labels <- NA

    barplot(rep(1, n), col = colors, names.arg = labels,
        axes = FALSE, space = space, border = border)

}
