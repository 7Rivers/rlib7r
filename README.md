# rlib7r
R package for internal use of MedGenome | 7 Rivers. It interfaces with SAS-ATLAS API and other data sources (UKB, array) and performs stats/ML tasks.

## Primer
Read <a href='http://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html'>Fong Chun Chan's blog post</a> for advise on how to use `devtools` and `roxygen2` to build an R package.

If you haven't already, install 
```
install.packages("devtools")
install.packages("roxygen2")
```

## Style Guide
While not strict, it is a good idea to follow <a href='http://web.stanford.edu/class/cs109l/unrestricted/resources/google-style.html'>Google's R Style Guide</a>:

### Summary: R Style Rules
- File Names: end in `.R`
- Identifiers: `variable.name`, `FunctionName`, `kConstantName`
- Line Length: maximum 80 characters
- Indentation: two spaces, no tabs
- Curly Braces: first on same line, last on own line
- Assignment: use `<-`, not `=`, never `->`
- Semicolons: don't use them
- Commenting Guidelines: all comments begin with `#` followed by a space; inline comments need two spaces before the `#`
- Function Documentation: see how to write `roxygen` doc strings in <a href='http://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html'>Fong Chun Chan's blog</a>
- TODO Style: TODO(username)

## Basic building and test process

Before you re-build the R package, update the documentation files (`.Rd`).
```
devtools::document()
```
Then build and install.
```
devtools::build()
devtools::install()
```
### If you use functions from another package
Add dependency in `DESCRIPTION` under `Imports`.  Do not use `library` or `require`.
