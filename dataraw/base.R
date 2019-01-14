##### Quartely #####

rec_dum <- read.csv("./dataraw/USRECQ.csv")

rec_dum <- ts(rec_dum[,2],start=c(1854,04),freq=4)

recession <- which(rec_dum == 1)
recession <- time(rec_dum)[recession]

auxq <- round(diff(recession),4) == 0.25

start_auxq <- which(auxq == F)+1
start_auxq <- c(1,start_auxq)

end_auxq <- which(auxq == F)-1
end_auxq <- c(end_auxq, length(recession))

start_datesq <- recession[start_auxq]
end_datesq <- c(1855.00,recession[end_auxq])

recessions_quartely <- cbind(start_datesq,end_datesq)

rect(xleft = start_datesq,xright = end_datesq,ytop=300,ybottom = -300, col = rgb(0,0,0,alpha = 0.3), border = NA)

#### Monthly ####

rec_dum_mon <- read.csv("USRECM.csv")

rec_dum_mon <- ts(rec_dum_mon[,2],start=c(1854,12),freq=12)

recession <- which(rec_dum_mon == 1)
recession <- time(rec_dum_mon)[recession]

aux <- round(diff(recession),4) == 0.0833

start_aux <- which(aux == F)+1
start_aux = c(1,start_aux)

end_aux <- c(which(aux == F)-1,length(aux))

start_dates <- recession[start_aux]
end_dates <- c(1855.000,recession[end_aux])

recessions_monthly <- cbind(start_dates,end_dates)

rect(xleft = start_dates,xright = end_dates,ytop=700,ybottom = -700, col = rgb(0,0,0,alpha = 0.3), border = NA)


