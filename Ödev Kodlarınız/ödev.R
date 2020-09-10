titanic_tr <- read.csv(file.choose())
titanic_te <- read.csv(file.choose())

#####1.Soru########
ncol(titanic_tr)
nrow(titanic_tr)
head(titanic_tr)
str(titanic_tr)
summary(titanic_tr)

#####2.Soru#####
str(titanic_te)     #veri tiplerini görmek icin


#veri tiplerini faktore donustumek icin
titanic_te$Sex = as.factor(titanic_te$Sex)
titanic_te$Cabin = as.factor(titanic_te$Cabin)
titanic_te$Embarked= as.factor(titanic_te$Embarked)

str(titanic_te) #sonucu kontrol etmek icin


#hangi degiskenlerde eksik deger var gormek ıcın
list_na <- colnames(titanic_te)[ apply(titanic_te, 2, anyNA) ]
list_na

# Age ve Fare degiskenleriinde eksik degerler var

ort_kadin <- mean(titanic_te$Age[titanic_te$Sex == "female"],na.rm = TRUE)
#kadin yolcularin yas ortalaması yaklasik 30'dur
ort_erkek <- mean(titanic_te$Age[titanic_te$Sex == "male"],na.rm = TRUE)
#erkek yolcularin yas ortalaması yaklasik 30'dur

#Yas ortalaması eksik olan kadin yolcular icin
titanic_te$Age[titanic_te$Sex == "female"] <- 
  replace(titanic_te$Age[titanic_te$Sex == "female"],
   is.na(titanic_te$Age[titanic_te$Sex == "female"]), ort_kadin)
titanic_te$Age[titanic_te$Sex == "female"]

#Yas ortalaması eksik olan erkek yolcular icin
titanic_te$Age[titanic_te$Sex == "male"] <- 
  replace(titanic_te$Age[titanic_te$Sex == "male"],
          is.na(titanic_te$Age[titanic_te$Sex == "male"]), ort_erkek)
titanic_te$Age[titanic_te$Sex == "male"]

sum(is.na(titanic_te$Fare))
#Pclass degeri olan tek yolcu vardır.

#Degeri olamayan yolcunun yasi ve bilet ucretinin bolumu
titanic_te$Age[is.na(titanic_te$Fare)] / titanic_te$Pclass[is.na(titanic_te$Fare)]
bolum <- titanic_te$Age[is.na(titanic_te$Fare)] / titanic_te$Pclass[is.na(titanic_te$Fare)]

#eksik deger yerine sonucun yerlestirilmesi
  replace(titanic_te$Fare,
          is.na(titanic_te$Fare),bolum)
titanic_te$Fare


#####3.Soru######
ncol(titanic_te)
nrow(titanic_te)
head(titanic_te)
str(titanic_te)
summary(titanic_te)


str(titanic_tr)     #veri tiplerini görmek icin


#veri tiplerini faktore donustumek icin
titanic_tr$Sex = as.factor(titanic_tr$Sex)
titanic_tr$Cabin = as.factor(titanic_tr$Cabin)
titanic_tr$Embarked= as.factor(titanic_tr$Embarked)


str(titanic_tr) #sonucu kontrol etmek icin


#hangi degiskenlerde eksik deger var gormek ıcın
list_na2 <- colnames(titanic_tr)[ apply(titanic_tr, 2, anyNA) ]
list_na2

# Age degiskeninde eksik degerler var
ort_kadin2 <- mean(titanic_tr$Age[titanic_tr$Sex == "female"],na.rm = TRUE)
#kadin yolcularin yas ortalaması yaklasik 28'dir
ort_erkek2 <- mean(titanic_tr$Age[titanic_tr$Sex == "male"],na.rm = TRUE)
#erkek yolcularin yas ortalaması yaklasik 31'dir

#Yas ortalaması eksik olan kadin yolcular icin
titanic_tr$Age[titanic_tr$Sex == "female"] <- 
  replace(titanic_tr$Age[titanic_tr$Sex == "female"],
          is.na(titanic_tr$Age[titanic_tr$Sex == "female"]),ort_kadin2)
titanic_tr$Age[titanic_tr$Sex == "female"]

#Yas ortalaması eksik olan erkek yolcular icin
titanic_tr$Age[titanic_tr$Sex == "male"] <- 
  replace(titanic_tr$Age[titanic_tr$Sex == "male"],
          is.na(titanic_tr$Age[titanic_tr$Sex == "male"]),ort_erkek2)
titanic_tr$Age[titanic_tr$Sex == "male"]

sum(is.na(titanic_tr$Fare))
#Pclass degeri olan yolcu yoktur










