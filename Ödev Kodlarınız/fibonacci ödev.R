fibonacci_dizi <- function(x){
 dizi <- numeric(x)
  dizi[1] <- dizi[2] <- 1
  for (x in 3:10) dizi[x] <- dizi[x - 2] + dizi[x - 1]
  data.frame(dizi)
  print(dizi)
}

fibonacci_dizi(10)

bonus <- fibonacci_dizi(10)
bonus
is.vector(bonus)


















