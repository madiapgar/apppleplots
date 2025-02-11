library(devtools)
library(purrr)


load_data <- function(update){

  if (update == TRUE) {
    ## putting all of my .rdata figures in a library
    ## loading them all into my global environment=
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
    load("~/projects/diet_mouse_cdiff/figures/alphaDiv_microbeProd_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/relAbun_microbeProd_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/panelC_fig3_redo.rdat")
    load("~/projects/diet_mouse_cdiff/figures/panelE_fig3_redo.rdat")
    load("~/projects/diet_mouse_cdiff/figures/butyrateOnly_metab.rdat")
    load("~/projects/diet_mouse_cdiff/figures/dcaSep_overall_bileAcid.rdat")
    load("~/projects/diet_mouse_cdiff/figures/miniComparison_diet_genusAbun_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/miniComparison_vendor_genusAbun_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/miniComparison_genusAbun_stat_vis.rdat")
    load("~/projects/diet_mouse_cdiff/figures/allExp_culture_withMicrobes.rdat")
    load("~/projects/diet_mouse_cdiff/figures/allExp_culture_withMicrobes_stats.rdat")
    load("~/projects/diet_mouse_cdiff/figures/genusAbun_plots_together_withLabs.rdat")
    load("~/projects/diet_mouse_cdiff/figures/lachno_abun_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/rumino_abun_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/pathogen_abun_plot.rdat")
    load("~/projects/diet_mouse_cdiff/figures/noButyrate_metab.rdat")
    load("~/projects/diet_mouse_cdiff/figures/newExp_avWeight_change.rdat")
    load("~/projects/diet_mouse_cdiff/figures/newExp_dietVendor_surv_plot.rdat")


    ## adding data files to project data directory to be loaded in later
    ## creating a named list of them
    figure_list <- list(all_day_plot = all_day_plot,
                       bile_plot = bile_plot,
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
                       tox_metab_stat_vis = tox_metab_stat_vis,
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
                       cecum_histo_plot = cecum_histo_plot,
                       colon_histo_plot = colon_histo_plot,
                       genus_plot1 = genus_plot1,
                       mini_neat_cecumHisto_stats_plot = mini_neat_cecumHisto_stats_plot,
                       colony_bloodOnly_plot = colony_bloodOnly_plot,
                       poster_abun2 = poster_abun2,
                       histo_perc_plot = histo_perc_plot,
                       ## plots below don't have documentation filled out yet!!
                       noDiet_histoCecum_toxStats_plot = noDiet_histoCecum_toxStats_plot,
                       faith_combStats_plot = faith_combStats_plot,
                       microbeProd_relAbunStats_plot = microbeProd_relAbunStats_plot,
                       panelC_fig3_redoWithlab = panelC_fig3_redoWithlab,
                       panelE_fig3_redoWithlab = panelE_fig3_redoWithlab,
                       butyrateOnly_plot = butyrateOnly_plot,
                       dca_sep_plot = dca_sep_plot,
                       miniVendor_genusAbun_plot = miniVendor_genusAbun_plot,
                       miniDiet_genusAbun_plot = miniDiet_genusAbun_plot,
                       mini_d3_genus_relAbun_stat_plot = mini_d3_genus_relAbun_stat_plot,
                       everything_plot = everything_plot,
                       everything_stats = everything_stats,
                       genusAbun_plots_together_withLabs = genusAbun_plots_together_withLabs,
                       lachno_abun_plot = lachno_abun_plot,
                       rumino_abun_plot = rumino_abun_plot,
                       path_abun_plot = path_abun_plot,
                       notButy_plot = notButy_plot,
                       newExp_avWeight_plot = newExp_avWeight_plot,
                       newExp_dietVendor_surv_plot = newExp_dietVendor_surv_plot)


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
