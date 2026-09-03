"hello world"
5
10
5
5 + 5
print ("Hello World!")
for (x in 1:10) {
  print(x)
}
# This is a comment 
"Hello World!"
"Hello World!" # This is a comment 
# "Good morning!"
"Good night!"
# This is a comment
# written in
# more than just one line
"Hello World!"
name <- "John"
age <- 40
name # output "John" 
age # output 40
name <- "John Doe"
name # auto-print the value of the name variable
name <- "John Doe"
print(name) 
text <- "awesome"
paste("R is", text)
text1 <- "R is"
text2 <- "awesome"
paste(text1, text2)
num1 <- 5
num2 <- 10
num1 + num2
var1 <- var2 <- var3 <- "Orange"
myvar <- "John"
myvar <- 30
myvar <- "Sally"
# Hay 3 tipos de numbers en R 
x <- 10.5 # numeric
y <- 10L # integer
z <- 1i # complex
x <- 10.5 
y <- 55
x 
y
class (x)
class (y)
x <- 1000L
y <- 55L
x 
y
class (x)
class (y)
x <- 3+5i
y <- 5i
x
y
class (x)
class (y)
x <- 1L # integer
y <- 2  # numeric 
x
y
class (a)
class (b)
"hello"
str <- "hello"
str
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."
str
cat (str)
str <- "Hello World"
nchar (str)
grepl ("H", str)
grepl ("X", str)
str1 <-"hello"
str2 <- "world"
paste(str1, str2)
str <- "We are the so-called \"Vikings\", from the north."
str
cat(str)
10 > 9
10 == 9
a <- 10 
b <- 9 
a > b
a <- 200
b <- 33 
if (b > a) {
  print ("b is greater than a")
} else {
    print ("b is not greater than a ") }
