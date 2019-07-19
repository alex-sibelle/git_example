library("dplyr")

mtcars$car <- rownames(mtcars)

store <-   
mtcars %>% 
  filter(mpg < 20 & cyl <= 6)

store
