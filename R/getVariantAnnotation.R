#' Fetches data from HGMD, OMIM, CLINVAR, and the variant summary table-materialized_view (variant QC stats, 
#' allele frequencies. and functional predictions.)
#' 
#' @param chrom Chromosome, as string, without the "chr" prefix
#' @param pos Position of the SNP. If structural variant, it's the start.
#' @param ref Reference allele
#' @param alt Alternative allele
#' @export
getVariantAnnotation <- function(chrom, pos, ref, alt, con=NULL, db.info) {
  if (is.null(con)) {
    con = dbConnect(db.info = db.info)
    on.exit(dbDisconnect(con))
  }
	sql = sprintf("
	SELECT mv.*, ha.*, ca.*, oa.*,	 
	FROM 
	  materialized_view mv
		LEFT JOIN
		hgmd_annotation ha ON mv.variant_id = ha.variant_id
		LEFT JOIN
		clinvar_annotation ca ON mv.variant_id = ca.variant_id
		LEFT JOIN
		omim_annotation oa ON mv.variant_id = oa.variant_id
		WHERE
	    vi.chrom = '%s' AND vi.start = '%s' AND  vi.ref='%s' AND vi.alt='%s';
  ", chrom, pos, ref, alt)
  var.info = dbGetQuery(con, sql)
  return(var.info)
}

getVarAnno.R <- function(...) {
  return(getVariantAnnotation(...))
}
