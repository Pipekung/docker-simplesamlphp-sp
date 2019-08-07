# Docker for SimpleSAMLphp as a Service Provider (SP)

This is a image to build a container for simeplesamlphp with nginx and php-fpm.

# Supported tags

- [`1`, `1.0`, `1.0.0`, `latest`]()

# Quick Start

Skeleton directory in `/var/www/html`
```bash
├─ index.php
├─ ...
│   ├─ ...
│   └─ ...
├─ ...
└─ saml
```

To pull from docker hub:

```console
$ docker pull pipekung/simplesamlphp-sp
```

### Running

To simply run the container:

```console
$ docker run -d -p 8000:80 -v /path/to/project:/var/www/html pipekung/simplesamlphp-sp
```

### ... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

Create file `stack.yml` or `docker-compose.yml`

``` yml
version: "3.1"
services:
  app:
    image: pipekung/simplesamlphp-sp
    volumes:
      - /path/to/project:/var/www/html
    ports:
      - 8000:80
```

Run docker stack deploy:

```console
$ docker stack deploy -c stack.yml simplesamlphp_sp
```

or docker-compose:

```console
$ docker-compose up -d
```