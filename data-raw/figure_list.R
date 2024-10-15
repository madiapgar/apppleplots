library(devtools)
library(purrr)


load_data <- function(update){

  if (update == TRUE) {
    ## putting all of my .rdata figures in a library
    ## loading them all into my global environment
    load("~/projects/diet_mouse_cdiff/figures/baiI.rdata")
    load("~/projects/diet_mouse_cdiff/figures/baiH.rdata")
    load("~/projects/diet_mouse_cdiff/figures/buty_coa_transferase.rdata")
    load("~/projects/diet_mouse_cdiff/figures/buty_kinase.rdata")
    load("~/projects/diet_mouse_cdiff/figures/but_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/buk_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/baiH_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/dil_toxin.rdata")
    load("~/projects/diet_mouse_cdiff/figures/faith_pd.rdata")
    load("~/projects/diet_mouse_cdiff/figures/faith_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/histo_metab_cecum.rdata")
    load("~/projects/diet_mouse_cdiff/figures/histo_metab_colon.rdata")
    load("~/projects/diet_mouse_cdiff/figures/histo_metab_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/metab.rdata")
    load("~/projects/diet_mouse_cdiff/figures/neat_histo_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/neat_histo_colon.rdata")
    load("~/projects/diet_mouse_cdiff/figures/neat_toxin.rdata")
    load("~/projects/diet_mouse_cdiff/figures/short_fam_abun_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/short_fam_abun.rdata")
    load("~/projects/diet_mouse_cdiff/figures/survival_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/survival.rdata")
    load("~/projects/diet_mouse_cdiff/figures/tox_metab_acetic.rdata")
    load("~/projects/diet_mouse_cdiff/figures/tox_metab_butanoic.rdata")
    load("~/projects/diet_mouse_cdiff/figures/tox_metab_propanoic.rdata")
    load("~/projects/diet_mouse_cdiff/figures/tox_metab_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/unweighted_pcoa.rdata")
    load("~/projects/diet_mouse_cdiff/figures/w_adonis_results.rdata")
    load("~/projects/diet_mouse_cdiff/figures/w_adonis_by_day.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uw_adonis_results.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uw_adonis_by_day.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uu_homog_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uu_homog.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uu_resil_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/uu_resil.rdata")
    load("~/projects/diet_mouse_cdiff/figures/weighted_pcoa.rdata")
    load("~/projects/diet_mouse_cdiff/figures/wu_homog_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/wu_homog.rdata")
    load("~/projects/diet_mouse_cdiff/figures/wu_resil_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/wu_resil.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_acid.rdata")
    load("~/projects/diet_mouse_cdiff/figures/overall_bile_acid.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_acid_ratio.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_inhibit_histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_promote_histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_histo_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_ratio_histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_inhibit_metab.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_promote_metab.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_metab_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_inhibit_toxin.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_promote_toxin.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_toxin_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_ratio_histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/bile_ratio_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_diet_facetLocation.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_location_facetDiet.rdata")
    load("~/projects/diet_mouse_cdiff/figures/cecum_histo_categories.rdata")
    load("~/projects/diet_mouse_cdiff/figures/colon_histo_categories.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_tcda_comp.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_tcdb_comp.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_toxin_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/cecum_histo_hypox.rdata")
    load("~/projects/diet_mouse_cdiff/figures/colon_histo_hypox.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_cecumONLY.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypoxia_colonONLY.rdata")
    load("~/projects/diet_mouse_cdiff/figures/neat_cecumHisto_stats.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypox_histo_cecum_comp.rdata")
    load("~/projects/diet_mouse_cdiff/figures/hypox_histo_colon_comp.rdata")
    load("~/projects/diet_mouse_cdiff/figures/cecum_histo.rdata")
    load("~/projects/diet_mouse_cdiff/figures/colon_histo.rdata")
    load("~/projects/diet_mouse_cdiff/posters/poster_fam_abun.rdat")
    load("~/projects/diet_mouse_cdiff/posters/poster_fam_abun_stats.rdat")
    load("~/projects/diet_mouse_cdiff/figures/genus_abun.rdat")
    load("~/projects/diet_mouse_cdiff/posters/mini_neat_cecumHisto_stats.rdat")
    load("~/projects/diet_mouse_cdiff/posters/bloodCulture_tax_barplot.rdat")
    load("~/projects/diet_mouse_cdiff/posters/cfus_bloodOnly.rdat")
    load("~/projects/diet_mouse_cdiff/posters/mini_bloodCulture_abun.rdat")
    load("~/projects/diet_mouse_cdiff/figures/cecum_histo_percent.rdat")
    load("~/projects/diet_mouse_cdiff/figures/noDiet_histoCecum_tox_plot.rdat")

    ## adding data files to project data directory to be loaded in later
    ## creating a named list of them
    figure_list <- list(all_day_plot = all_day_plot,
                       baiH = baiH,
                       baiI = baiI,
                       bile_plot = bile_plot,
                       but_plot = but_plot,
                       buk_plot = buk_plot,
                       baiH_plot = baiH_plot,
                       butyrate_kinase = butyrate_kinase,
                       butyryl_coa_transferase = butyryl_coa_transferase,
                       diet_plot_final = diet_plot_final,
                       dil_plot = dil_plot,
                       faith_plot = faith_plot,
                       faith_stat_vis = faith_stat_vis,
                       histo_metabCecum_plot = histo_metabCecum_plot,
                       histo_metabColon_plot = histo_metabColon_plot,
                       metab_plot = metab_plot,
                       metab_stat_vis = metab_stat_vis,
                       neat_histo_colon_plot = neat_histo_colon_plot,
                       neat_plot = neat_plot,
                       neat_tox_stat_vis = neat_tox_stat_vis,
                       overall_plot = overall_plot,
                       poster_abun1 = poster_abun1,
                       poster_stat_plot1 = poster_stat_plot1,
                       ratio_bile_plot = ratio_bile_plot,
                       family_abun1 = family_abun1,
                       stat_plot1 = stat_plot1,
                       surv_stat_vis = surv_stat_vis,
                       tox_acetic = tox_acetic,
                       tox_butanoic = tox_butanoic,
                       tox_metab_stat_vis = tox_metab_stat_vis,
                       tox_propanoic = tox_propanoic,
                       unweighted_pcoa = unweighted_pcoa,
                       uu_homog_plot = uu_homog_plot,
                       uu_homog_stat_vis = uu_homog_stat_vis,
                       uu_resil_plot = uu_resil_plot,
                       uu_resil_stat_vis = uu_resil_stat_vis,
                       w_homog_stat_vis = w_homog_stat_vis,
                       w_resil_stat_vis = w_resil_stat_vis,
                       weighted_pcoa = weighted_pcoa,
                       wu_homog_plot = wu_homog_plot,
                       wu_resil_plot = wu_resil_plot,
                       histo_inhibitors_plot = histo_inhibitors_plot,
                       histo_promoters_plot = histo_promoters_plot,
                       histo_bile_stat_plot = histo_bile_stat_plot,
                       histo_ratio_plot = histo_ratio_plot,
                       metab_inhibitors_plot = metab_inhibitors_plot,
                       metab_promoters_plot = metab_promoters_plot,
                       metab_bile_stat_plot = metab_bile_stat_plot,
                       toxin_inhibitors_stats_plot = toxin_inhibitors_stats_plot,
                       toxin_promoters_plot = toxin_promoters_plot,
                       tox_bile_stat_plot = tox_bile_stat_plot,
                       histo_ratio_plot = histo_ratio_plot,
                       histo_ratio_stat_plot = histo_ratio_stat_plot,
                       cecum_plot = cecum_plot,
                       colon_plot = colon_plot,
                       hypox_tcda_plot = hypox_tcda_plot,
                       hypox_tcdb_plot = hypox_tcdb_plot,
                       hypox_toxin_stat_plot = hypox_toxin_stat_plot,
                       cecal_hypox_plot = cecal_hypox_plot,
                       colon_hypox_plot = colon_hypox_plot,
                       neat_cecumHisto_stats_plot = neat_cecumHisto_stats_plot,
                       hypoxia_cecum_plot = hypoxia_cecum_plot,
                       hypoxia_locationDiet_plot = hypoxia_locationDiet_plot,
                       hypoxia_dietLocation_plot = hypoxia_dietLocation_plot,
                       hypox_colonStats_plot = hypox_colonStats_plot,
                       hypox_cecumHisto_plot = hypox_cecumHisto_plot,
                       cecum_histo_plot = cecum_histo_plot,
                       colon_histo_plot = colon_histo_plot,
                       genus_plot1 = genus_plot1,
                       mini_neat_cecumHisto_stats_plot = mini_neat_cecumHisto_stats_plot,
                       colony_bloodOnly_plot = colony_bloodOnly_plot,
                       poster_abun2 = poster_abun2,
                       histo_perc_plot = histo_perc_plot,
                       noDiet_histoCecum_tox_plot = noDiet_histoCecum_tox_plot)


    ## going through the named list I created above
    ## and saving them to the data folder with the names I gave them
    purrr::walk2(figure_list,
          names(figure_list),
          function(obj, name) {
            assign(name, obj)
            do.call(usethis::"use_data", list(as.name(name), overwrite = TRUE,
                                              compress = "xz"))
      }
    )
  } else {
    print('Not reloading figure data!')
  }
}

## 10-15-2024 UPDATE: had to regenerate and load all .rdat plots because of a ggplot2/ggside
## and cowplot package update. Need to keep an eye out for this in the future!!
## it was really annoying
load_data(update = TRUE)
