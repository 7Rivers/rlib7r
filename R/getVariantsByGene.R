#' Get variants in a gene
#' 
#' @param gene HGNC gene symbol
#' @param vep_var_impact One of {HIGH, LOW, MODERATE, MODIFIER, NA}
#' @param canonical If true, limit to canonical transcipts
#' @examples
#' get.variants.by.gene(gene='PCSK9', vep_var_impact='HIGH', canonical=TRUE)
#' @export
getVariantsByGene = function(gene, vep_var_impact=NULL, canonical=TRUE, 
                                con=NULL, db.info=.fah.dbinfo) {
    if (is.null(con)) {
        con = dbConnect(db.info=db.info)
        on.exit(dbDisconnect(con))
    }
    sql = sprintf("select * from gene_annotation where gene_name = '%s'", gene)
    if (canonical) sql = paste(sql, "and canonical_tras = 'Y'")
    if (!is.null(vep_var_impact)) 
        sql = paste0(sql, "and vep_var_impact = '", vep_var_impact, "'")
    variants = dbGetQuery(con, sql)
    return(variants)
}

