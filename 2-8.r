library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "8")

x <- data$x
y <- data$y

plot <- ggplot(data, aes(x = `x`, y = `y`)) +
    geom_point() +
    labs(
        title = "2-8-1:新保单数目与加班工作时间",
        x = "保单数目",
        y = "加班工作时间（小时）"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-8-1.jpg", plot = plot, width = 8, height = 6, dpi = 300)

print("回归方程：")
model <- lm(y ~ x)
print(summary(model))

print("标准误差sigma：")
n <- length(y)
rss <- sum(model$residuals^2)
standard_error <- sqrt(rss / (n - 2))
print(standard_error)

print("回归系数的区间估计：")
print(confint(model, level = 0.95))

print("决定系数：")
print(summary(model)$r.squared)

print("方差分析:")
anova_results <- anova(model)
print(anova_results)

print("系数的显著性检验：")
print(confint(model, level = 0.95))

print("相关系数的显著性检验:")
print(cor.test(x, y))

print("2-8-2:残差图")
data <- data.frame(
    Fitted_Values = model$fitted.values,
    Residuals = resid(model)
)

plot <- ggplot(data, aes(x = Fitted_Values, y = Residuals)) +
    geom_point() +
    geom_hline(yintercept = 0, color = "#ff0000", linetype = "dashed") +
    labs(x = "Fitted Values", y = "Residuals", title = "残差图") +
    theme_minimal()

print(plot)
ggsave("./img/2-8-2.jpg", plot = plot, width = 8, height = 6, dpi = 300)


x0 <- 1000
y0 <- predict(model, newdata = data.frame(x = x0), se.fit = TRUE)
se_fit <- y0$se.fit
n <- nrow(data)
t_value <- qt(0.975, df = n - 2) # t分布的95% 置信区间
lower_bound <- y0$fit - t_value * se_fit
upper_bound <- y0$fit + t_value * se_fit
cat("se_fit:", se_fit, "\n")
cat("在", x0, "处的预测值为:", y0$fit, "\n")
cat("95% 置信区间:", lower_bound, "到", upper_bound, "\n")
