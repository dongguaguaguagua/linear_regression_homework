library(readxl)
library(ggplot2)
data <- read_excel("2data.xlsx", sheet = "11")

x <- data$CPI
y <- data$`S&P500指数`

plot <- ggplot(data, aes(x = `CPI`, y = `S&P500指数`)) +
    geom_point() +
    labs(
        title = "2-11:CPI与S&P指数",
        x = "CPI指数",
        y = "S&P500指数"
    ) +
    theme_minimal()
print(plot)
ggsave("./img/2-11.jpg", plot = plot, width = 8, height = 6, dpi = 300)

print(summary(lm(y ~ x), digits = digits, maxsum = maxsum))
