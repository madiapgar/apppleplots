#' Run a Kruskal-Wallis and Dunn's Post Hoc Test
#'
#' @description
#'
#' `kruskal_dunn_stats()` returns a named list containing dataframes with your Kruskal-Wallis and Dunn's
#' Post Hoc test results.
#'
#'
#' @examples
#' # extracting results from the named list
#' krDunn_stat_list <- kruskal_dunn_stats(input_table = exercise_df,
#'                                        grouped_by = c('location',
#'                                                        'sex'),
#'                                        multiple_groups = TRUE,
#'                                        adjust_method = 'BH',
#'                                        filter_adj_p_value = FALSE,
#'                                        formula_left = 'heart_rate',
#'                                        formula_right = 'predominant_activity')
#'
#' test_kruskal <- krDunn_stat_list$KruskalTest
#' test_dunn <- krDunn_stat_list$DunnTest
#'
#' @import magrittr
#' @importFrom dplyr group_by
#' @importFrom dplyr do
#' @importFrom dplyr ungroup
#' @importFrom dplyr arrange
#' @importFrom dplyr mutate
#' @importFrom dplyr filter
#' @importFrom generics tidy
#' @importFrom stats kruskal.test
#' @importFrom stats reformulate
#' @importFrom stats p.adjust
#' @importFrom glue glue
#' @importFrom rstatix dunn_test
#' @importFrom rstatix add_xy_position
#' @export kruskal_dunn_stats
#' @param input_table Expects a dataframe or tibble.
#' @param grouped_by The column name you want your data grouped by prior to statistical analysis (as a string or a list of strings).
#' Typically it's whatever you've faceted your plot by (if you want your stats on your plot).
#' @param multiple_groups If TRUE, will know that you've grouped your data by two columns. If FALSE, will know that you've only grouped
#' your data by one column. Default is FALSE.
#' @param adjust_method P-value adjustment method (as a string). Options: "holm", "hochberg", "hommel", "bonferroni", "BH", "BY",
#' "fdr", and "none".
#' @param filter_adj_p_value If TRUE, will filter your Kruskal Test adjusted p-values <= 0.05 significance and will
#' filter all non-significant results out of the input table prior to the Dunn's Post Hoc test. Default is FALSE.
#' @param formula_left The column name of the variable you want tested on the left side of the formula (as a string).
#'   ex: formula_left ~ formula_right
#' @param formula_right The column name of the variable you want tested on the right side of the formula (as a string).
#'   ex: formula_left ~ formula_right
## this function runs a kruskal test followed by a dunns post hoc test on the data
kruskal_dunn_stats <- function(input_table,
                               grouped_by,
                               multiple_groups = FALSE,
                               adjust_method,
                               filter_adj_p_value = FALSE,
                               formula_left,
                               formula_right){
  # kruskal test
  kruskal_results <- input_table %>%
                      dplyr::group_by(input_table[grouped_by]) %>%
                      dplyr::do(generics::tidy(stats::kruskal.test(.data[[formula_left]] ~ .data[[formula_right]],
                                                                   data = .))) %>%
                      dplyr::ungroup() %>%
                      dplyr::arrange(.data$p.value) %>%
                      dplyr::mutate(p.adj = stats::p.adjust(.data$p.value,
                                                            method = adjust_method))


  if (multiple_groups == TRUE) {
    kruskal_results <- kruskal_results %>%
                          dplyr::mutate(test_id = paste(.data[[grouped_by[1]]],
                                                        .data[[grouped_by[2]]],
                                                        sep = "_"))

    alt_input <- input_table %>%
                    dplyr::mutate(test_id = paste(.data[[grouped_by[1]]],
                                                  .data[[grouped_by[2]]],
                                                  sep = "_"))
  } else {
    kruskal_results <- kruskal_results %>%
                          dplyr::mutate(test_id = paste(.data[[grouped_by[1]]]))

    alt_input <- input_table %>%
                    dplyr::mutate(test_id = paste(.data[[grouped_by[1]]]))
  }

  ## dunns post hoc test
  ## need to use reformulate/glue to have function variables work with the dunn test formula
  rightSide_name <- formula_right
  funky_formula <- stats::reformulate(glue::glue("{rightSide_name}"),
                                      glue::glue("{formula_left}"))

  if (filter_adj_p_value == TRUE) {
    kruskal_results <- kruskal_results %>%
                        dplyr::filter(.data$p.adj <= 0.05)

    dunn_results <- alt_input %>%
                      dplyr::group_by(alt_input[grouped_by]) %>%
                      dplyr::filter(.data$test_id %in% kruskal_results$test_id) %>%
                      rstatix::dunn_test(funky_formula,
                                         p.adjust.method = adjust_method,
                                         data = .) %>%
                      rstatix::add_xy_position(scales = 'free',
                                               fun = 'max')
  } else {
    kruskal_results

    dunn_results <- alt_input %>%
                      dplyr::group_by(alt_input[grouped_by]) %>%
                      rstatix::dunn_test(funky_formula,
                                         p.adjust.method = adjust_method,
                                         data = .) %>%
                      rstatix::add_xy_position(scales = 'free',
                                               fun = 'max')
  }

  ## list of outputs
  my_list <- list(KruskalTest = kruskal_results,
                  DunnTest = dunn_results)
  return(my_list)
}
