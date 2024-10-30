library(readxl)
data <- read_excel("3data.xlsx", sheet = "13")

model <- lm(y ~ ., data = data)
stepwise_model <- step(model, direction = "both")
summary(stepwise_model)
