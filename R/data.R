## C. difficile Infection Dietary Intervention and Gut Microbiome plots
NULL
#'
#' Histopathology Plot
#'
#' Cecal and colonic histopathology score results at the last day of the
#' experimental timeline.
#'
#' @format ggplot object
"all_day_plot"

#' Bile Acid Concentration Plot
#'
#' Cecal sample primary and secondary bile acid concentrations at the last day of the
#' experimental timeline, broken up by the name of the bile acid.
#'
#' @format ggplot object
"bile_plot"

#' Cecal Concentration of Butyrate
#'
#' Cecal butyrate concentrations at day 3 for all diets. This is a shortened version of `metab_plot`.
#'
#' @format ggplot object
"butyrateOnly_plot"

#' Cecal Hypoxia and Histopathology Score Correlation Plot
#'
#' Cecal sample histopathology scoring components correlated with hypoxia fluorescence levels
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"cecal_hypox_plot"

#' Cecal Histopathology Scores Only Plot
#'
#' Cecal histopathology score results at the last day of the experimental timeline.
#'
#' @format ggplot object
"cecum_histo_plot"

#' Cecal Histopathology Scoring Components Plot
#'
#' Cecal histopathology score results at the last day of the experimental timeline broken up
#' by the respective scoring components.
#'
#' @format ggplot object
"cecum_plot"

#' Colon Histopathology Scores Only Plot
#'
#' Colon histopathology score results at the last day of the experimental timeline.
#'
#' @format ggplot object
"colon_histo_plot"

#' Colon Hypoxia and Histopathology Score Correlation Plot
#'
#' Colon sample histopathology scoring components correlated with hypoxia fluorescence levels
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"colon_hypox_plot"

#' Colon Histopathology Scoring Components Plot
#'
#' Colon histopathology score results at the last day of the experimental timeline broken up
#' by the respective scoring components.
#'
#' @format ggplot object
"colon_plot"

#' Blood Culture Colony Count Plot
#'
#' Colony counts for blood cultures grown aerobically and anaerobically.
#'
#' @format ggplot object
"colony_bloodOnly_plot"

#' Cecal Bile Acid Concentration
#'
#' Cecal DCA (secondary bile acid), C. difficile inhibiting bile acid, and C. difficile promoting
#' bile acid concentrations at day 3. P-value significance is overlaid on the plot.
#'
#' @format ggplot object
"dca_sep_plot"

#' Mouse Survival Plot
#'
#' Survival results per diet for the experiment.
#'
#' @format ggplot object
"diet_plot_final"

#' New Experiment Positive Culture and Survival Results
#'
#' A summary plot of positive culture results per anatomical location (spleen, liver, or blood) at day 3
#' combined with whether the associated mouse survived or not. Also includes the microbes found in the
#' positive cultures.
#'
#' @format ggplot object
"everything_plot"

#' New Experiment Positive Culture and Survival Statistical Results
#'
#' Non-parametric ANOVA pairwise comparisons associated with `everything_plot`. Done between diets and
#' vendors for positive culture and/or survival.
#'
#' @format ggplot object
"everything_stats"

#' Faith's PD Plot (Alpha Diversity)
#'
#' Fecal stool sample faith's PD scores across experimental timeline.
#'
#' @format ggplot object
"faith_plot"

#' Faith's PD Statistical Results Plot (Alpha Diversity)
#'
#' Non-parametric ANOVA for fecal stool sample faith's PD scores across experimental timeline.
#'
#' @format ggplot object
"faith_stat_vis"

#' Cecal Microbiome Faith's PD Correlated to DCA and Butyrate Concentrations
#'
#' Cecal microbiome Faith's PD at day 3 correlated with DCA (secondary bile acid) and butyrate concentrations
#' at the same time point. Significant p-values and r2 values are overlaid on the plot. Points are
#' colored by diet rather than being faceted.
#'
#' @format ggplot object
"faith_combStats_plot"

#' Microbe Family Relative Abundance Plot
#'
#' Fecal stool sample microbe relative abundances across experimental timeline, sectioned out by Family.
#'
#' @format ggplot object
"family_abun1"

#' Microbe Genus Relative Abundance Plot
#'
#' Fecal stool sample microbe relative abundances across experimental timeline, sectioned out by Genus.
#' Includes obligate anaerobes and potential pathogens. Faceted by diet.
#'
#' @format ggplot object
"genusAbun_plots_together_withLabs"

