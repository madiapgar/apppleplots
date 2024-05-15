## 05-15-24
## generating a "fake"/simulated dataset to test my functions
library(readr)
library(tidyverse)

## need to set seed so that my "random" numbers will be the same every time I re-run the code
set.seed(100)

## defining variables (mostly via random number/character generation)
sample1 <- sample(x = 1000:5000, size = 100, replace = FALSE)
# sample2 <- sample(x = 100:1000, size = 100, replace = TRUE)
# sample3 <- sample(x = 10:50, size = 100, replace = TRUE)
sexes <- sample(x = c('M', 'F'), size = 100, replace = TRUE)
locations <- sample(x = c('colorado',
                          'oregon',
                          'montana',
                          'california'),
                    size = 100,
                    replace = TRUE)
heartRates <- sample(x = 60:100, size = 100, replace = TRUE)
exerciseMins <- sample(x = c(15,
                             30,
                             45,
                             60,
                             90), size = 100, replace = TRUE)
exerciseWeekly <- sample(x = 1:7, size = 100, replace = TRUE)
activity <- sample(x = c('running',
                         'swimming',
                         'weights',
                         'yoga',
                         'walking',
                         'other'),
                   size = 100,
                   replace = TRUE)
systolicMeas <- sample(x = 100:130, size = 100, replace = TRUE)
diastolicMeas <- sample(x = 60:85, size = 100, replace = TRUE)
BMI <- sample(x = 18.5:28.5, size = 100, replace = TRUE)


## assembling data frame with defined variables above
my_fake_exercise <- data.frame(sampleid = sample1,
                               sex = sexes,
                               location = locations,
                               heart_rate = heartRates,
                               exercise_mins = exerciseMins,
                               exercise_weekly = exerciseWeekly,
                               predominant_activity = activity,
                               bp_systolic = systolicMeas,
                               bp_diastolic = diastolicMeas,
                               bmi = BMI)


## fake distance matrix
pc1_values <- runif(100, min = -1, max = 1)
pc2_values <- runif(100, min = -1, max = 1)

my_fake_dist <- data.frame(sampleid = my_fake_exercise$sampleid,
                           PC1 = pc1_values,
                           PC2 = pc2_values)

my_fake_dist %>%
  left_join(my_fake_exercise, by = 'sampleid') -> my_fake_combo

## saving fake data to data-raw folder
write_tsv(my_fake_exercise,
          './data-raw/fake_exercise_data.tsv')
write_tsv(my_fake_dist,
          './data-raw/fake_pcoa_data.tsv')
