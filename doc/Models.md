# Available Statistics/Models
*In alphabetical order*


## Adagrad
Stochastic adaptive gradient descent for a given model.  See Stochastic Gradient Methods.

## CovarianceMatrix
Analytical covariance matrix.

## Diff
Track the last value and last difference.

## Diffs
Track the last value and last difference for several variables.

## FiveNumberSummary  
Univariate five number summary using exact maximum/minimum and approximate .25, .5, and .75 quantiles.

## LinReg
Analytical linear regression.

## Mean
Analytical sample mean.

## Means
Analytical sample means, similar to `mean(x, 1)`.

## Moments
First four non-central moments.  Tracks mean, variance, skewness, and kurtosis.

## Momentum
Stochastic gradient descent with momentum for a given model.  See Stochastic Gradient Methods.

## NormalMix
Univariate normal mixture via an online EM algorithm.

## Principal Components Analysis
`pca(o)` where `type(o)` = `CovarianceMatrix`

## SGD
Stochastic gradient descent for a given model.  See Stochastic Gradient Methods.

## SparseReg
Sparse regression.  A type to experiment with regularized regression.  Currently only OLS and Ridge is supported.  TODO: Lasso, elastic net, etc.

## StepwiseReg
Stepwise regression.  With each update, there is the possibility of a variable entering or leaving the model.

## Summary
Summary statistics: mean, variance, maximum, and minimum.

## QuantileMM
Approximate quantiles using an online MM algorithm.

## QuantRegMM
Approximate quantile regression using an online MM algorithm.

## Variance
Analytical sample variance.

## Variances
Analytical sample variances, similar to `var(x, 1)`.


## Fitting a Parametric Distribution

Estimating the parameters of a distribution in an online setting can be done using `distributionfit(Dist, y, args...)` where `Dist` is one of the following:

- `Bernoulli`
- `Beta`
- `Binomial`
- `Cauchy`
- `Dirichlet`
- `Exponential`
- `Gamma`
- `LogNormal`
- `Multinomial`
- `MvNormal`
- `Normal`
- `Poisson`