#' Microbe Genera Relative Abundance Plot
#'
#' Fecal stool sample microbe relative abundances across experimental timeline, sectioned out by Genus.
#'
#' @format ggplot object
"genus_plot1"

#' Bile Acid Concentration and Histopathology Score Correlation Statistical Results Plot
#'
#' Cecal bile acid concentrations correlated with cecal and colonic histopathology scores statistical
#' results. Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"histo_bile_stat_plot"

#' Bile Acid Inhibitors and Histopathology Score Correlation Plot
#'
#' Cecal bile acid inhibitor concentrations correlated with cecal and colonic histopathology scores
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"histo_inhibitors_plot"

#' Metabolite Concentration and Histopathology Score Correlation Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, propanoic acid) correlated with
#' cecal histopathology scores at the last day of the experimental timeline.
#'
#' @format ggplot object
"histo_metabCecum_plot"

#' Metabolite Concentration and Histopathology Score Correlation Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, propanoic acid) correlated with
#' colonic histopathology scores at the last day of the experimental timeline.
#'
#' @format ggplot object
"histo_metabColon_plot"

#' Cecal Histopathology Scores Component Percentages Plot
#'
#' Cecal histopathology score component percentage results at the last day of the experimental timeline.
#' This is based on the percentage of "bad" histopathology scores received per diet.
#'
#' @format ggplot object
"histo_perc_plot"

#' Bile Acid Promoters and Histopathology Score Correlation Plot
#'
#' Cecal bile acid promoter concentrations correlated with cecal and colonic histopathology scores
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"histo_promoters_plot"

#' Bile Acid Ratio and Histopathology Score Correlation Plot
#'
#' Cecal bile acid promoter:inhibitor ratios correlated with cecal and colonic histopathology scores
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"histo_ratio_plot"

#' Bile Acid Ratio and Histopathology Score Correlation Statistical Results Plot
#'
#' Cecal bile acid promoter:inhibitor ratios correlated with cecal and colonic histopathology scores
#' statistical results. Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"histo_ratio_stat_plot"

#' Cecalk Hypoxia Levels
#'
#' Cecal hypoxia fluorescence levels at the last day of the experimental timeline.
#'
#' @format ggplot object
"hypoxia_cecum_plot"

#' Hypoxia and Histopathology Score Correlation Plot (in the colon ONLY)
#'
#' Colonic histopathology scores correlated with colonic hypoxia fluorescence levels
#' at the last day of the experimental timeline. P-value significance is overlaid on the plot.
#'
#' @format ggplot object
"hypox_colonStats_plot"

#' Hypoxia and TcdA Toxin Correlation Plot
#'
#' Cecal hypoxia fluorescence levels correlated with cecal TcdA toxin concentration
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"hypox_tcda_plot"

#' Hypoxia and TcdB Toxin Correlation Plot
#'
#' Cecal hypoxia fluorescence levels correlated with cecal TcdB toxin concentration
#' at the last day of the experimental timeline.
#'
#' @format ggplot object
"hypox_tcdb_plot"

#' Hypoxia and Toxin Correlation Statistical Results Plot
#'
#' Cecal hypoxia fluorescence levels correlated with cecal toxin concentration
#' statistical results. Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"hypox_toxin_stat_plot"

#' Hypoxia Plot (GI location on x-axis, faceted by diet)
#'
#' Hypoxia fluorescence levels at the last day of the experimental timeline.
#'
#' @format ggplot object
"hypoxia_dietLocation_plot"

#' Hypoxia Plot (diet on x-axis, faceted by GI location)
#'
#' Hypoxia fluorescence levels at the last day of the experimental timeline.
#'
#' @format ggplot object
"hypoxia_locationDiet_plot"

#' Lachnospiraceae Relative Abundance Plot
#'
#' Features the top five most abundant genera in Lachnospiraceae and follows their relative
#' abundance throughout the experimental timeline, faceted by diet. Is a plot in `genusAbun_plots_together_withLabs`.
#'
#' @format ggplot object
"lachno_abun_plot"

#' Metabolite and Bile Acid Concentration Correlation Statistical Results Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid) correlated
#' with cecal bile acid concentrations statistical results. Indicates p-value significance and the
#' correlation coefficient.
#'
#' @format ggplot object
"metab_bile_stat_plot"

