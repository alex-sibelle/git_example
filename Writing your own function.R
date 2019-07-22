### Today we are going to write our own function
### We are going to start basic, and learn how a function works, the various parts a function has
### and how functions look for variables. In doing this we are going to learn alot about r

## What are functions? Stored chucks of code that you can use to achieve something.
## The allow more effective and less error prone programming by reducing the 
## duplication with which code is type out.
## This increases efficiency of programming. Allows greater ability to change key parameters
## and reduces the likely hood of errors.

## An example of a function is mean
x <- 1:10
mean(x)

## Functions are made up of a body, formal arguments and an environment
## Functions are also stored to named objects, and it is this name
## which we used to call a function
## we can use body(), formals() and envio
body(mean) ## code is stored
formals(mean) ## What arguments the fuction takes to pass to the code
environment(mean) ## Where variables are defined, r looks to the current environment first, then looks to the parent.

## loop to calculate the sum
x <- c(1,2,3)
total <- 0
for (i in seq_along(x)) {
  total <- total + x[i]
}
total

### Function to calculate the sum of a.
sum2 <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  total
}


## Call body, formals, and environment on our sum function
body(sum2) # displays our code
formals(sum2) # displays the arguments
environment(sum2) # stored to the global environment

### Alter the sum2 function to calculate the mean: sum/n
mean2 <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  total
}

### Alter mean to enable weighted means
mean3 <- function(x, w) {
  total_x <- 0
  total_w <- 0
  for (i in seq_along(x)) {
    total_x <- total_x + x[i]*w[i]
    total_w <- total_w + w[i]
  }
  total_x/total_w  
}

### Alter mean to enable weighted means with if statement, and a default option
### Defaults give your function a value that it keeps unless you tell it otherwise
mean3 <- function(x, w = NULL) {
  total_x <- 0
  total_w <- 0
  
  if (is.null(w)) w <- rep(1,length(x))
  
  for (i in seq_along(x)) {
    total_x <- total_x + x[i]*w[i]
    total_w <- total_w + w[i]
  }
  
  total_x/total_w  
  
}

## Now it works without specifying weights and calculates the unweighted mean
mean4(c(1,2,3))


#### Final thing - we have used a loop here, but it is 
### work recognising that R works fastest when vectorised (or alternatively when functions are)
### written in a different language

### By way of example, we can vectorise sum by multiplying the vector by a vector of 1s
### Function to calculate sum of vector (vectorised)
sum_v <- function(x) {
  rep(1,length(x)) %*% x
}

### Lesson here - when facing slow code, try to vectorise it.
### Example
## Sum fastest
start <- Sys.time()
sum(1:100000000)
Sys.time()- start


## Vectorised form next fastest
start <- Sys.time()
sum_v(1:100000000)
Sys.time()- start


## Loop is the slowest
start <- Sys.time()
sum2(1:100000000)
Sys.time()- start

