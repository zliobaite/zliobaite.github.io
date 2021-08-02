---
layout: post
category: machine-learning
tags: [palaeontology,humanevolution,fossils,machinelearning]
title: Notes on text mining human evolution
---

This is a follow up on the post on [trends in human evolution research]({{ site.baseurl }}{% link _posts/2021-7-30-Human-evolution1.md %}), outlining how the analysis was done. This is not an elegant solution, I apologize. I wanted a quick prototype, thus I used a zoo of tools. I'm sure most of the steps could be done more elegantly and efficiently, but my solution worked for the purpose (of exploration over a weekend).

Most of the analysis was done in `Python`, a bit in `R`. If you are in palaeontology you probably generally prefer `R`, but for preprocessing texts you'll find better tools in `Python`. Anyhow, if you are determined, you very likely can do a similar analysis in `R`, as more tools are becoming available. If I were to implement this in `R` I'd probably start [here](https://www.tidytextmining.com/).

### 1. Getting the texts

So let's begin. If we want to text-mine research articles, first thing we need to do is to get the actual texts. A set of texts for analysis is called *corpus*. You probably want to stay away from extracting texts from pdfs, so you need to find excess to full texts. When you find access to full texts, basically there are two ways to get the texts. The first one is to crawl the published website, which means to write a program that would visit each article and copy its text as if a user would do it manually. This is generally undesired, sometimes forbidden, and anyway needs to be timed well not to overload the traffic. A much better way to use APIs that publishers provide for the purpose of getting texts for text mining. Largest commercial publishers would very likely have them, but smaller ones perhaps won't. And, the challenge is that operating an API would be different in each case.

Luckily, the Journal of Human Evolution was available via [Elsevier's API](https://www.elsevier.com/about/policies/text-and-data-mining). for starters one needed to get an [API key](https://dev.elsevier.com/), that's a personal identification number that Elsevier is using to track who is doing what. For next steps one needs to save the personal key into [config.json](https://github.com/zliobaite/text_mining_human_evolution/blob/main/1_getting_texts/config.json), this is a template without the actual key, paste your key to replace '123mykey'.

Next, one needs to decide what texts one wants to get. In this particular case one can get anything that can be searched in [Scopus](https://www.scopus.com/home.uri?zone=header&origin=) database of Elsevier. For me it was easy, I simply queried all the articles that belong to the journal with ISSN = '0047-2484' (The Journal of Human Evolution). One can do keywords, but I did not.

Using [this script](https://github.com/zliobaite/text_mining_human_evolution/blob/main/1_getting_texts/run1_get_articles.py) I got [this csv table](https://github.com/zliobaite/text_mining_human_evolution/blob/main/1_getting_texts/articles_JHE.csv) listing all the articles published in the Journal of Human Evolution.

Next, I retrieved the full texts of the articles listed in the csv table. I used pii as the unique identifier (one could equally have used DOI). I took PII from the csv table, which we retrieved a step earlier, column no. 15. This saved each article in folder `data`. I [shared two full-text files](https://github.com/zliobaite/text_mining_human_evolution/tree/main/1_getting_texts/data), as an example of what arrived.  It's text, there are no figures. But the texts contain meta data and links, which we'll need to remove before proceeding to analyzing research content.

### 2. Preprocessing

The next step is to clean and standardize the texts (convert nouns to singular, verbs to present tense and alike). [This script](https://github.com/zliobaite/text_mining_human_evolution/blob/main/2_preprocessing/run2_texts_to_data.py) cleans the texts and saves them into a csv file together with meta data about the articles. Meta data includes DOIs, PIIs, titles, page ranges, authors and more. The script does the following. [`corpus_JHE_demo.csv`](https://github.com/zliobaite/text_mining_human_evolution/blob/main/2_preprocessing/corpus_JHE_demo.csv) shows the processed data formal looks, the file only has three articles, not the whole corpus.

The script reads all files from the directory `data`. That is the directory where we saved the texts retrieved from Scopus. Each file is one article. Each article is read into one long string of words. The script removes punctuations, removes double white spaces and converts characters to lower case using `clean_text` function.

Next I used [Natural Language Toolkit (NLTK)](https://www.nltk.org/) of Python for converting texts into data that can be used for predictive modeling. I pushed the texts through a tokenizer, that is converted a sequence of characters into a sequence of tokens ("features").  Sometimes tokens can be more than one word, for example, bigrams or n-grams combining multiple words. Most commonly each word is one token, that's what I did here. I used [`TweetTokenizer`](https://www.nltk.org/api/nltk.tokenize.html). Then I removed English stopwords (NLKT) package has a tool for that (`nltk.corpus.stopwords.words('english')`). Then I removed the remaining words shorter than 2 characters and longer than 20 characters, this helped to get rid of remaining artifacts due to web links present in the texts.

Then I lemmatized the words. Lemmatization groups together inflected words such that they can be analyzed as having the same meaning. For example, the word "better" is changed to "good", or the word "chewing" is changed to "chew". I used [`WordNetLemmatizer`](https://www.nltk.org/howto/wordnet.html) from NLTK.

Finally, I put back the processed text into one string again. This step is redundant because when I start analyzing the text, I'll need to tokenize it again. But I did it because I wanted to have all preprocessed texts in one csv file called [`corpus_JHE.csv`], you'll see this name in the script. This file is over 100MB, so I zipped it. For a quick view I made a subsample file [`corpus_JHE_demo.csv`](https://github.com/zliobaite/text_mining_human_evolution/blob/main/2_preprocessing/corpus_JHE_demo.csv) that has three rows corresponding to three articles. The full corpus had 4014 articles.

There was one more step in the sequence. I wanted to exclude editorial announcements and other short pieces from the analysis. For that purpose I only included an article in the corpus if it had more than one page. For this I (unelegantly) used the dash from the page number column. Since the originally retrieved set of metadata missed a few page numbers, I filled them manually, thence the input file in preprocessing was `articles_JHE_added_pages.csv` instead of `articles_JHE.csv`, which we got in step 1.

## 3. Topic modeling and sentiment analysis

The next step is [topic modeling](https://en.wikipedia.org/wiki/Topic_model). I used [Jupyter Notebook](https://jupyter.org/), which is an interactive environment for coding and allows to change modeling parameters, rerun parts of the pipeline and visualize the results. Jupyter is not specific to text mining, and not necessary for this analysis, I just used it for convenience. The code can be executed as is in `python`.

[This notebook](https://github.com/zliobaite/text_mining_human_evolution/blob/main/3_topic_modeling/run3_analyze.ipynb) that contains my script for the analysis, it's commented upon. And the results are discussed in [the previous post]({{ site.baseurl }}{% link _posts/2021-7-30-Human-evolution1.md %}). The notebook includes topic modeling and sentiment classification.

Three csv files are saved as a result of this run:
- `topics_keywords.csv` has 10 rows, each row is one topic resulting from the topic modeling. In the columns are relative importance of words in each topic. The words are in the column headers. The higher the number, the more important is this word for this topic. One can extract, for example, 30 most important words for each topic, as shown in [the previous post]({{ site.baseurl }}{% link _posts/2021-7-30-Human-evolution1.md %}). One can visualize topics as [wordclouds](https://amueller.github.io/word_cloud/), as also shown in [the previous post]({{ site.baseurl }}{% link _posts/2021-7-30-Human-evolution1.md %}).
- `dominant_topics.cs` for each document (one document is one row) gives fractions of assignments to topics. The topics are numbered from 0 to 9 in the columns and the fractions sum up to 100%(=1). This means that a document can be assignment, for example, 80% to Topic#1, 11% to Topic#3 and 9% to Topic#8.
- `sentiments.csv` gives sentiment classification for each document. Each row is one document. Columns: `neg` -- fraction of negative sentiment per document,
`neu` -- fraction of neutral sentiment per document,
`pos` - fraction of positive sentiment per document,
compound -- overall polarity score which I am not using in the analysis,
`eid` and `pii` -- unique identifiers of the articles.

The very last step is visualization of topics and sentiments over time. For my convenience I implemented it in `R`, the script is [here](https://github.com/zliobaite/text_mining_human_evolution/blob/main/3_topic_modeling/run4_visualize_sentiments.R). The output files of that run can be used for visualization. I aggregated the results over 5 year time bins. They are stored in folder `sentiment_plots`.  The output files are:
- `data_all_articles.csv` -- meta data on all articles together with their topic assignments and sentiment classification.
- `year_results.csv` -- fraction of topics within each time period.
- `year_sentiment_pos.csv` -- the prevalence of positive sentiments over time within each topic.
- `year_sentiment_neg.csv` -- the prevalence of negative sentiments over time within each topic.
- `year_sentiment_neu.csv` -- the prevalence of neutral sentiments over time within each topic.


The code mentioned in this post is stored on [GitHub](https://github.com/zliobaite/text_mining_human_evolution).
