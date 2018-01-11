
library(nycflights13)
library(ggplot2)

ggplot(data = flights) + stat_bin(aes(x=dep_delay, y=..count..))

ggplot(data = flights) + stat_bin(aes(x=dep_delay, y=..count../sum(..count..)))


ggplot(data = flights) + stat_bin(aes(x=dep_delay, y=100*(..count../sum(..count..))))+
  ylab("Percentage")

ggplot(data = flights) + stat_bin(aes(x=dep_delay, y=..density..))+
  ylab("Density")

ggplot(data = flights) + stat_summary(aes(x=factor(month), y = dep_delay))

ggplot(data = flights, aes(x=factor(month), y = dep_delay)) + 
  stat_summary(fun.data="mean_cl_boot")

coefV <- function(y){
  sd(y, na.rm = T)/mean(y,na.rm = T)
}
ggplot(data = flights, aes(x=factor(month), y = dep_delay)) + 
  stat_summary(fun.y = coefV, geom = "point")


