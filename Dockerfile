# syntax=docker/dockerfile:1
FROM fedora:33
RUN dnf update -y
RUN dnf install -y cmake g++ gfortran
RUN dnf install -y copr-rpmbuild

# Python installation
RUN dnf install -y python3 python3-devel
RUN python3 --version

RUN dnf install -y gsl gsl-devel
RUN dnf install -y lhapdf lhapdf-devel

# ROOT installation
RUN dnf install -y root root-foam python3-root
RUN root -v -q

RUN dnf install -y pythia8-devel
RUN dnf clean all
