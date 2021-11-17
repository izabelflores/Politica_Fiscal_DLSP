
## Importando 

library(httr) # baixar
library(readxl) # leitura excel
library(tidyverse) # manipulacao de dados
library(knitr) # tabelas

options(scipen=999)

#%% DLSP 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Dlspp.xls'
GET(url, write_disk(DLSP <- tempfile(fileext = ".xls")))
DLSP <- read_excel(DLSP,
                   sheet = "R$ milhões",
                   skip=9,
                   col_names = FALSE,
                   col_types = "numeric")

#%% fc_DLSP 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Evodlp.xls'
GET(url, write_disk(fc_DLSP <- tempfile(fileext = ".xls")))
fc_DLSP <- read_excel(fc_DLSP,
                      sheet = "Fluxos mensais por esfera",
                      skip=9,
                      col_names = FALSE,
                      col_types = "numeric")

#%% fc_DLSP_det 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Facdetp.xls'
GET(url, write_disk(fc_DLSP_det <- tempfile(fileext = ".xls")))

fc_DLSP_det_estoques <- read_excel(fc_DLSP_det,
                                   sheet = "Estoques",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DLSP_det_primario <- read_excel(fc_DLSP_det,
                                   sheet = "Primário",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DLSP_det_juros <- read_excel(fc_DLSP_det,
                                sheet = "Juros",
                                skip=9,
                                col_names = FALSE,
                                col_types = "numeric")

fc_DLSP_det_metint <- read_excel(fc_DLSP_det,
                                 sheet = "Met Int",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

fc_DLSP_det_metext <- read_excel(fc_DLSP_det,
                                 sheet = "Met Ext",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

fc_DLSP_det_paridade <- read_excel(fc_DLSP_det,
                                   sheet = "Paridade",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DLSP_det_cxcomp <- read_excel(fc_DLSP_det,
                                 sheet = "Cx Comp",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

fc_DLSP_det_recdiv <- read_excel(fc_DLSP_det,
                                 sheet = "Rec Div",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

fc_DLSP_det_privat <- read_excel(fc_DLSP_det,
                                 sheet = "Privat",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

#%% DLSP_index 

url<- 'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Dlspindexp.xls'
GET(url, write_disk(DLSP_index <- tempfile(fileext = ".xls")))


DLSP_index_divida <- read_excel(DLSP_index,
                                sheet = "DividaR$",
                                skip=11,
                                col_names = FALSE,
                                col_types = "numeric")

DLSP_index_primario <- read_excel(DLSP_index,
                                  sheet = "PrimarioR$",
                                  skip=11,
                                  col_names = FALSE,
                                  col_types = "numeric")

DLSP_index_juros <- read_excel(DLSP_index,
                               sheet = "JurosR$",
                               skip=11,
                               col_names = FALSE,
                               col_types = "numeric")

#%% NFSP_usos_fontes 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Nfspusop.xls'
GET(url, write_disk(NFSP_usos_fontes <- tempfile(fileext = ".xls")))

NFSP_usos <- read_excel(NFSP_usos_fontes,
                        sheet = "Usos",
                        skip=9,
                        col_names = FALSE,
                        col_types = "numeric")

NFSP_fontes <- read_excel(NFSP_usos_fontes,
                          sheet = "Fontes",
                          skip=9,
                          col_names = FALSE,
                          col_types = "numeric")

