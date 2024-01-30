install.packages("usethis")
library(usethis)
create_github_token()
install.packages("gitcreds")
library(gitcreds)
gitcreds_set()
# Setting random number seeds for reproducible results
set.seed(123)

# Simulated data
# Assume that the true values have a mean of 175 and a standard deviation of 5
# Assume that each student's measurements have different means and standard deviations
true_values <- rnorm(20, mean = 175, sd = 5)
edward_values <- rnorm(20, mean = 174, sd = 5)
hugo_values <- rnorm(20, mean = 176, sd = 5)
lucy_values <- rnorm(20, mean = 177, sd = 5)

# Creating Data Frames
data <- data.frame(
  true_values,
  edward_values,
  hugo_values,
  lucy_values
)

# Three t-tests were conducted to compare the difference between the measured and true values for each student
t_test_edward <- t.test(data$edward_values, data$true_values, paired = TRUE)
t_test_hugo <- t.test(data$hugo_values, data$true_values, paired = TRUE)
t_test_lucy <- t.test(data$lucy_values, data$true_values, paired = TRUE)

# Output t test results
list(t_test_edward = t_test_edward,
     t_test_hugo = t_test_hugo,
     t_test_lucy = t_test_lucy)
# Load necessary libraries
install.packages("ggplot2")
# Load necessary libraries
library(ggplot2)

# Assume 'data' is the data frame created with the simulated data
# Plotting the true values and the measured values by Edward, Hugo, and Lucy with points
p <- ggplot(data, aes(x = 1:nrow(data))) +
  geom_point(aes(y = true_values, colour = "True Values"), size = 2) +
  geom_point(aes(y = edward_values, colour = "Edward's Measurements"), size = 2) +
  geom_point(aes(y = hugo_values, colour = "Hugo's Measurements"), size = 2) +
  geom_point(aes(y = lucy_values, colour = "Lucy's Measurements"), size = 2) +
  labs(title = "Comparison of True Values and Measurements with Points", x = "Observation", y = "Values") +
  theme_minimal() +
  scale_colour_manual(values = c("True Values" = "blue", 
                                 "Edward's Measurements" = "red", 
                                 "Hugo's Measurements" = "green",
                                 "Lucy's Measurements" = "purple"))

# Print the plot
print(p)

