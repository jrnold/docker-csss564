FROM jrnold/rstan:latest
MAINTAINER Jeffrey Arnold jeffrey.arnold@gmail.com

# Essential to build stanc
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
        jags
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/

RUN install2.r  --error \
    rjags \
    runjags \
    MCMCpack \
    MCMCglmm \
    ggmcmc \
    LearnBayes
