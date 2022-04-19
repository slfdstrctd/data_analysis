library(dplyr)
library(ggplot2)
library(Hotelling)

data <- read.csv("./datasets/data_big.csv")

ps <- c('HR.2', 'SBP.2', 'SV.2', 'MBP.2')
df <- data[ps]
p <- c()

for (i in 1:nrow(df)) {
  df_i <- df[seq(1, nrow(df)) != i,]
  x_i <- df[i,]
  mean_i <- apply(df_i, MARGIN = 2, mean)
  cov_i <- cov(df_i)
  t <-
    t(as.numeric(x_i) - mean_i) %*% cov_i ^ (-1) %*% (as.numeric(x_i) - mean_i)
  p <- c(p, 1 - pchisq(t, 4))
}

df <- df %>% mutate(p_v = p < 0.05)

comb <- combn(length(ps), 2)
for (i in 1:(length(comb) / 2)) {
  plot(df[, c(comb[[1, i]], comb[[2, i]])], col = 3 - df$p_v)
}


res <- hotelling.test(as.matrix(df$HR.2), as.matrix(df$SBP.2))
res
