##############################
## File formating easySFS
##
## Matt Brachmann (PhDMattyB)
##
## 2019-07-09
##
##############################

setwd('')

library(tidyverse)
library(wesanderson)
library(patchwork)
library(janitor)
library(devtools)
library(skimr)
library(tvthemes)
library(rsed)
library(data.table)

theme_set(theme_bw())

vcf = read_tsv('.vcf', 
               skip = 30, col_names = T)

vcf = vcf[,10:length(vcf)]

vcf = gather(vcf) %>%
  select(1) %>% 
  distinct() %>% 
  rowid_to_column()  

easySFS = mutate(.data = vcf,
              pops = sed_substitute(vcf$key,'_.*', "")) %>% 
  select(key, pops) %>% 
  write_tsv('.txt', col_names = F)
