

#%% Limpeza

#%% Tabelas Horizontais, por data

# (tirar NA's)

#%% inicio da serie em 2001/12/01

# faltou indexador

list_1 <- list(DLSP, 
             fc_DLSP,
             fc_DLSP_det_cxcomp,
             fc_DLSP_det_juros,
             fc_DLSP_det_metext,
             fc_DLSP_det_metint,
             fc_DLSP_det_paridade,
             fc_DLSP_det_primario,
             fc_DLSP_det_privat,
             fc_DLSP_det_recdiv,
             DBGG_2007,
             NFSP_fontes,
             NFSP_usos,
             tx_impl_DLSP,
             cronop_DLSP)

#%% inicio da serie em 2006/12/01

list_2 <- list(fc_DBGG,
               fc_DBGG_det_estoques,
               cronop_DBGG)

#%% inicio da serie em 2007/01/01

list_3 <- list(DBGG_2008,
               fc_DBGG_det_ajcamext,
               fc_DBGG_det_ajcamint,
               fc_DBGG_det_divexoutros,
               fc_DBGG_det_emissoes,
               fc_DBGG_det_juros,
               fc_DBGG_det_privat,
               fc_DBGG_det_recdiv,
               tx_impl_DBGG)


# lapplay lista 1

st <- as.Date("2001/12/01")
seq <- seq(st, by = "month", along.with = (DLSP[1,]-2))

data_1 <- lapply(list_1, function(x) {x <- x %>% 
  filter(!is.na(x[,3])) %>% 
  select(-c(1,2)) %>% 
  `colnames<-`(seq); return(x)})

#%% laplay lista 2

st <- as.Date("2006/12/01")
seq <- seq(st, by = "month", along.with = (fc_DBGG[1,]-2))

data_2 <- lapply(list_2, function(x) {x <- x %>% 
  filter(!is.na(x[,3])) %>% 
  select(-c(1,2)) %>% 
  `colnames<-`(seq); return(x)})

#%% laplay lista 3

st <- as.Date("2007/01/01")
seq <- seq(st, by = "month", along.with = (DBGG_2008[1,]-2))

data_3 <- lapply(list_3, function(x) {x <- x %>% 
  filter(!is.na(x[,3])) %>% 
  select(-c(1,2)) %>% 
  `colnames<-`(seq); return(x)})

#%% tornando dataframes

#%% inicio da serie em 2006/12/01

DLSP <- as.data.frame(data_1[[1]])
fc_DLSP <- as.data.frame(data_1[[2]])
fc_DLSP_det_cxcomp <- as.data.frame(data_1[[3]])
fc_DLSP_det_juros <- as.data.frame(data_1[[4]])
fc_DLSP_det_metext <- as.data.frame(data_1[[5]])
fc_DLSP_det_metint <- as.data.frame(data_1[[6]])
fc_DLSP_det_paridade <- as.data.frame(data_1[[7]])
fc_DLSP_det_primario <- as.data.frame(data_1[[8]])
fc_DLSP_det_privat <- as.data.frame(data_1[[9]])
fc_DLSP_det_recdiv <- as.data.frame(data_1[[10]])
DBGG_2007 <- as.data.frame(data_1[[11]])
NFSP_fontes <- as.data.frame(data_1[[12]])
NFSP_usos <- as.data.frame(data_1[[13]])
tx_impl_DLSP <- as.data.frame(data_1[[14]])
cronop_DLSP <- as.data.frame(data_1[[15]])

#%% inicio da serie em 2006/12/01

fc_DBGG <- as.data.frame(data_2[[1]])
fc_DBGG_det_estoques <- as.data.frame(data_2[[2]])
cronop_DBGG <- as.data.frame(data_2[[3]])

#%% inicio da serie em 2007/01/01

DBGG_2008 <- as.data.frame(data_3[[1]])
fc_DBGG_det_ajcamext <- as.data.frame(data_3[[2]])
fc_DBGG_det_ajcamint <- as.data.frame(data_3[[3]])
fc_DBGG_det_divexoutros <- as.data.frame(data_3[[4]])
fc_DBGG_det_emissoes <- as.data.frame(data_3[[5]])
fc_DBGG_det_juros <- as.data.frame(data_3[[6]])
fc_DBGG_det_privat <- as.data.frame(data_3[[7]])
fc_DBGG_det_recdiv <- as.data.frame(data_3[[8]])
tx_impl_DBGG <- as.data.frame(data_3[[9]])

#%% tabela de Divida liquida

Divida_liquida <- bind_rows(DLSP, #238
                            tx_impl_DLSP, #238
                            cronop_DLSP, #238
                            fc_DLSP_det_primario, #238
                            fc_DLSP_det_juros, #238
                            fc_DLSP_det_metint, #328
                            fc_DLSP_det_metext, #238
                            fc_DLSP_det_paridade, #238
                            fc_DLSP_det_cxcomp, #238
                            fc_DLSP_det_recdiv, #238
                            fc_DLSP_det_privat) #238

remove(DLSP,tx_impl_DLSP, cronop_DLSP, 
       fc_DLSP_det_primario, fc_DLSP_det_juros,
       fc_DLSP_det_metint, fc_DLSP_det_metext,
       fc_DLSP_det_paridade, fc_DLSP_det_cxcomp,
       fc_DLSP_det_recdiv, fc_DLSP_det_privat, data_1)

write_excel_csv2(Divida_liquida, 
                "C:/Users/izabe/Desktop/Github/Politica_Fiscal_DLSP/Divida_liquida.csv")
