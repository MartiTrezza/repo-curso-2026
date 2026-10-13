
# Tarea 05 ------------------------------------------------
install.packages("reshape2")
library(tidyverse)
library(tidytext)
library(topicmodels)
library(textdata)
library(igraph)
library(ggraph)

url <- "https://gitlab.com/uploads/-/system/personal_snippet/4897254/d83847870c9577a22a20063379f91120/DATA-T9-mckinsey-mind-the-gap-articles-20251020.csv"

mckinsey <- read_csv(url) %>%
  rename(id = ...1)

glimpse(mckinsey)
dim(mckinsey)
# Explorando el corpus

range(mckinsey$date)

mckinsey %>%
  select(id, title, date) %>%
  print(n = Inf)

mckinsey <- mckinsey %>%
  mutate(n_words = str_count(article_text, "\\S+"))

summary(mckinsey$n_words)
# El corpus tiene 146 articulos sobre la Gen Z
# Estan publicados entre 2022 y 2025. 
# Son comparables y tienen una mediana es de 611.5 palabras.

# Frecuencia de palabras y TF-IDF

tidy_mckinsey <- mckinsey %>%
  select(id, title, date, article_text) %>%
  unnest_tokens(word, article_text) %>%
  anti_join(stop_words, by = "word") %>%
  filter(!str_detect(word, "^[0-9]+$"))

tidy_mckinsey %>%
  count(word, sort = TRUE) %>%
  slice_max(n, n = 20)

mckinsey_tfidf <- tidy_mckinsey %>%
  count(id, word, sort = TRUE) %>%
  bind_tf_idf(word, id, n)

mckinsey_tfidf %>%
  arrange(desc(tf_idf)) %>%
  slice_head(n = 20)

# Las palabras mas  frecuentes se relacionan con la Gen Z,
# el trabajo, la salud y el consumo. 

# El TF-IDF sirve para identificar palabras mas especificas de cada articulo.

# Analisis de sentimiento: Bing y AFINN

bing <- get_sentiments("bing")

sentiment_bing <- tidy_mckinsey %>%
  inner_join(bing, by = "word") %>%
  count(id, sentiment) %>%
  pivot_wider(
    names_from = sentiment,
    values_from = n,
    values_fill = 0) %>%
  mutate(sentiment_score = positive - negative) %>%
  left_join(mckinsey %>% select(id, title, date), by = "id")

# Articulos mas negativos
sentiment_bing %>%
  arrange(sentiment_score) %>%
  slice_head(n = 5)

# Articulos mas positivos
sentiment_bing %>%
  arrange(desc(sentiment_score)) %>%
  slice_head(n = 5)

afinn <- get_sentiments("afinn")

sentiment_afinn <- tidy_mckinsey %>%
  inner_join(afinn, by = "word") %>%
  group_by(id) %>%
  summarise(afinn_score = sum(value), .groups = "drop") %>%
  left_join(mckinsey %>% select(id, title, date), by = "id")

summary(sentiment_afinn$afinn_score)

# Bing distingue palabras positivas y negativas.
# AFINN asigna un puntaje a cada palabra.
# La media fue 15.89 y la mediana 16.
# Los puntajes tambien dependen de la longitud de los articulos.

# Modelado de topicos con LDA: k = 10 y k = 15

custom_stopwords <- tibble(
  word = c(
    "gen", "zers", "mckinsey", "partner",
    "global", "percent", "it's", "it’s"))

tidy_mckinsey_clean <- tidy_mckinsey %>%
  anti_join(custom_stopwords, by = "word")

mckinsey_dtm <- tidy_mckinsey_clean %>%
  count(id, word) %>%
  cast_dtm(id, word, n)

set.seed(1234)
lda_k10 <- LDA(mckinsey_dtm, k = 10, control = list(seed = 1234))
lda_k15 <- LDA(mckinsey_dtm, k = 15, control = list(seed = 1234))

# Top 10 terminos por topico, k = 10
top_terms_k10 <- tidy(lda_k10, matrix = "beta") %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup()

top_terms_k10 %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Terminos por topico (k = 10)", x = NULL, y = "beta")

# Top 10 terminos por topico, k = 15
top_terms_k15 <- tidy(lda_k15, matrix = "beta") %>%
  group_by(topic) %>%
  slice_max(beta, n = 10) %>%
  ungroup()

top_terms_k15 %>%
  mutate(term = reorder_within(term, beta, topic)) %>%
  ggplot(aes(term, beta, fill = factor(topic))) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~topic, scales = "free", ncol = 3) +
  coord_flip() +
  scale_x_reordered() +
  labs(title = "Terminos por topico (k = 15)", x = NULL, y = "beta")

# El LDA identifica posibles temas del corpus. Con k = 10
# los topicos son mas amplios, mientras que con k = 15
# pueden distinguirse temas mas especificos.
