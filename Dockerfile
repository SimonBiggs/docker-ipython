FROM ipython/notebook

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install python-numpy python3-numpy \
    python-scipy python3-scipy \
    python-matplotlib python3-matplotlib \
    python-pandas python3-pandas \
    python-sympy \
    python-nose2 python3-nose2

RUN mkdir /root/notebooks/

WORKDIR /root/notebooks/

RUN mkdir ~/github/; \
    cd ~/github/; \
    git clone https://github.com/jrjohansson/scientific-python-lectures.git
    
RUN cp -r ~/github/scientific-python-lectures ~/notebooks/lectures-learning-python
    
RUN ipython3 -c '%install_ext http://raw.github.com/jrjohansson/version_information/master/version_information.py'

EXPOSE 8888

CMD ipython3 notebook --no-browser --ip=0.0.0.0 --port=8888
