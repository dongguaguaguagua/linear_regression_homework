library(readxl)
library(ggplot2)

data <- read_excel("2data.xlsx", sheet = "5")

x <- data$产量x
y <- data$单位成本y

plot(x, y)

model <- lm(y ~ x)

# 计算置信区间
x0 <- 10
y0 <- predict(model, newdata = data.frame(x = x0), se.fit = TRUE)
se_fit <- y0$se.fit
n <- nrow(data)
t_value <- qt(0.975, df = n - 2) # t分布的95% 置信区间
print(t_value)
lower_bound <- y0$fit - t_value * se_fit
upper_bound <- y0$fit + t_value * se_fit

# 输出结果
cat("在", x0, "处的预测值为:", y0$fit, "\n")
cat("95% 置信区间:", lower_bound, "到", upper_bound, "\n")
