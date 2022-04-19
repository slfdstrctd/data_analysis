library(survival)
library(survminer)

df <- read.csv("./datasets/points5.csv", sep = ";")
df <- subset(df, select = c(-1))
head(df)


# Kaplan-Meier
fit <- survfit(Surv(dni.zhil, 1 - zhiv) ~ xirurgich, df)
summary(fit)$table

ggsurvplot(fit, pval = TRUE)
surv_diff <- survdiff(Surv(dni.zhil, 1 - zhiv) ~ xirurgich, df)

ggsurvplot(fit,
           conf.int = TRUE,
           ggtheme = theme_bw(), 
           fun = "cumhaz")

# Cox 
fitCox <- coxph(Surv(dni.zhil, 1 - zhiv) ~ IgA0 + IgA1 + IgA2, df)

ggsurvplot(survfit(fitCox, data = df), ggtheme = theme_minimal())
