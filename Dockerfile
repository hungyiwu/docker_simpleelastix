# basic os setup
FROM ubuntu:focal
RUN apt update && apt upgrade -y
# setup time zone as needed later in the installation
RUN apt install -y tzdata
RUN echo "America/Boston" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
# install packages needed for SimpleElastix
RUN apt install -y cmake git swig python3 python3-dev tcl tcl-dev tk tk-dev
RUN apt install -y python-is-python3 python3-pip
# clone and compile SimpleElastix
RUN git clone https://github.com/SuperElastix/SimpleElastix
RUN mkdir /build
WORKDIR /build
RUN cmake -D PYTHON_EXECUTABLE=`which python3` ../SimpleElastix/SuperBuild
RUN make -j `nproc`
# install SimpleElastix python wrapping
WORKDIR /build/SimpleITK-build/Wrapping/Python
RUN python Packaging/setup.py install
# install other usual libraries
WORKDIR /root
RUN pip3 install numpy scikit-image tifffile python-fire
