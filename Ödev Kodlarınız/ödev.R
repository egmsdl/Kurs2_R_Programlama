titanic_te <- read.csv(file.choose())
titanic_tr <- read.csv(file.choose())
######################################
## titanic_tr verisindeki numerik degiskenler
str(titanic_tr)
## 1.,2.,3.,6.,7.,8.,10. degiskenler numerik

plot(titanic_tr[,c(1:3,6:8,10)],
     main= "titanic_tr veri setindeki numerik degiskenlerin korelasyonlari",
     col= "blue")
## Age ve Fare degiskenleri disindaki numerik degiskenler aslýnda factor degiskenleridir. 
## Bu nedenle grafik korelasyonu iyi temsil etmiyor.
## Age ve Fare degiskenleri arasýdaki korelasyon;

plot(titanic_tr[, c(6,10)], main= "yolcularin yaslari ve bilet fiyatlari arasýndaki iliski",
     xlab= "Yolcularin Yaslari", ylab= "Bilet fiyatlari",
     col= "red")

## Örtüsen Histogram Grafikleri
## Fare degiskeninin histogram grafigi ile gösterimi
summary(titanic_tr$Fare)
## Min. fiyat 0, max. fiyat ise 512'dir
hist(titanic_tr$Fare,breaks = seq(0,515,5),
     main ="yolcularin yaslari ve bilet fiyatlari ",
     xlab= "Yolcularin Yaslari ve Biletlerinin Fiyatlari",
     ylab = "Frekans",
     col = rgb(200,0,0,155, maxColorValue = 255))

## Age degiskeninin histogram grafigi ile gösterimi
## Bu grafikte ana baslik ve eksen isimleri yazmak anlamsýz.
summary(titanic_tr$Age)
## Min. yas 0, max. yas ise 80'dir
hist(titanic_tr$Age, 
     breaks = seq(0,80,5), add=T,
     col = rgb(0,0,200,155, maxColorValue = 255))

## Boxplot
boxplot(Fare ~ Age, data = titanic_tr,
        main= "Yolcularin yaslarina göre bilet fiyatlari",
        xlab = "Yaslar", ylab= "Bilet Fiyatlari",
        col= "lightgreen")

boxplot(Age ~ Fare , data = titanic_tr, 
        main= "Yolcularin bilet fiyatlarina göre yaslari",
        xlab = "Bilet Fiyatlari", ylab = "Yaslar",
        col= "lightblue")

#Age ve Embarked Degiskenleri Arasindaki Ýliski
attach(titanic_tr)
library(ggplot2)
qplot(Embarked, Age, data = titanic_tr,
      geom= "boxplot", fill= Embarked,
      main = "Age ve Embarked Degiskenleri Arasýndaki Ýliski")


## Grafik Ýzgarasi
par(mfrow = c(2,2))

plot(titanic_tr[, c(6,10)], main= "yolcularin yaslari ve bilet fiyatlari arasýndaki iliski",
     xlab= "Yolcularin Yaslari", ylab= "Bilet fiyatlari",
     col= "red")

hist(titanic_tr$Fare,breaks = seq(0,515,5),
     main ="yolcularin yaslari ve bilet fiyatlari ",
     xlab= "Yolcularin Yaslari ve Biletlerinin Fiyatlari",
     ylab = "Frekans",
     col = rgb(200,0,0,155, maxColorValue = 255))

hist(titanic_tr$Age, 
     breaks = seq(0,80,5), add=T,
     col = rgb(0,0,200,155, maxColorValue = 255))

boxplot(Fare ~ Age, data = titanic_tr,
        main= "Yolcularin yaslarina göre bilet fiyatlari",
        xlab = "Yaslar", ylab= "Bilet Fiyatlari",
        col= "lightgreen")

