
library(readr)

df <- read.delim("secure.log", row.names = NULL,  header = FALSE, stringsAsFactors = FALSE)
df1 <- read.delim("fail2ban.log", row.names = NULL,  header = FALSE, stringsAsFactors = FALSE)
x <- 0
for (i in 1:nrow(df)) {
  n <- grepl("POSSIBLE BREAK-IN ATTEMPT!", df[i,]) | grepl("Failed password for root", df[i,])
  if (n == TRUE)
  { x <- x+1}
}

y <- 0
for (i in 1:nrow(df)) {
  n <- grepl("invalid user", df[i,]) & grepl("preauth", df[i,]) 
  if (n == TRUE)
  {y <- y+1}
}

z <- 0
for (i in 1:nrow(df1)) {
  n <- grepl("Ban", df1[i,]) 
  if (n == TRUE)
  {z <- z+1}
}

print(paste(x,"possible attacks are found"))
print(paste(y,"confirmed attacks are found"))
print(paste(z,"IP were banned the past 4 days"))

