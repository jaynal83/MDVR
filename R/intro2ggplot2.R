library(ggplot2)
xdat <- read.csv("anscombe_quartet_modified.csv")

# step-1: Define the plot and map the aesthetics
plot1 <- ggplot(data = xdat, aes(x=x, y=y))
print(plot1)

# step-2: Adding facet (panel for each group)
plot1 <- plot1 + facet_wrap(~group)
print(plot1)

# step-3: Adding points to the plot
plot1 <- plot1 + geom_point()
print(plot1)

# step-4: Modifying colour, shape, and size of the points
plot1 <- plot1 + geom_point(size = 5, fill = "red", color = "darkgreen", shape = 21)
print(plot1)

# step-5: Adding fitted line (linear fit)
plot1 <- plot1 + geom_smooth(method = "lm")
print(plot1)

# step-6: removing confidence interval and modify line type, size and colour
plot1 <- plot1 + geom_smooth(method = "lm", se = F, linetype = 1, size = 2, col = "orange")
print(plot1)

# step-7: Removing background colour
plot1 <- plot1 + theme_bw()
print(plot1)

# step-8: Adding plot title and subtitle
plot1 <- plot1 + ggtitle(
  label = "Anscombe Quartet", 
  subtitle = "Scatter plot"
  ) 
print(plot1)

# step-9: Modifying size, colour and position of plot title
plot1 <- plot1 + theme(
    plot.title = element_text(
      size = 25, 
      face = "bold", 
      color = "orange", 
      hjust = 0.5),
    plot.subtitle = element_text(
      size = 15, 
      face = "italic", 
      colour = "darkgreen", 
      hjust = 0.5)
  )
print(plot1)

# step-10 exporting the graph as high quality png file 
png("plot1.png",res = 1500, height = 8, width = 8, units = "in")
ggplot(data = xdat, aes(x=x, y=y))+
  facet_wrap(~group)+
  geom_point(size = 5, fill = "red", color = "darkgreen", shape = 21)+
  geom_smooth(method = "lm", se = F, linetype = 1, size = 2, col = "orange")+
  theme_bw()+
  ggtitle(
    label = "Anscombe Quartet", 
    subtitle = "Scatter plot"
  )+
  theme(
    plot.title = element_text(
      size = 25, 
      face = "bold", 
      color = "orange", 
      hjust = 0.5),
    plot.subtitle = element_text(
      size = 15, 
      face = "italic", 
      colour = "darkgreen", 
      hjust = 0.5)
  )
dev.off()

