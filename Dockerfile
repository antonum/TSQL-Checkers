FROM store/intersystems/iris:2019.1.0.511.0-community
LABEL maintainer="Anton Umnikov <anton@intersystems.com>"

WORKDIR /opt

COPY User User
COPY tsql tsql
COPY checkers.mac .

RUN TEMPID=$(echo "i"$RANDOM) \
 && iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyID=$TEMPID,$TEMPID \
 && /bin/echo -e "$TEMPID\n$TEMPID\n" \
        'do ##class(Security.Users).UnExpireUserPasswords("*")\n' \
        'do ##class(Security.Users).AddRoles("admin", "%ALL")\n' \
        'do ##class(Security.System).Get(,.p)\n' \
        'set p("AutheEnabled")=$zb(p("AutheEnabled"),16,7)\n' \
        'do ##class(Security.System).Modify(,.p)\n' \
        'zn "USER"\n' \
        'do $system.OBJ.ImportDir("/opt/", "*.cls", "c", , 1)\n' \
        'do $system.OBJ.Load("/opt/checkers.mac","c")\n' \
        'halt\n' \
  | iris session $ISC_PACKAGE_INSTANCENAME \
 && /bin/echo -e "$TEMPID\n$TEMPID\n" \
  | iris stop $ISC_PACKAGE_INSTANCENAME quietly
  
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]