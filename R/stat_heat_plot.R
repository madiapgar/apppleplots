#' Creates a statistical visualization
#'
#' @description
#'
#' `stat_heat_plot()` returns a heat map based on the statistical results entered.
#' Most compatible with pairwise or linear regression results.
#'
#'
#' @examples
#' # example code
#'
#' @import magrittr
#' @import ggplot2
#' @export stat_heat_plot
#' @param input_table Expects a dataframe or tibble.
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param pairwise Formats plot for pairwise test results (i.e have group comparisons), default is FALSE
#' @param correlation Formats plot for linear regression test results (i.e correlation comparisons), default is FALSE
#' @param tile_fill The column name of which numeric value you want fill the tiles (as as string)
#' @param tile_outline_color The color you want to outline the individual tiles with, default is BLACK
#' @param tile_alpha Enter a numeric value between 0 and 1 to change the transparency of your points, default is 0.6
#' @param text_value The column name of the text you want overlaid on your plot tiles (as a string)
#' @param low_color Tile numeric low point color, default is BLUE
#' @param high_color Tile numeric high point color, default is GREEN
#' @param legend_name The name of your legend (as a string)
#' @param x_labels A list of new labels for x-axis values (requires a discrete variable)
#' @param y_labels A list of new labels for y-axis values (requires a discrete variable)
#' @param facet_by The column name that you want to facet your plot by (as a string)
#' @param facet_labels A list of new facet labels in the labeller format
#'   ex: new_facet_labs <- c('names',
#'                           'I want')
#'       names(new_facet_labs) <- c('old names',
#'                                  'to be replaced')
#' @param x_name The name of your x-axis (as a string)
#' @param y_name The name of your y-axis (as a string)
#' @param title_content The title of your plot (as a string)
stat_heat_plot <- function(input_table,
                           x_value,
                           y_value,
                           pairwise = FALSE,
                           correlation = FALSE,
                           tile_fill,
                           tile_outline_color = 'black',
                           tile_alpha = 0.6,
                           text_value,
                           low_color = 'blue',
                           high_color = 'green',
                           legend_name,
                           x_labels,
                           y_labels,
                           facet_by,
                           facet_labels,
                           x_name,
                           y_name,
                           title_content){
  input_table %>%
    ggplot2::ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
    ggplot2::geom_tile(aes(fill = .data[[tile_fill]]),
                       color = tile_outline_color,
                       alpha = tile_alpha) +
    ggplot2::geom_text(aes(label = .data[[text_value]])) +
    ggplot2::scale_fill_gradient2(low = low_color,
                                  high = high_color) +
    ggplot2::scale_y_discrete(labels = y_labels) +
    ggplot2::facet_wrap(~.data[[facet_by]],
                        labeller = labeller(.cols = facet_labels),
                        scales = 'free_x') +
    ggplot2::theme_bw() +
    ggplot2::xlab(x_name) +
    ggplot2::ylab(y_name) +
    ggplot2::labs(fill = legend_name) -> plot

  if (pairwise == TRUE) {
    plot <- plot +
      ggplot2::scale_x_continuous(breaks = x_labels) +
      ggplot2::ggtitle(label = title_content,
                       subtitle = 'Group 1') +
      ggplot2::theme(strip.text.y = element_text(angle = 0),
                     plot.subtitle = element_text(hjust = 0.5))
  } else {
    plot
  }

  if (correlation == TRUE) {
    plot <- plot +
      ggplot2::scale_x_discrete(labels = x_labels) +
      ggplot2::ggtitle(title_content)
  } else {
    plot
  }

  return(plot)
}
