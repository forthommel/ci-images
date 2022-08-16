# syntax=docker/dockerfile:1
FROM gitlab-registry.cern.ch/ci-tools/ci-worker:cc7
RUN yum update -y
RUN yum makecache
RUN yum group install -y "Development Tools"
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8
RUN yum install -y cmake3 g++ gcc-gfortran
RUN yum install -y ninja-build

# GSL installation
RUN rpm -ivvh http://springdale.princeton.edu/data/springdale/7/x86_64/os/Computational/gsl26-2.6-3.sdl7.2.x86_64.rpm
RUN rpm -ivvh http://springdale.princeton.edu/data/springdale/7/x86_64/os/Computational/gsl26-devel-2.6-3.sdl7.2.x86_64.rpm

# Python installation
RUN yum install -y python3 python3-devel
RUN python3 --version

RUN yum install -y lhapdf lhapdf-devel

# ROOT installation
RUN yum install -y root root-foam python3-root
RUN root -v -q

RUN yum install -y pythia8-devel
RUN yum clean all

RUN scl enable devtoolset-8 bash
