---
knit: "bookdown::render_book"
title: "[ENAR 2023 Short Course] Targeted Learning in the `tlverse`"
subtitle: "Advanced Methods for Causal Machine Learning"
author: "Mark van der Laan, Alan Hubbard, Jeremy Coyle, Nima Hejazi, Ivana
  Malenica, Rachael Phillips"
date: "updated: March 07, 2023"
documentclass: book
site: bookdown::bookdown_site
bibliography: [book.bib, packages.bib]
biblio-style: apalike
fontsize: '12pt, krantz2'
monofontoptions: "Scale=0.7"
link-citations: yes
colorlinks: yes
lot: yes
lof: yes
always_allow_html: yes
url: 'https\://tlverse.org/enar2023-workshop/'
github-repo: tlverse/enar2023-workshop
graphics: yes
description: "Open source, reproducible teaching materials accompanying a
  short course on Targeted Learning with the [`tlverse` software
  ecosystem](https://github.com/tlverse)."
---

# Welcome! {-}

This open source, reproducible vignette is for a full-day short course at the 
2023 International Biometric Society Eastern North American Region (ENAR) 
Conference in Nashville, Tennessee. Beyond introducing the Targeted Learning 
framework for causal and statistical inference with machine learning, this 
course focuses on applying the methodology in practice using the [`tlverse` 
software ecosystem](https://github.com/tlverse). The materials are based on a 
working draft of the book, [*Targeted Learning in `R`: Causal Data Science with 
the `tlverse` Software Ecosystem*](https://tlverse.org/tlverse-handbook/), which
includes in-depth discussion of these topics and much more, and may serve as a
useful reference to accompany these workshop materials.

<img style="float: center; margin-right: 1%; margin-bottom: 0.01em"
     src="img/logos/tlverse-logo.svg" width="30%" height="30%">
<img style="float: center; margin-right: 1%; margin-bottom: 0.01em"
     src="img/logos/Rlogo.svg" width="35%" height="35%">
<img style="float: center; margin-right: 1%; margin-bottom: 0.01em"
     src="img/logos/vdl-logo-transparent.svg" width="30%" height="30%">
<p style="clear: both;">
<br>

## Important links {-}

* __Load R environment__: Please set up the `R` virtual environment using the
  [instructions](https://github.com/tlverse/enar2023-workshop/blob/master/install.md).
  If you experiencing issues with the `R` environment, you may install the 
  relevant software packages before the workshop using the [installation
  script](https://github.com/tlverse/enar2023-workshop/blob/master/install.R).

* You will probably exceed the GitHub API rate limit during this installation,
  which will throw an error. This issue and the solution are addressed
  [here](#installtlverse).

* __Code__: `R` script files for each section of the workshop are available via
  the GitHub repository for the workshop at
  https://github.com/tlverse/enar2023-workshop/tree/master/R_code

## About this workshop {-}

This full-day workshop provides a comprehensive introduction to the field of 
Targeted Learning, at the intersection of causal inference and machine learning, 
and its accompanying [`tlverse` software ecosystem](https://github.com/tlverse). 
Focus will be on targeted minimum loss estimators of causal effects, in 
particular of sophisticated intervention regimes (dynamic, optimal dynamic, 
stochastic), heterogeneous treatment effects, and ensemble machine learning of 
complex functionals (multinomial probabilities, conditional densities). The 
robust, efficient plug-in estimators that will be introduced leverage 
state-of-the-art, ensemble machine learning tools in order to flexibly adjust 
for confounding while yielding valid statistical inference. This course will 
be of interest to both statistical and applied scientists engaged in 
biomedical/health studies, whether experimental or observational, who wish to 
apply cutting-edge statistical and causal inference methodology to rigorously 
formalizing and answering substantive questions. This workshop incorporates 
interactive discussions and hands-on, guided R programming exercises, allowing 
participants to familiarize themselves with methodology and tools that 
translate to real-world data analysis.

Participants are highly recommended to have had prior training in basic 
statistical concepts (e.g., confounding, probability distributions, hypothesis 
testing and confidence intervals, regression). Advanced knowledge of 
mathematical statistics is useful but not necessary. Familiarity with the `R` 
programming language is essential.

## Tentative schedule {-}

* _Optional pre-workshop reading_: The Roadmap of Targeted Learning and [Why We 
  Need A Statistical Revolution](https://senseaboutscienceusa.org/super-learning-and-the-revolution-in-knowledge/)
* 08:00-10:00: Introduction to Targeted Learning
* 10:00-10:20: Coffee break
* 10:20-10:45: Introduction to the `tlverse`
* 10:45-12:00: Super learning with the [`sl3` `R`
  package](https://github.com/tlverse/sl3)
* 12:00-01:00: Lunch break
* 01:00-01:30: Brief intro to the [`tmle3` `R`
  package](https://github.com/tlverse/tmle3) 
* 01:30-03:00: Optimal treatment regimes with the [`tmle3mopttx` `R`
  package](https://github.com/tlverse/tmle3mopttx)
* 03:00-03:20: Coffee break
* 03:20-05:00: Stochastic treatment regimes with the [`tmle3shift` `R`
  package](https://github.com/tlverse/tmle3shift)


## About the instructors {-}

### Mark van der Laan {-}

[Mark van der Laan](https://vanderlaan-lab.org) is the Jiann-Ping Hsu/Karl E. 
Peace Professor of Biostatistics and Statistics at the University of California,
Berkeley. He has made contributions to survival analysis, semiparametric 
statistics, multiple testing, and causal inference. He also developed the 
targeted maximum likelihood methodology and general theory for super-learning. 
He is a founding editor of the Journal of Causal Inference and International 
Journal of Biostatistics. He has authored four books on Targeted Learning, 
censored data and multiple testing, authored over 300 publications, and 
graduated over 50 PhD students. He received the COPSS Presidents' Award in 2005, 
the Mortimer Spiegelman Award in 2004, and the van Dantzig Award in 2005.

### Alan Hubbard {-}

Alan Hubbard is a Professor and the Head of Biostatistics at the University of 
California at Berkeley (UCB), Co-director of the [Center of Targeted 
Learning](https://ctml.berkeley.edu), Head of the Computational Biology 
Core of the SuperFund Center at UCB (NIH/EPA), and a consulting 
statistician on several federally funded and foundation projects. He has worked 
as well on projects ranging from molecular biology of aging, epidemiology, and 
infectious disease modeling, but most all of his work has focused on 
semi-parametric estimation in high-dimensional data. His current 
methods-research focuses on precision medicine, variable importance, 
statistical inference for data-adaptive parameters, and statistical software 
implementing targeted learning methods. Alan is currently working in several 
areas of applied research, including early childhood development in developing 
countries, environmental genomics and comparative effectiveness research. He has 
most recently concentrated on using complex patient data for better prediction 
for acute trauma patients.

### Nima Hejazi {-}

[Nima Hejazi](https://nimahejazi.org), is an Assistant Professor of 
Biostatistics at the Harvard T.H. Chan School of Public Health. He recently 
completed an NSF Mathematical Sciences Postdoctoral Research Fellowship, and, 
prior to this, obtained his PhD in Biostatistics from UC Berkeley. He has been 
on the founding core development team of the [`tlverse` 
project](https://github.com/tlverse), an extensible software ecosystem for 
targeted learning, and, since 2020, has collaborated very closely with the 
Vaccine and Infectious Disease Division of the Fred Hutchinson Cancer Center as 
a core member of the US Government Immune Correlates Biostatistical Analysis 
Team of the NIAID-funded COVID-19 Prevention Network. Nima's research interests 
combine causal inference and machine learning, driven by the aim of developing 
assumption-lean statistical procedures tailored for efficient and robust 
inference about scientifically informative parameters. He is particularly 
motivated by methodological issues stemming from robust non/semi-parametric 
inference, high-dimensional inference, targeted loss-based estimation, and 
biased sampling designs, usually tied to applications from clinical trials or 
computational biology and especially as related to scientific issues concerning 
vaccine efficacy evaluation, infectious disease epidemiology, and immunology.

### Ivana Malenica {-}

[Ivana Malenica](https://imalenica.github.io/) is a Postdoctoral Researcher in 
the Department of Statistics (https://statistics.fas.harvard.edu/) at Harvard 
and a Wojcicki and Troper Data Science Fellow at the [Harvard Data Science 
Initiative](https://datascience.harvard.edu/). She obtained her PhD in 
Biostatistics at UC Berkeley working with Mark van der Laan, where she was a 
Berkeley Institute for Data Science (BIDS) Fellow and a NIH Biomedical Big 
Data Fellow. Her research interests span non/semi-parametric theory, causal 
inference and machine learning, with emphasis on personalized health and 
dependent settings. Most of her current work involves causal inference with 
time and network dependence, online learning, optimal individualized treatment, 
reinforcement learning, and adaptive sequential designs.

### Rachael Phillips {-}

Rachael Phillips is a PhD candidate in biostatistics at the University of 
California at Berkeley, advised by Professors Alan Hubbard and Mark van der Laan. 
She has an MA in Biostatistics, BS in Biology, and BA in Mathematics. As a 
student of Targeted Learning, Rachael integrates causal inference, machine 
learning, and semi-parametric statistical theory to answer causal questions with 
statistical confidence. She is a researcher for the [Center for Targeted 
Machine Learning and Causal Inference](https://ctml.berkeley.edu) and actively 
actively collaborates with Professor and chief anesthesiologist, Romain 
Pirracchio, at the University of California at San Francisco (UCSF) on the 
development of clinical algorithm frameworks and guidelines. For multiple years 
during her PhD studies, Rachael worked with and was funded by the United States 
Food and Drug Administration (FDA contract 75F40119C10155). Led by Dr. Susan 
Gruber, PI, this project focused on the use of Targeted Learning for the 
evaluation and generation of real-world evidence (RWE). Also, throughout her 
PhD, she has developed open-source software, biostatistics graduate courses 
and other educational material for Targeted Learning and causal inference. 
