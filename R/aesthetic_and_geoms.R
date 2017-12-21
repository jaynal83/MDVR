# Session-3: Aesthetic mapping & geometric object in ggplot2

## The dataset

library(nycflights13)
ncol(flights)
nrow(flights)
names(flights)
head(flights)

## Plotting

library(ggplot2)
ggplot(data = flights, aes(x=dep_delay, y=arr_delay))


ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point()+
  geom_smooth()


ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point(aes(x=month))+
  geom_smooth()

ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point(aes(x=month))+
  geom_smooth(aes(x=month))


## Aesthetic mapping Vs setting

ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point(aes(col=origin))


ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point(col="darkgreen")


ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
  geom_point(aes(col="darkgreen"))


## The use of alpha

ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
geom_point(aes(col=origin))

ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
geom_point(aes(col=origin), alpha=0.3)

## Single axis aesthetic

ggplot(data = flights, aes(x=dep_delay))+
geom_histogram()

ggplot(data = flights, aes(x=dep_delay))+
geom_histogram()+
geom_freqpoly()


## Writing customized text within plot area

ggplot(data = flights, aes(x=dep_delay, y=arr_delay))+
geom_point()+
geom_text(aes(x=250, y=1000, label="Y=a+bx"))




