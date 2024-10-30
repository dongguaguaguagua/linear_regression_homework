library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "10")

x <- data$人均国民收入
y <- data$人均消费金额

plot <- ggplot(data, aes(x = `人均国民收入`, y = `人均消费金额`)) +
    geom_point() +
    labs(
        title = "2-10:人均国民收入与人均消费金额",
        x = "人均国民收入x",
        y = "人均消费金额y"
    ) +
    theme_minimal()

print(plot)
ggsave("./img/2-10.jpg", plot = plot, width = 8, height = 6, dpi = 300)

print(summary(lm(y ~ x), digits = digits, maxsum = maxsum))
