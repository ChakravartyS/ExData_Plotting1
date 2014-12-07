## ---- Plot 1.R script to plot histogram of Global Active Power


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

## ---- Plot 1 (Plot histogram of Global Active Power)

png ("Plot 1.png")
hist (power.data.2.days.df $ Global_active_power, 
      main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)", 
      ylab = "Frequency", 
      col = "red")
dev.off ()