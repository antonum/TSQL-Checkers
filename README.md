# TSQL Checker

The game is a port of TSQL Checkers written by Steve Wint for SQL Server 2000. You can get the original script here http://www.stevewint.com 
Tested on InterSystems Cache' and InterSystems IRIS.

## Quick installation

In IRIS terminal `USER>`

```
!wget -O /tmp/checkets.tar.gz https://github.com/antonum/TSQL-Checkers/archive/master.zip && tar -xvf /tmp/checkets.tar.gz -C /tmp
do $system.OBJ.LoadDir("/tmp/checkers","c",,1)
do $system.OBJ.Load("/tmp/checkers/checkers.mac","c",,1) 
do ^checkers
```
