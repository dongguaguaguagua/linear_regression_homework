library(readxl)

data <- read_excel("3data.xlsx", sheet = "12")
x1 <- data$x1
x2 <- data$x2
y <- data$y
n <- nrow(data)

model <- lm(y ~ x1 + x2, data = data)
print(summary(model, digits = digits, maxsum = maxsum))
print(anova(model))

y_mean <- mean(y)
sst <- sum((y - y_mean)^2)
y_hat <- predict(model)
ssr <- sum((y_hat - y_mean)^2)
sse <- sum((y - y_hat)^2)
cat("总变差 (SST):", sst, "\n")
cat("解释变差 (SSR):", ssr, "\n")
cat("残差变差 (SSE):", sse, "\n")

print(qt(0.975, df = n - 2 - 1))
