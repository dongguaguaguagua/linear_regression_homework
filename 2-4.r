library(readxl)
library(ggplot2)

# 读取Excel文件中的“4”工作表
data <- read_excel("2data.xlsx", sheet = "4")
x <- data$家庭人均收入x
y <- data$人均食品支出y

# 创建散点图
plot <- ggplot(data, aes(x = `家庭人均收入x`, y = `人均食品支出y`)) +
  geom_point() +
  labs(
    title = "2-4:家庭人均收入与人均食品支出散点图",
    x = "家庭人均收入",
    y = "人均食品支出"
  ) +
  theme_minimal()
ggsave("./img/2-4.jpg", plot = plot, width = 8, height = 6, dpi = 300)
print(plot)
model <- lm(y ~ x)
print(summary(model))
# print(plot)
# anova: analysis of varience
anova_results <- anova(model)
print(anova_results)

