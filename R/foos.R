nber_load <- function(periodicity){
  if(periodicity == "q"|periodicity == "quartely"){
    load("./data/recessions_quartely.Rdata")
    dados <- recessions_quartely
  } else if(periodicity == "m"|periodicity == "monthly"){
    load("./data/recessions_monthly.Rdata")
    dados <- recessions_monthly
  } else{
    stop("Periodicity must be quarters of months")
  }
  return(dados)
}

#' Plot using base plot
#'
#'@param periodicity What is the periodicity of data used. Only accepts (q)uartely or (m)onthly. You can use the whole word or only the first letter
#'@param ytop,ybottom Controls the upper and lower limits of the shading. The default should be enough for most data
#'@param alpha Controls the transparency of the shade. Should be a number between 0 and 1
#'@return If there is a time series already plot, it should shade the back. Otherwise, it returns an error.
#'@examples
#' x <- rnorm(100)
#' x <- ts(x,start = c(1900,01),freq=4)
#' plot(x)
#' plot_recession("q")
plot_recession <- function(periodicity, ytop = 700, ybottom = -700,alpha = 0.3){
  dados <- nber_load(periodicity = periodicity)
  rect(xleft = dados[,1],xright = dados[,2], ytop = ytop,ybottom = ybottom, col = rgb(0,0,0,alpha = alpha), border = NA)
}
