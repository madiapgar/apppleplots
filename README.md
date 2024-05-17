# apppleplots Package

This repository contains an R package created to easily pull/manipulate visualizations and commonly used functions in association with [this study](https://github.com/madiapgar/diet_mouse_cdiff). 

## Functions

`correlation_plots()` - returns a plot faceted by two variables, gives you the option to apply a log10 transformation to the x and y-axis, and the line of best fit method is alterable.

`facet_once_plots()` - returns a plot faceted by a single variable with data points, boxes, and contains an option to include p-value significance.

`facet_twice_plots()` - is similar to `facet_once_plots()` but gives you the option to facet by two variables and apply a log10 transformation to the y-axis. Best for use with longitudinal data.

`pcoa_plots()` - returns a PCoA plot based on your unweighted/weighted UniFrac results. Can be faceted once or twice by desired metadata variables.

`stat_heat_plot()` - returns a heat map based on the statistical results entered. Most compatible with pairwise or linear regression results.

`kruskal_dunn_stats()` - returns a named list containing dataframes with your Kruskal-Wallis and Dunn's Post Hoc test results.

`linear_model()` returns a dataframe with results of your linear regression analysis.

## Installation

`if (!requireNamespace("devtools", quietly = TRUE)){install.packages("devtools")} devtools::install_github("madiapgar/apppleplots")`