FROM store/intersystems/iris:2019.1.0.511.0-community

WORKDIR /opt

COPY User User
COPY tsql tsql
COPY checkers.mac .

RUN TEMPID=$(echo "i"$RANDOM) \
 && iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyID=$TEMPID,$TEMPID \
 && /bin/echo -e "$TEMPID\n$TEMPID\n" \
        'zn "USER"\n' \
        'do $system.OBJ.ImportDir("/opt/", "*.cls", "c", , 1)\n' \
        'do $system.OBJ.Load("/opt/checkers.mac","c")\n' \
        'halt\n' \
  | iris session $ISC_PACKAGE_INSTANCENAME \
 && /bin/echo -e "$TEMPID\n$TEMPID\n" \
  | iris stop $ISC_PACKAGE_INSTANCENAME quietly