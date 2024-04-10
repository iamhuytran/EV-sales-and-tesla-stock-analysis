library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)

#importing csv file
EV_sales <- read_csv("C:/Users/diamo/Downloads/vsc_python/EV_sales.csv")

#checking datatypes
sapply(EV_sales,class)

#making sure the plotting of the month is in chronological order
EV_sales$Year_Month = forcats::fct_inorder(EV_sales$Year_Month)

#plotting
EV_sales_plot <- ggplot(data = EV_sales, aes(x = Year_Month))
EV_sales_plot <- EV_sales_plot + geom_line(aes(y = Sales, group = 1), color = 'orange')
EV_sales_plot <- EV_sales_plot + theme(legend.position = "none")
EV_sales_plot <- EV_sales_plot + theme_void()
EV_sales_plot <- EV_sales_plot + theme(
  panel.background = element_rect(fill = "transparent"), # bg of the panel
  plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
  panel.grid.major = element_blank(), # get rid of major grid
  panel.grid.minor = element_blank(), # get rid of minor grid
  legend.background = element_rect(fill = "transparent"), # get rid of legend bg
  legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
)
EV_sales_plot <- EV_sales_plot + ylim(0, 120000)
ggsave(filename = 'EV_sales_plot.png', device = 'png', bg = 'transparent')

#incrementing the x-axis
every_nth = function(n) {
  return(function(x) {x[c(TRUE, rep(FALSE, n - 1))]})
}
EV_sales_plot <- EV_sales_plot + scale_x_discrete(breaks = every_nth(n = 3))

EV_sales_plot

#plotting
price <- ggplot(data = Tesla, aes(x = record_date))
price <- price + geom_line(aes(y = price, group = 1), color = 'cyan')
price <- price + theme(legend.position = "none")
price <- price + theme_void()
price <- price + theme(
  panel.background = element_rect(fill = "transparent"), # bg of the panel
  plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
  panel.grid.major = element_blank(), # get rid of major grid
  panel.grid.minor = element_blank(), # get rid of minor grid
  legend.background = element_rect(fill = "transparent"), # get rid of legend bg
  legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
)
ggsave(filename = 'price.png', device = 'png', bg = 'transparent')

plot1 <- image_read('EV_sales_plot.png')
plot2 <- image_read('price.png')

overlay <- image_composite(plot1,plot2, "over")

overlay