#' Metabolite and Bile Acid Inhibitors Correlation Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid) correlated
#' with cecal bile acid inhibitors at the last day of the experimental timeline.
#'
#' @format ggplot object
"metab_inhibitors_plot"

#' Metabolite Concentration Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid)
#'  at the last day of the experimental timeline.
#'
#' @format ggplot object
"metab_plot"

#' Metabolite and Bile Acid Promoters Correlation Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid) correlated
#' with cecal bile acid promoters at the last day of the experimental timeline.
#'
#' @format ggplot object
"metab_promoters_plot"

#' Metabolite and Histopathology Score Correlation Statistical Results Plot
#'
#' Cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid) correlated
#' with histopathology score statistical results.
#' Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"metab_stat_vis"

#' Cecal Microbiome Relative Abundances Correlated to DCA and Butyrate Concentrations
#'
#' Cecal microbiome relative abundances of key families and genera at day 3 compared to concentrations
#' of DCA and butyrate at the same day. Significant p-values and r2 values are overlaid on the plot.
#' Points are colored by diet rather than being faceted.
#'
#' @format ggplot object
"microbeProd_relAbunStats_plot"

#' Cecal Toxin and Histopathology Score Correlation Plot (mini version)
#'
#' Cecal toxin concentrations correlated with cecal histopathology scores at the last day of
#' the experimental timeline. P-value significance is overlaid on the plot and only significant
#' results are pictured.
#'
#' @format ggplot object
"mini_neat_cecumHisto_stats_plot"

#' All Experiment Comparison Relative Abundance Plot (colored by diet)
#'
#' Comparison of the relative abundance of potential pathogenic genera at days -15 and 3 between sets
#' of experiments done (Old Anschutz (2020), U of Arizona, New Anschutz (2024)). Points are colored by
#' diet for comparison between experiments.
#'
#' @format ggplot object
"miniDiet_genusAbun_plot"

#' All Experiment Comparison Relative Abundance Stats Plot (between experiment and vendor)
#'
#' Pairwise comparison statistics associated with the relative abundance of potential pathogenic genera
#' at days -15 and 3 between sets of experiments done (Old Anschutz (2020), U of Arizona, New Anschutz (2024)).
#' Done via non-parametric ANOVA.
#'
#' @format ggplot object
"mini_d3_genus_relAbun_stat_plot"

#' All Experiment Comparison Relative Abundance Plot (colored by vendor)
#'
#' Comparison of the relative abundance of potential pathogenic genera at days -15 and 3 between sets
#' of experiments done (Old Anschutz (2020), U of Arizona, New Anschutz (2024)). Points are colored by
#' mouse vendor since it differed based on experiment.
#'
#' @format ggplot object
"miniVendor_genusAbun_plot"

#' Cecal Toxin and Histopathology Score Correlation Plot (full version)
#'
#' Cecal toxin concentrations correlated with cecal histopathology scores at the last day of
#' the experimental timeline. P-value significance is overlaid on the plot and all
#' results are pictured, whether they're significant or not.
#'
#' @format ggplot object
"neat_cecumHisto_stats_plot"

#' Colon Toxin and Histopathology Score Correlation Plot
#'
#' Colonic toxin concentrations correlated with colonic histopathology scores at the last day of
#' the experimental timeline.
#'
#' @format ggplot object
"neat_histo_colon_plot"

#' Cecal Neat Toxin Concentration Plot
#'
#' Cecal neat toxin concentrations at the last day of the experimental timeline.
#'
#' @format ggplot object
"neat_plot"

#' Toxin and Histopathology Score Correlation Statistical Results Plot
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with histopathology score statistical results.
#' Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"neat_tox_stat_vis"

#' New Experiment Average Percent Change in Mouse Weight Plot
#'
#' Average percent change in mouse weight by diet and vendor in the days post infection with C. difficile.
#' Associated with New Anschutz experiments.
#'
#' @format ggplot object
"newExp_avWeight_plot"

#' New Experiment Survival Plot
#'
#' Mouse survival curves by diet and vendor in the days post infection with C. difficile.
#' Associated with New Anschutz experiments.
#'
#' @format ggplot object
"newExp_dietVendor_surv_plot"

