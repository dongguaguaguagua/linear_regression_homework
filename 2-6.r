library(readxl)
library(ggplot2)

# 读取Excel文件中的“4”工作表
data <- read_excel("2data.xlsx", sheet = "6")

x <- data$含碳量x
y <- data$电阻y

plot <- ggplot(data, aes(x = `含碳量x`, y = `电阻y`)) +
    geom_point() +
    labs(
        title = "2-6:钢线含碳量和电阻散点图",
        x = "含碳量x",
        y = "电阻y"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-6.jpg", plot = plot, width = 8, height = 6, dpi = 300)


model <- lm(y ~ x)
print(summary(model, digits = digits, maxsum = maxsum))
anova_results <- anova(model)
print(anova_results)
print(confint(model, level = 0.95))

x0 <- 0.5
y0 <- predict(model, newdata = data.frame(x = x0), se.fit = TRUE)
se_fit <- y0$se.fit
n <- nrow(data)
t_value <- qt(0.975, df = n - 2) # t分布的95% 置信区间
print(se_fit)
lower_bound <- y0$fit - t_value * se_fit
upper_bound <- y0$fit + t_value * se_fit

# 输出结果
cat("在", x0, "处的预测值为:", y0$fit, "\n")
cat("95% 置信区间:", lower_bound, "到", upper_bound, "\n")
