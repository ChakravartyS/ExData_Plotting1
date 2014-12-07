## ---- Plot 3.R script to plot Energy Sub Metering 1, 2 & 3 vs Date-Time


## ---- Extract data from the dates 2007-02-01 and 2007-02-02 in supplied file

data.file.name.chr <- "household_power_consumption.txt"
power.data.df <- read.table (data.file.name.chr,
                             header=TRUE, 
                             sep=";",
                             na.strings = "?", 
                             nrows= 2100000, 
                             stringsAsFactors=TRUE 
)

power.data.2.days.df <- subset (power.data.df, 
                                Date %in% c ("1/2/2007", "2/2/2007"),
)

## ---- Plot 3 (Plot Energy Sub Metering 1, 2 & 3 vs Date-Time)

date.time.dt <- strptime ( paste (power.data.2.days.df $ Date, 
                                  power.data.2.days.df $ Time, 
                                  sep = " "),
                           "%d/%m/%Y %H:%M:%S"
                           )
png ("Plot 3.png")
plot (date.time.dt, 
      power.data.2.days.df $ Sub_metering_1, 
      type = "l", 
      xlab = "", 
      ylab = "Energy sub metering"
)
lines (date.time.dt, 
       power.data.2.days.df $ Sub_metering_2, 
       type = "l", 
       col = "red" 
)
lines (date.time.dt, 
       power.data.2.days.df $ Sub_metering_3, 
       type = "l", 
       col = "blue" 
)

legend ("topright", 
        c ("Sub_metering_1", 
           "Sub_metering_2",  
           "Sub_metering_3" 
        ), 
        col = c ("black", 
                 "red", 
                 "blue" 
        ), 
        lty = 1, 
        lwd = 2
) 
dev.off ()