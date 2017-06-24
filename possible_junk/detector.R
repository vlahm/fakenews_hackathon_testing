setwd('~/git/fakenews/')
if(!require(caret))install.packages('caret')
# if(!require(NLP))install.packages('NLP')
if(!require(cleanNLP))install.packages('cleanNLP')
if(!require(reticulate))install.packages('reticulate')
library(caret)
# library(NLP)
library(cleanNLP)
install.packages('curlconverter')
library(curlconverter)

fake = read.csv('fake.csv', stringsAsFactors=FALSE)
head(fake)
names(fake)
str(fake)
# liar = read.table('train.tsv')

all = read.csv('uci-news-aggregator.csv', stringsAsFactors=FALSE)
names(all)
unique(all$CATEGORY)
unique(all$PUBLISHER)
head(all)
#peter norvig's method for spell correction http://norvig.com/spell-correct.html

#annotation and tokenization ####
init_spaCy()
obj <- run_annotators(text, as_strings = TRUE)
names(obj)
get_document(obj)
get_token(obj)

#curl request for web data####
req = "curl --get --include 'https://webhose.io/filterWebContent?token=3cd317bf-5cd9-4ebc-b5a8-c180890936f0&format=json&q=site%3Acnn.com' \
        -H 'Accept: text/plain'"
resp <- make_req(straighten(req))
