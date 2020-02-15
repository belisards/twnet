library(dplyr)

dados <- data.table::fread("tweets_hash.csv", na.strings = "")

# Para cada mensagem, adiciona uma coluna com a frequência da hash e plota a distribuição da frequência
dados <- dados %>% group_by(hash) %>% mutate(media_hashfreq = n()) %>% arrange(-media_hashfreq)
hist(dados$media_hashfreq)

# Seleciona os primeiros usuários que publicaram as top 10 hashs
top10 <- dados %>% select(from_user, text,hash,media_url, time, media_hashfreq) %>% group_by(hash) %>% 
slice(which.min(time)) %>% 
arrange(-media_hashfreq) 

write.csv(top10,"tweets_hash_top.csv")

top10
