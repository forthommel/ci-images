# syntax=docker/dockerfile:1
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install --yes apt-utils
RUN apt-get install --yes cmake g++ gfortran python-dev
RUN apt-get install --yes libgsl0-dev
#RUN apt-get install --yes liblhapdf0 lhapdf-pdfsets-minimal
#RUN apt-get install --yes libmuparser libmuparser-dev
RUN apt-get install --yes root-system root-system-* root-plugin-* libroot-*
RUN apt-get install --yes libpythia8-dev
RUN apt-get clean
RUN python --version
