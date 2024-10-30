library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "14")

x <- data$年份
y <- data$石油产量

plot <- ggplot(data, aes(x = `年份`, y = `石油产量`)) +
    geom_point() +
    labs(
        title = "2-14-1:年份与石油产量（未变换）",
        x = "年份x",
        y = "石油产量y"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-14-1.jpg", plot = plot, width = 8, height = 6, dpi = 300)

Y <- log(y)
model <- lm(Y ~ x)
print(summary(model))
beta_0 <- coef(model)[1]
beta_1 <- coef(model)[2]
a <- exp(beta_0)
b <- beta_1
cat("拟合结果: y =", a, "* e^(", b, "* x)\n")


plot <- ggplot(data, aes(x = `年份`, y = log(`石油产量`))) +
    geom_point() +
    labs(
        title = "2-14-2:年份与石油产量（对石油产量取log后）",
        x = "年份x",
        y = "石油产量y"
    ) +
    theme_minimal()
print(plot)

ggsave("./img/2-14-2.jpg", plot = plot, width = 8, height = 6, dpi = 300)
