# syntax=docker/dockerfile:1
FROM fedora:39
RUN dnf update -y
RUN dnf install -y cmake g++ gfortran valgrind
RUN dnf install -y ninja-build

# Python installation
RUN dnf install -y python3 python3-devel
RUN python3 --version

# ROOT installation
RUN dnf install -y root-* python3-root
RUN root -v -q

# external add-ons

# physics
RUN wget https://pythia.org/download/pythia6/pythia6428.f && gfortran -fPIC -shared pythia6428.f -o /usr/local/lib/libpythia6.so
RUN dnf install -y pythia8-devel
RUN dnf install -y lhapdf lhapdf-devel
RUN dnf install -y HepMC HepMC-devel
RUN dnf install -y HepMC3 HepMC3-devel

# utilities
RUN dnf install -y gsl gsl-devel
RUN dnf install -y CTML-devel
RUN dnf install -y gnuplot
RUN dnf install -y doxygen
RUN dnf install -y copr-rpmbuild

# environment cleanup
RUN dnf clean all
