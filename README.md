# Toolkir para investigar bots e ações coordenadas no Twitter

Levantamento de soluções a partir de um estudo de caso com as ofensas dirigidas à jornalista Patrícia Campos Mello, no dia 12 de fevereiro de 2019. Estudo/trabalho em progresso.

## Coleta de dados

### [Twint Splunk](https://github.com/twintproject/twint-splunk/blob/master/README.md)
Versão dockerizada do Twint com a funcionalidade de "resume" para os downloads. 

Arquivo de exemplo em .zip executado com o comando:

` ./twint -s @camposmello --since 2020-02-12 -o camposmello --csv`


### [BotSlayer](https://osome.iuni.iu.edu/tools/botslayer/)
BotSlayer ajuda a rastrear e detectar potencial manipulação de informação no Twitter. Fornece um dashboard dockerizado e exporta os resultados em CSV (arquivo de exemplo em anexo) com as entidades ("Entities are pieces of information that appear in tweets and retweets matching the query. An entity can be a hashtag, link, image, video, user handle, or text phrase") e os seguintes parâmetros:

* BS Level: Anomaly score that combines tweets, accounts, trendiness, and botness. The higher the BS level of an entity, the higher the estimated likelihood that the entity may be supported by a coordinated campaign involving social bots.

* Tweets: Number of tweets and retweets that match the query and contain this entity in the last four hours;

* Accounts: Number of distinct accounts tweeting messages that match the query and contain this entity in the last four hours.

* Trendiness: Relative change in the number of tweets that match the query and contain this entity in the last four hours, compared to the previous four hours.

* Botness: Average bot score across tweets that match the query and contain this entity in the last four hours.

A coluna com o nome dos usuários pode ser extraída para um arquivo com o seguinte comando no terminal.

`cat arquivo.csv | cut -d ',' -f4 | grep @ > users.csv`

### [Tinfoleak](https://github.com/vaguileradiaz/tinfoleak)
Pode receber o arquivo `users.csv` e gerar relatórios detalhados com informações sobre as atividades dos usuários.

### Busca por imagens
Localizados na pasta "img_hashs" deste repositório. São scripts para investigar a propagação de imagens no Twitter.

* O primeiro gera uma hash para cada URLs de mídia (fotos), a fim de identificar imagens idênticas que possuem URL diferentes.

* O segundo script busca as hashs mais "famosas" no dataset e busca a primeira mensagem que compartilhou a imagem correspondente.


## References
[Bellingcat - Twitter Analysis: Identifying A Pro-Indonesian Propaganda Bot Network](https://www.bellingcat.com/news/2019/09/03/twitter-analysis-identifying-a-pro-indonesian-propaganda-bot-network/)

[Don’t @ Me: Hunting Twitter Bots at Scale](https://duo.com/blog/dont-me-hunting-twitter-bots-at-scale)