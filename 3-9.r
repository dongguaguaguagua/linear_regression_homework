library(readxl)

data <- read_excel("3data.xlsx", sheet = "9")
x1 <- data$x1
x2 <- data$x2
x3 <- data$x3
y <- data$y
n <- nrow(data)

data_subset <- data.frame(y, x1, x2, x3)
pairs(data_subset, main = "Scatter Plot Matrix of y, x1, x2, x3")

model <- lm(y ~ x1 + x2 + x3, data = data)
print(summary(model, digits = digits, maxsum = maxsum))

print(qt(0.975, df = 15))
