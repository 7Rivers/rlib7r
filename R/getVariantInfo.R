.src.to.dbtable = c('clinvar'='clinvar_annotation', 
                   'dbsnp'='dbsnp',
                   'exac'='exac',                 
                   '1000g'='g1000',
                   'gnomad'='gnomad',
                   'hgmd'='hgmd_annotation',
                   'jap1000g'='jap1000g',
                   'medvardb'='medvardb_annotation')
#' query DB tables for variant informaiton
#' 
#' @param snps Vector of SNPs in the format chr_pos_ref_alt
#' @param varids Vector of variant IDs
#' @param source Name of the dataset to pull from
#' @examples
#' getVariantInfo(varids=c(1221787, 1221983, 1222865), source='medvardb')
#' @export
getVariantInfo = function(snps, varids, source=names(.src.to.dbtable),
                          con=NULL, db.info) {
    source = match.arg(source)
    src.db = .src.to.dbtable[source] 
    if (is.null(con)) {
        con = .dbConnect(db.info=db.info)
        on.exit(dbDisconnect(con))
    }
    sql = sprintf("select * from %s where variant_id in (%s)", 
                  src.db, paste(varids, collapse=','))
    var.info = dbGetQuery(con, sql)
    return(var.info)
}

