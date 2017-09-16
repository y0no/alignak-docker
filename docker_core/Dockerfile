FROM python:2
MAINTAINER Yoann Ono Dit Biot <contact@y0no.fr>

WORKDIR /opt
RUN apt-get update && apt-get install -y wget supervisor python-dev libffi-dev libssl-dev git monitoring-plugins mailutils 
RUN git clone https://github.com/Alignak-monitoring/alignak.git
RUN easy_install pip
RUN cd alignak && pip install --upgrade cffi && pip install -r requirements.txt && pip install .

RUN pip install alignak-backend-client alignak-backend-import 

RUN apt-get install -y libsnmp-perl libnet-snmp-perl
RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-checks-snmp.git
RUN cd alignak-checks-snmp && pip install .

RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-backend.git
RUN cd alignak-backend && pip install -r requirements.txt && pip install .

RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-module-backend
RUN cd alignak-module-backend && pip install -r requirements.txt && pip install .

# Supervisor conf
COPY tpl/supervisor.conf /etc/supervisor/conf.d/alignak.conf

# Alignak conf
COPY tpl/arbiter-master.cfg /usr/local/etc/alignak/arbiter/daemons/
COPY tpl/broker-master.cfg /usr/local/etc/alignak/arbiter/daemons/
COPY tpl/scheduler-master.cfg /usr/local/etc/alignak/arbiter/daemons/

RUN cp -R /usr/local/etc/alignak /usr/local/etc/alignak.dist \
    && rm -rf /usr/local/etc/alignak/*

# Container startup script
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

CMD bash /setup.sh && /usr/bin/supervisord
