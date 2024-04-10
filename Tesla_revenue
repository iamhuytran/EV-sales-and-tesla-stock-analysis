library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)

#importing csv file
Tesla_revenue <- read_csv("C:/Users/diamo/Downloads/Tesla_revenue.csv")

#checking datatypes
sapply(Tesla_revenue,class)

#making sure the plotting of the month is in chronological order
Tesla_revenue$record_date = forcats::fct_inorder(Tesla_revenue$record_date)

#plotting
Revenue_plot <- ggplot(data = Tesla_revenue, aes(x = record_date, y = Revenue,
                                                 fill = Revenue))
Revenue_plot <- Revenue_plot + geom_col(aes(fill = Revenue)) 
Revenue_plot <- Revenue_plot + scale_fill_gradient(low = "red", high = "blue")
Revenue_plot <- Revenue_plot + scale_x_discrete(limits=rev)
Revenue_plot <- Revenue_plot + labs(title = "Tesla Revenue by Quarter Dates",
                                      x = "Date", y = "Revenue in Millions of $")

Revenue_plot
