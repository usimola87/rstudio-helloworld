install.packages("renv")
renv::init()

install.packages(c(
  "tidyverse",
  "janitor",
  "ggplot2",
  "readr",
  "dplyr"
))

renv::snapshot()

library(tidyverse)
library(janitor)

# create sample dataset
df <- tibble(
  group = c("A", "B", "C", "A", "B", "C"),
  value = c(10, 15, 7, 12, 18, 9)
)

# clean column names
df <- clean_names(df)

# summary
summary_df <- df %>%
  group_by(group) %>%
  summarise(mean_value = mean(value))

print(summary_df)

# simple plot
ggplot(df, aes(x = group, y = value)) +
  geom_boxplot()
