#' Creates correlation comparison plots
#'
#' @description
#'
#' `correlation_plots()` returns a plot faceted by two variables, gives you the option to apply a log10
#' transformation to the x and y-axis, and the line of best fit method is alterable.
#'
#'
#' @examples
#' # coming soon!
#'
#' @import magrittr
#' @import ggplot2
#' @export correlation_plots
#' @param input_table Expects a dataframe or tibble.
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param x_transform Applies log10 transformation to x-axis values, default is FALSE
#' @param y_transform Applies log10 transformation to y-axis values, default is FALSE
#' @param point_alpha Enter a numeric value between 0 and 1 to change the transparency of your points, default is 0.4
#' @param regression_method Defines which line of best fit method you want, default is 'lm'
#' @param facet_rows The column name that you want to facet your plot ROWS by (as a string)
#' @param facet_cols The column name that you want to facet your plot COLUMNS by (as a string)
#' @param row_labs A list of new facet ROW labels in the labeller format
#'   ex: new_facet_labs <- c('names',
#'                           'I want')
#'       names(new_facet_labs) <- c('old names',
#'                                  'to be replaced')
#' @param col_labs A list of new facet COLUMN labels in the labeller format (same as above)
#' @param x_name The name of your x-axis (as a string)
#' @param y_name The name of your y-axis (as a string)
#' @param title_content The title of your plot (as a string)
correlation_plots <- function(input_table,
                              x_value,
                              y_value,
                              x_transform = FALSE,
                              y_transform = FALSE,
                              point_alpha = 0.4,
                              regression_method = 'lm',
                              facet_rows,
                              facet_cols,
                              row_labs,
                              col_labs,
                              x_name,
                              y_name,
                              title_content){
  plot <- input_table %>%
            ggplot2::ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
            ggplot2::geom_jitter(alpha = point_alpha, width = 0.1, height = 0) +
            ggplot2::geom_smooth(method = regression_method, se = FALSE) +
            ggplot2::facet_grid(rows = vars(.data[[facet_rows]]),
                                cols = vars(.data[[facet_cols]]),
                                labeller = labeller(.rows = row_labs,
                                                    .cols = col_labs),
                                scales = 'free_y') +
            ggplot2::theme_bw() +
            ggplot2::theme(strip.text.y = element_text(angle = 0)) +
            ggplot2::labs(x = x_name,
                          y = y_name,
                          title = title_content)

  if (x_transform == TRUE) {
    plot <- plot + ggplot2::scale_x_continuous(trans = 'log10')
  } else {
    plot
  }

  if (y_transform == TRUE) {
    plot <- plot + ggplot2::scale_y_continuous(trans = 'log10')
  } else {
    plot
  }

  return(plot)
}
