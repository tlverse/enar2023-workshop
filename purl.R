library(here)
library(knitr)
library(stringr)

# get list of chapters for which to create .R files
chapters <- setdiff(str_subset(dir(), ".Rmd"),
                    c("01-introduction.Rmd", "02-preliminaries.Rmd", "03-intro-tlverse.Rmd", 
                      "04-intro-roadmap.Rmd", "index.Rmd", "references.Rmd"))

# create .R files
lapply(chapters, function(f) {
  purl(f, output = here("R_code", str_replace(f, ".Rmd", ".R")))
})
