# TSQL Checkers

The game is a port of TSQL Checkers written by Steve Wint for SQL Server 2000. You can get the original script here http://www.stevewint.com 
Tested on InterSystems Cache' and InterSystems IRIS.


![alt text](https://s3.amazonaws.com/anton-iot-demo/Checkers1.gif "TSQL Checkers")


## Quick installation

Instructions below assume that you already have InterSystems IRIS installed. If not - the easiest way to try it would be to pull the [InterSystems IRIS Docker Image](https://hub.docker.com/_/intersystems-iris-data-platform) and follow the setup instructions.

In IRIS terminal `USER>`

```
!wget -O /tmp/checkers.tar.gz https://github.com/antonum/TSQL-Checkers/archive/master.tar.gz && tar -xvf /tmp/checkers.tar.gz -C /tmp
do $system.OBJ.LoadDir("/tmp/TSQL-Checkers-master","c",,1)
do $system.OBJ.Load("/tmp/TSQL-Checkers-master/checkers.mac","c")
do ^checkers

```
