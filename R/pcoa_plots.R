#' Create PCoA plot
#'
#' @description
#'
#' `pcoa_plots()` returns a PCoA plot based on your unweighted/weighted UniFrac results. Can be faceted once or twice
#' by desired metadata variables.
#'
#'
#' @examples
#' # coming soon!
#'
#'
#' @import magrittr
#' @import ggplot2
#' @export pcoa_plots
#' @param input_table Expects a dataframe or tibble.
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param facet_once If TRUE, will allow you to facet by one variable. Put variable column name (as a string) into the
#' `facet_cols` parameter, default is FALSE
#' @param facet_twice If TRUE, will allow you to facet by two variable. Put variable column names (as a string) into the
#' `facet_cols` and `facet_rows` parameters, default is FALSE
#' @param point_fill The column name of what you want your points to be colored/filled by (as a string)
#' @param point_alpha Enter a numeric value between 0 and 1 to change the transparency of your points, default is 0.7
#' @param point_size Enter a numeric value to change the size of your points, default is 2
#' @param fill_type Is your color/fill value continuous or discrete? Accepts inputs of 'NULL' (you don't want your points colored),
#' 'continuous' or 'discrete'.
#' @param palette The name of the `scale_color_brewer()` palette you want your points colored by (as a string). Make sure
#' that you're choosing a palette that's appropriate for the data you want colored (continuous v discrete).
#' @param facet_rows The column name that you want to facet your plot ROWS by (as a string), default is NULL
#' @param facet_cols The column name that you want to facet your plot COLUMNS by (as a string), default is NULL
#' @param row_labs A list of new facet ROW labels in the labeller format, default is NULL
#'   ex: new_facet_labs <- c('names',
#'                           'I want')
#'       names(new_facet_labs) <- c('old names',
#'                                  'to be replaced')
#' @param col_labs A list of new facet COLUMN labels in the labeller format (same as above), default is NULL
#' @param legend_name The name of your legend (as a string)
#' @param x_name The name of your x-axis (as a string)
#' @param y_name The name of your y-axis (as a string)
#' @param title_content The title of your plot (as a string)
## pcoa plot function
## xlab and ylab are outputs from pcoa_ax_lab function
pcoa_plots <- function(input_table,
                       x_value,
                       y_value,
                       facet_once = FALSE,
                       facet_twice = FALSE,
                       point_fill,
                       point_alpha = 0.7,
                       point_size = 2,
                       fill_type,
                       palette,
                       facet_rows = NULL,
                       facet_cols = NULL,
                       row_labs = NULL,
                       col_labs = NULL,
                       legend_name,
                       x_name,
                       y_name,
                       title_content){
  plot <- input_table %>%
            ggplot2::ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
            ggplot2::geom_point(aes(fill = .data[[point_fill]]),
                                pch = 21,
                                alpha = point_alpha,
                                size = point_size) +
            ggplot2::theme_bw() +
            ggplot2::theme(legend.text = element_text(size = 12),
                           strip.text.y = element_text(angle = 0)) +
            ggplot2::ggtitle(title_content) +
            ggplot2::labs(x = x_name,
                          y = y_name,
                          fill = legend_name)

  if (is.null(fill_type)) {
    plot
  } else {
    if (fill_type == 'discrete') {
      plot <- plot + ggplot2::scale_fill_brewer(palette = palette)
    } else {
      plot <- plot + ggplot2::scale_fill_distiller(palette = palette)
    }
  }

  if (facet_once == TRUE) {
    plot <- plot + ggplot2::facet_grid(~.data[[facet_cols]],
                                       labeller = labeller(.cols = col_labs))
  } else {
    plot
  }

  if (facet_twice == TRUE) {
    plot <- plot + ggplot2::facet_grid(rows = vars(.data[[facet_rows]]),
                                       cols = vars(.data[[facet_cols]]),
                                       labeller = labeller(.rows = row_labs,
                                                           .cols = col_labs))
  } else {
    plot
  }

  return(plot)
}
