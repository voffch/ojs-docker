# What

This is my quick and dirty hack to get the OJS (at the moment, 3.3.0-* LTS only) up and running in docker.

## Why

To try things out! And to get that specific version of OJS with a specific combination of php (7.4), database, and the webserver (nginx+php-fpm). Otherwise, I'd use one of the [official OJS docker images](https://hub.docker.com/r/pkpofficial/ojs) or the [files to build them](https://gitlab.com/pkp-org/docker/ojs). [Here](https://github.com/pkp/docker-ojs/tree/main) you can see how to use the official images.

## How

First, check out the [official OJS installation guide](https://docs.pkp.sfu.ca/admin-guide/3.3/en/requirements).

Clone/download this.

Next, either [download](https://pkp.sfu.ca/software/ojs/download/archive/) and unpack the website into `./volumes/html` or modify the `OJS_VERSION` in `get_ojs.sh` and run

```bash
chmod a+x ./get_ojs.sh
```

Make sure that `docker-compose.yaml` suits your needs, then run

```bash
docker compose up
docker exec ojs-php chown -R www-data /var/www/html/config.inc.php /var/www/html/public /var/www/html/cache /var/www/html/plugins /var/www/files
```

The website should be now accessible at `http://localhost:8080` or whatever's in `docker-compose`.

Follow the usual installation instructions.

Then try, play, break, delete, repeat.