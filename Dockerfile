FROM rocker/geospatial:latest

MAINTAINER Xiangyun Huang <xiangyunfaith@outlook.com>

# System dependencies for required R packages
RUN Rscript -e "install.packages(c('devtools','RCurl'), repos = 'https://cran.rstudio.com')"

RUN Rscript -e "source('https://cdn.rawgit.com/road2stat/liftrlib/aa132a2d/install_cran.R');install_cran(c('glmnet'))"

RUN Rscript -e "source('http://bioconductor.org/biocLite.R');biocLite(c('Gviz'))"

RUN Rscript -e "source('https://cdn.rawgit.com/road2stat/liftrlib/aa132a2d/install_remotes.R');install_remotes(c('road2stat/liftr'))"

RUN mkdir /liftrroot/
WORKDIR /liftrroot/
