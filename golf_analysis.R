X_2016 <- dget("X_2016")
X_2015 <- dget("X_2015")
X_2014 <- dget("X_2014")
X_2013 <- dget("X_2013")
X_2012 <- dget("X_2012")
X_2011 <- dget("X_2011")
X_2010 <- dget("X_2010")

y_2016 <- dget("y_2016")
y_2015 <- dget("y_2015")
y_2014 <- dget("y_2014")
y_2013 <- dget("y_2013")
y_2012 <- dget("y_2012")
y_2011 <- dget("y_2011")
y_2010 <- dget("y_2010")

# predict 2017 results

full <- rbind(X_2015, X_2014, X_2013, X_2012, X_2011, X_2010)
full_y <- c(y_2015, y_2014, y_2013, y_2012, y_2011, y_2010)

fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize= F,lambda= lambda)
pred <- predict(fit, as.matrix(X_2016))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2016 results

full <- rbind(X_2014, X_2013, X_2012, X_2011, X_2010)
full_y <- c(y_2014, y_2013, y_2012, y_2011, y_2010)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2015))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2015 results

full <- rbind(X_2015, X_2013, X_2012, X_2011, X_2010)
full_y <- c(y_2015, y_2013, y_2012, y_2011, y_2010)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2014))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2014 results

full <- rbind(X_2015, X_2014, X_2012, X_2011, X_2010)
full_y <- c(y_2015, y_2014, y_2012, y_2011, y_2010)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2013))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2013 results

full <- rbind(X_2015, X_2014, X_2013, X_2011, X_2010)
full_y <- c(y_2015, y_2014, y_2013, y_2011, y_2010)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2012))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2012 results

full <- rbind(X_2015, X_2014, X_2013, X_2012, X_2010)
full_y <- c(y_2015, y_2014, y_2013, y_2012, y_2010)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2011))
View(pred)
coefficients <- coef(fit)
coefficients

# predict 2011 results

full <- rbind(X_2015, X_2014, X_2013, X_2012, X_2011)
full_y <- c(y_2015, y_2014, y_2013, y_2012, y_2011)

lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2010))
View(pred)
coefficients <- coef(fit)
coefficients