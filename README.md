# BRMoviePredictor
A Data mining Technique for Analyzing and Predicting the success of a Brazilian movie

## Introduction
This article proposes a way to predict the success of a Brazilian film before its arrival at the box office. Knowing which movies are likely to be successful and which ones will probably fail before launch can greatly benefit the producers. Instead of listening to critics' opinion, we apply machine learning algorithms and statistics techniques to make that decision. The data of the films are based on a Brazilian Observatory of Cinema and Audiovisual managed by the National Cinema Agency (ANCINE) from the years 1995 to 2017. This database contains information on various information related to Brazilian productions. Among them, it is worth pointing out the genre, director, producer, distributor, total audience and their income obtained. The data we have obtained are highly susceptible to noisy, absent and inconsistent data due to the long stored period. The main problem with datasets was the lack of fields. To overcome this missing field problem, we prefer to remove this data.

## How it Works
A total of 3 classification models and 3 regression models were used to answer the study question. We used the input resources (Director, Gender, Distributor) to predict the destination variable (Public / Income). We used the functionalities and packages in the R language in the mining process. The techniques chosen were Neural Networks, Mixture Discriminant Analysis (MDA) and Random Forest for classification and k-Nearest Neighbor (kNN), Support Vector Machines (SVM) and Ridge Regression for regression. In all cases they address the following question: "Can we predict whether a movie will be successful before it reaches the box office?"

## Full Study
