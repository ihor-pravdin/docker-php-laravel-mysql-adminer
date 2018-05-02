# docker-php-laravel-mysql-adminer

Php7+Laravel development env.

### Usage

Run:
```shell
docker-compose up
```

Rebuild:
```shell
docker-compose up --build
```

### How to start new laravel project

Edit `.env` file, or leave default:
```
###APP

APP_NAME=<your-project-name>
APP_PORT=8000

###DB

MYSQL_PORT=3306
MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=<your-db-name>
MYSQL_USER=<your-db-user>
MYSQL_PASSWORD=<your-db-pass>

###ADMINER

ADMINER_PORT=8080
```

Run conteiners with `docker-compose up`, connect to container 'php7':
```shell
docker exec -it php7 /bin/bash
```
Then, inside the container (default workdir: `/var/www`), execute:
```shell
laravel new <your-project-name>
```

Then stop containers and edit `php/Dockerfile` by removing comment from the last line:
```
CMD php $APP_NAME/artisan serve --host php --port $APP_PORT
```

Finaly rebuild containers:
```
docker-compose up --build
```

Now app available on `<docker-ip>:8000` and adminer on `<docker-ip>:8080`
