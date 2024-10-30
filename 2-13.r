library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "13")

x <- data$销售额x
y <- data$流通费率y

plot <- ggplot(data, aes(x = `销售额x`, y = `流通费率y`)) +
    geom_point() +
    labs(
        title = "2-13:销售额与流通费率",
        x = "销售额x",
        y = "流通费率y"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-13.jpg", plot = plot, width = 8, height = 6, dpi = 300)

# 拟合双曲线模型
z <- 1 / x
model <- lm(y ~ z)
x0 <- 9
z0 <- 1 / x0
y0 <- predict(model, newdata = data.frame(z = z0), se.fit = TRUE)
print(y0)
