# syntax=docker/dockerfile:1
FROM gitlab-registry.cern.ch/ci-tools/ci-worker:cc7
RUN yum update -y
RUN yum group install -y "Development Tools"
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8
RUN yum install -y cmake3 g++ gcc-gfortran

# Python installation
RUN yum install -y python3 python3-devel
RUN python3 --version

RUN yum install -y gsl gsl-devel
RUN yum install -y lhapdf lhapdf-devel

# ROOT installation
RUN yum install -y root root-foam python3-root
RUN root -v -q

RUN yum install -y pythia8-devel
RUN yum clean all

RUN scl enable devtoolset-8 bash
