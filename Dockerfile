# syntax=docker/dockerfile:1
FROM fedora:40
RUN dnf update -y
RUN dnf install -y cmake g++ gfortran valgrind
RUN dnf install -y ninja-build

# Python installation
RUN dnf install -y python3 python3-devel
RUN python3 --version

# external add-ons
RUN dnf install -y yaml-cpp-devel

# physics
RUN curl https://pythia.org/download/pythia6/pythia6428.f -o pythia6428.f && gfortran -fPIC -shared pythia6428.f -o /usr/local/lib/libpythia6.so
#RUN curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/herwig6521.f -o herwig6521.f && curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/HERWIG65.INC -o HERWIG65.INC && curl https://www.hep.phy.cam.ac.uk/theory/webber/Herwig/herwig6521.INC -o herwig6521.inc && gfortran -fPIC -shared herwig6521.f -o /usr/local/lib/libherwig6.so
RUN curl https://service-spi.web.cern.ch/service-spi/external/MCGenerators/distribution/herwig/herwig-6.521-src.tgz -o herwig6521.tgz && mkdir herwig && tar xfz herwig6521.tgz -C herwig --strip-components=2 && cd herwig && ./configure --prefix=/usr && make -j 8 && make install
RUN dnf install -y pythia8-devel
RUN dnf install -y boost-devel
RUN dnf install -y lhapdf lhapdf-devel
RUN dnf install -y HepMC HepMC-devel
RUN dnf install -y HepMC3 HepMC3-devel

RUN dnf install -y redhat-rpm-config
ARG apfelxx_version=4.8.0
RUN curl -L https://github.com/vbertone/apfelxx/archive/refs/tags/$apfelxx_version.tar.gz -o apfelxx.tar.gz && tar xvfz apfelxx.tar.gz && cd apfelxx-$apfelxx_version/ && sed -i "s/#include <functional>/#include <functional>\n#include <algorithm>/" src/kernel/matrix.cc && mkdir build && cd build && cmake -GNinja .. && ninja && ninja install

# CLHEP
RUN curl -L https://proj-clhep.web.cern.ch/proj-clhep/dist1/clhep-2.4.7.1.tgz -o clhep.tgz && tar xvfz clhep.tgz --strip-components 1 && mkdir CLHEP-build && cd CLHEP-build && cmake -GNinja ../CLHEP && ninja && ninja install
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
