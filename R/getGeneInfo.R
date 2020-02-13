#' Get gene information
#'
#' @param gene HGNC gene symbol
#' @return data.frame of gene info
#' @examples
#' get.gene.info('PCSK9')
#' @export
getGeneInfo = function(gene,
                         con=NULL, db.info=.fah.dbinfo) {
    if (is.null(con)) {
        con = dbConnect(db.info=db.info)
        on.exit(dbDisconnect(con))
    }
    sql = sprintf("select * from gene_master 
                where gene_symbol = '%s' 
                and ens_gene_id like 'ENSG%%'", gene)
    genes = dbGetQuery(con, sql)
    return(genes)  
}
