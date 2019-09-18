FROM python:2.7

WORKDIR /opt

RUN git clone https://github.com/Alignak-monitoring-contrib/alignak-webui
#RUN cd alignak-webui && pip install -r requirements.txt && pip install .

RUN pip install alignak-webui
RUN pip install uwsgi

RUN addgroup --system alignak
RUN adduser --system alignak --ingroup alignak

RUN mkdir -p /usr/local/etc/alignak-webui/ && \
    cp -r /opt/alignak-webui/etc/* /usr/local/etc/alignak-webui/

RUN sed -i "s|; alignak_backend = http://127.0.0.1:5000|alignak_backend = http://backend:5000|" /usr/local/etc/alignak-webui/settings.cfg
# RUN sed -i "s|; alignak_ws = http://127.0.0.1:7770|alignak_ws = http://core:7770|" /usr/local/etc/alignak-webui/settings.cfg
# RUN sed -i "s|; alignak_ws_authorization = 0|alignak_ws_authorization = 1|" /usr/local/etc/alignak-webui/settings.cfg

CMD /opt/alignak-webui/bin/alignak-webui-uwsgi
