#' geographic information from statcrunch.com on metropolitan statistical areas
#' @docType data
#' @format data.frame
"statcrunch_msa"

#' locations of US counties
#' @docType data
#' @format sf instance
"us_county_geo"

#' cancer rate data by metropolitan statistical area, 1999-2018, from CDC WONDER system
#' @docType data
#' @format data.frame
#' @note Created by joining statcrunch location data to result of WONDER request.
#' See woncan_meta for details.
"woncan"

#' metadata on cancer rate data by metropolitan statistical area, 1999-2018, from CDC WONDER system
#' @docType data
#' @format character
"woncan_meta"
