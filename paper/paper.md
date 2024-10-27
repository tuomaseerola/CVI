---
title: 'CVI: An R Package for Content Validity Indices'
tags:
  - R
  - content validity index
  - CVI
  - measurement
  - scale development
authors:
  - name: Tuomas Eerola
    orcid: 0000-0002-2896-929X
    affiliation: 1
affiliations:
 - name: Durham University, UK
   index: 1
date: 15 December 2024
bibliography: paper.bib
output: rticles::joss_article
csl: apa.csl
citation_package: "default"
keep_tex: TRUE
journal: JOSS
---

# Summary

In scale development in social sciences, content validity is the extent to which an instrument includes appropriate items representing the construct being measured. The Content Validity Index (CVI) is the most widely used quantitative measure of content validity, consisting of two types: item-level CVI (I-CVI) and scale-level CVI (S-CVI) [@lynn1986]. To calculate either of these measures, one starts with rating data from multiple experts who have assessed the relevance of the items on a scale. There are a number of different variants of both indices, including adjustments for chance agreement and different suggested thresholds for items and scale to achieve high content validity [@polit2006content]. The CVI package provides all common ways to calculate the CVI indices, including _CVI-I_ (item-level content validity index), _CVI-I.adjusted_ (item-level content validity index adjusted for chance agreement), _CVI-R_ (item-level content validity ratio), and two scale-level content validity indices (_S-CVI/Ave_ based on the average method and S-CVI/UA relying on the universal agreement method. In addition, various CVI thresholds depending on the index, the number of raters, and the statistical techniques are provided [@Jeldres2023].

# Statement of need

CVI is a R package for assessing the content validity of expert evaluations suitable for social sciences. While inter-rater reliability measures are found in several other packages such as `irr` [@gamer2019] and 'psych' [@revelle2024], the calculation of content validity indices are not available as a combined package although a isolated functions such as `cvi.R`[^1] or `CVratio` in `psychometric` library [@fletcher2023] can be found. Since the calculation of the content validity of items and scales is the mandatory part of any scale development, it is essential to have a flexible tool that offers the latest techniques for assessing these qualities. For context, there are 18,607 studies in Scopus in the last 10 years that match the "content validity" keyword combination. While the actual calculation of CVI measures for items is relatively simple, the decision-making thresholds and the adoption of techniques are diverse and often rely on outdated suggestions for the arbitrary thresholds [@lawshe1975quantitative; @polit2006content], even though there are better justified alternatives such as exact probabilities [@ayre2014critical] or Bayesian estimation [@baghestani2019bayesian]. These options are available in the CVI library to homogenize and facilitate scale development.

`CVI` is available from GitHub (https://github.com/tuomaseerola/CVI), and archived on Zenodo (http://doi.org/10.5281/zenodo.000000).

[^1]: https://github.com/lbraglia/lbquest/blob/master/R/cvi.R

# References
