library(dplyr)
library(ggplot2)
library(corrgram)
library(glmnet)
library(NMF)

# read in data
basic <- read.csv('Masters Data 2014 - Basic data (1).csv')
d1 <- read.csv('Masters Data 2014 - Birdie Conversions 2014.csv')
d2 <- read.csv('Masters Data 2014 - Bounce Back 2014.csv')
d3 <- read.csv('Masters Data 2014 - Club Head Speed 2014.csv')
d4 <- read.csv('Masters Data 2014 - Going for the Green 2014 (1).csv')
d5 <- read.csv('Masters Data 2014 - Greens Hit in Regulation 2014.csv')
d6 <- read.csv('Masters Data 2014 - Hit Fairway Percentage 2014.csv')
d7 <- read.csv('Masters Data 2014 - One Putt Percentage.csv')
d8 <- read.csv('Masters Data 2014 - Par 3 Scoring Average (1).csv')
d9 <- read.csv('Masters Data 2014 - Par 4 Scoring Average.csv')
d10 <- read.csv('Masters Data 2014 - Par 5 Scoring Average.csv')
d11 <- read.csv('Masters Data 2014 - Proximity to the Hole 2014.csv')
d12 <- read.csv('Masters Data 2014 - Putts Per Round 2014.csv')
d13 <- read.csv('Masters Data 2014 - Rough Tendency 2014.csv')
d14 <- read.csv('Masters Data 2014 - Sand Save Percentage 2014.csv')
d15 <- read.csv('Masters Data 2014 - Scoring Average.csv')
d16 <- read.csv('Masters Data 2014 - Scrambling 2014.csv')
d17 <- read.csv('Masters Data 2014 - Strokes Gained Putting.csv')
d18 <- read.csv('Masters Data 2014 - Strokes Gained Tee to Green 2014.csv')
d19 <- read.csv('Masters Data 2014 - Total Putting.csv')
d20 <- read.csv('Masters Data 2014 - Total Putts Gained.csv')
results <- read.csv('Masters Data 2014 - RESULTS.csv')

data <- basic %>% 
  left_join(d1, by = "PLAYER") %>% 
  left_join(d2, by = "PLAYER") %>% 
  left_join(d3, by = "PLAYER") %>% 
  left_join(d4, by = "PLAYER") %>% 
  left_join(d5, by = "PLAYER") %>% 
  left_join(d6, by = "PLAYER") %>% 
  left_join(d7, by = "PLAYER") %>% 
  left_join(d8, by = "PLAYER") %>% 
  left_join(d9, by = "PLAYER") %>% 
  left_join(d10, by = "PLAYER") %>% 
  left_join(d11, by = "PLAYER") %>%
  left_join(d12, by = "PLAYER") %>% 
  left_join(d13, by = "PLAYER") %>% 
  left_join(d14, by = "PLAYER") %>% 
  left_join(d15, by = "PLAYER") %>% 
  left_join(d16, by = "PLAYER") %>% 
  left_join(d17, by = "PLAYER") %>% 
  left_join(d18, by = "PLAYER") %>% 
  left_join(d19, by = "PLAYER") %>% 
  left_join(d20, by = "PLAYER") %>% 
  left_join(results, by = "PLAYER")

data <- data[!is.na(data$POS),] # only take players who participated in Masters
y <- as.vector(data$POS)
row.names(data) <- paste(data$PLAYER, "2014", sep = "")
data <- select(data, -PLAYER) # set player names as row names, remove from data frame
for(i in 1:ncol(data)){ # set missing values to mean of that column
  data[is.na(data[,i]), i] <- mean(data[,i], na.rm = TRUE)
}
X <- select(data, -POS) # matrix without response variable

# how do factors relate to each other?
corrgram(X)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(X), y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X))
plot(pred,y)
pred
coefficients <- coef(fit)
coefficients

# NMF
nneg <- X
nneg[nneg<0] <- 0
fact <- nmf(nneg, rank = 3)
coefmap(fact)
basismap(fact)