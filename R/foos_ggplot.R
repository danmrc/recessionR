#' Loads the dates of begining and ending of recessions acording to NBER to be used with ggplot2
#'
#' @param periodicity What is the periodicity of data used. Only accepts (q)uartely or (m)onthly. You can use the whole word or only the first letter
#' @return An matrix with two columns: the first is the beggining of the recession according to NBER and the second column the end
#' @note The diference between this command and \code{\link{nber_load}} is that this one uses dates in the usual way (human readable), while \code{\link{nber_load}} uses the \code{ts} convention, i.e. year.fraction
#' @seealso \code{\link{nber_load}}
nber_load_ggplot <- function(periodicity){
  if(periodicity == "q"|periodicity == "quartely"){
    dados <- recession_dates_quartely_ggplot
  } else if(periodicity == "m"|periodicity == "monthly"){
    dados <- recession_dates_monthly_ggplot
  } else{
    stop("Periodicity must be quarters of months")
  }
  return(dados)
}

#'Cuts to get the dates of recessions between two dates
#'
#'@param periodicity What is the periodicity of data used. Only accepts (q)uartely or (m)onthly. You can use the whole word or only the first letter
#'@param start_date The start date in \code{\link{Dates}} format
#'@param end_date The ending date in \code{\link{Dates}} format
#'
#'@return A dataframe with two columns, the first with the start date of all recessions between \code{start_date} and \code{end_date} and the second column with the end date of all recessions between \code{start_date} and \code{end_date}
#'
recession_dates_ggplot <- function(periodicity,start_date,end_date){
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package \"ggplot2\" needed for this function to work. Please install it.",
         call. = FALSE)
  }
  dados_gg <- nber_load_ggplot(periodicity = periodicity)
  start_log <- start_date > dados_gg$start_date
  end_log <- end_date < dados_gg$end_date

  start_log <- rle(start_log)
  end_log <- rle(end_log)

  if(length(start_log$values) == 1){
    first_date <- 1
  } else {
    first_date <- start_log$lengths[1] + 1
  }


  if(length(end_log$values) == 1){
    end_date <- nrow(dados_gg)
  } else {
    end_date <- end_log$length[1]
  }

  new_rec <- dados_gg[first_date:end_date,]
  return(new_rec)
}

#'A convenient wrapper to plot shadded areas in ggplot2 in periods of recession
#'
#'@param periodicity What is the periodicity of data used. Only accepts (q)uartely or (m)onthly. You can use the whole word or only the first letter
#'@param start_date The start date in \code{\link{Dates}} format
#'@param end_date The ending date in \code{\link{Dates}} format
#'@param alpha The transparency. Defaults to 0.3
#'
#'@return This should be used with a ggplot. Will shade the areas where there were recessions
#'
#'@note This basically call \code{\link{geom_rect}} from ggplot2 using data that was loaded and cutted with \code{\link{recession_dates_ggplot}}
#'
#'@seealso \code{\link{recession_dates_ggplot}}
#'
#'@examples
#'x <- rnorm(500)
#'today <- Sys.Date()
#'datess <- rev(seq(today,length.out = 500, by = "-1 month"))
#'
#'ddata <- data.frame(Dates = datess, x = x)
#'
#'ggplot() + geom_line(data = ddata, aes(Dates,x)) + nber_recession_ggplot("m",start_date = ddata[1,1],end_date =  ddata[500,1])
#'
nber_recession_ggplot <- function(periodicity,start_date,end_date,alpha = 0.3){
  dados_rec_ggplot <- recession_dates_ggplot(periodicity = periodicity,start_date = start_date,end_date = end_date)
  return(ggplot2::geom_rect(data = dados_rec_ggplot,aes(xmin=start_date,xmax=end_date,ymin=-Inf,ymax=Inf,alpha = alpha)))
}
