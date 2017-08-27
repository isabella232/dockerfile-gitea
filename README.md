# gitea-docker

derived from the gitea docker image to work with fabric8 

```
docker run -d --name=gitea -p 10022:22 -p 10080:3000 stakater/gitea:latest
```

## database configuration

### sqlite3

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

### postgres

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

## keycloak settings

Sign In -> Authentication -> Add New Source -> 

Add ID & Secret & 

OpenID Connect Auto Discovery URL:

```
https://kc.dd.theapp.com/auth/realms/fabric8/.well-known/openid-configuration
```

## ToDos

- [ ] how to refresh go dependencies in IDEA?
- [ ] update dockerfile to execute custom start script
- [ ] change database to postgres
- [x] disable registration
- [ ] create default system admin automatically at startup - maybe its not needed as the first user who signs up later 
through keycloak will become the system admin! -- we can use `gitea admin`
- [ ] add keycloak openid connect configurations by default; so, user must have option to login using openid connect - 
@strk on discord suggested that I need to create a custom template to make it work!

```
mkdir -p custom/templates/user/auth; 
cp templates/user/auth/signin_inner.tmpl custom/templates/user/auth; 
vi custom/templates/user/auth/signin_inner.tmpl
```

## OpenID Connect

```
https://github.com/go-gitea/gitea/blob/master/vendor/github.com/markbates/goth/providers/openidConnect/openidConnect.go
```

## Contacts

### @strk 

## Conf

```
https://github.com/go-gitea/gitea/blob/master/conf/app.ini
```