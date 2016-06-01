source('final script.R')

# uploading data from 2013

basic <- read.csv('Masters Data 2013 - Basic Data 2013 (1).csv')
d1 <- read.csv('Masters Data 2013 - Birdie Conversions 2013.csv')
d2 <- read.csv('Masters Data 2013 - Bounce Back 2013.csv')
d3 <- read.csv('Masters Data 2013 - Club Head Speed 2013.csv')
d4 <- read.csv('Masters Data 2013 - Going for the Green 2013.csv')
d5 <- read.csv('Masters Data 2013 - Greens Hit in Regulation 2013.csv')
d6 <- read.csv('Masters Data 2013 - Hit Fairway % 2013.csv')
d7 <- read.csv('Masters Data 2013 - One Putt % 2013.csv')
d8 <- read.csv('Masters Data 2013 - Par 5 Scoring Avg 2013.csv')
d9 <- read.csv('Masters Data 2013 - Proximity to the Hole 2013.csv')
d10 <- read.csv('Masters Data 2013 - Putts Per Round 2013.csv')
d11 <- read.csv('Masters Data 2013 - Rough Tendency 2013.csv')
d12 <- read.csv('Masters Data 2013 - Sand Save Percentage 2013.csv')
d13 <- read.csv('Masters Data 2013 - Scoring Average 2013.csv')
d14 <- read.csv('Masters Data 2013 - Scrambling 2013.csv')
d15 <- read.csv('Masters Data 2013 - Strokes Gained Putting 2013.csv')
d16 <- read.csv('Masters Data 2013 - Strokes Gained Tee to Green 2013.csv')
results <- read.csv('Masters Data 2013 - RESULTS 2013.csv')

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
  left_join(d16, by = "PLAYER") 