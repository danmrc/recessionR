#'Dates of recessions in USA, according to NBER (monthly)
#'
#'@format This data "human friendly", so it is actually a string of data in the format YYYY-MM-DD, and it is used by ggplot.This is not true to the data used in the base plot.Each dataset contains two columns:
#'\describe{
#' \item{start_date}{The month of the begin of a recession}
#' \item{end_date}{The month of the end of a recession}
#' }
#'
#'@source \url{https://fred.stlouisfed.org/series/USREC}
#'
"recession_m_ggplot"

#'Dates of recessions in USA, according to NBER (quartely)
#'
#'@format This data "human friendly", so it is actually a string of data in the format YYYY-MM-DD, and it is used by ggplot. This is not true to the data used in the base plot.Each dataset contains two columns:
#'\describe{
#' \item{start_date}{The quarter of the begin of a recession}
#' \item{end_date}{The quarter of the end of a recession}
#' }
#'
#'@source \url{https://fred.stlouisfed.org/series/USREC}
#'
"recession_q_ggplot"

#' Dates of recessions in USA, according to NBER (monthly)
#'

#'@format This data _is not_ "human friendly", it is a time in the format YYYY.Frac, which Frac is a fraction of the year. This is what you get if you take an \code{ts} object\code{x} and use \code{time(x)}.This is use by the base plot function. Each dataset contains two columns:
#'\describe{
#' \item{start_date}{The month of the beginning of a recession}
#' \item{end_date}{The month of the end of a recession}
#' }
#'
#'@source \url{https://fred.stlouisfed.org/series/USREC}
#'
"recessions_monthly"

#' Dates of recessions in USA, according to NBER (quartely)
#'

#'@format This data _is not_ "human friendly", it is a time in the format YYYY.Frac, which Frac is a fraction of the year. This is what you get if you take an \code{ts} object\code{x} and use \code{time(x)}. This is use by the base plot function. Each dataset contains two columns:
#'\describe{
#' \item{start_date}{The quarter of the beginning of a recession}
#' \item{end_date}{The quarter of the end of a recession}
#' }
#'
#'@source \url{https://fred.stlouisfed.org/series/USREC}
#'
"recessions_quartely"
