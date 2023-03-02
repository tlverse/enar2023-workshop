# (PART) Part 2: The `tlverse` {-}

# What is the `tlverse`? {-}

The `tlverse` is a new framework for Targeted Learning in `R`, inspired by
the [`tidyverse` ecosystem](https://tidyverse.org) of `R` packages.

By analogy to the [`tidyverse`](https://tidyverse.org/):

> The `tidyverse` is an opinionated collection of `R` packages designed for data
> science. All packages share an underlying design philosophy, grammar, and data
> structures.

So, the [`tlverse`](https://tlverse.org) is

> An opinionated collection of `R` packages for Targeted Learning sharing an
> underlying design philosophy, grammar, and core set of data structures. The
> `tlverse` aims to provide tools both for building Targeted Learning-based
> data analyses and for implementing novel, state-of-the-art Targeted Learning
> methods.

## Anatomy of the `tlverse` {-}

All Targeted Learning methods are targeted maximum likelihood (or minimum
loss-based) estimators (i.e., TMLEs). The construction of any Targeted Learning
estimator proceeds through a two-stage process:

1. Flexibly learning particular components of the data-generating distribution
   often through machine learning (e.g., Super Learning), resulting in _initial
   estimates_ of nuisance parameters.
2. Use of a carefully constructed parametric model-based update, via maximum
   likelihood estimation (i.e., MLE), incorporating the initial estimates
   produced by the prior step to produce a TML estimator.

The packages making up the core components of the `tlverse` software ecosystem
-- `sl3` and `tmle3` -- address the above two goals, respectively. Together, the
general functionality exposed by both allows one to build specific TMLEs
tailored exactly to a particular statistical estimation problem.

The software packages that make up the **core** of the `tlverse` are

* [`sl3`](https://github.com/tlverse/sl3): Modern Super Machine Learning
  * _What?_ A modern object-oriented implementation of the Super Learner
    algorithm, employing recently developed paradigms in `R` programming.
  * _Why?_ A design that leverages modern ideas for faster computation, is
    easily extensible and forward-looking, and forms one of the cornerstones of
    the `tlverse`.

* [`tmle3`](https://github.com/tlverse/tmle3): An Engine for Targeted Learning
  * _What?_ A generalized framework that simplifies Targeted Learning by
    identifying and implementing a series of common statistical estimation
    procedures.
  * _Why?_ A common interface and engine that accommodates current algorithmic
    approaches to Targeted Learning and yet remains a flexible enough engine to
    power the implementation of emerging statistical techniques as they are
    developed.

Beyond these engines that provide the driving force behind the `tlverse`, there
are a few supporting packages that play important roles in the **background**:

* [`origami`](https://github.com/tlverse/origami): A Generalized Framework for
   Cross-Validation [@coyle2018origami]
  * _What?_ A generalized framework for flexible cross-validation.
  * _Why?_ Cross-validation is a key part of ensuring error estimates are honest
    and in preventing overfitting. It is an essential part of both the Super
    Learner ensemble modeling algorithm and in the construction of TML
    estimators.

* [`delayed`](https://github.com/tlverse/delayed): Parallelization Framework for
   Dependent Tasks
  * _What?_ A framework for delayed computations (i.e., futures) based on task
    dependencies.
  * _Why?_ Efficient allocation of compute resources is essential when deploying
    computationally intensive algorithms at large scale.

A key principle of the `tlverse` is extensibility. That is, the software
ecosystem aims to support the development of novel Targeted Learning estimators
as they reach maturity. To achieve this degree of flexibility, we follow the
model of implementing new classes of estimators, for distinct causal inference
problems in separate packages, all of which rely upon the core machinery
provided by `sl3` and `tmle3`. There are currently three examples:

* [`tmle3mopttx`](https://github.com/tlverse/tmle3mopttx): Optimal Treatments
  in the `tlverse`
  * _What?_ Learn an optimal rule and estimate the mean outcome under the rule.
  * _Why?_ Optimal treatments are a powerful tool in precision healthcare and
    other settings where a one-size-fits-all treatment approach is not
    appropriate.

* [`tmle3shift`](https://github.com/tlverse/tmle3shift): Stochastic Shift
  Interventions based on Modified Treatment Policies in the `tlverse`
  * _What?_ Stochastic shift interventions for evaluating changes in
    continuous-valued treatments.
  * _Why?_ Not all treatment variables are binary or categorical. Estimating the
    total effects of intervening on continuous-valued treatments provides a way
    to probe how an effect changes with shifts in the treatment variable.

* [`tmle3mediate`](https://github.com/tlverse/tmle3mediate): Causal Mediation
  Analysis in the `tlverse`
  * _What?_ Techniques for evaluating the direct and indirect effects of
    treatments through mediating variables.
  * _Why?_ Evaluating the total effect of a treatment does not provide
    information about the pathways through which it may operate. When mediating
    variables have been collected, one can instead evaluate direct and indirect
    effect parameters that speak to the _action mechanism_ of the treatment.

## Reproduciblity with the `tlverse` {-}

The `tlverse` software ecosystem is a growing collection of packages, several of
which are quite early on in the software lifecycle. The team does its best to
maintain backwards compatibility. Once this work reaches completion, the
specific versions of the `tlverse` packages used will be archived and tagged to
produce it.

This book was written using [bookdown](http://bookdown.org/), and the complete
source is available on [GitHub](https://github.com/tlverse/tlverse-handbook).
This version of the book was built with R version 4.2.2 (2022-10-31),
[pandoc](https://pandoc.org/) version 2.7.3, and the
following packages:


|package      |version    |source                                                                  |
|:------------|:----------|:-----------------------------------------------------------------------|
|bookdown     |0.26.3     |Github (rstudio/bookdown\@169c43b6bb95213f2af63a95acd4e977a58a3e1f)     |
|bslib        |0.3.1.9000 |Github (rstudio/bslib\@a4946a49499438e71dce29c810a41e2d05170376)        |
|dagitty      |0.3-1      |CRAN (R 4.2.2)                                                          |
|data.table   |1.14.6     |CRAN (R 4.2.2)                                                          |
|delayed      |0.4.0      |CRAN (R 4.2.2)                                                          |
|devtools     |2.4.3      |CRAN (R 4.2.2)                                                          |
|downlit      |0.4.0      |CRAN (R 4.2.2)                                                          |
|dplyr        |1.0.10     |CRAN (R 4.2.2)                                                          |
|forecast     |8.16       |CRAN (R 4.2.2)                                                          |
|future       |1.30.0     |CRAN (R 4.2.2)                                                          |
|ggdag        |0.2.4      |CRAN (R 4.2.2)                                                          |
|ggfortify    |0.4.15     |CRAN (R 4.2.2)                                                          |
|ggplot2      |3.4.0      |CRAN (R 4.2.2)                                                          |
|here         |1.0.1      |CRAN (R 4.2.2)                                                          |
|kableExtra   |1.3.4      |CRAN (R 4.2.2)                                                          |
|knitr        |1.39       |CRAN (R 4.2.2)                                                          |
|mvtnorm      |1.1-3      |CRAN (R 4.2.2)                                                          |
|origami      |1.0.7      |Github (tlverse/origami\@2c4476fefd80cf125e942a6f8ab98600b52955e8)      |
|randomForest |4.7-1.1    |CRAN (R 4.2.2)                                                          |
|readr        |2.1.2      |CRAN (R 4.2.2)                                                          |
|rmarkdown    |2.14       |CRAN (R 4.2.2)                                                          |
|skimr        |2.1.4      |CRAN (R 4.2.2)                                                          |
|sl3          |1.4.5      |Github (tlverse/sl3\@de445c210eefa5aa9dd4c0d1fab8126f0d7c5eeb)          |
|stringr      |1.5.0      |CRAN (R 4.2.2)                                                          |
|tibble       |3.1.8      |CRAN (R 4.2.2)                                                          |
|tidyr        |1.2.1      |CRAN (R 4.2.2)                                                          |
|tidyverse    |1.3.1      |CRAN (R 4.2.2)                                                          |
|tmle3        |0.2.0      |Github (tlverse/tmle3\@ed72f8a20e64c914ab25ffe015d865f7a9963d27)        |
|tmle3mediate |0.0.3      |Github (tlverse/tmle3mediate\@70d1151c4adb54d044f355d06d07bcaeb7f8ae07) |
|tmle3mopttx  |1.0.0      |Github (tlverse/tmle3mopttx\@c8c675f051bc5ee6d51fa535fe6dc80791d4d1b7)  |
|tmle3shift   |0.2.0      |Github (tlverse/tmle3shift\@4ed52b50af501a5fa2e6257b568d17fd485d3f42)   |

# Primer on the `R6` Class System {-}

The `tlverse` is designed using basic object oriented programming (OOP)
principles and the [`R6` OOP framework](https://adv-r.hadley.nz/r6.html). While
we've tried to make it easy to use the `tlverse` packages without worrying much
about OOP, it is helpful to have some intuition about how the `tlverse` is
structured. Here, we briefly outline some key concepts from OOP. Readers
familiar with OOP basics are invited to skip this section.

## Classes, Fields, and Methods {-}

The key concept of OOP is that of an object, a collection of data and functions
that corresponds to some conceptual unit. Objects have two main types of
elements:

1. _fields_, which can be thought of as nouns, are information about an object,
   and
2. _methods_, which can be thought of as verbs, are actions an object can
   perform.

Objects are members of classes, which define what those specific fields and
methods are. Classes can inherit elements from other classes (sometimes called
base classes) -- accordingly, classes that are similar, but not exactly the
same, can share some parts of their definitions.

Many different implementations of OOP exist, with variations in how these
concepts are implemented and used. `R` has several different implementations,
including `S3`, `S4`, reference classes, and `R6`. The `tlverse` uses the `R6`
implementation. In `R6`, methods and fields of a class object are accessed using
the `$` operator. For a more thorough introduction to `R`'s various OOP systems,
see http://adv-r.had.co.nz/OO-essentials.html, from Hadley Wickham's _Advanced
R_ [@wickham2014advanced].

## Object Oriented Programming: `Python` and `R` {-}

OO concepts (classes with inheritance) were baked into Python from the first
published version (version 0.9 in 1991). In contrast, `R` gets its OO "approach"
from its predecessor, `S`, first released in 1976. For the first 15 years, `S`
had no support for classes, then, suddenly, `S` got two OO frameworks bolted on
in rapid succession: informal classes with `S3` in 1991, and formal classes with
`S4` in 1998. This process continues, with new OO frameworks being periodically
released, to try to improve the lackluster OO support in `R`, with reference
classes (`R5`, 2010) and `R6` (2014). Of these, `R6` behaves most like Python
classes (and also most like OOP focused languages like C++ and Java), including
having method definitions be part of class definitions, and allowing objects to
be modified by reference.

