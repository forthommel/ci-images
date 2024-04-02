# syntax=docker/dockerfile:1
FROM fedora:39
RUN dnf update -y
RUN dnf install -y cmake g++ gfortran valgrind
RUN dnf install -y ninja-build

# Python installation
RUN dnf install -y python3 python3-devel
RUN python3 --version

# external add-ons

# physics
RUN curl https://pythia.org/download/pythia6/pythia6428.f -o pythia6428.f && gfortran -fPIC -shared pythia6428.f -o /usr/local/lib/libpythia6.so
RUN curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/herwig6521.f -o herwig6521.f && curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/HERWIG65.INC -o HERWIG65.INC && curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/herwig6521.INC -o herwig6521.inc && gfortran -fPIC -shared herwig6521.f -o /usr/local/lib/libherwig6.so
RUN dnf install -y pythia8-devel
RUN dnf install -y lhapdf lhapdf-devel
RUN dnf install -y HepMC HepMC-devel
RUN dnf install -y HepMC3 HepMC3-devel

# ROOT
RUN dnf install -y root-* python3-root
RUN root -q

# utilities
RUN dnf install -y gsl gsl-devel
RUN dnf install -y CTML-devel
RUN dnf install -y gnuplot
RUN dnf install -y doxygen
RUN dnf install -y copr-rpmbuild

# environment cleanup
RUN dnf clean all
