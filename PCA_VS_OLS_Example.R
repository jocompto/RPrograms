# PRINCIPAL COMPONENT ANALYSIS (PCA) VS ORDINARY LEAST SQUARES (OLS): A VISUAL EXPLANATION
# Posted on September 16, 2010, 11:11 am, by JD Long,
# corrected errors in posted source code: plot on line 40; 
#                                         adjusted "" on colors
#                                         added alternative color to eigenVectors line



set.seed(2)
x <- 1:100

y <- 20 + 3 * x
e <- rnorm(100, 0, 60)
y <- 20 + 3 * x + e

plot(x,y)
yx.lm <- lm(y ~ x)
lines(x, predict(yx.lm), col="red")

xy.lm <- lm(x ~ y)
lines(predict(xy.lm), y, col="blue")


#normalize means and cbind together
xyNorm <- cbind(x=x-mean(x), y=y-mean(y))
plot(xyNorm)

#covariance
xyCov <- cov(xyNorm)
eigenValues <- eigen(xyCov)$values
eigenVectors <- eigen(xyCov)$vectors

plot(xyNorm, ylim=c(-200,200), xlim=c(-200,200))
lines(xyNorm[x], eigenVectors[2,1]/eigenVectors[1,1] * xyNorm[x])
lines(xyNorm[x], eigenVectors[2,2]/eigenVectors[1,2] * xyNorm[x])

# the largest eigenValue is the first one
# so that’s our principal component.
# but the principal component is in normalized terms (mean=0)
# and we want it back in real terms like our starting data
# so let’s denormalize it
plot(x,y)
lines(x, (eigenVectors[2,1]/eigenVectors[1,1] * xyNorm[x]) + mean(y), col="green")
# that looks right. line through the middle as expected

# what if we bring back our other two regressions 

lines(x, predict(yx.lm), col="red")
lines(predict(xy.lm), y, col="blue")

