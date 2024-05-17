#' Run a Linear Model
#'
#' @description
#'
#' `linear_model()` returns a dataframe with results of your linear regression analysis.
#'
#'
#' @examples
#' \dontrun{
#' linear_model <- linear_model(input_table = exercise_df,
#'                              grouped_by = c('location',
#'                                             'sex'),
#'                              multiple_groups = TRUE,
#'                              adjust_method = 'BH',
#'                              filter_adj_p_value = TRUE,
#'                              formula_left = 'heart_rate',
#'                              formula_right = 'predominant_activity')
#' }
#'
#' @import magrittr
#' @importFrom dplyr group_by
#' @importFrom dplyr do
#' @importFrom dplyr ungroup
#' @importFrom dplyr arrange
#' @importFrom dplyr mutate
#' @importFrom dplyr filter
#' @importFrom generics tidy
#' @importFrom generics glance
#' @importFrom stats p.adjust
#' @importFrom stats na.omit
#' @importFrom stats lm
#' @importFrom stats as.formula
#' @importFrom stats symnum
#' @export linear_model
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
linear_model <- function(input_table,
                         grouped_by,
                         multiple_groups = FALSE,
                         adjust_method,
                         filter_adj_p_value = FALSE,
                         formula_left,
                         formula_right){
  ## linear modeling
  funky_formula <- paste(formula_left, formula_right, sep = "~")
  pre_lm <- input_table %>%
              stats::na.omit() %>%
              dplyr::group_by(input_table[grouped_by]) %>%
              dplyr::do(generics::glance(stats::lm(stats::as.formula(funky_formula),
                        data = .))) %>%
              dplyr::ungroup() %>%
              stats::na.omit() %>%
              dplyr::mutate(p.adj = stats::p.adjust(.data$p.value,
                                                    method = adjust_method))

  if (multiple_groups == TRUE) {
    pre_lm <- pre_lm %>%
                dplyr::mutate(test_id = paste(.data[[grouped_by[1]]],
                                              .data[[grouped_by[2]]],
                                              sep = "_"))

    alt_input <- input_table %>%
                  dplyr::mutate(test_id = paste(.data[[grouped_by[1]]],
                                                .data[[grouped_by[2]]],
                                                sep = "_"))
  } else {
    pre_lm <- pre_lm %>%
                dplyr::mutate(test_id = paste(.data[[grouped_by[1]]]))

    alt_input <- input_table %>%
                  dplyr::mutate(test_id = paste(.data[[grouped_by[1]]]))
  }

  if (filter_adj_p_value == TRUE) {
    pre_lm <- pre_lm %>%
                dplyr::filter(.data$p.adj <= 0.05)

    linear_model_results <- alt_input %>%
                              stats::na.omit() %>%
                              dplyr::group_by(input_table[grouped_by]) %>%
                              dplyr::filter(.data$test_id %in% pre_lm$test_id) %>%
                              dplyr::do(generics::tidy(stats::lm(stats::as.formula(funky_formula),
                                                                 data = .))) %>%
                              stats::na.omit() %>%
                              dplyr::filter(term != '(Intercept)')
  } else {
    pre_lm

    linear_model_results <- alt_input %>%
                              stats::na.omit() %>%
                              dplyr::group_by(input_table[grouped_by]) %>%
                              dplyr::filter(.data$test_id %in% pre_lm$test_id) %>%
                              dplyr::do(generics::tidy(stats::lm(stats::as.formula(funky_formula),
                                                                 data = .))) %>%
                              stats::na.omit() %>%
                              dplyr::filter(term != '(Intercept)')
  }

  ## assigning p-value significance
  linear_model_results['signif'] <- stats::symnum(linear_model_results$p.value,
                                                  cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                                  symbols = c("****", "***", "**", "*", "ns"),
                                                  abbr.colnames = FALSE,
                                                  na = "")
  return(linear_model_results)
}
