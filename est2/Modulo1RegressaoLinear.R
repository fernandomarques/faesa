LungDisease <- read.csv("LungDisease.csv")
head(LungDisease)

library(ggplot2)
cor(LungDisease$Exposure,LungDisease$PEFR)
ggplot(LungDisease, aes(y=PEFR,x=Exposure)) + geom_point()

model <- lm(PEFR ~ Exposure, data= LungDisease)
model 

ggplot(data=LungDisease, aes(y=PEFR, x= Exposure)) + 
  geom_point() + 
  geom_abline(slope = model$coefficients[2],
              intercept = model$coefficients[1]) +
  geom_smooth(method="lm")

model$residuals
model$fitted.values
summary(model)
RMSE(model$fitted.values,LungDisease$PEFR)
##
## Multi variaveis
##

house <- read.csv("house_sales.csv")
head(house[, c("AdjSalePrice", "SqFtTotLiving", 
               "SqFtLot", "Bathrooms", "Bedrooms",
               "BldgGrade")])

house_lm <- lm(AdjSalePrice ~ SqFtTotLiving + SqFtLot +
                 Bathrooms + Bedrooms + BldgGrade, 
               data=house, na.action=na.omit)
house_lm

summary(house_lm)

# K-Fold com caret

library(caret)
flds <- createFolds(LungDisease$Exposure)
train <- LungDisease [-flds[[1]],]
test <- LungDisease[flds[[1]],]
model_fold <- lm(PEFR ~ Exposure, data= train)

predicted <- predict(model_fold,test)
predicted - test$PEFR
# Lembrando que o RMSE quanto menor melhor
# RMSE -> Root Mean Squarred Error
RMSE(predicted, test$PEFR)
RMSE(model_fold$fitted.values, train$PEFR)

#
# Regressão passo a passo
#
# Não faça isso! 
house_full <- lm(AdjSalePrice ~ SqFtTotLiving +
                   SqFtLot + Bathrooms + Bedrooms +
                   BldgGrade + PropertyType +
                   NbrLivingUnits + SqFtFinBasement +
                   YrBuilt + YrRenovated + NewConstruction,
                 data=house, na.action=na.omit)
summary(house_full)
summary(house_lm)
RMSE_FULL <- RMSE(house_full$fitted.values,
                  house$AdjSalePrice)
RMSE_LM <- RMSE(house_lm$fitted.values, house$AdjSalePrice)
RMSE_FULL - RMSE_LM

AIC(house_full,house_lm)

library(MASS)
step <- stepAIC(house_full, direction="both")

##
## Regressão Ponderada
##
library(lubridate)
house$Year = year(house$DocumentDate)
house$Weight = house$Year - 2005
house_wt <- lm(AdjSalePrice ~ SqFtTotLiving +
                 SqFtLot + Bathrooms + 
                 Bedrooms + BldgGrade,
               data=house, weight=Weight, na.action=na.omit)
round(cbind(house_lm=house_lm$coefficients, 
            house_wt=house_wt$coefficients), digits=3)


