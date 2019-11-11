FROM python:3.7

WORKDIR /opt

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN sed -i \
    -e 's/"MONGO_HOST": "localhost"/"MONGO_HOST": "db"/' \
    -e 's|"MONGO_URI": "mongodb://localhost:27017/alignak-backend"|"MONGO_URI": "mongodb://db:27017/alignak-backend"|' \
    -e 's|"ALIGNAK_URL": "http://127.0.0.1:7770"|"ALIGNAK_URL": "http://core:7770"|' \
    -e 's/"IP_CRON": \["127.0.0.1"\]/"IP_CRON": ["127.0.0.1", "core", "webui"]/' \
    -e 's/"SCHEDULER_TIMESERIES_ACTIVE": false,/"SCHEDULER_TIMESERIES_ACTIVE": true,/' \
    -e 's/"SCHEDULER_GRAFANA_ACTIVE": false,/"SCHEDULER_GRAFANA_ACTIVE": true,/' \
    /usr/local/share/alignak-backend/etc/settings.json

ENV ALIGNAK_BACKEND_CONFIGURATION_FILE=/usr/local/share/alignak-backend/etc/settings.json
CMD /usr/local/bin/alignak-backend
