source('final script.R')
data_2014 <- select(data, -PAR.3, -PAR.4, -greens.hit, -GIR.RANK, -TOTAL, -AVERAGE,
                    -TOTAL.PUTTS.GAINED, -AGE)
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
data_2013 <- select(data_2013, -PLAYER, -AGE) # set player names as row names, remove from data frame
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

data_2012 <- data_2012[!is.na(data_2012$POS),] # only take players who participated in Masters
y_2012 <- as.vector(data_2012$POS)
row.names(data_2012) <- data_2012$PLAYER
data_2012 <- select(data_2012, -PLAYER, -AGE) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2012)){ # set missing values to mean of that column
  data_2012[is.na(data_2012[,i]), i] <- mean(data_2012[,i], na.rm = TRUE)
}
X_2012 <- select(data_2012, -POS) # matrix without response variable

# adding 2011

basic <- read.csv('Masters Data 2011 - Basic Data 2011.csv')
d1 <- read.csv('Masters Data 2011 - Birdie Conversions 2011.csv')
d2 <- read.csv('Masters Data 2011 - Bounce Back 2011.csv')
d3 <- read.csv('Masters Data 2011 - Club Head Speed 2011.csv')
d4 <- read.csv('Masters Data 2011 - Going for the Green 20111.csv')
d5 <- read.csv('Masters Data 2011 - Hit Fairway % 2011.csv')
d6 <- read.csv('Masters Data 2011 - One Putt % 2011.csv')
d7 <- read.csv('Masters Data 2011 - Par 5 Scoring Average 2011.csv')
d8 <- read.csv('Masters Data 2011 - Proximity to the Hole 2011.csv')
d9 <- read.csv('Masters Data 2011 - Putts Per Round 2011.csv')
d10 <- read.csv('Masters Data 2011 - Rough Tendency 2011.csv')
d11 <- read.csv('Masters Data 2011 - Sand Save % 2011.csv')
d12 <- read.csv('Masters Data 2011 - Scoring Average 2011.csv')
d13 <- read.csv('Masters Data 2011 - Scrambling 2011.csv')
d14 <- read.csv('Masters Data 2011 - Strokes Gained Putting 2011.csv')
d15 <- read.csv('Masters Data 2011 - Strokes Gained Tee to Green 2011.csv')
results <- read.csv('Masters Data 2011 - RESULTS.csv')

data_2011 <- basic %>% 
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

data_2011 <- data_2011[!is.na(data_2011$POS),] # only take players who participated in Masters
y_2011 <- as.vector(data_2011$POS)
row.names(data_2011) <- data_2011$PLAYER
data_2011 <- select(data_2011, -PLAYER, -AGE) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2011)){ # set missing values to mean of that column
  data_2011[is.na(data_2011[,i]), i] <- mean(data_2011[,i], na.rm = TRUE)
}
X_2011 <- select(data_2011, -POS) # matrix without response variable

# add data from 2010

basic <- read.csv('Masters Data 2010 - Basic Data 2010.csv')
d1 <- read.csv('Masters Data 2010 - Birdie Conversions 2010.csv')
d2 <- read.csv('Masters Data 2010 - Bounce Back 2010.csv')
d3 <- read.csv('Masters Data 2010 - Club Head Speed 2010.csv')
d4 <- read.csv('Masters Data 2010 - Going for the Green 2010.csv')
d5 <- read.csv('Masters Data 2010 - Hit Fairway % 2010.csv')
d6 <- read.csv('Masters Data 2010 - One Putt % 2010.csv')
d7 <- read.csv('Masters Data 2010 - Par 5 Scoring Average 2010.csv')
d8 <- read.csv('Masters Data 2010 - Proximity to the Hole 2010.csv')
d9 <- read.csv('Masters Data 2010 - Putts Per Round 2010.csv')
d10 <- read.csv('Masters Data 2010 - Rough Tendency 2010.csv')
d11 <- read.csv('Masters Data 2010 - Sand Save % 2010.csv')
d12 <- read.csv('Masters Data 2010 - Scoring Average 2010.csv')
d13 <- read.csv('Masters Data 2010 - Scrambling 2010.csv')
d14 <- read.csv('Masters Data 2010 - Strokes Gained Putting 2010.csv')
d15 <- read.csv('Masters Data 2010 - Strokes Gained Tee to Green 2010.csv')
results <- read.csv('Masters Data 2010 - RESULTS (1).csv')

data_2010 <- basic %>% 
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

data_2010 <- data_2010[!is.na(data_2010$POS),] # only take players who participated in Masters
y_2010 <- as.vector(data_2010$POS)
row.names(data_2010) <- data_2010$PLAYER
data_2010 <- select(data_2010, -PLAYER) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2010)){ # set missing values to mean of that column
  data_2010[is.na(data_2010[,i]), i] <- mean(data_2010[,i], na.rm = TRUE)
}
X_2010 <- select(data_2010, -POS) # matrix without response variable

# uploading data from 2015 (test set)

basic <- read.csv('Masters Data 2015 - Basic Data 2015.csv')
d1 <- read.csv('Masters Data 2015 - Birdie Conversions 2015.csv')
d2 <- read.csv('Masters Data 2015 - Bounce Back 2015.csv')
d3 <- read.csv('Masters Data 2015 - Club Head Speed 2015.csv')
d4 <- read.csv('Masters Data 2015 - Going for the Green 2015.csv')
d5 <- read.csv('Masters Data 2015 - Hit Fairway % 2015.csv')
d6 <- read.csv('Masters Data 2015 - One Putt % 2015.csv')
d7 <- read.csv('Masters Data 2015 - Par 5 Scoring Average 2015.csv')
d8 <- read.csv('Masters Data 2015 - Proximity to the Hole 2015.csv')
d9 <- read.csv('Masters Data 2015 - Putts Per Round 2015.csv')
d10 <- read.csv('Masters Data 2015 - Rough Tendency 2015.csv')
d11 <- read.csv('Masters Data 2015 - Sand Save % 2015.csv')
d12 <- read.csv('Masters Data 2015 - Scoring Average 2015.csv')
d13 <- read.csv('Masters Data 2015 - Scrambling 2015.csv')
d14 <- read.csv('Masters Data 2015 - Strokes Gained Putting 2015.csv')
d15 <- read.csv('Masters Data 2015 - Strokes Gained Tee to Green 2015.csv')
results <- read.csv('Masters Data 2015 - RESULTS.csv')

data_2015 <- basic %>% 
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

data_2015 <- data_2015[!is.na(data_2015$POS),] # only take players who participated in Masters
y_2015 <- as.vector(data_2015$POS)
row.names(data_2015) <- data_2015$PLAYER
data_2015 <- select(data_2015, -PLAYER) # set player names as row names, remove from data frame
for(i in 1:ncol(data_2015)){ # set missing values to mean of that column
  data_2015[is.na(data_2015[,i]), i] <- mean(data_2015[,i], na.rm = TRUE)
}
X_2015 <- select(data_2015, -POS) # matrix without response variable

# uploading data from 2016 (future test)

# join all sets

full <- rbind(X_2014, X_2013, X_2012, X_2011, X_2010)
full_y <- c(y, y_2013, y_2012, y_2011, y_2010)
