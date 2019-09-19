FROM python:2.7

WORKDIR /opt

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN addgroup --system alignak
RUN adduser --system alignak --ingroup alignak

# Supervisor conf
RUN apt-get update && apt-get install -y supervisor
COPY etc/supervisor.conf /etc/supervisor/conf.d/alignak.conf

# packages needed by checks-snmp
RUN apt-get update && apt-get install -y monitoring-plugins libsnmp-perl libnet-snmp-perl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT bash /entrypoint.sh
