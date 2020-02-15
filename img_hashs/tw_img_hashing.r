library(dplyr)
library(openssl)

# Lê a base
dados <- data.table::fread("dados/tweets.csv", na.strings = "")

# Remove tuites sem mídia
dados <- dados[!is.na(dados$media_url),]

# Printa total de linhas antes do filtro
nrow(dados)

# Filtra por imagens
dados <- dados %>% filter(., grepl("twimg.com/media",media_url))

# Printa total de linhas depois do filtro
nrow(dados)

# Adiciona hash a partir da URL de mídia
criahash <- function(link) {
    hashmd <- try(md5(url(link)))
    return(as.character(hashmd))
}

options(warn=-1)
# Adiciona nova coluna com a hash de cada foto. Pode demorar a depender da quantidade. 
hashs <- dados %>% select(media_url) %>% unique() %>% rowwise() %>% mutate(hash = criahash(media_url)) 
options(warn=0)

# Total de mídias únicas e hashs
length(unique(dados$media_url))
length(unique(hashs$hash))

# Junta as hashs no dataset
dados <- left_join(hashs, dados, by = c('media_url','media_url'))

#Grava dataset com as hashs
write.csv(dados,"tweets_hash.csv")