#' Toxin and Histopathology Score Correlation Plot (not faceted by diet)
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with histopathology score. Significant p-values
#' and r2 values are overlaid on the plot. Points are colored by diet rather than being faceted.
#'
#' @format ggplot object
"noDiet_histoCecum_toxStats_plot"

#' Cecal Concentration of Acetate and Propionate
#'
#' Cecal acetate and propionate concentrations at day 3 for all diets. This is a shortened version
#' of `metab_plot`, its final third is `butyrateOnly_plot`.
#'
#' @format ggplot object
"notButy_plot"

#' Bile Acid Concentration Plot (promoters and inhibitors ONLY)
#'
#' Cecal sample primary and secondary bile acid concentrations at the last day of the
#' experimental timeline, broken up by whether they promote or inhibit C. difficile growth.
#'
#' @format ggplot object
"overall_plot"

#' Cecal DCA Concentration Correlated to Toxin and Histopathology Results
#'
#' Cecal DCA concentration at day 3 compared to C. difficile toxins (TcdA/TcdB) and cecal histopathology
#' scores at the same time point. Significant p-values and r2 values are overlaid on the plot.
#' Points are colored by diet rather than being faceted.
#'
#' @format ggplot object
"panelC_fig3_redoWithlab"

#' Cecal Butyrate Concentration Correlated to Toxin and Histopathology Results
#'
#' Cecal butyrate concentration at day 3 compared to C. difficile toxins (TcdA/TcdB) and cecal histopathology
#' scores at the same time point. Significant p-values and r2 values are overlaid on the plot.
#' Points are colored by diet rather than being faceted.
#'
#' @format ggplot object
"panelE_fig3_redoWithlab"

#' Potential Pathogen Relative Abundance Plot
#'
#' Features five potential pathogen genera and follows their relative abundance throughout the experimental
#' timeline, faceted by diet. Is a plot in `genusAbun_plots_together_withLabs`.
#'
#' @format ggplot object
"path_abun_plot"

#' Microbe Family Relative Abundance Plot (mini version)
#'
#' Fecal stool sample microbe relative abundances across experimental timeline, sectioned out by Family.
#' Shortened to include only 5 families, works well for usage in presentations and/or posters.
#'
#' @format ggplot object
"poster_abun1"

#' Blood Culture Genera Relative Abundance Plot
#'
#' Blood culture sample microbe relative abundances, sectioned out by Genus.
#'
#' @format ggplot object
"poster_abun2"

#' Microbe Family Relative Abundance Statistical Results Plot (mini version)
#'
#' Non-parametric ANOVA results of microbe family relative abundances between diets.
#'
#' @format ggplot object
"poster_stat_plot1"

#' Bile Acid Ratio Plot
#'
#' Cecal sample bile acid promoter:inhibitor ratios at the last day of the
#' experimental timeline.
#'
#' @format ggplot object
"ratio_bile_plot"

#' Ruminococcaeae Relative Abundance Plot
#'
#' Features the top four most abundant genera in Ruminococcaceae and follows their relative
#' abundance throughout the experimental timeline, faceted by diet. Is a plot in `genusAbun_plots_together_withLabs`.
#'
#' @format ggplot object
"rumino_abun_plot"

#' Microbe Family Relative Abundance Statistical Results Plot (manuscript version)
#'
#' Non-parametric ANOVA results of microbe family relative abundances between diets.
#' This version is used in a figure in the paper manuscript.
#'
#' @format ggplot object
"stat_plot1"

#' Survival Statistical Results Plot
#'
#' Non-parametric ANOVA results of mouse survival between diets.
#'
#' @format ggplot object
"surv_stat_vis"

#' Toxin and Bile Acid Concentration Correlation Statistical Results Plot
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with cecal bile acid concentrations statistical
#' results. Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"tox_bile_stat_plot"

#' Toxin and Metabolite Concentration Correlation Statistical Results Plot
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with cecal metabolite concentrations (acetic acid, n-butanoic acid, and propanoic acid)
#' statistical results. Indicates p-value significance and the correlation coefficient.
#'
#' @format ggplot object
"tox_metab_stat_vis"

#' Toxin and Bile Acid Inhibitors Correlation Plot
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with cecal bile acid inhibitors at the last day of the experimental timeline.
#' Significant p-values are overlaid on the plot.
#'
#' @format ggplot object
"toxin_inhibitors_stats_plot"

