# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y cmake g++ gfortran
RUN apt-get install -y ninja-build
RUN apt-get install -y libgsl0-dev
#RUN apt-get install -y liblhapdf0 lhapdf-pdfsets-minimal
#RUN apt-get install -y libmuparser libmuparser-dev

# ROOT installation
RUN apt-get install -y wget binutils libx11-dev libxpm-dev libxft-dev libxext-dev python3-dev libssl-dev
SHELL ["/bin/bash", "-c"]
RUN cd /usr/local && wget -q https://root.cern/download/root_v6.26.08.Linux-ubuntu22-x86_64-gcc11.2.tar.gz -O root.tar.gz && tar xfz root.tar.gz && rm -f root.tar.gz
RUN echo "source /usr/local/root/bin/thisroot.sh" >> ~/.bashrc
#RUN source ~/.bashrc && root -v -q
RUN source /usr/local/root/bin/thisroot.sh && root -v -q

#RUN apt-get install -y libpythia8-dev #FIXME not yet available
RUN apt-get clean
RUN python --version
