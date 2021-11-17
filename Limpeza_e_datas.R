
# 17/11

#DLSP e DBGG

#%% Limpeza
# (tirar NA's)

#%% inicio da serie em 2001/12/01

list_1 <- list(DLSP, 
             fc_DLSP,
             fc_DLSP_det_cxcomp,
             fc_DLSP_det_estoques,
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



# 18/11

#%% conferir se pegou todas as tabelas que estão na vertical
#%% pegou as tabelas horizontais

# 19/11
#%% elaborar vetor de nomes das colunas
#%% juntar todas as bases em uma (ou duas)
