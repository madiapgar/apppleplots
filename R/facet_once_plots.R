#' Create faceted boxplot including statistical results
#'
#' @description
#'
#' `facet_once_plots()` returns a plot faceted by a single variable with data points, boxes, and contains an option
#' to include p-value significance.
#'
#'
#' @examples
#' # example code
#'
#' @import magrittr
#' @import ggplot2
#' @importFrom ggpubr stat_pvalue_manual
#' @export facet_once_plots
#' @param input_table Expects a dataframe or tibble.
#' @param stat_on_plot Uses stat_table to overlay p-value significance on plot, default is TRUE
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param grouped_by The column name of how you want your boxplots to be grouped, typically is the same as
#'   the x-axis column name (as a string)
#' @param point_alpha Enter a numeric value between 0 and 1 to change the transparency of your points
#' @param x_labels A list of new labels for x-axis values (requires a discrete variable)
#' @param facet_by The column name that you want to facet your plot by (as a string)
#' @param facet_labels A list of new facet labels in the labeller format
#'   ex: new_facet_labs <- c('names',
#'                           'I want')
#'       names(new_facet_labs) <- c('old names',
#'                                  'to be replaced')
#' @param stat_table The name of your dataframe or tibble containing statistical results (specifically containing columns for:
#'   1. p-value significance - named 'p.adj.signif'
#'   2. y-position - added via add_y_position())
#' @param x_name The name of your x-axis (as a string)
#' @param y_name The name of your y-axis (as a string)
#' @param title_content The title of your plot (as a string)
facet_once_plots <- function(input_table,
                             stat_on_plot = TRUE,
                             x_value,
                             y_value,
                             grouped_by,
                             point_alpha,
                             x_labels,
                             facet_by,
                             facet_labels,
                             stat_table = NULL,
                             x_name,
                             y_name,
                             title_content){
  plot <- input_table %>%
            ggplot2::ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
            ggplot2::geom_boxplot(aes(group = .data[[grouped_by]])) +
            ggplot2::geom_jitter(alpha = point_alpha, width = 0.1, height = 0) +
            ggplot2::scale_x_discrete(labels = x_labels) +
            ggplot2::theme_bw() +
            ggplot2::facet_grid(~.data[[facet_by]],
                                labeller = labeller(.cols = facet_labels)) +
            ggplot2::labs(x = x_name,
                          y = y_name,
                          title = title_content)

  if (stat_on_plot == 'TRUE') {
    plot <- plot + ggpubr::stat_pvalue_manual(stat_table,
                                              tip.length = 0.01,
                                              label = 'p.adj.signif',
                                              hide.ns = TRUE)
  } else {
    plot
  }

  return(plot)
}

