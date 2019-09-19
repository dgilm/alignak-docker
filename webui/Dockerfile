FROM python:2.7

WORKDIR /opt

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN addgroup --system alignak
RUN adduser --system alignak --ingroup alignak

RUN sed -i \
    "s|; alignak_backend = http://127.0.0.1:5000|alignak_backend = http://backend:5000|" \
    /usr/local/share/alignak-webui/etc/settings.cfg

RUN sed -i \
    "s|; alignak_ws = http://127.0.0.1:7770|alignak_ws = http://core:7770|" \
    /usr/local/share/alignak-webui/etc/settings.cfg
# RUN sed -i "s|; alignak_ws_authorization = 0|alignak_ws_authorization = 1|" /usr/local/share/alignak-webui/etc/settings.cfg

# TODO: is there an environment variable to override default settings.cfg?
RUN ln -sf /usr/local/share/alignak-webui/etc /usr/local/etc/alignak-webui
CMD /usr/local/share/alignak-webui/alignak-webui-uwsgi
