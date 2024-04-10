library("readxl")
library(ggplot2)
library(dplyr)

#importing excel file
EV_car_sales <- read_excel("C:/Users/diamo/Downloads/EV_car_sales.xlsx")
df <- EV_car_sales[-c(1:4,17:20),] 

#change columns' names
names(df) <- c("Months", "Year_2021", "Year_2022", "Year_2023")

#convert to strings
str(df)

#change datatypes to numeric
df$Year_2021 <- as.numeric(as.character(df$Year_2021))
df$Year_2022 <- as.numeric(as.character(df$Year_2022))
df$Year_2023 <- as.numeric(as.character(df$Year_2023))

#checking the datatypes
sapply(df,class)

#ordering of the months in the x-axis
df$Months <- factor(df$Months, levels = month.name)

#plotting
graph <- ggplot(data = df,aes(x = Months))
graph <- graph + geom_line(aes(y = Year_2023, color = 'red', group = 1))
graph <- graph + geom_point(aes(y = Year_2023, color = 'red'))
graph <- graph + geom_line(aes(y = Year_2022, color = 'green', group = 1))
graph <- graph + geom_point(aes(y = Year_2022, color = 'green'))
graph <- graph + geom_line(aes(y = Year_2021, color = 'blue', group = 1))
graph <- graph + geom_point(aes(y = Year_2021, color = 'blue'))
graph <- graph + theme_classic()
graph <- graph + scale_color_manual(name = "Year"
                                    , labels = c("2021", "2022", "2023")
                                    , values = c("blue", "green", "red"))
graph <- graph + scale_x_discrete(breaks = every_nth(n = 1))
graph <- graph + ylim(0, 120000)
graph <- graph + labs(title = "EV Cars Sold in the US by Months",
                      x = "Month", y = "EV Cars Sold")

graph

#export tables to csv
#write.csv(df, "C:/Users/diamo/Downloads/R Studio Exported CSV/ EV_car_sales.csv", row.names=FALSE)



