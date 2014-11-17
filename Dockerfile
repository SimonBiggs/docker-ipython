FROM ipython/notebook

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install python-numpy python3-numpy \
    python-scipy python3-scipy \
    python-matplotlib python3-matplotlib \
    python-pandas python3-pandas \
    python-sympy \
    python-nose2 python3-nose2 \
    python-mpi4py python3-mpi4py \
    cython cython3 \
    python-mako python3-mako
    
RUN pip3 install sympy

RUN apt-get -y install \
    gfortran
    
RUN mkdir /root/notebooks/

WORKDIR /root/notebooks/

RUN mkdir ~/github/; \
    cd ~/github/; \
    git clone https://github.com/jrjohansson/scientific-python-lectures.git; \
    git clone https://gist.github.com/5920182.git
    
RUN cp -r ~/github/scientific-python-lectures ~/notebooks/lectures-learning-python; \
    cp ~/github/5920182/Crash\ Course\ v0.5.ipynb.json ~/notebooks/crash-course-in-python.ipynb
    
RUN ipython -c '%install_ext http://raw.github.com/jrjohansson/version_information/master/version_information.py'

EXPOSE 8888

CMD ipython notebook --no-browser --ip=0.0.0.0 --port=8888
