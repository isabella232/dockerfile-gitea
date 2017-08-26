# gitea-docker
derived from the gitea docker image to work with fabric8 

docker run -d --name=gitea -p 10022:22 -p 10080:3000 stakater/gitea:latest

## database configuration
```
[database]
DB_TYPE  = sqlite3
PATH     = /data/gitea/gitea.db
HOST     = 127.0.0.1:3306
NAME     = gitea
USER     = gitea
PASSWD   =
SSL_MODE = disable
```

```
[database]
DB_TYPE  = postgres
HOST     = gitea-db:5432
NAME     = gitea
USER     = gitea
PASSWD   =
SSL_MODE = disable
PATH     = /data/gitea/gitea.db
```

## ToDos

- [ ] change database to postgres
- [ ] disable registration
- [ ] create default system admin automatically at startup
- [ ] add keycloak openid connect configurations by default; so, user must have option to login using openid connect
