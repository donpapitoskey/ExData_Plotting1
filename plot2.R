#Reading the file, I actually did not remember the code for just selecting tcertain rows 

df<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)

#Selecting only the rows for the project
df<-df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

#working on a copy of the original dataset

df1<-df

#changing format of date and time

df1$Datetime<-strptime(paste(df$Date,df$Time),format = "%d/%m/%Y %H:%M:%S")

#generating plot

png(filename = "plot2.png")
plot(df1$Datetime,df1$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()