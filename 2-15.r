library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "15")

x <- data$平日发行量
y <- data$周日发行量

plot <- ggplot(data, aes(x = `平日发行量`, y = `周日发行量`)) +
    geom_point() +
    labs(
        title = "2-15:报纸发行量",
        x = "平日发行量",
        y = "周日发行量"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-15.jpg", plot = plot, width = 8, height = 6, dpi = 300)

model <- lm(y ~ x)
print(summary(model))

print(confint(model, level = 0.95))
print(anova(model))

x0 <- 500
y0 <- predict(model, newdata = data.frame(x = x0), se.fit = TRUE)
se_fit <- y0$se.fit
n <- nrow(data)
t_value <- qt(0.975, df = n - 2) # t分布的95% 置信区间
lower_bound <- y0$fit - t_value * se_fit
upper_bound <- y0$fit + t_value * se_fit
cat("se_fit:", se_fit, "\n")
cat("在", x0, "处的预测值为:", y0$fit, "\n")
cat("95% 置信区间:", lower_bound, "到", upper_bound, "\n")

