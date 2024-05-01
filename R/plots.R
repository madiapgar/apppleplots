#' Contains all plot-producing functions
#'
#' @description
#' A short description...
#'
#' @section section title:
#'
#' @examples
#' # example code
#'
#'
#' @export stats_on_plots
#' @param input_table Expects a dataframe or tibble.
#' @param stat_on_plot Uses stat_table to overlay p-value significance on plot, default is TRUE
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param grouped_by The column name of how you want your boxplots to be grouped, typically is the same as
#'   the x-axis column name (as a string)
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
# basic single faceted box plot with p-value significance overlaid on plot
stats_on_plots <- function(input_table,
                           stat_on_plot = TRUE,
                           x_value,
                           y_value,
                           grouped_by,
                           x_labels,
                           facet_by,
                           facet_labels,
                           stat_table,
                           x_name,
                           y_name,
                           title_content){
  input_table %>%
    ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
    geom_boxplot(aes(group = .data[[grouped_by]])) +
    geom_jitter(alpha = 0.4, width = 0.1, height = 0) +
    scale_x_discrete(labels = x_labels) +
    theme_bw() +
    facet_grid(~.data[[facet_by]],
               labeller = labeller(.cols = facet_labels)) +
    labs(x = x_name,
         y = y_name,
         title = title_content) -> plot

  if (stat_on_plot == 'TRUE') {
    plot <- plot + rstatix::stat_pvalue_manual(stat_table,
                                              tip.length = 0.01,
                                              label = 'p.adj.signif',
                                              hide.ns = TRUE)
  } else {
    plot
  }

  return(plot)
}


#' @export facet_twice_plots
#' @param input_table Expects a dataframe or tibble.
#' @param x_value The column name of what you want on the x-axis (as a string)
#' @param y_value The column name of what you want on the y-axis (as a string)
#' @param y_transform Applies log10 transformation to y-axis values, default is TRUE
#' @param x_labels A list of new labels for x-axis values (requires a continuous variable)
#' @param box_group_by The column name of how you want your boxplots to be grouped, typically is the same as
#'   the x-axis column name (as a string)
#' @param line_group_by The column name of how you want to be your lines to be grouped (i.e. by sample ID)
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
# plot faceted by two variables with boxplots, plots, and non-linear regression line best for use with
# longitudinal data
facet_twice_plots <- function(input_table,
                              x_value,
                              y_value,
                              y_transform = TRUE,
                              x_labels,
                              box_group_by,
                              line_group_by,
                              facet_rows,
                              facet_cols,
                              row_labs,
                              col_labs,
                              x_name,
                              y_name,
                              title_content){
  input_table %>%
    ggplot(aes(x = .data[[x_value]], y = .data[[y_value]])) +
    scale_x_continuous(breaks = x_labels) +
    geom_boxplot(aes(group = .data[[box_group_by]]), outlier.shape = NA) +
    geom_line(aes(group = .data[[line_group_by]]), alpha = 0.1) +
    geom_smooth(se = FALSE) +
    geom_jitter(width = 0.1, height = 0, alpha = 0.6) +
    theme_bw() +
    facet_grid(.data[[facet_rows]]~.data[[facet_cols]],
               labeller = labeller(.cols = col_labs,
                                   .rows = row_labs)) +
    theme(strip.text.y = element_text(angle = 0)) +
    ggtitle(title_content) +
    ylab(y_name) +
    xlab(x_name) -> plot

  if (y_transform == 'TRUE') {
    plot <- plot + scale_y_continuous(trans = 'log10')
  } else {
    plot
  }

  return(plot)
}

