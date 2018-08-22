# This is a Dockerfile for the SimpleElastix superbuild.
# It takes a long time to run, so it fails on dockerhub.
#
FROM ubuntu

RUN apt-get update
RUN apt-get install -y tzdata
RUN echo "America/Boston" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install -y cmake swig python3 python3-dev tcl tcl-dev tk tk-dev
RUN apt-get install -y git
RUN git clone https://github.com/SuperElastix/SimpleElastix
RUN mkdir /build
RUN cd /build
RUN cd /build;cmake -D PYTHON_EXECUTABLE=`which python3` ../SimpleElastix/SuperBuild
RUN cd /build;make -j `nproc`
RUN cd /build/SimpleITK-build/Wrapping/Python/Packaging;python3 setup.py install