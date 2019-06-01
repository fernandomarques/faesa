world
library(ggplot2)

head(iris)

hist(iris$Sepal.Length)

ggplot(iris, aes(x=iris$Sepal.Length)) +
  geom_histogram(bins = 8)


par(mfrow = c(1, 3))
xlim <- range(iris$Sepal.Length)#use to ensure plots span same x
by(iris, iris$Species, function(x){
  hist(x$Sepal.Length, main = x$Species[1], 
       xlab = "Sepal length", xlim = xlim)
})

ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(bins = 12) +
  facet_wrap(~ Species)

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 12)

ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.4) # alpha gives transparency

library(gridExtra)
jt <- ggplot(iris, aes(x = Species, y = Sepal.Length, colour = Species)) +
  geom_jitter(height = 0, width = 0.3) #height and width specify the amount of jitter
bx <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot(notch = TRUE) #notch gives uncertainty of the median
vi <- ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_violin() #density plots on their side
gridExtra::grid.arrange(jt, bx, vi)