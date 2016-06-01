source('final script.R')
data_2014 <- select(data, -PAR.3, -PAR.4, -greens.hit, -GIR.RANK, -TOTAL, -AVERAGE,
                    -TOTAL.PUTTS.GAINED)
X_2014 <- select(data_2014, -POS)

# uploading data from 2013

basic <- read.csv('Masters Data 2013 - Basic Data 2013 (1).csv')
d1 <- read.csv('Masters Data 2013 - Birdie Conversions 2013.csv')
d2 <- read.csv('Masters Data 2013 - Bounce Back 2013.csv')
d3 <- read.csv('Masters Data 2013 - Club Head Speed 2013.csv')
d4 <- read.csv('Masters Data 2013 - Going for the Green 2013.csv')
d5 <- read.csv('Masters Data 2013 - Hit Fairway % 2013.csv')
d6 <- read.csv('Masters Data 2013 - One Putt % 2013.csv')
d7 <- read.csv('Masters Data 2013 - Par 5 Scoring Avg 2013.csv')
d8 <- read.csv('Masters Data 2013 - Proximity to the Hole 2013.csv')
d9 <- read.csv('Masters Data 2013 - Putts Per Round 2013.csv')
d10 <- read.csv('Masters Data 2013 - Rough Tendency 2013.csv')
d11 <- read.csv('Masters Data 2013 - Sand Save Percentage 2013.csv')
d12 <- read.csv('Masters Data 2013 - Scoring Average 2013.csv')
d13 <- read.csv('Masters Data 2013 - Scrambling 2013.csv')
d14 <- read.csv('Masters Data 2013 - Strokes Gained Putting 2013.csv')
d15 <- read.csv('Masters Data 2013 - Strokes Gained Tee to Green 2013.csv')
results <- read.csv('Masters Data 2013 - RESULTS 2013.csv')

data_2013 <- basic %>% 
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
  left_join(results, by = "PLAYER")

data_2013 <- data_2013[!is.na(data_2013$POS),] # only take players who participated in Masters
y_2013 <- as.vector(data_2013$POS)
row.names(data_2013) <- data_2013$PLAYER
data_2013 <- select(data_2013, -PLAYER) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2013)){ # set missing values to mean of that column
  data_2013[is.na(data_2013[,i]), i] <- mean(data_2013[,i], na.rm = TRUE)
}
X_2013 <- select(data_2013, -POS) # matrix without response variable

# add data from 2012

basic <- read.csv('Masters Data 2012 - Basic Data 2012.csv')
d1 <- read.csv('Masters Data 2012 - Birdie Conversions 2012.csv')
d2 <- read.csv('Masters Data 2012 - Bounce Back 2012.csv')
d3 <- read.csv('Masters Data 2012 - Club Head Speed 2012.csv')
d4 <- read.csv('Masters Data 2012 - Going for the Green 2012.csv')
d5 <- read.csv('Masters Data 2012 - Hit Fairway % 2012.csv')
d6 <- read.csv('Masters Data 2012 - One Putt % 2012.csv')
d7 <- read.csv('Masters Data 2012 - Par 5 Scoring Average 2012.csv')
d8 <- read.csv('Masters Data 2012 - Proximity to the Hole 2012.csv')
d9 <- read.csv('Masters Data 2012 - Putts Per Round 2012.csv')
d10 <- read.csv('Masters Data 2012 - Rough Tendency 2012.csv')
d11 <- read.csv('Masters Data 2012 - Sand Save % 2012.csv')
d12 <- read.csv('Masters Data 2012 - Scoring Average 2012.csv')
d13 <- read.csv('Masters Data 2012 - Scrambling 2012.csv')
d14 <- read.csv('Masters Data 2012 - Strokes Gained Putting.csv')
d15 <- read.csv('Masters Data 2012 - Strokes Gained Tee to Green 2012.csv')
results <- read.csv('Masters Data 2012 - RESULTS.csv')

data_2012 <- basic %>% 
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
  left_join(results, by = "PLAYER")

data_2012$POS <- as.numeric(data_2012$POS)
data_2012$AGE <- as.numeric(data_2012$POS)
data_2012 <- data_2012[!is.na(data_2012$POS),] # only take players who participated in Masters
y_2012 <- as.vector(data_2012$POS)
row.names(data_2012) <- data_2012$PLAYER
data_2012 <- select(data_2012, -PLAYER) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2012)){ # set missing values to mean of that column
  data_2012[is.na(data_2012[,i]), i] <- mean(data_2012[,i], na.rm = TRUE)
}
X_2012 <- select(data_2012, -POS) # matrix without response variable

# adding 2011




# join all sets

full <- rbind(X_2014, X_2013, X_2012)

