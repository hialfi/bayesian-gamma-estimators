# Bayesian Estimators for Posterior Gamma Distribution

This R script demonstrates how to compute Bayesian estimators (posterior mean, median, and mode) for a Gamma-distributed posterior using different loss functions: quadratic, absolute, and zero-one loss. It also includes a visualization of the posterior distribution with all three estimators highlighted.

## 🔍 Problem Overview

Given a posterior distribution assumed to follow a Gamma distribution with:
- Shape (`alpha_post`) = 55
- Rate (`lambda_post`) = 56.5

We aim to estimate the unknown parameter `c` using:
- **Posterior Mean** (Quadratic Loss)
- **Posterior Median** (Absolute Loss)
- **Posterior Mode** (Zero-One Loss)

## 📈 Output

The script:
- Defines the posterior PDF manually.
- Computes and prints the three estimators.
- Plots the posterior distribution with vertical lines for each estimator.

## 📦 Features

- Manual definition of the Gamma posterior PDF.
- Numerical integration for computing the posterior CDF and median.
- Custom plotting with R base graphics.
- Clear explanation of estimator interpretation.

## 🛠️ How to Run

Make sure you have R installed. Then run the script using:

```R
source("bayesian_estimators.R")
