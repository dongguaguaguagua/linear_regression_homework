library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "12")

x <- data$x
y <- data$y

plot <- ggplot(data, aes(x = `x`, y = `y`)) +
    geom_point() +
    labs(
        title = "2-12:名义利率与通货膨胀率",
        x = "通货膨胀率",
        y = "名义利率"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-12.jpg", plot = plot, width = 8, height = 6, dpi = 300)

print(summary(lm(y ~ x)))
