lambda = exp(seq(-10,0,length = 100))
fit <- cv.glmnet(as.matrix(X), y, alpha = 0, standardize = F, lambda= lambda)
pred <- predict(fit, as.matrix(X))
plot(pred,y)
pred
coefficients <- coef(fit)
coefficients