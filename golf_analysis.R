lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2015))
plot(pred,y_2015)
pred
coefficients <- coef(fit)
coefficients

fit <- cv.glmnet(as.matrix(full), full_y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X_2016))
plot(pred,y)
pred
coefficients <- coef(fit)
coefficients