#homework 
#Data trans -write 5 queries for managing data from library(nycflights13)

install.packages("nycflights13")
library(nycflights13)
head(flights)
glimpse(flights)

#1 only choose origin is LGA and destination is ATL
df <- data.frame(flights)

df %>%
  select(month, flight, origin, dest) %>%
  filter(origin == "LGA", dest == "ATL") %>%
  group_by(month)
  
#2 which month has delayed for over 30 mins
df %>%
  select(month, dep_time, dep_delay)%>%
  filter(dep_delay <= -30)
  
#3 mutate arrive delay or ontime
df %>%
 select(month, sched_arr_time,arr_time,arr_delay)%>%
 mutate(de_on = ifelse(arr_delay < 0, "delay", "on_time"))%>%
  arrange(desc(arr_delay))

#4 summarize
df %>%
  select(distance)%>%
  summarise(mean_dis = mean(distance),
            sum_dis = sum(distance),
            median_dis = median(distance),
            sd_dis = sd(distance),
            n = n())

#5 flight over 10 hours

df %>%
  select(origin, dest, distance, hour) %>%
  filter(hour > 10)
 

   
 








