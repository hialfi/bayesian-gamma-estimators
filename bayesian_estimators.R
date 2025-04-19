# -------------------------------
# Posterior Distribution Parameters
# -------------------------------
alpha_post <- 55     # shape
lambda_post <- 56.5  # rate

# -------------------------------
# 1. Define the posterior PDF manually
# -------------------------------
posterior_pdf <- function(x) {
  ifelse(x <= 0, 0,
         (lambda_post^alpha_post / gamma(alpha_post)) *
           x^(alpha_post - 1) * exp(-lambda_post * x))
}

# -------------------------------
# 2. Compute estimators
# -------------------------------

# Posterior mean (quadratic loss)
posterior_mean <- alpha_post / lambda_post

# Posterior mode (zero-one loss)
posterior_mode <- if (alpha_post >= 1) (alpha_post - 1) / lambda_post else NA

# Posterior median (absolute loss) – numerical integration
posterior_cdf <- Vectorize(function(x) {
  integrate(posterior_pdf, lower = 0, upper = x)$value
})
posterior_median <- uniroot(function(x) posterior_cdf(x) - 0.5,
                            lower = 0.01, upper = 2)$root

# -------------------------------
# 3. Print Estimation Results
# -------------------------------
cat("Bayesian Estimators for c (Gamma(55, 56.5))\n")
cat("--------------------------------------------------\n")
cat(sprintf("Posterior Mean   (Quadratic Loss): %.4f\n", posterior_mean))
cat(sprintf("Posterior Median (Absolute Loss) : %.4f\n", posterior_median))
cat(sprintf("Posterior Mode   (Zero-One Loss) : %.4f\n", posterior_mode))
cat("--------------------------------------------------\n")

# All three estimates of c are close to each other (around 0.97), suggesting a high concentration of posterior belief about the value of c in this range.
# The posterior distribution is slightly skewed to the right, which is typical for Gamma distributions with these parameters.
# The mean is slightly greater than the median, and the mode is the smallest among the three.
# The choice of estimator depends on the type of loss:
# If we care more about large errors (e.g., squared errors), we use the mean.
# If we want a more robust estimate (less sensitive to outliers), we use the median.
# If we only care about the most likely single value, we use the mode.

# -------------------------------
# 4. Plot Posterior with Estimators
# -------------------------------
x_vals <- seq(0, 2, length.out = 1000)
y_vals <- posterior_pdf(x_vals)

plot(x_vals, y_vals, type = "l", lwd = 2, col = "darkgrey",
     main = "Posterior Distribution of c with Bayesian Estimators",
     xlab = "c", ylab = "Posterior Density")

# Add vertical lines for the estimators
abline(v = posterior_mean, col = "deeppink", lwd = 2, lty = 2)
abline(v = posterior_median, col = "blue", lwd = 2, lty = 3)
abline(v = posterior_mode, col = "green", lwd = 2, lty = 4)

# Add legend
legend("topright", legend = c("Posterior Mean", "Posterior Median", "Posterior Mode"),
       col = c("deeppink", "blue", "green"), lty = c(2, 3, 4), lwd = 2)
