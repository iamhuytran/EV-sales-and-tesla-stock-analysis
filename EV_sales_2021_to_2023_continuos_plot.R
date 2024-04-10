library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)

df <- read_csv("C:/Users/diamo/Downloads/vsc_python/EV_sales.csv")

#checking datatypes
sapply(df,class)

#making sure the plotting of the month is in chronological order
df$Year_Month = forcats::fct_inorder(df$Year_Month)

#plotting
graph <- ggplot(data = df,aes(x = Year_Month))
graph <- graph + geom_line(aes(y = Sales, color = 'orange', group = 1))
graph <- graph + geom_point(aes(y = Sales, color = 'orange'))
graph <- graph + theme(legend.position = "none")
graph <- graph + ylim(0, 120000)
graph <- graph + labs(title = "EV Cars Sold in the US by Months",
                      x = "Months", y = "EV Cars Sold")
#incrementing the x-axis
every_nth = function(n) {
  return(function(x) {x[c(TRUE, rep(FALSE, n - 1))]})
}
graph <- graph + scale_x_discrete(breaks = every_nth(n = 3))

graph
