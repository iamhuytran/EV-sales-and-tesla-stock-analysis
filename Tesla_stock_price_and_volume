library("readxl")
library(ggplot2)
library(dplyr)
library(readr)
library(forcats)

#importing csv file
Tesla <- read_csv("C:/Users/diamo/Downloads/vsc_python/tesla_stock.csv")

#checking datatypes
sapply(Tesla,class)

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

price

volume <- ggplot(data = Tesla, aes(x = record_date))
volume <- volume + geom_col(aes(y = volume, group = 1), color = 'brown')
volume <- volume + theme_void()
volume <- volume + theme(
  panel.background = element_rect(fill = "transparent"), # bg of the panel
  plot.background = element_rect(fill = "transparent", color = NA), # bg of the plot
  panel.grid.major = element_blank(), # get rid of major grid
  panel.grid.minor = element_blank(), # get rid of minor grid
  legend.background = element_rect(fill = "transparent"), # get rid of legend bg
  legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
)

ggsave(filename = 'volume.png', device = 'png', bg = 'transparent')

volume

plot2 <- image_read('price.png')
plot3 <- image_read('volume.png')

overlay <- image_composite(plot3,plot2, "over")

overlay
