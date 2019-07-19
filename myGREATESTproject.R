library("dplyr")

mtcars$car <- rownames(mtcars)

store <-   
mtcars %>% 
  filter(mpg < 20 & cyl <= 6) %>%
  group_by(cyl) %>% 
  summarise_at(c("vs","mpg","disp","hp"), mean)



