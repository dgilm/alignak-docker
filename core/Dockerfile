FROM python:2.7

WORKDIR /opt
RUN apt-get update && apt-get install -y wget supervisor python-dev libffi-dev libssl-dev git monitoring-plugins mailutils
RUN git clone https://github.com/Alignak-monitoring/alignak.git
RUN easy_install pip
RUN cd alignak && pip install --upgrade cffi && pip install -r requirements.txt && pip install .

RUN pip install alignak-backend-client alignak-backend-import

RUN apt-get install -y libsnmp-perl libnet-snmp-perl
RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-checks-snmp.git
RUN cd alignak-checks-snmp && pip install .

# TODO: use --system flag!
RUN addgroup --system alignak
RUN adduser --system alignak --ingroup alignak

# Supervisor conf
COPY etc/supervisor.conf /etc/supervisor/conf.d/alignak.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT bash /entrypoint.sh
