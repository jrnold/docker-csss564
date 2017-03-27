FROM jrnold/rstan:latest
MAINTAINER Jeffrey Arnold jeffrey.arnold@gmail.com

ENV JAGS_VERSION 4.2.0

RUN wget https://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-${JAGS_VERSION}.tar.gz \
    && tar -xf JAGS-${JAGS_VERSION}.tar.gz \
    && cd JAGS-${JAGS_VERSION} \
    && ./configure \
    && make install \
    && cd .. \
    && rm -rf JAGS-${JAGS_VERSION} JAGS-${JAGS_VERSION}.tar.gz

RUN install2.r --error \
    rjags \
    runjags \
    MCMCpack \
    MCMCglmm \
    ggmcmc \
    LearnBayes \
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

RUN  r -e 'devtools::install_github("rmcelreath/rethinking")'
