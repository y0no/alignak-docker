FROM python:2
MAINTAINER Yoann Ono Dit Biot <contact@y0no.fr>

WORKDIR /opt
RUN git clone https://github.com/Alignak-monitoring-contrib/alignak-webui
RUN cd alignak-webui && pip install -r requirements.txt && pip install .
#RUN pip install alignak-webui

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD /setup.sh && alignak-webui-uwsgi