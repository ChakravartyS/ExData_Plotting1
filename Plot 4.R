## ---- Plot 4.R script to plot Global Active Power, Voltage, Energy sub
##      metering and Global Reactive Power vs Date-Time in four separate plots
##      on a single page

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

## ---- Plot 4 (Plot Global Active Power, Voltage, Energy sub metering and
##      Global Reactive Power vs Date-Time in four separate plots on a page)

date.time.dt <- strptime ( paste (power.data.2.days.df $ Date, 
                                  power.data.2.days.df $ Time, 
                                  sep = " "),
                           "%d/%m/%Y %H:%M:%S"
)

png ("Plot 4.png")
par (mar = c(4, 4, 1, 1),
     mfrow = c(2,2))

## ---- Plot Global Active Power vs Date-Time
plot (date.time.dt, 
      power.data.2.days.df $ Global_active_power, 
      type = "l",
      xlab = "",
      ylab = "Global Active Power")

## ---- Plot Voltage vs Date-Time
plot (date.time.dt, 
      power.data.2.days.df $ Voltage, 
      type = "l",
      xlab = "datetime",
      ylab = "Voltage")

## ---- Plot Energy Sub Metering 1, 2 & 3 vs Date-Time
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
        lty = , 
        lwd = 2,
        bty = "n"
) 

## ---- Plot Global Reactive Power vs Date-Time
plot (date.time.dt, 
      power.data.2.days.df $ Global_reactive_power, 
      type = "l",
      xlab = "datetime",
      ylab = "Global_reactive_power")

dev.off ()