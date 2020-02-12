# Soluções para levantar informações sobre bots e ações coordenadas no Twitter

## Coleta de dados

### [Twint Splunk](https://github.com/twintproject/twint-splunk/blob/master/README.md)
Versão dockerizada do Twint com a funcionalidade de "resume" para os downloads

### [BotSlayer](https://osome.iuni.iu.edu/tools/botslayer/)
BotSlayer ajuda a rastrear e detectar potencial manipulação de informação no Twitter. Fornece um dashboard dockerizado e exporta os resultados em CSV (arquivo de exemplo em anexo) com as entidades ("Entities are pieces of information that appear in tweets and retweets matching the query. An entity can be a hashtag, link, image, video, user handle, or text phrase") e os seguintes parâmetros:

* BS Level: Anomaly score that combines tweets, accounts, trendiness, and botness. The higher the BS level of an entity, the higher the estimated likelihood that the entity may be supported by a coordinated campaign involving social bots.

* Tweets: Number of tweets and retweets that match the query and contain this entity in the last four hours;

* Accounts: Number of distinct accounts tweeting messages that match the query and contain this entity in the last four hours.

* Trendiness: Relative change in the number of tweets that match the query and contain this entity in the last four hours, compared to the previous four hours.

* Botness: Average bot score across tweets that match the query and contain this entity in the last four hours.

