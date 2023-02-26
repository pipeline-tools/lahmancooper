# The .onLoad and function runs when you
# run library(lahmancooper), and will create
# your DB accessor functions when the package is loaded.

#' Connect to the Lahman database and create
#' accessor funtions when the package is loaded.
#'
#' Note how the exportPattern below matches the con_id
#' ("lahman") in the call to dbc_init. This will ensure
#' all of your table accessor functions are exported to
#' the package namespace.
#'
#' @importFrom dbcooper dbc_init
#' @importFrom dplyr rename_all
#' @importFrom snakecase to_snake_case
#'
#' @exportPattern ^lahman_*
.onLoad <- function(libname, pkgname) {
  # Use the internal function to create a db connection (see connections.R)
  con <- get_lahman_connection()

  # Add tbl, query, execute, etc functions to the package
  package_env <- parent.env(environment())
  dbcooper::dbc_init(con,
                     "lahman",
                     env = package_env,
                     # nice clean column names
                     table_post = function(.) {dplyr::rename_all(., snakecase::to_snake_case)}
                     )
}

#' Clear connections when the pacakge is unloaded.
#'
#' @importFrom dbcooper dbc_clear_connections
.onUnload <- function(libpath){
  dbcooper::dbc_clear_connections()
}
