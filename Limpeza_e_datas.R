
# 17/11

#DLSP e DBGG

#%% Limpeza
# (tirar NA's)


list <- list(DLSP, 
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
             DBGG_2008,
             fc_DBGG,
             fc_DBGG_det_ajcamext,
             fc_DBGG_det_ajcamint,
             fc_DBGG_det_divexoutros,
             fc_DBGG_det_emissoes,
             fc_DBGG_det_estoques,
             fc_DBGG_det_juros,
             fc_DBGG_det_privat,
             fc_DBGG_det_recdiv
             )

data <- lapply(list, function(x) {x <- x %>% filter(!is.na(x[,3])); return(x)})


#%% colocar data nas colunas 
# (fazer tabela com com data de inicio de cada coluna)
# função pra vetor com tamanho do data frame
# vetor como nome das colunas

# 18/11

#%% o mesmo para outras
#%% juntar todas as bases em uma (ou duas)

# 19/11

#%% criar codigo e dicionario das variaveis
#%% exportar para o excel