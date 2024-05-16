#' Run a Linear Model
#'
#' @description
#'
#' `linear_model()` returns a named list containing dataframes with your Kruskal-Wallis and Dunn's
#' Post Hoc test results.
#'
#'
#' @examples
#' # extracting results from the named list
#' \dontrun{
#' kruskal_dunn_results <- kruskal_dunn_stats(input_table = my_table,
#'                                            grouped_by = 'location',
#'                                            adjust_method = 'BH',
#'                                            filter_adj_p_value = TRUE,
#'                                            formula_left = 'blood_sugar',
#'                                            formula_right = 'sex')
#' kruskal <- kruskal_dunn_results$KruskalTest
#' dunn <- kruskal_dunn_results$DunnTest
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
linear_model <- function(input_table,
                         grouped_by,
                         adjust_method,
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
                                                    method = adjust_method)) %>%
              dplyr::filter(.data$p.adj <= 0.05)

  pre_lm <- pre_lm %>%
              dplyr::mutate(test_id = paste(.data[[grouped_by[1]]], .data[[grouped_by[2]]], sep = "_"))

  linear_model_results <- input_table %>%
                            stats::na.omit() %>%
                            dplyr::group_by(input_table[grouped_by]) %>%
                            dplyr::mutate(test_id = paste(.data[[grouped_by[1]]], .data[[grouped_by[2]]],
                                                          sep = "_")) %>%
                            dplyr::filter(.data$test_id %in% pre_lm$test_id) %>%
                            dplyr::do(generics::tidy(stats::lm(stats::as.formula(funky_formula),
                                       data = .))) %>%
                            stats::na.omit() %>%
                            dplyr::filter(term != '(Intercept)')

  linear_model_results['signif'] <- stats::symnum(linear_model_results$p.value,
                                                  cutpoints = c(0, 0.0001, 0.001, 0.01, 0.05, 1),
                                                  symbols = c("****", "***", "**", "*", "ns"),
                                                  abbr.colnames = FALSE,
                                                  na = "")
  return(linear_model_results)
}
