##round(poisson.test(10*60,60)$conf,2)
##[1]  9.22 10.83
##attr(,"conf.level")
##[1] 0.95
## sigma <- 10; mu_0 = 0 ; mu_a = 2; n <- 100; alpha = .05
## plot(c(-3,6), c(0,dnorm(0)), type = "n", frame = FALSE, xlab= "Z value", ylab = "")
## xvals <- seq(-3,6, length= 1000)
## lines(xvals, dnorm(xvals), type="l", lwd=3)
##  lines(xvals, dnorm(xvals, mean = sqrt(n) * (mu_a - mu_0)/sigma), lwd=3)
## abline(v=qnorm(1-alpha))

## ppois(9,5, lower.tail=FALSE)
## power.t.test(n=16, delta=2/4, sd=1, type="one.sample", alt="one.sided")$power
##  power.t.test(power=.8, delta=2/4, sd=1, type="one.sample", alt="one.sided")$n

##  mpgMean <- mean(mtcars$mpg)
## mpgSd <- sd(mtcars$mpg)
## z <- qnorm(.05)


## m4 <- mtcars$mpg[mtcars$cyl == 4]
## m6 <- mtcars$mpg[mtcars$cyl == 6]
## p <- t.test(m4, m6, paired = FALSE, alternative="two.sided", var.equal=FALSE)$p.value

## A sample of 100 men yielded an average PSA level of 3.0 with a sd of 1.1. 
## What are the complete set of values that a 5% two sided Z test of 
## H0:??=??0 would fail to reject the null hypothesis for?
## 
## error <- qnorm(0.975)*s/sqrt(n)
## left <- a-error
## right <- a+error

## You believe the coin that you're flipping is biased towards heads. 
## You get 55 heads out of 100 flips.
## What's the exact relevant pvalue to 4 decimal places expressed as a proportion

## Note you have to start at 54 as it lower.tail = FALSE gives 
## the strictly greater than probabilities
## ans <- round(pbinom(54, prob = .5, size = 100, lower.tail = FALSE),4)

## A web site was monitored for a year and it received 520 hits per day.
## In the first 30 days in the next year, the site received 15,800 
## Assuming that web hits are Poisson.
## Give an exact one sided P-value to the hypothesis that web hits are up
## this year over last to four significant digits (expressed as a proportion).

## pv <- ppois(15800 - 1, lambda = 520 * 30, lower.tail = FALSE)

## Also, compare with the Gaussian approximation where ??^???N(??,??/t)
## pnorm(15800 / 30, mean = 520, sd = sqrt(520 / 30), lower.tail = FALSE)

## Suppose that in an AB test, one advertising scheme led to an average of 10 purchases 
## per day for a sample of 100 days, while the other led to 11 purchaces per day, 
## also for a sample of 100 days. Assuming a common standard deviation of 4 purchases per day. 
## Assuming that the groups are independent and that they days are iid, 
## perform a Z test of equivalence.
## What is the P-value reported to 3 digits expressed as a proportion?
## m1 <- 10; m2 <- 11
## n1 <- n2 <- 100
## s <- 4
## se <- s * sqrt(1 / n1 + 1 / n2)
## ts <- (m2 - m1) / se
## pv <- 2 * pnorm(-abs(ts))
##

## Consider two problems previous. Assuming that 10 purchases per day is a benchmark null value,
## that days are iid and that the standard deviation is 4 purchases for day. 
## Suppose that you plan on sampling 100 days. What would be the power for a 
## one sided 5% Z mean test that purchases per day have increased under the 
## alternative of ??=11 purchase per day?
## power <- pnorm(10 + qnorm(.95) * .4, mean = 11, sd = .4, lower.tail = FALSE)

## Researchers would like to conduct a study of healthy adults to detect a four year 
## mean brain volume loss of .01 mm3. Assume that the standard deviation of four year
## volume loss in this population is .04 mm3.
## What is necessary sample size for the study for a 5% one sided test versus a
## null hypothesis of no volume loss to acheive 80% power? (Always round up)
## n <- (qnorm(.95) + qnorm(.8)) ^ 2 * .04 ^ 2 / .01^2


## -----
library(ggplot2)
library(UsingR)
library(manipulate)
k <- 1000
xvals <- seq(-5, 5, length=k)
myplot <- function(df){
  d <- data.frame( y= c(dnorm(xvals),dt(xvals,df)),
                   x= xvals,
                   dist = fact(rep(c("Normal","T"), c(k,k)))
  g<- ggplot(d,aes(x=x,y=y))
  g<- g + geom_line(size=2,aes(colour=dist))
  g
}
manipulate(myplot(mu),mu=slider(1,20,step=1))

g <- ggplot(sleep, aes(x = group, y = extra, group = factor(ID)))
 g <- g + geom_line(size = 1, aes(colour = ID)) + geom_point(size =10, pch = 21, fill = "salmon", alpha = .5)
g