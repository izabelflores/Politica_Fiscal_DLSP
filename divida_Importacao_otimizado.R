# Importando dívida (funções)

#### library #####

library(purrr)
library(dplyr)
library(stringr)
library(readxl)
library(tidyr)
library(ggplot2)

#### baixar arquivos ####


 # montar urls

sufixos_xls <-
  c(
    "Divggp.xls",
    "Divggnp.xls",
    "Facdbp.xls",
    "Facdetdbp.xls",
    "Dlspindexp.xls",
    "Dlspp.xls",
    "Evodlp.xls",
    "Facdetp.xls",
    "Dlspindexp.xls",
    "Nfspusop.xls",
    "DivMobp.xls",
    "Tximplnp.xls",
    "Cronop.xls"
  )

url_divida <- paste0(
  "https://www.bcb.gov.br/content/estatisticas/Documents/Tabelas_especiais/",
  sufixos_xls
) %>%
  as.list() %>%
  set_names(sufixos_xls)


 # baixar arquivos em pasta temporaria

purrr::walk2(
  url_divida,
  url_divida %>% names(),
  ~ download.file(.x, 
                  destfile = paste0(tempdir(),
                                    "\\divida", 
                                    .y
                  ),
                  mode = "wb"
  )
)

 # caminho pastas

path <- paste0(tempdir(), "\\divida", sufixos_xls)

#### lendo sheets ####


# Nomes e dos parametros para leitura


parametros <- 
  
  tribble(
    
    ~Nomes,                ~n_path ,    ~sheet,                    ~skip,
    
    #divida bruta
    
    "DBGG_2007",               1   ,  "R$ milhões",                     9,
    "DBGG_2008",               2   ,  "R$ milhões",                     9,
    "fc_DBGG",                 3   ,  "Fluxos mensais",                 9,
    "fc_DBGG_det_estoques",    4   ,  "Estoques",                       9,
    "fc_DBGG_det_emissoes",    4   ,  "Emissões",                       9,
    "fc_DBGG_det_juros"   ,    4   ,  "Juros",                          9,
    "fc_DBGG_det_ajcamint",    4   ,  "Aj Cam Int",                     9,
    "fc_DBGG_det_ajcamext",    4   ,  "Aj Cam Ext",                     9,
    "fc_DBGG_det_divexoutros", 4   ,  "Div Ex Outros",                  9,
    "fc_DBGG_det_recdiv",      4   ,  "Rec Div",                        9,
    "fc_DBGG_det_privat",      4   ,  "Privat",                         9,
    "DBGG_index_divida",       5   ,  "DividaR$",                      11,
    "DBGG_index_primario",     5   ,  "PrimarioR$",                    11,
    "DBGG_index_juros",        5   ,  "JurosR$",                       11,
    
    #divida liquida
    
    "DLSP",                    6   ,  "R$ milhões",                     9,
    "fc_DLSP",                 7   ,  "Fluxos mensais por esfera",      9,
    "fc_DLSP_det_estoques",    8   ,  "Estoques",                       9,
    "fc_DLSP_det_primario",    8   ,  "Estoques",                       9,
    "fc_DLSP_det_ejuros",      8   ,  "Primário",                       9,
    "fc_DLSP_det_estoques",    8   ,  "Juros",                          9,
    "fc_DLSP_det_metint",      8   ,  "Met Int",                        9,
    "fc_DLSP_det_metext",      8   ,  "Met Ext",                        9,
    "fc_DLSP_det_paridade",    8   ,  "Paridade",                       9,
    "fc_DLSP_det_cxcomp",      8   ,  "Cx Comp",                        9,
    "fc_DLSP_det_recdiv",      8   ,  "Rec Div",                        9,
    "fc_DLSP_det_privat",      8   ,  "Privat",                         9,
    "DLSP_index_divida",       9   ,  "DividaR$",                      11,
    "DLSP_index_primario",     9   ,  "PrimarioR$",                    11,
    "DLSP_index_juros",        9   ,  "JurosR$",                       11,
    "NFSP_usos",              10   ,  "Usos",                           9,
    "NFSP_fontes",            10   ,  "Fontes",                         9,
    "Div_mob_vencimentos",    11   ,  "Perfil de vencimentos",         25,
    "Div_mob_posicao_cart",   11   ,  "Estoque Posição de Carteira",   32,
    "Div_mob_indexador",      11   ,  "Participação por indexador",   107,
    
    "tx_impl_DLSP",           12   ,  "DLSP_mensal",                    9,
    "tx_impl_DBGG",           12   ,  "DBGG_mensal",                    9,
    "cronop_DLSP",            13   ,  "Cronograma_DLSP",                9,
    "cronop_DBGG",            13   ,  "Cronograma_DBGG",                9
  )


# Função importacao tabelas

importar_tabelas <- function(n_path, sheet, skip){
  
  readxl::read_excel(path[n_path],
                     sheet     = sheet,
                     skip      = skip,
                     col_names = FALSE)
  
}

# Leitura dos dados para uma lista com os elementos nomeados


lista_dados_brutos <-
  pmap(parametros[-1], importar_tabelas) %>%
  set_names(parametros$Nomes) 

