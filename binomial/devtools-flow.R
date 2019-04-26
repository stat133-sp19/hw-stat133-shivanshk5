# Title: Devtools Workflow
# Author: Shivansh Kumar
# Date: 1 May 2019
# Description: Devtools workflow guide

# Loading Library
library(devtools)

devtools::document()          # generate documentation
devtools::check_man()         # check documentation
devtools::test()              # run tests
devtools::build_vignettes()   # build vignettes
devtools::build()             # build bundle
devtools::install()           # install package
