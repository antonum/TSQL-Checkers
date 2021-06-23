# TSQL Checkers

The game is a port of TSQL Checkers written by Steve Wint for SQL Server 2000. You can get the original script here http://www.stevewint.com 
Tested on InterSystems Cache' and InterSystems IRIS.


![alt text](https://s3.amazonaws.com/anton-iot-demo/Checkers1.gif "TSQL Checkers")


## Quick installation for existing IRIS instance

Instructions below assume that you already have InterSystems IRIS installed. If not - the easiest way to try it would be to pull the [InterSystems IRIS Community Edition Docker Image](https://hub.docker.com/_/intersystems-iris-data-platform) and follow the setup instructions.

In IRIS terminal `USER>`

```
!wget -O /tmp/checkers.tar.gz https://github.com/antonum/TSQL-Checkers/archive/master.tar.gz && tar -xvf /tmp/checkers.tar.gz -C /tmp
do $system.OBJ.LoadDir("/tmp/TSQL-Checkers-master/src/","ck",,1)
do ^checkers

```

## Quick installation with Docker Compose and InterSystems IRIS Community Edition


```
$ git clone https://github.com/antonum/TSQL-Checkers.git
$ docker-compose up -d
$ docker-copmose exec iris iris session iris
USER>do ^checkers

```

## See also

For more information on InterSystems IRIS support for Transact-SQL (TSQL), SQL Server and Sybase to IRIS Migration tools see [Transact-SQL (TSQL) Migration Guide](https://irisdocs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GTSQ)

### Hints if the original docu is unavailable 

- Rules are standard rules of Checker   
- Moves are done by entering start and target coordinates e.g. **F2E1** or **f2e1** also **f2-e1**  
- An invalid move results in **<METHOD DOES NOT EXIST>+11^checker**   
- Don't worry enter **GOTO** or simply **G** to continue with a valid move.   
- If your opponent reaches the bottom line and gets a *KING* it is totally paralized and can't move it anymore (Seems to be a bug)    
- So it'S hard not to be a winner.
#### Remember the focus is on TSQL support

