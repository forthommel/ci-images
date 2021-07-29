# syntax=docker/dockerfile:1
FROM fedora:33
RUN dnf update
RUN dnf install -y cmake g++ gfortran python-devel
RUN dnf install -y gsl gsl-devel
RUN dnf install -y liblhapdf lhapdf-devel

# ROOT installation
RUN dnf install -y root root-devel
RUN root -v -q

RUN dnf install -y pythia8-devel
RUN dnf clean all
RUN python --version
