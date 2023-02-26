# Logic responsible for creating the database connection.
# In other database packages, this could be very specific.
# Use a connections.R to manage the creation, resetting,
# and deletions (if neccessary) of your database connections.

#' Retrieve a connection from to the Lahman database.
#'
#' This example is simple, but you will most likely use
#' DBI::dbConnect for your connection. If connecting to
#' a secure database, you can store your credentials in
#' your .Renviron and utilize them for this function.
#'
#' @importFrom dbplyr lahman_sqlite
get_lahman_connection <- function(){
  conn <- dbplyr::lahman_sqlite()
  conn
}
