#1. Create a new RStudio project
#File → New Project → New Directory → New Project
#Name your project
#Make sure it opens in a new folder

#2. Initialize renv (reproducible environment)
#Run:
install.packages("renv")
renv::init()

#If it asks:
#choose Option 2 (fresh project) for new projects

#3. Install packages you need
# Example:
install.packages(c(
  "tidyverse",
  "janitor",
  "ggplot2",
  "readr",
  "dplyr"
))

#4. Save environment snapshot
renv::snapshot()
#This locks your package versions

#5. Write your R code
#Example:
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


#6. Initialize Git (only once per project)
#In terminal:
# git init

#7. First Git commit (local snapshot)
#Stage files:
#In RStudio Git tab:
#check all files (? → A)

#Commit:
#Message:
#Initial project setup
#Click Commit

#8. Create GitHub repository
#On GitHub:
#New repo
#Do NOT initialize with README
#Copy repo URL

#9. Connect local project to GitHub
# git remote add origin https://github.com/USERNAME/REPO.git

#Check: 
# git remote -v

#10. Ensure correct branch name
# git branch -M main

#11. Push to GitHub
# git push -u origin main

#If prompted:
#log in via browser
#or use GitHub token

#12. Normal daily workflow (VERY IMPORTANT)
#After setup, you ONLY repeat this cycle:

#Edit code in RStudio
#Save file
#Stage changes (Git tab)
#Commit:
#  short message describing change
#Push:
#  git push


#Common issues (quick fixes)
# “main does not match any”
# git branch -M main
#Git not connected to GitHub
# git remote add origin URL
#Not sure status
# git status
#Package mismatch
# renv::restore()