H <- matrix(c(1, 2, 1, 2, 5, 1, 1, 1, 6), nrow = 3, byrow = TRUE)
y <- c(3, 9, 8)
inverse_H <- solve(H)
print(inverse_H %*% y)
