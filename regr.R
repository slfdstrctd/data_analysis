library(olsrr)
data <-
  read.csv("./datasets/data_big.csv")

df <- data[c(1:30, 32:34), c(56, 23, 24, 26:31)]
LM <-
  lm(DBP.2 ~ HR.1 + SBP.1 + MBP.1 + SV.1 + CO.1 + SI.1 + CI.1 + TPR.1, data)

print(head(df))

L <- cov(df)

L.12 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 3, 4, 5, 6, 7, 8, 9)]
L.13 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 4, 5, 6, 7, 8, 9)]
L.14 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 5, 6, 7, 8, 9)]
L.15 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 4, 6, 7, 8, 9)]
L.16 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 4, 5, 7, 8, 9)]
L.17 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 4, 5, 6, 8, 9)]
L.18 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 4, 5, 6, 7, 9)]
L.19 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(1, 2, 3, 4, 5, 6, 7, 8)]

L.11 <- L[c(2, 3, 4, 5, 6, 7, 8, 9), c(2, 3, 4, 5, 6, 7, 8, 9)]


b.12 <- -det(L.12) * (-1) ^ (1 + 2) / det(L.11)
b.13 <- -det(L.13) * (-1) ^ (1 + 3) / det(L.11)
b.14 <- -det(L.14) * (-1) ^ (1 + 4) / det(L.11)
b.15 <- -det(L.15) * (-1) ^ (1 + 5) / det(L.11)
b.16 <- -det(L.16) * (-1) ^ (1 + 6) / det(L.11)
b.17 <- -det(L.17) * (-1) ^ (1 + 7) / det(L.11)
b.18 <- -det(L.18) * (-1) ^ (1 + 8) / det(L.11)
b.19 <- -det(L.19) * (-1) ^ (1 + 9) / det(L.11)


b.11 <-
  mean(df$DBP.2) - b.12 * mean(df$HR.1) - b.13 * mean(df$SBP.1) - b.14 *
  mean(df$MBP.1) -
  b.15 * mean(df$SV.1) - b.16 * mean(df$CO.1) - b.17 * mean(df$SI.1) - b.18 *
  mean(df$CI.1) -
  b.19 * mean(df$TPR.1)

print(c(b.11, b.12, b.13, b.14, b.15, b.16, b.17, b.18, b.19))

LM$coefficients


cs <- apply(combn(8, 3), 2, function(x) {
  df2 <- data.frame(Y = df$DBP.2, df[, x + 1])
  summary(lm(Y ~ ., df2))$r.squared
})
dfg <- cbind(t(combn(8, 3)), cs = cs)
which.max(dfg[, 4])
colnames(df)[dfg[which.max(dfg[, 4]), -4] + 1]


res <- ols_step_both_p(LM,
                       pent = 0.2,
                       prem = 0.4,
                       details = TRUE)
res$predictors

dfg

colnames(df)

qqnorm(LM$residuals)
qqline(LM$residuals)


shapiro.test(LM$residuals)
plot(LM)

boxplot(Ozone ~ Month, data = airquality)
wilcox.test(Ozone ~ Month, data = airquality,
            subset = Month %in% c(5, 8))
