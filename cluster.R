df <-
  read.csv("./datasets/DataV.csv",
           encoding = "UTF-8")

df <- subset(df, select = c(-1))
# df <- trimws(df)
# colnames(df)
colnames(df) <-
  c(
    "исход",
    "пол",
    "возраст",
    "ИВЛ",
    "Ковид",
    "оценка_тяжести",
    "тяжесть",
    "Онкология",
    "АГ",
    "ИБС",
    "ИМ",
    "СД",
    "ХОБЛ ",
    "ЖА ",
    "Пред_аритмия",
    "ФП ",
    "ИМ_ковид",
    "Миокардит_ковид",
    "ЖТ_ковид",
    "ЖТ_ИМ",
    "ОНМК_ковид",
    "тромбозы_ковид",
    "гематомы_ковид",
    "ХСН_ковид",
    "Пар_ФП_ковиде",
    "СПОН_ковиде",
    "ИВЛ_ковид",
    "АД_систол",
    "АД_диастол",
    "D.димер",
    "тропонин",
    "ферритин",
    "фибриноген",
    "ЛДГ",
    "соэ",
    "СРБ",
    "ЛЦ",
    "Трц",
    "Калий",
    "СКФ",
    "креатинин",
    "пор_легких",
    "перегруз_ПЖ",
    "ПЖ",
    "TAPSE",
    "ЧСС",
    "НСР",
    "низк_вольт",
    "Ритм",
    "ось_сердца",
    "угол_альфа",
    "Увелич_ЛП",
    "Увелич_ПП",
    "ГЛЖ",
    "ГПЖ",
    "перегруз_правых_отделов",
    "QTc",
    "QIII.SI",
    "поворот_верхушкой.SI.SII.SIII",
    "поворот_ПЖ",
    "АВ_бл",
    "Рубцовые_изм.нижн ",
    "Депр_ишемич_ST",
    "изм_ST_T",
    "колво_отвед_ST",
    "ФРРЖ",
    "макроальтернация",
    "изм_фазы_реполяризации",
    "ПБЛНПГ",
    "НБЛНПГ",
    "БПВР_ЛНПГ",
    "БЗНР_ЛНПГ",
    "ПБПНПГ",
    "НБПНПГ",
    "неспец.в.ж.бл",
    "Пред.эктопия",
    "Од.Пред.эктопия.колич",
    "парн_пред_эктопия_колич",
    "желуд_эктопия",
    "од_ЖА_колич",
    "ПарнЖА_колич",
    "ИВЛ_2",
    "проц_легких",
    "горм_тер",
    "сурфактант",
    "моноклон_антитела",
    "тяжесть_исх",
    "ст_стяж_КТ_исх",
    "стадия_КТ_исх",
    " стадия_КТ_фин_тяж",
    " стадия_КТ_фин_прогр",
    "ритм_исх",
    "ритм.фп.тп_исх",
    "ритм_фин",
    "ритм.фп.тп_фин",
    "ритм_вып",
    "ритм.фп.тп_вып"
  )

library("tree")

aa <- as.data.frame(na.omit(df[, c(1, 6:32)]))


aa <-
  as.data.frame(na.omit(cbind(gr = aa$исход, ttt)))# colnames(df)
aa

s <- dapply(aa, 2, function(x)
  min(c(sd(x[aa[, 1] == 1]), sd(x[aa[, 1] == 2]))))
s
colnames(aa)

t <- names(s[s != 0 & !is.na(s)])

bb <- cbind(gr = aa$gr, aa[, t])

bb <- data.frame(bb)

I_inf <- function(X) {
  nn <- table(X)
  n <- sum(nn)
  n * log(n) - sum(nn * log(nn))
}


D_inf <- function(X, Y) {
  I_inf(c(X, Y)) - I_inf(X) - I_inf(Y)
}

GinyDA. <- function(y, class, k1, k2) {
  #y независимая переменная, class,#k1,k2 минимальные объемы подвыборок
  ss <- sort(unique(y))
  # ss
  ss. <- (ss[-1] + ss[-length(ss)]) / 2
  
  #определяем середины интервалов между наблюдениями
  l <- lapply(ss., function(x) {
    L1 <- class[y <= x]
    L2 <- class[y > x]
    
    if (length(L1) > k1 & length(L2) > k2)
      res <- c(D_inf(L1, L2), x)
    else
      res <-
      c(NA, NA)
  })# считаем информационные выигрыши при размежевании данных
  data.frame(na.omit(do.call('rbind', l)))
}


treeA <- tree(gr ~ ., bb)
plot(treeA)
title("Стандартное дерево")
text(treeA, col = 3)

gi <- GinyDA.(bb$D.димер, bb$gr, 2, 2)
tr <- tree(gi)
plot(tr)
title("Дерево через инф. выигрыши")
text(tr, col = 2)
