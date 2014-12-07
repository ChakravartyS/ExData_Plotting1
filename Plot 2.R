## ---- Plot 2.R script to plot Global Active Power vs Date-Time


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

## ---- Plot 2 (Plot Global Active Power vs Date-Time)

date.time.dt <- strptime ( paste (power.data.2.days.df $ Date, 
                                  power.data.2.days.df $ Time, 
                                  sep = " "),
                           "%d/%m/%Y %H:%M:%S"
                           )
png ("Plot 2.png")
plot (date.time.dt, 
      power.data.2.days.df $ Global_active_power, 
      type = "l",
      xlab = "",
      ylab = "Global Active Power (kilowatts)")
dev.off ()