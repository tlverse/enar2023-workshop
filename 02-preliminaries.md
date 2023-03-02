# (PART) Part 1: Preliminaries {-}

# Setting up `R` and RStudio {-}

**`R`** and **RStudio** are separate downloads and installations. `R` is the
underlying statistical computing environment. RStudio is a graphical integrated
development environment (IDE) that makes using `R` much easier and more
interactive. You need to install `R` before you install RStudio.

## Windows {-}

### If you already have `R` and RStudio installed: {-}

* Open RStudio, and click on "Help" > "Check for updates". If a new version is
  available, quit RStudio, and download the latest version for RStudio.
* To check which version of `R` you are using, start RStudio and the first thing
  that appears in the console indicates the version of `R` you are
  running. Alternatively, you can type `sessionInfo()`, which will also display
  which version of `R` you are running. Go on the [CRAN
  website](https://cran.r-project.org/bin/windows/base/) and check whether a
  more recent version is available. If so, please download and install it. You
  can [check here](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f)
  for more information on how to remove old versions from your system if you
  wish to do so.

### If you don't have `R` and RStudio installed: {-}

* Download `R` from
  the [CRAN website](http://cran.r-project.org/bin/windows/base/release.htm).
* Run the `.exe` file that was just downloaded
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Windows
  XP/Vista/7/8** (where x, y, and z represent version numbers)
* Double click the file to install it
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

## macOS / Mac OS X {-}

### If you already have `R` and RStudio installed: {-}

* Open RStudio, and click on "Help" > "Check for updates". If a new version is
  available, quit RStudio, and download the latest version for RStudio.
* To check the version of `R` you are using, start RStudio and the first thing
  that appears on the terminal indicates the version of `R` you are running.
  Alternatively, you can type `sessionInfo()`, which will also display which
  version of `R` you are running. Go on the [CRAN
  website](https://cran.r-project.org/bin/macosx/) and check whether a more
  recent version is available. If so, please download and install it.

### If you don't have `R` and RStudio installed: {-}

* Download `R` from
  the [CRAN website](http://cran.r-project.org/bin/macosx).
* Select the `.pkg` file for the latest `R` version
* Double click on the downloaded file to install R
* It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed
  by some packages)
* Go to the [RStudio download
  page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)**
  (where x, y, and z represent version numbers)
* Double click the file to install RStudio
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

## Linux {-}

* Follow the instructions for your distribution
  from [CRAN](https://cloud.r-project.org/bin/linux), they provide information
  to get the most recent version of `R` for common distributions. For most
  distributions, you could use your package manager (e.g., for Debian/Ubuntu run
  `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we
  don't recommend this approach as the versions provided by this are
  usually out of date. In any case, make sure you have the most recent version 
  of `R`.
* Go to the [RStudio download
  page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select the version that matches your distribution, and
  install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i
  rstudio-x.yy.zzz-amd64.deb` at the terminal).
* Once it's installed, open RStudio to make sure it works and you don't get any
  error messages.

These setup instructions are adapted from those written for [Data Carpentry: R
for Data Analysis and Visualization of Ecological
Data](http://www.datacarpentry.org/R-ecology-lesson/).

# Install `tlverse` software {#installtlverse} {-}

The `tlverse` ecosystem of packages are currently hosted at
https://github.com/tlverse, not fully on [CRAN](https://CRAN.R-project.org/) yet. 
You can use the [`usethis` package](https://usethis.r-lib.org/) to install all 
tlverse packages or specific packages:


```r
install.packages("devtools")

# install all tlverse packages 
devtools::install_github("tlverse/tlverse")

# install a specific package (example is sl3)
devtools::install_github("tlverse/sl3")

# install a specific branch of package (example is devel branch of sl3)
# (first clear workspace and restart R)
devtools::install_github("tlverse/sl3@devel")

```

The `tlverse` packages depend on other packages that are also hosted on GitHub. 
Because of this, you may see the following error:

```
Error: HTTP error 403.
  API rate limit exceeded for 71.204.135.82. (But here's the good news:
  Authenticated requests get a higher rate limit. Check out the documentation
  for more details.)

  Rate limit remaining: 0/60
  Rate limit reset at: 2019-03-04 19:39:05 UTC

  To increase your GitHub API rate limit
  - Use `usethis::browse_github_pat()` to create a Personal Access Token.
  - Use `usethis::edit_r_environ()` and add the token as `GITHUB_PAT`.
```

This just means that `R` tried to install too many packages from GitHub in too
short of a window. To fix this, you need to tell `R` how to use GitHub as your
user (you'll need a GitHub user account). Follow these two steps:

1. Type `usethis::browse_github_pat()` in your `R` console, which will direct
   you to GitHub's page to create a New Personal Access Token (PAT).
2. Create a PAT simply by clicking "Generate token" at the bottom of the page.
3. Copy your PAT, a long string of lowercase letters and numbers.
4. Type `usethis::edit_r_environ()` in your `R` console, which will open your
   `.Renviron` file in the source window of RStudio.

    a. If your `.Renviron` file does not pop-up after calling
       `usethis::edit_r_environ()`; then try inputting
       `Sys.setenv(GITHUB_PAT = "yourPAT")`, replacing your PAT with inside the
       quotes. If this does not error, then skip to step 8.

5. In your `.Renviron` file, type `GITHUB_PAT=` and then paste your PAT after
   the equals symbol with no space.
6. In your `.Renviron` file, press the enter key to ensure that your `.Renviron`
   ends with a new line.
7. Save your `.Renviron` file. The example below shows how this syntax should
   look.

  
  ```r
  GITHUB_PAT=yourPAT
  
  ```

8. Restart R. You can restart `R` via the drop-down menu on RStudio's "Session"
   tab, which is located at the top of the RStudio interface. You have to
   restart `R` for the changes to take effect!

After following these steps, you should be able to successfully install the
package which threw the error above.

# Supplemental learning resources {-}

To effectively utilize these materials, the reader need not be a fully trained
statistician. However, it is highly recommended for the reader to have an 
understanding of basic statistical concepts such as confounding, probability 
distributions, confidence intervals, hypothesis tests, and regression. Advanced 
knowledge of mathematical statistics may be useful but is not necessary. 
Familiarity with the `R` programming language will be essential. We also 
recommend an understanding of introductory causal inference.

For learning the `R` programming language we recommend the following (free)
introductory resources:

* [Software Carpentry's _Programming with
    `R`_](http://swcarpentry.github.io/r-novice-inflammation/)
* [Software Carpentry's _`R` for Reproducible Scientific
    Analysis_](http://swcarpentry.github.io/r-novice-gapminder/)
* [Garret Grolemund and Hadley Wickham's _`R` for Data
    Science_](https://r4ds.had.co.nz)

For a general, modern introduction to causal inference, we recommend

* [Miguel A. Hernán and James M. Robins' _Causal Inference: What If_
    (2022)](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/)
* [Jason A. Roy's _A Crash Course in Causality: Inferring Causal Effects from
  Observational Data_ on
  Coursera](https://www.coursera.org/learn/crash-course-in-causality)

Feel free to [suggest a
resource](https://github.com/tlverse/tlverse-handbook/issues)!
