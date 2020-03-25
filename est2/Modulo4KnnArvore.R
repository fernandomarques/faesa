
loan200 <- read.csv("loan200.csv")
head(loan200)

library(FNN)
newloan <- loan200[1, 2:3, drop=FALSE]
knn_pred <- knn(train=loan200[-1,2:3], test=newloan, cl=loan200[-1,1], k=20)
knn_pred == 'paid off'

## look at the nearest 20 records
loan200[attr(knn_pred, 'nn.index')-1, ]
dist <- attr(knn_pred, 'nn.dist')

## Funcao cria um circulo ao redor dos vizinhos
circleFun <- function(center = c(0,0), r = 1, npoints = 100){
  tt <- seq(0, 2*pi, length.out = npoints-1)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = c(xx, xx[1]), y = c(yy, yy[1])))
}
library(dplyr)
circle_df <- circleFun(center=unlist(newloan), r=max(dist), npoints=201)
loan200_df <- bind_cols(loan200, circle_df)

library(ggplot2)
ggplot(data=loan200_df, aes(x=payment_inc_ratio, dti, color=outcome, shape=outcome)) +
  geom_point(size=2) +
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9")) +
  scale_shape_manual(values = c(1, 4, 15)) +
  geom_path(aes(x=x, y=y), color='black') +
  xlim(3, 15) + 
  ylim(17, 29) +
  theme_bw() 

## Padronizando
loan_data <- read.csv("loan_data.csv")
loan_df <- model.matrix(~ -1 + payment_inc_ratio + dti + revol_bal + revol_util, data=loan_data)
newloan = loan_df[1,, drop=FALSE]
loan_df = loan_df[-1,]
outcome <- loan_data[-1,1]
knn_pred <- knn(train=loan_df, test=newloan, cl=outcome, k=5)
knn_pred
loan_df[attr(knn_pred,"nn.index"),] #observem a variavel revol_bal

# Dados padronizados
loan_df <- model.matrix(~ -1 + payment_inc_ratio + dti + revol_bal + revol_util, data=loan_data)
loan_std <- scale(loan_df) #Escala os dados
target_std = loan_std[1,, drop=FALSE]
loan_std = loan_std[-1,]
outcome <- loan_data[-1,1]
knn_pred <- knn(train=loan_std, test=target_std, cl=outcome, k=5)
knn_pred
loan_df[attr(knn_pred,"nn.index"),]


## Usando KNN para gerar características
borrow_df <- model.matrix(~ -1 + dti + revol_bal + revol_util + open_acc +
                            delinq_2yrs_zero + pub_rec_zero, data=loan_data)
borrow_knn <- knn(borrow_df, test=borrow_df, cl=loan_data[, 'outcome'], prob=TRUE, k=20)
prob <- attr(borrow_knn, "prob")
borrow_feature <- ifelse(borrow_knn=='default', 1-prob, prob)
summary(borrow_feature)

loan_data$borrower_score <- borrow_feature


## Arvores
library(rpart)
loan3000 <- read.csv("loan3000.csv")
loan_tree <- rpart(outcome ~ borrower_score + payment_inc_ratio,
                   data=loan3000, 
                   control = rpart.control(cp=.005))
plot(loan_tree, uniform=TRUE, margin=.05)
text(loan_tree, cex=.75)
# um grafico de arvore mais bonito
library(rattle)
fancyRpartPlot(loan_tree, cex = 0.8)

## Mostrando a arvore

r_tree <- data_frame(x1 = c(0.575, 0.375, 0.375, 0.375, 0.475),
                     x2 = c(0.575, 0.375, 0.575, 0.575, 0.475),
                     y1 = c(0,         0, 10.42, 4.426, 4.426),
                     y2 = c(25,       25, 10.42, 4.426, 10.42),
                     rule_number = factor(c(1, 2, 3, 4, 5)))
r_tree <- as.data.frame(r_tree)

labs <- data.frame(x=c(.575 + (1-.575)/2, 
                       .375/2, 
                       (.375 + .575)/2,
                       (.375 + .575)/2, 
                       (.475 + .575)/2, 
                       (.375 + .475)/2
),
y=c(12.5, 
    12.5,
    10.42 + (25-10.42)/2,
    4.426/2, 
    4.426 + (10.42-4.426)/2,
    4.426 + (10.42-4.426)/2
),
decision = factor(c('paid off', 'default', 'default', 'paid off', 'paid off', 'default')))



ggplot(data=loan3000, aes(x=borrower_score, y=payment_inc_ratio)) +
  geom_point( aes(color=outcome, shape=outcome), alpha=.5) +
  scale_color_manual(values=c('blue', 'red')) +
  scale_shape_manual(values = c(1, 46)) +
  # scale_shape_discrete(solid=FALSE) +
  geom_segment(data=r_tree, aes(x=x1, y=y1, xend=x2, yend=y2, linetype=rule_number), size=1.5, alpha=.7) +
  guides(colour = guide_legend(override.aes = list(size=1.5)),
         linetype = guide_legend(keywidth=3, override.aes = list(size=1))) +
  scale_x_continuous(expand=c(0,0)) + 
  scale_y_continuous(expand=c(0,0), limits=c(0, 25)) + 
  geom_label(data=labs, aes(x=x, y=y, label=decision)) +
  theme_bw()
