#' simple tables of confidence intervals for cancer incidence
#' @return a CSV file with columns as provided via \url{https://gis.cdc.gov/CANCER/USCS/#/StateCounty/}
#' @param site character(1) name of anatomic site, either "breast" or "prostate"
#' @param simple logical(1) defaults to TRUE, omits state and sex for demonstrative tables
#' @examples
#' btab = MA_cancer_rate_table("breast")
#' dim(btab)
#' names(btab)
#' @export
MA_cancer_rate_table = function(site="breast", simple=TRUE) {
 stopifnot(site %in% c("breast", "prostate"))
 if (site == "prostate") ans = read.csv(system.file("csv/MASSProstateWCI.csv", package="BiocYES"))
 ans = read.csv(system.file("csv/MABreastWCI.csv", package="BiocYES"))
 if (simple) ans = ans[, -c(1,5)]
 ans
}
