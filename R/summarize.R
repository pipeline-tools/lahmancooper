# It's common to create additional functionality
# that's specific to your use case, such as custom
# summarize functions, or even ggplot themes and scales.

#' Summarise any table with a salary column
#' @importFrom dplyr %>% summarize
#'
#' @export
summarize_salaries <- function(tbl) {
  tbl %>%
    summarise(salary = sum(salary, na.rm = T))
}
