#Reading the file, I actually did not remember the code for just selecting tcertain rows 

df<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#Selecting only the rows for the project
df<-df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

#working on a copy of the original dataset

df1<-df

#changing format of date and time

df1$Datetime<-strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S")

#generating plot

png(filename = "plot4.png")
par(mfrow=c(2,2))
plot(df1$Datetime,df1$Global_active_power,type="l",xlab = "",ylab = "Global Active Power")
plot(df1$Datetime,df1$Voltage,type="l",xlab = "datetime",ylab = "Voltage")
plot(df1$Datetime,df1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(df1$Datetime,df1$Sub_metering_1,type="l",col="black")
points(df1$Datetime,df1$Sub_metering_2,type="l",col="red")
points(df1$Datetime,df1$Sub_metering_3,type="l",col="blue")

legend(x = "topright",y = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","blue","red"),lty=1)

plot(df1$Datetime,df1$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()