2 + 5 
2 * 5
x / y
x ^ y
x %% y
my_var <- 3
my_var <<- 3
3 -> my_var
3 ->> my_var
my_var 
x == y
x != y
x > y
x < y
x >= y
x <= y
x == y | x < y
x > 0 ! x < y
!x < y
x <- 1:10
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}
i <- 0
while (i < 6) {
  i <- i + 1
  if (i == 3) {
    next
  }
  print(i)
dice <- 1
while (dice <= 6) {
  if (dice < 6) {
    print("No Yahtzee")
  } else {
    print("Yahtzee!")
  }
  dice <- dice + 1
}
for (x in 1:10) {
  print(x)
}
fruits <- list("apple", "banana", "cherry")
for (x in fruits) {
  print(x)
}
fruits <- list("apple", "banana", "cherry")

for (x in fruits) {
  if (x == "cherry") {
    break
  }
  print(x)
}
fruits <- list("apple", "banana", "cherry")
for (x in fruits) {
  if (x == "banana") {
    next
  }
  print(x)
}
dice <- 1:6
for(x in dice) {
  if (x == 6) {
    print(paste("The dice number is", x, "Yahtzee!"))
  } else {
    print(paste("The dice number is", x, "Not Yahtzee"))
  }
}
adj <- list("red", "big", "tasty")
fruits <- list("apple", "banana", "cherry")
for (x in adj) {
  for (y in fruits) {
    print(paste(x, y))
  }
}
fruits <- c("banana", "apple", "orange")
fruits
numbers <- c(1, 2, 3)
numbers
numbers <- 1:10
numbers
log_values <-c(TRUE, FALSE, TRUE, FALSE)
log_values
fruits <- c("banana", "manzana", "orange")
length(fruits)
fruits <- c("banana", "manzana", "orange", "mango", "lemon")
numbers <- c(13, 3, 5, 7, 20, 2)
sort(fruits)
sort(numbers)
fruits <- c("banana", "apple", "orange")
fruits[2]
fruits[c(1, 3)]
fruits[c(-1)]
fruits[1] <- "pear"
fruits
repeat_each <- rep(c(1,2,3), each = 3)
repeat_each
repeat_times <- rep(c(1,2,3), times = 3)
repeat_times
repear_independet <- rep(c(1,2,3), times = c(5,2,1))
repear_independet
numbers <- 1:10
numbers
numbers <- seq(from = 0, to =100, by =20)
numbers
thislist <- list("apple", "banana", "cherry")
thislist
thislist[1]
thislist[1] <- "blackcurrant"
thislist
length(thislist)
"apple" %in% thislist
"banana" %in% thislist
append(thislist, "orange", after = 2)
newlist <- thislist[-1]
newlist
thislist <- list("apple", "banana", "cherry", "orange", "kiwi", "melon", "mango")
(thislist)[2:5]
for (x in thislist) {print (x)}
list1 <- list("a","b","c")
list2 <- list(1,2,3)
list3 <- c(list1, list2)
list3
thismatrix <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
thismatrix
thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)
thismatrix[1, 2]
thismatrix[2,]
thismatrix[,2]
thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)
thismatrix
thismatrix[c(1,2),]
thismatrix[, c(1,2)]
newmatrix <- cbind(thismatrix, c("strawberry", "blueberry", "raspberry"))
newmatrix
thismatrix <- thismatrix[-c(1), -c(1)]
thismatrix
"apple" %in% thismatrix
"grape" %in% thismatrix
thismatrix <- matrix(c("apple", "banana", "cherry", "orange"), nrow = 2, ncol = 2)
dim(thismatrix)
length(thismatrix)
for (rows in 1:nrow(thismatrix)) { for(columns in 1:ncol(thismatrix)) { print (thismatrix[rows, columns])}}
Matrix1 <- matrix(c("apple", "banana", "cherry", "grape"), nrow = 2, ncol = 2)
Matrix2 <- matrix(c("orange", "mango", "pineapple", "watermelon"), nrow = 2, ncol = 2)
Matrix_Combined <- rbind(Matrix1, Matrix2)
Matrix_Combined
Matrix_Combined <- cbind(Matrix1, Matrix2)
Matrix_Combined
thisarray <- c(1:24)
thisarray
multiarray <- array(thisarray, dim =c(4, 3, 2))
multiarray
multiarray[2, 3, 2]
multiarray[,c(1),1]
2 %in% multiarray
dim(multiarray)
length(multiarray)
for(x in multiarray){
  print(x)
}
Data_Frame <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)
Data_Frame
summary(Data_Frame)
Data_Frame[1]
Data_Frame[["Training"]]
Data_Frame$Training
New_row_DF <- rbind(Data_Frame, c("Strength", 110, 110))
New_row_DF
New_col_DF <- cbind(Data_Frame, Steps = c(1000, 6000, 2000))
New_col_DF
Data_Frame_New <- Data_Frame[-c(1), -c(1)]
Data_Frame_New
dim(Data_Frame)
ncol(Data_Frame)
nrow(Data_Frame) 
length(Data_Frame)
Data_Frame1 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45)
)
Data_Frame2 <- data.frame (
  Training = c("Stamina", "Stamina", "Strength"),
  Pulse = c(140, 150, 160),
  Duration = c(30, 30, 20)
)
New_Data_Frame <- rbind(Data_Frame1, Data_Frame2)
New_Data_Frame
Data_Frame3 <- data.frame (
  Training = c("Strength", "Stamina", "Other"),
  Pulse = c(100, 150, 120),
  Duration = c(60, 30, 45))
Data_Frame4 <- data.frame (
  Steps = c(3000, 6000, 2000),
  Calories = c(300, 400, 300))
New_Data_Frame1 <- cbind(Data_Frame3, Data_Frame4)
New_Data_Frame1

music_genre <- factor(c("Jazz", "Rock", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre
levels(music_genre)
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))
levels(music_genre)
length(music_genre)
music_genre[3]
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
music_genre[3]
music_genre[3] <- "Pop"
music_genre[3]
music_genre[3] <- "Opera"
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Opera"))
music_genre[3] <- "Opera"
music_genre[3]