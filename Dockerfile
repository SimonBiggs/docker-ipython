FROM ipython/notebook

MAINTAINER Simon Biggs <mail@simonbiggs.net>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install python-numpy python3-numpy \
    python-scipy python3-scipy \
    python-matplotlib python3-matplotlib \
    python-pandas python3-pandas

RUN mkdir /root/notebooks/

WORKDIR /root/notebooks/

EXPOSE 8888

CMD ipython3 notebook --no-browser --ip=0.0.0.0 --port=8888
