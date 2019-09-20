# alignak-docker

Run [alignak monitoring framework](http://www.alignak.net/) using
docker and docker-compose.

## Services

docker-compose will launch the following services:

* **core**: all monitoring processes (arbiter, scheduler, broker, poller, reactioner and receiver)
* **backend**: the backend module (configuration via REST API, retention, livestate, logs, etc.)
* **db**: the mongodb database used by the backend
* **webui**: the web user interface

## Startup

Just execute:

```
docker-compose up -d
```

Make sure all services are up and running:

```
$ docker-compose ps

     Name                    Command               State           Ports
---------------------------------------------------------------------------------
alignak-backend   /bin/sh -c /usr/local/bin/ ...   Up      0.0.0.0:5000->5000/tcp
alignak-core      /bin/sh -c bash /entrypoint.sh   Up      0.0.0.0:7768->7768/tcp
alignak-db        docker-entrypoint.sh mongod      Up      27017/tcp
alignak-webui     /bin/sh -c /usr/local/shar ...   Up      0.0.0.0:5001->5001/tcp
```

and review logs with:

```
docker-compose logs -f
```

## Import demo assets (optional)

Alignak provides an utility to import assets. You can just import the
demo assets installed by alignak executing:

```shell
docker-compose exec core \
    alignak-backend-import \
    -b "http://backend:5000" \
    -u admin -p admin \
    /usr/local/share/alignak/etc/alignak.cfg
```

## Visualization

Point your browser to the following location and enjoy:

> http://localhost:5001

Use default user (admin) and password (admin) for authenticate.
