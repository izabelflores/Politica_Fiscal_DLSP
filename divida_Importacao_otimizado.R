# Importando dívida (funções)

#### library ####

library(purrr)
library(dplyr)
library(stringr)
library(readxl)
library(tidyr)
library(ggplot2)
library(jantior)

  # pra puxar as urls
  
  sufixos_xls <- c("Divggp.xls", "Divggnp.xls", "Facdbp.xls", "Facdetdbp.xls", "Dlspindexp.xls",
                   "Dlspp.xls", "Evodlp.xls", "Facdetp.xls", "Dlspindexp.xls", "Nfspusop.xls",
                   "DivMobp.xls", "Tximplnp.xls", "Cronop.xls")
  
  url_divida <- paste0(
    "https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/",
    sufixos_xls
  ) %>%
    as.list() %>%
    set_names(sufixos_xls)
  



  
  # baixa os arquivos em tempfile
  
  purrr::walk2(
    url_divida, # as urls
    url_divida %>% names(), # os nomes dos itens nas listas que são os anos
    ~ download.file(.x, # passa cada item do primeiro vetor
                    destfile = paste0(tempdir(), "\\divida", .y), # segundo item do vetor
                    mode = "wb"
    )
  ) # modo
  
 
   path <- paste0(tempdir(), "\\divida", sufixos_xls)



#### lendo sheets ####

# divida bruta

DBGG_2007 <- read_excel(path[1],
                        sheet = "R$ milhões",
                        skip=9,
                        col_names = FALSE)

DBGG_2008 <- read_excel(path[2],
                        sheet = "R$ milhões",
                        skip=9,
                        col_names = FALSE)

fc_DBGG <- read_excel(path[3],
                      sheet = "Fluxos mensais",
                      skip=9,
                      col_names = FALSE)

fc_DBGG_det_estoques <- read_excel(path[4],
                                   sheet = "Estoques",
                                   skip=9,
                                   col_names = FALSE)

fc_DBGG_det_emissoes <- read_excel(path[4],
                                   sheet = "Emissões",
                                   skip=9,
                                   col_names = FALSE)

fc_DBGG_det_juros <- read_excel(path[4],
                                sheet = "Juros",
                                skip=9,
                                col_names = FALSE)

fc_DBGG_det_ajcamint <- read_excel(path[4],
                                   sheet = "Aj Cam Int",
                                   skip=9,
                                   col_names = FALSE)

fc_DBGG_det_ajcamext <- read_excel(path[4],
                                   sheet = "Aj Cam Ext",
                                   skip=9,
                                   col_names = FALSE)

fc_DBGG_det_divexoutros <- read_excel(path[4],
                                      sheet = "Div Ex Outros",
                                      skip=9,
                                      col_names = FALSE)

fc_DBGG_det_recdiv <- read_excel(path[4],
                                 sheet = "Rec Div",
                                 skip=9,
                                 col_names = FALSE)

fc_DBGG_det_privat <- read_excel(path[4],
                                 sheet = "Privat",
                                 skip=9,
                                 col_names = FALSE)

DBGG_index_divida <- read_excel(path[5],
                                sheet = "DividaR$",
                                skip=11,
                                col_names = FALSE)

DBGG_index_primario <- read_excel(path[5],
                                  sheet = "PrimarioR$",
                                  skip=11,
                                  col_names = FALSE)

DBGG_index_juros <- read_excel(path[5],
                               sheet = "JurosR$",
                               skip=11,
                               col_names = FALSE)

# divida liquida

DLSP <- read_excel(path[6],
                   sheet = "R$ milhões",
                   skip=9,
                   col_names = FALSE)

fc_DLSP <- read_excel(path[7],
                      sheet = "Fluxos mensais por esfera",
                      skip=9,
                      col_names = FALSE)

fc_DLSP_det_estoques <- read_excel(path[8],
                                   sheet = "Estoques",
                                   skip=9,
                                   col_names = FALSE)

fc_DLSP_det_primario <- read_excel(path[8],
                                   sheet = "Primário",
                                   skip=9,
                                   col_names = FALSE)

fc_DLSP_det_juros <- read_excel(path[8],
                                sheet = "Juros",
                                skip=9,
                                col_names = FALSE)

fc_DLSP_det_metint <- read_excel(path[8],
                                 sheet = "Met Int",
                                 skip=9,
                                 col_names = FALSE)

fc_DLSP_det_metext <- read_excel(path[8],
                                 sheet = "Met Ext",
                                 skip=9,
                                 col_names = FALSE)

fc_DLSP_det_paridade <- read_excel(path[8],
                                   sheet = "Paridade",
                                   skip=9,
                                   col_names = FALSE)

fc_DLSP_det_cxcomp <- read_excel(path[8],
                                 sheet = "Cx Comp",
                                 skip=9,
                                 col_names = FALSE)

fc_DLSP_det_recdiv <- read_excel(path[8],
                                 sheet = "Rec Div",
                                 skip=9,
                                 col_names = FALSE)

fc_DLSP_det_privat <- read_excel(path[8],
                                 sheet = "Privat",
                                 skip=9,
                                 col_names = FALSE)

DLSP_index_divida <- read_excel(path[9],
                                sheet = "DividaR$",
                                skip=11,
                                col_names = FALSE)

DLSP_index_primario <- read_excel(path[9],
                                  sheet = "PrimarioR$",
                                  skip=11,
                                  col_names = FALSE)

DLSP_index_juros <- read_excel(path[9],
                               sheet = "JurosR$",
                               skip=11,
                               col_names = FALSE)

NFSP_usos <- read_excel(path[10],
                        sheet = "Usos",
                        skip=9,
                        col_names = FALSE)

NFSP_fontes <- read_excel(path[10],
                          sheet = "Fontes",
                          skip=9,
                          col_names = FALSE)

Div_mob_vencimentos <- read_excel(path[11],
                                  sheet = "Perfil de vencimentos",
                                  skip=25,
                                  col_names = FALSE)

Div_mob_posicao_carteira <- read_excel(path[11],
                                       sheet = "Estoque Posição de Carteira",
                                       skip=32,
                                       col_names = FALSE)

Div_mob_indexador <- read_excel(path[11],
                                sheet = "Participação por indexador",
                                skip=107,
                                col_names = FALSE)

tx_impl_DLSP <- read_excel(path[12],
                           sheet = "DLSP_mensal",
                           skip=9,
                           col_names = FALSE)

tx_impl_DBGG <- read_excel(path[12],
                           sheet = "DBGG_mensal",
                           skip=9,
                           col_names = FALSE)

cronop_DLSP <- read_excel(path[13],
                          sheet = "Cronograma_DLSP",
                          skip=9,
                          col_names = FALSE)

cronop_DBGG <- read_excel(path[13],
                          sheet = "Cronograma_DBGG",
                          skip=9,
                          col_names = FALSE)







