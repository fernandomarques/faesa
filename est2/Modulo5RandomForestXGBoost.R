
sp500_px <- read.csv("sp500_data.csv")

df <- sp500_px[row.names(sp500_px)>='2011-01-01', c('XOM', 'CVX')]
set.seed(52)
km <- kmeans(df, nstart = 10,centers=4 )

km$centers
