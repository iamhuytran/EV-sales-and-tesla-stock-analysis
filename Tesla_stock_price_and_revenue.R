library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)
library(magick)

#importing csv file
EV_sales <- read_csv("C:/Users/diamo/Downloads/vsc_python/EV_sales.csv");
Tesla <- read_csv("C:/Users/diamo/Downloads/vsc_python/tesla_stock.csv");
Revenue <- read_csv("C:/Users/diamo/Downloads/Tesla_revenue.csv");

#checking datatypes
sapply(EV_sales,class);
sapply(Tesla,class);

#making sure the plotting of the month is in chronological order
Revenue$record_date = forcats::fct_inorder(Revenue$record_date);

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
ggsave(filename = 'price.png', device = 'png', bg = 'transparent');

price;

#plotting
Revenue_plot <- ggplot(data = Revenue, aes(x = record_date))
Revenue_plot <- Revenue_plot + geom_col(aes(y = Revenue, group = 1), color = 'purple', alpha = 0.1)
Revenue_plot <- Revenue_plot + scale_x_discrete(limits=rev)

Revenue_plot <- Revenue_plot + theme_void()
Revenue_plot <- Revenue_plot + theme(
  panel.background = element_rect(fill = "transparent"), # bg of the panel
  plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
  panel.grid.major = element_blank(), # get rid of major grid
  panel.grid.minor = element_blank(), # get rid of minor grid
  legend.background = element_rect(fill = "transparent"), # get rid of legend bg
  legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
)
ggsave(filename = 'Revenue_plot.png', device = 'png', bg = 'transparent');

Revenue_plot;

plot1 <- image_read('price.png')
plot4 <- image_read('Revenue_plot.png')

overlay <- image_composite(plot4,plot1, "over")

overlay
