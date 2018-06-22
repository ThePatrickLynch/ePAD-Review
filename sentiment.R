# Sentiment analysis of ePad student responses

rm(list=ls())


library(tidytext)
library(dplyr)
library(sentimentr)
library(syuzhet)
library(ggplot2)

bing_lex <- get_sentiments("bing")
nrc_lex <- get_sentiments("nrc")
afinn_lex <- get_sentiments("afinn")


response <- read.csv(file.choose(), header = T)

prepped <- as.vector(t(response)[1,])
preppedsentiment <- get_nrc_sentiment(prepped)
prepnew <- as.vector(t(response)[2,])
prepnewsentiment <- get_nrc_sentiment(prepnew)
changes <- as.vector(t(response)[3,])
changessentiment <- get_nrc_sentiment(changes)
guidance <- as.vector(t(response)[4,])
guidancesentiment <- get_nrc_sentiment(guidance)

td_new <- data.frame(colSums(preppedsentiment))
td_new <- cbind("sentiment" = rownames(td_new), td_new)
barplot(td_new[,2], xlab="Sentiment using nrc lexicon", horiz=T, main="How well did you feel prepared for using ePAD?",ylab="Score", 
            col = rainbow(10,start = 0, end = .8), 
            legend.text = td_new[,1])