#' Toxin and Bile Acid Promoters Correlation Plot
#'
#' Cecal toxin concentrations (TcdA and TcdB) correlated with cecal bile acid promoters at the last day of the experimental timeline.
#'
#' @format ggplot object
"toxin_promoters_plot"

#' Unweighted UniFrac PCoA Plot
#'
#' Fecal stool sample distances by diet throughout the experimental timeline.
#'
#' @format ggplot object
"unweighted_pcoa"

#' Unweighted UniFrac Microbiome Homogeneity Plot
#'
#' Fecal stool sample pairwise distances by diet within the experimental time points.
#'
#' @format ggplot object
"uu_homog_plot"

#' Unweighted UniFrac Microbiome Homogeneity Statistical Results Plot
#'
#' Non-parametric ANOVA of fecal stool sample pairwise distances by diet within the
#' experimental time points.
#'
#' @format ggplot object
"uu_homog_stat_vis"

#' Unweighted UniFrac Microbiome Resiliency Plot
#'
#' Fecal stool sample pairwise distances by diet between baseline microbiome and subsequent time points.
#'
#' @format ggplot object
"uu_resil_plot"

#' Unweighted UniFrac Microbiome Resiliency Statistical Results Plot
#'
#' Non-parametric ANOVA of fecal stool sample pairwise distances by diet between baseline microbiome
#' and subsequent time points.
#'
#' @format ggplot object
"uu_resil_stat_vis"

#' Weighted UniFrac Microbiome Homogeneity Statistical Results Plot
#'
#' Non-parametric ANOVA of fecal stool sample pairwise distances by diet within the
#' experimental time points.
#'
#' @format ggplot object
"w_homog_stat_vis"

#' Weighted UniFrac Microbiome Resiliency Statistical Results Plot
#'
#' Non-parametric ANOVA of fecal stool sample pairwise distances by diet between baseline microbiome
#' and subsequent time points.
#'
#' @format ggplot object
"w_resil_stat_vis"

#' Weighted UniFrac PCoA Plot
#'
#' Fecal stool sample distances by diet throughout the experimental timeline.
#'
#' @format ggplot object
"weighted_pcoa"

#' Weighted UniFrac Microbiome Homogeneity Plot
#'
#' Fecal stool sample pairwise distances by diet within the experimental time points.
#'
#' @format ggplot object
"wu_homog_plot"

#' Weighted UniFrac Microbiome Resiliency Plot
#'
#' Fecal stool sample pairwise distances by diet between baseline microbiome and subsequent time points.
#'
#' @format ggplot object
"wu_resil_plot"

#' Exercise Data
#'
#' Generated data for the purpose of package testing and function examples. Note: this data is completely
#' fake and was randomly generated in R based off of healthy ranges for each value. These samples were not
#' obtained by sampling actual people.
#'
#' @format
#' A dataframe with 100 rows and 10 columns:
#' \describe{
#' \item{sampleid}{IDs for each individual sample}
#' \item{sex}{Sex of each individual}
#' \item{location}{The state the individual lives in}
#' \item{heart_rate}{The average resting heart rate of each individual}
#' \item{exercise_mins}{The average amount of time spent exercising per workout (in minutes)}
#' \item{exercise_weekly}{The average number of times an individual works out per week}
#' \item{predominant_activity}{The activity most often used in a workout}
#' \item{bp_systolic}{The average systolic blood pressure measurement of each individual}
#' \item{bp_diastolic}{The average diastolic blood pressure measurement of each individual}
#' \item{bmi}{The BMI of each individual}
#' }
"exercise_df"

#' Principal Coordinates for Exercise Data
#'
#' Generated data for the purpose of package testing and function examples. This dataframe can be combined with
#' the `exercise_df` as they have the same sample IDs. Note: this data is completely fake and was randomly generated
#' in R based off of healthy ranges for each value. These samples were not obtained by sampling actual people or by running
#' an actual UniFrac dissimilarity measurement.
#'
#' @format
#' A dataframe with 100 rows and 3 columns:
#' \describe{
#' \item{sampleid}{IDs for each individual sample}
#' \item{PC1}{Principal coordinates for the first axis}
#' \item{PC2}{Principal coordinates for the second axis}
#' }
"dist_df"




#' @source <https://github.com/madiapgar/diet_mouse_cdiff>
