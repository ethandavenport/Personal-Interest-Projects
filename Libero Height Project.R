#Libero Height Project

library(tidyverse)
library(mosaic)

write.csv(data0, "C:/Users/ethan/OneDrive/Documents/data0.csv")

defense <- data0 %>%
  filter(skill %in% c("Reception", "Dig"))

scores = defense %>%
  group_by(player_name, team) %>%
  summarise(Good = prop(evaluation_code == "+"),
            OK = prop(evaluation_code == "!"),
            Poor = prop(evaluation_code == "/"),
            Error = prop(evaluation_code == "="),
            count = n()) %>%
  mutate(dig_score = 3*Good + 2*OK + Poor,
         in_system = Good + OK) %>%
  filter(count >= 50)

data0 %>%
  group_by(skill) %>%
  summarize(count = n())

stringsAsFactors = FALSE



