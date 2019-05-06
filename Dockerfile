FROM centos/devtoolset-7-toolchain-centos7
USER root
RUN  yum -y update
RUN  yum -y install gcc g++ gdbserver make git
RUN  yum -y install gcc-c++
RUN  yum -y install libc6-dbg gdb valgrind
RUN yum -y install epel-release
RUN yum -y install python34
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python3.4 get-pip.py
RUN pip3 install pygments
RUN mkdir /root/.ssh/
RUN git config --global user.name "Nathan Brown"
RUN git config --global user.email "nlbrow@umich.edu"
ARG CACHE_DATE
# this auth token no longer works but yea
RUN git clone https://f6ea8b654f9108b95c21850f274985cb5cfebed8@github.com/eecs482/nlbrow.1.git /root/project
ADD gdbinit /root/.gdbinit
ADD hlgdb.py /root/hlgdb.py
WORKDIR /root/project
RUN make
ENTRYPOINT gdb scheduler
