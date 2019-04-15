FROM opencpu/base
LABEL Charalampos Chomenidis <hampos@me.com>
LABEL Pantelis Karatzas <pantelispanka@gmail.com>

RUN apt-get -y install libxml2-dev libcurl4-openssl-dev

RUN R -e "install.packages(c('RCurl' ,'png' ,'jsonlite' ,'assertive', 'gWidgets', 'hwriter'), repos='http://cran.cc.uoc.gr/mirrors/CRAN/')"
COPY proast61.5_0.0_R_x86_64-pc-linux-gnu.tar.gz /packages/
COPY IntPROAST61v5_1.0.tar.gz /packages/
USER root
RUN R CMD INSTALL /packages/proast61.5_0.0_R_x86_64-pc-linux-gnu.tar.gz --library=/usr/local/lib/R/site-library
RUN R CMD INSTALL /packages/IntPROAST61v5_1.0.tar.gz --library=/usr/local/lib/R/site-library


CMD /usr/sbin/apache2ctl -D FOREGROUND
