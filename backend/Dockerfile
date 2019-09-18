FROM python:2.7

WORKDIR /opt
RUN apt-get update && apt-get install -y git

RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-backend.git
RUN cd alignak-backend && pip install -r requirements.txt && pip install .

RUN cd /opt && git clone https://github.com/Alignak-monitoring-contrib/alignak-module-backend
RUN cd alignak-module-backend && pip install -r requirements.txt && pip install .

RUN mkdir -p /usr/local/etc/alignak-backend/ && \
    cp /opt/alignak-backend/etc/* /usr/local/etc/alignak-backend/

RUN sed -i \
    -e 's/"MONGO_HOST": "localhost"/"MONGO_HOST": "db"/' \
    -e 's|"MONGO_URI": "mongodb://localhost:27017/alignak-backend"|"MONGO_URI": "mongodb://db:27017/alignak-backend"|' \
    -e 's|"ALIGNAK_URL": "http://127.0.0.1:7770"|"ALIGNAK_URL": "http://core:7770"|' \
    -e 's/"IP_CRON": \["127.0.0.1"\]/"IP_CRON": ["127.0.0.1", "core", "webui"]/' \
    /usr/local/etc/alignak-backend/settings.json

CMD python /usr/local/bin/alignak-backend
