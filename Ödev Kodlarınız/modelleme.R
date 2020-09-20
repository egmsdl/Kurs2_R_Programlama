titanic_tr <- read.csv(file.choose())
colSums(is.na(titanic_tr))

#Age degiskeninde eksik degerler var
#Eksik degerlerin yerine yas ortalamasýný yazmak

yas_ort <- round(mean(titanic_tr$Age, na.rm= T))
titanic_tr$Age[is.na(titanic_tr$Age)] <- yas_ort
titanic_tr$Age

#Numerik degerleri normalize etmek

normalize <- function(x){ return((x-min(x))/(max(x)-min(x))) }
titanic_tr$Age <- normalise(titanic_tr$Age)


################################################

titanic_te <- read.csv(file.choose())
colSums(is.na(titanic_te))

#Age ve Fare degiskenlerinde eksik degerler var
#Eksik degerlerin yerine yas ve fiyat ortalamasýný yazmak

yas_ort2 <- round(mean(titanic_te$Age, na.rm= T))
titanic_te$Age[is.na(titanic_te$Age)] <- yas_ort2
titanic_te$Age

fiyat_ort <- round(mean(titanic_te$Fare, na.rm= T))
titanic_te$Fare[is.na(titanic_te$Fare)] <- fiyat_ort
titanic_te$Fare

#Numerik degerleri normalize etmek

normalize <- function(x){return((x-min(x))/(max(x)-min(x))) }
titanic_te$Age <- normalise(titanic_te$Age)
titanic_te$Fare<- normalise(titanic_te$Fare)

#K-NN model oluþturma

set.seed(202005)
komsu <- round(sqrt(nrow(titanic_tr)))+1
model <- knn(train=titanic_tr[,c("Pclass", "Age", "SibSp", "Parch", "Fare")],
             test=titanic_te[,c("Pclass",  "Age", "SibSp", "Parch", "Fare")], 
             cl=titanic_tr[,c("Survived")], k = komsu)

table(model)





