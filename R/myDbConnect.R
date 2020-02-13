#' Connect to the SQL database
#'
#' @param db.info A list with fields: user, password, dbname, and host 
#' @export
MyDbConnect = function(db.info) {
    con = dbConnect(MySQL(), user=db.info$user, password=db.info$password,
                    dbname=db.info$dbname, host=db.info$host) 
    return(con)
}

.dbConnect <- function(...) { myDbConnect(...) }
