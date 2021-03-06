# TSQL Checkers

The game is a port of TSQL Checkers written by Steve Wint for SQL Server 2000. You can get the original script here http://www.stevewint.com 
Tested on InterSystems Cache' and InterSystems IRIS.


![alt text](https://s3.amazonaws.com/anton-iot-demo/Checkers1.gif "TSQL Checkers")


## Quick installation for existing IRIS instance

Instructions below assume that you already have InterSystems IRIS installed. If not - the easiest way to try it would be to pull the [InterSystems IRIS Community Edition Docker Image](https://hub.docker.com/_/intersystems-iris-data-platform) and follow the setup instructions.

In IRIS terminal `USER>`

```
!wget -O /tmp/checkers.tar.gz https://github.com/antonum/TSQL-Checkers/archive/master.tar.gz && tar -xvf /tmp/checkers.tar.gz -C /tmp
do $system.OBJ.LoadDir("/tmp/TSQL-Checkers-master","c",,1)
do $system.OBJ.Load("/tmp/TSQL-Checkers-master/checkers.mac","c")
do ^checkers

```

## Quick installation with Docker Compose and InterSystems IRIS Community Edition


```
$ git clone https://github.com/antonum/TSQL-Checkers.git
$ docker-compose build
$ docker-compose up -d
$ docker exec -it checkers_iris_1 iris session iris
USER>do ^checkers

```

## See also

For more information on InterSystems IRIS support for Transact-SQL (TSQL), SQL Server and Sybase to IRIS Migration tools see [Transact-SQL (TSQL) Migration Guide](https://irisdocs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GTSQ)
