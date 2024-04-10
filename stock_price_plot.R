library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)

#importing csv file
Tesla <- read_csv("C:/Users/diamo/Downloads/vsc_python/tesla_stock.csv")

#checking datatypes
sapply(EV_sales,class)

#plotting
Tesla_plot <- ggplot(data = Tesla, aes(x = record_date))
Tesla_plot <- Tesla_plot + geom_line(aes(y = price, group = 1), color = 'cyan')
Tesla_plot <- Tesla_plot + theme(legend.position = "none")
Tesla_plot <- Tesla_plot + labs(title = "Tesla Stock Prices by Years",
                                      x = "Year", y = "Price in Dollars")

Tesla_plot
