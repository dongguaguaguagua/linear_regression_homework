library(readxl)

data <- read_excel("3data.xlsx", sheet = "7")
x1 <- data$x1
x2 <- data$x2
y <- data$y

model <- lm(y ~ x1 + x2, data = data)
print(summary(model, digits = digits, maxsum = maxsum))
# print(qt(0.975, df = 15, lower.tail = FALSE))

# 计算置信区间
x01 <- 10
x02 <- 480
y0 <- predict(model, newdata = data.frame(x1 = x01, x2 = x02), se.fit = TRUE)
se_fit <- y0$se.fit
n <- nrow(data)
t_value <- qt(0.975, df = n - 3) # t分布的95% 置信区间
cat("t:", t_value, "\n")
cat("se_fit:", se_fit, "\n")
lower_bound <- y0$fit - t_value * se_fit
upper_bound <- y0$fit + t_value * se_fit
cat("预测值为:", y0$fit, "\n")
cat("95% 置信区间:", lower_bound, "到", upper_bound, "\n")


print(anova(model))
