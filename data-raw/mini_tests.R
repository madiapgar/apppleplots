## mini tests

library(readr)
library(tidyverse)
library(ggplot2)

exercise_df <- read_tsv('./data-raw/fake_exercise_data.tsv')
pcoa_df <- read_tsv('./data-raw/fake_pcoa_data.tsv')

pcoa_df %>%
  left_join(exercise_df, by = 'sampleid') -> pcoa_df

## facet_once_plots()
activity_labs <- c('Other',
                   'Running',
                   'Swimming',
                   'Walking',
                   'Weights',
                   'Yoga')
names(activity_labs) <- c('other',
                          'running',
                          'swimming',
                          'walking',
                          'weights',
                          'yoga')

sex_x_labs <- c('Female',
                'Male')

test_facet_once <- facet_once_plots(input_table = exercise_df,
                                   stat_on_plot = FALSE,
                                   x_value = 'sex',
                                   y_value = 'heart_rate',
                                   x_value_type = 'discrete',
                                   grouped_by = 'sex',
                                   point_alpha = 0.4,
                                   x_labels = sex_x_labs,
                                   facet_by = 'predominant_activity',
                                   facet_labels = activity_labs,
                                   stat_table = NULL,
                                   x_name = 'Sex',
                                   y_name = 'Heart Rate',
                                   title_content = 'Test facet_once_plots')

test_facet_once

## facet_twice_plots()
sex_labs <- c('Female',
              'Male')
names(sex_labs) <- c('F',
                     'M')

location_x_labs <- c('CA',
                     'CO',
                     'MT',
                     'OR')

test_facet_twice <- facet_twice_plots(input_table = exercise_df,
                                      x_value = 'location',
                                      y_value = 'bmi',
                                      x_value_type = 'discrete',
                                      y_transform = FALSE,
                                      x_labels = location_x_labs,
                                      box_group_by = 'location',
                                      line_group_by = 'exercise_weekly',
                                      point_alpha = 0.4,
                                      facet_rows = 'sex',
                                      facet_cols = 'predominant_activity',
                                      row_labs = sex_labs,
                                      col_labs = activity_labs,
                                      x_name = 'Location',
                                      y_name = 'BMI',
                                      title_content = 'Test facet_twice_plots')

test_facet_twice

## correlation_plots()
location_labs <- c('California',
                   'Colorado',
                   'Montana',
                   'Oregon')
names(location_labs) <- c('california',
                          'colorado',
                          'montana',
                          'oregon')

test_correlation <- correlation_plots(input_table = exercise_df,
                                      x_value = 'exercise_mins',
                                      y_value = 'heart_rate',
                                      x_transform = FALSE,
                                      y_transform = FALSE,
                                      point_alpha = 0.4,
                                      regression_method = 'lm',
                                      facet_rows = 'sex',
                                      facet_cols = 'location',
                                      row_labs = sex_labs,
                                      col_labs = location_labs,
                                      x_name = 'Average Exercise Time per Day (minutes)',
                                      y_name = 'Heart Rate',
                                      title_content = 'Test correlation_plots')

test_correlation

## pcoa_plots()
test_pcoa <- pcoa_plots(input_table = pcoa_df,
                        x_value = 'PC1',
                        y_value = 'PC2',
                        facet_once = FALSE,
                        facet_twice = TRUE,
                        point_fill = 'exercise_mins',
                        point_alpha = 0.7,
                        point_size = 2,
                        fill_type = 'continuous',
                        palette = 'Spectral',
                        facet_rows = 'sex',
                        facet_cols = 'location',
                        row_labs = sex_labs,
                        col_labs = location_labs,
                        legend_name = 'Minutes Exercised',
                        x_name = 'PC1',
                        y_name = 'PC2',
                        title_content = 'Test pcoa_plots')

test_pcoa

## kruskal_dunn_stats()
krDunn_stat_list <- kruskal_dunn_stats(input_table = exercise_df,
                                       grouped_by = c('location',
                                                      'sex'),
                                       multiple_groups = TRUE,
                                       adjust_method = 'BH',
                                       filter_adj_p_value = FALSE,
                                       formula_left = 'heart_rate',
                                       formula_right = 'predominant_activity')

test_kruskal <- krDunn_stat_list$KruskalTest
test_dunn <- krDunn_stat_list$DunnTest


## stat_heat_plot()
exercise_df %>%
  group_by(location, sex, predominant_activity) %>%
  summarise(mean_heart_rate = mean(heart_rate)) -> mean_exercise_df


test_dunn %>%
  merge(mean_exercise_df,
        by.x = c('group1',
                 'sex',
                 'location'),
        by.y = c('predominant_activity',
                 'sex',
                 'location')) %>%
  rename('group1_heart_rate' = 'mean_heart_rate') %>%
  merge(mean_exercise_df,
        by.x = c('group2',
                 'sex',
                 'location'),
        by.y = c('predominant_activity',
                 'sex',
                 'location')) %>%
  rename('group2_heart_rate' = 'mean_heart_rate') %>%
  mutate(diff_means = (group1_heart_rate - group2_heart_rate),
         stat_diff_means = if_else(p.adj > 0.05, 0, diff_means)) -> new_test_dunn

test_stat_plot <- stat_heat_plot(input_table = new_test_dunn,
                                 x_value = 'location',
                                 y_value = 'group2',
                                 x_value_type = 'discrete',
                                 y_value_type = NULL,
                                 pairwise = TRUE,
                                 correlation = FALSE,
                                 tile_fill = 'stat_diff_means',
                                 tile_outline_color = 'black',
                                 tile_alpha = 0.7,
                                 text_value = 'p.adj.signif',
                                 low_color = 'blue',
                                 high_color = 'green',
                                 legend_name = 'Group 1 -\nGroup 2',
                                 x_labels = location_x_labs,
                                 y_labels = NULL,
                                 facet_by = 'sex',
                                 facet_labels = sex_labs,
                                 x_name = 'Location',
                                 y_name = 'Group 2',
                                 title_content = 'Test stat_heat_plot')

test_stat_plot
