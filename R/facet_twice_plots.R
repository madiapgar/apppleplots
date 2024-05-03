#' Creates a twice faceted boxplot
#'
#' @description
#'
#' `facet_twice_plots()` is similar to `facet_once_plots()` but gives you the option to facet by two variables
#' and apply a log10 transformation to the y-axis. Best for use with longitudinal data.
#'
#' @section TEST:
#'
#' @examples
#' # example code
#'
#' @export facet_twice_plots
#' @param input_table Expects a dataframe or tibble.
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param y_transform Applies log10 transformation to y-axis values, default is TRUE
#' @param x_labels A list of new labels for x-axis values (requires a continuous variable)
#' @param box_group_by The column name of how you want your boxplots to be grouped, typically is the same as
#'   the x-axis column name (as a string)
#' @param line_group_by The column name of how you want to be your lines to be grouped (i.e. by sample ID)
#' @param point_alpha Enter a numeric value between 0 and 1 to change the transparency of your points, default is 0.4
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
facet_twice_plots <- function(input_table,
                              x_value,
                              y_value,
                              y_transform = TRUE,
                              x_labels,
                              box_group_by,
                              line_group_by,
                              point_alpha = 0.4,
                              facet_rows,
                              facet_cols,
                              row_labs,
                              col_labs,
                              x_name,
                              y_name,
                              title_content){
  input_table %>%
    ggplot2::ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
    ggplot2::scale_x_continuous(breaks = x_labels) +
    ggplot2::geom_boxplot(aes(group = .data[[box_group_by]]), outlier.shape = NA) +
    ggplot2::geom_line(aes(group = .data[[line_group_by]]), alpha = 0.1) +
    ggplot2::geom_smooth(se = FALSE) +
    ggplot2::geom_jitter(width = 0.1, height = 0, alpha = point_alpha) +
    ggplot2::theme_bw() +
    ggplot2::facet_grid(rows = vars(.data[[facet_rows]]),
                        cols = vars(.data[[facet_cols]]),
                        labeller = labeller(.cols = col_labs,
                                            .rows = row_labs)) +
    ggplot2::theme(strip.text.y = element_text(angle = 0)) +
    ggplot2::ggtitle(title_content) +
    ggplot2::ylab(y_name) +
    ggplot2::xlab(x_name) -> plot

  if (y_transform == 'TRUE') {
    plot <- plot + ggplot2::scale_y_continuous(trans = 'log10')
  } else {
    plot
  }

  return(plot)
}
