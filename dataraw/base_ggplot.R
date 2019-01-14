##### Quartely #####

rm(list=ls())

dados <- read.csv("./dataraw/USRECQ.csv")

rec_dum <- ts(dados[,2],start=c(1854,04),freq=4)
datas <- as.Date(dados[,1])

recession <- which(rec_dum == 1)

datas_rec <- datas[recession]

aux <- datas_rec[1]

reptions <- rle(as.vector(rec_dum))
position_c <- cumsum(reptions$lengths)

pos_end <- position_c[seq(1,length(position_c),by=2)]
end_date <- datas[pos_end]

pos_start <- position_c+1
pos_start<- pos_start[seq(2,length(position_c),by=2)]
start_date <- datas[pos_start]
start_date <- c(aux,start_date)
start_date <- start_date[1:34]

recession_dates_quartely_ggplot <- data.frame(start_date,end_date)

save(recession_dates_quartely_ggplot, file =  "./data/recession_q_ggplor.Rdata")

##### Monthly #####

rm(list=ls())

dados <- read.csv("./dataraw/USRECM.csv")

rec_dum <- ts(dados[,2],start=c(1854,04),freq=12)
datas <- as.Date(dados[,1])

recession <- which(rec_dum == 1)

datas_rec <- datas[recession]

aux <- datas_rec[1]

reptions <- rle(as.vector(rec_dum))
position_c <- cumsum(reptions$lengths)

pos_end <- position_c[seq(1,length(position_c),by=2)]
end_date <- datas[pos_end]

pos_start <- position_c+1
pos_start<- pos_start[seq(2,length(position_c),by=2)]
start_date <- datas[pos_start]
start_date <- c(aux,start_date)
start_date <- start_date[1:34]

recession_dates_monthly_ggplot <- data.frame(start_date,end_date)

save(recession_dates_monthly_ggplot, file =  "./data/recession_m_ggplot.Rdata")
