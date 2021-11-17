
## Importando 

library(httr) # baixar
library(readxl) # leitura excel
library(tidyverse) # manipulacao de dados
library(knitr) # tabelas

options(scipen=999)

#%% Div_mob 
url<- 'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/DivMobp.xls'
GET(url, write_disk(Div_mob <- tempfile(fileext = ".xls")))

Div_mob_vencimentos <- read_excel(Div_mob,
                                  sheet = "Perfil de vencimentos",
                                  skip=25,
                                  col_names = FALSE,
                                  col_types = "numeric")

Div_mob_posicao_carteira <- read_excel(Div_mob,
                                       sheet = "Estoque Posição de Carteira",
                                       skip=32,
                                       col_names = FALSE,
                                       col_types = "numeric")

Div_mob_indexador <- read_excel(Div_mob,
                                sheet = "Participação por indexador",
                                skip=107,
                                col_names = FALSE,
                                col_types = "numeric")

#%% tx_impl 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Tximplnp.xls'
GET(url, write_disk(tx_impl <- tempfile(fileext = ".xls")))

tx_impl_DLSP <- read_excel(tx_impl,
                           sheet = "DLSP_mensal",
                           skip=9,
                           col_names = FALSE,
                           col_types = "numeric")

tx_impl_DBGG <- read_excel(tx_impl,
                           sheet = "DBGG_mensal",
                           skip=9,
                           col_names = FALSE,
                           col_types = "numeric")

#%% cronop 

url<-'https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/Cronop.xls'
GET(url, write_disk(cronop <- tempfile(fileext = ".xls")))

cronop_DLSP <- read_excel(cronop,
                          sheet = "Cronograma_DLSP",
                          skip=9,
                          col_names = FALSE,
                          col_types = "numeric")

cronop_DBGG <- read_excel(cronop,
                          sheet = "Cronograma_DBGG",
                          skip=9,
                          col_names = FALSE,
                          col_types = "numeric")

