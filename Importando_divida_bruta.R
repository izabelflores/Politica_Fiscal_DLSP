
## Importando 

library(httr) # baixar
library(readxl) # leitura excel
library(tidyverse) # manipulacao de dados
library(knitr) # tabelas

options(scipen=999)

#%% DBGG 2007

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Divggp.xls'
GET(url, write_disk(DBGG_2007 <- tempfile(fileext = ".xls")))

DBGG_2007 <- read_excel(DBGG_2007,
                        sheet = "R$ milhões",
                        skip=9,
                        col_names = FALSE,
                        col_types = "numeric")
#%% DBGG 2008

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Divggnp.xls'
GET(url, write_disk(DBGG_2008 <- tempfile(fileext = ".xls")))

DBGG_2008 <- read_excel(DBGG_2008,
                        sheet = "R$ milhões",
                        skip=9,
                        col_names = FALSE,
                        col_types = "numeric")

#%% fc_DBGG 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Facdbp.xls'
GET(url, write_disk(fc_DBGG <- tempfile(fileext = ".xls")))

fc_DBGG <- read_excel(fc_DBGG,
                      sheet = "Fluxos mensais",
                      skip=9,
                      col_names = FALSE,
                      col_types = "numeric")

#%% fc_DBGG_det

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Facdetdbp.xls'
GET(url, write_disk(fc_DBGG_det <- tempfile(fileext = ".xls")))

fc_DBGG_det_estoques <- read_excel(fc_DBGG_det,
                                   sheet = "Estoques",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DBGG_det_emissoes <- read_excel(fc_DBGG_det,
                                   sheet = "Emissões",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DBGG_det_juros <- read_excel(fc_DBGG_det,
                                sheet = "Juros",
                                skip=9,
                                col_names = FALSE,
                                col_types = "numeric")

fc_DBGG_det_ajcamint <- read_excel(fc_DBGG_det,
                                   sheet = "Aj Cam Int",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DBGG_det_ajcamext <- read_excel(fc_DBGG_det,
                                   sheet = "Aj Cam Ext",
                                   skip=9,
                                   col_names = FALSE,
                                   col_types = "numeric")

fc_DBGG_det_divexoutros <- read_excel(fc_DBGG_det,
                                      sheet = "Div Ex Outros",
                                      skip=9,
                                      col_names = FALSE,
                                      col_types = "numeric")

fc_DBGG_det_recdiv <- read_excel(fc_DBGG_det,
                                 sheet = "Rec Div",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

fc_DBGG_det_privat <- read_excel(fc_DBGG_det,
                                 sheet = "Privat",
                                 skip=9,
                                 col_names = FALSE,
                                 col_types = "numeric")

#%% DBGG_index


url<- 'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Dlspindexp.xls'
GET(url, write_disk(DGBB_index <- tempfile(fileext = ".xls")))


DBGG_index_divida <- read_excel(DBGG_index,
                                sheet = "DividaR$",
                                skip=11,
                                col_names = FALSE,
                                col_types = "numeric")

DBGG_index_primario <- read_excel(DBGG_index,
                                  sheet = "PrimarioR$",
                                  skip=11,
                                  col_names = FALSE,
                                  col_types = "numeric")

DBGG_index_juros <- read_excel(DBGG_index,
                               sheet = "JurosR$",
                               skip=11,
                               col_names = FALSE,
                               col_types = "numeric")

