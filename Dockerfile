# syntax=docker/dockerfile:1
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install --yes apt-utils
RUN apt-get install --yes cmake g++ gfortran python-dev
RUN apt-get install --yes libgsl0-dev
#RUN apt-get install --yes liblhapdf0 lhapdf-pdfsets-minimal
#RUN apt-get install --yes libmuparser libmuparser-dev

# ROOT installation
ADD https://root.cern/download/root_v6.24.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz .
ADD root_v6.24.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz /usr/local
SHELL ["/bin/bash", "-c"]
RUN ls --recursive /usr/local
RUN echo "source /usr/local/root/bin/thisroot.sh" >> ~/.bashrc
RUN source ~/.bashrc && root -v -q
RUN rm -f root_v6.24.02.Linux-ubuntu20-x86_64-gcc9.3.tar.gz

RUN apt-get install --yes libpythia8-dev
RUN apt-get clean
RUN python --version
