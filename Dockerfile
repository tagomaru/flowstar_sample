FROM ubuntu:16.04

# set workdir
WORKDIR /flowstar/

# update and upgrade
RUN apt-get -y update && apt-get -y upgrade

# install compiler stuff
RUN apt-get -y install make g++ libyaml-cpp-dev

# copy
COPY . /flowstar/

# 1. Install Flow* libraries
RUN apt-get -y install libgmp3-dev libmpfr-dev libmpfr-doc libmpfr4 libmpfr4-dbg \
        gsl-bin libgsl0-dev bison flex gnuplot-x11 libglpk-dev

# 2. Complie Flow*
RUN make