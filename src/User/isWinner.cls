Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.isWinner
Class User.isWinner [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod isWinner(who As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648)) As %Library.Boolean [ Language = tsql, SqlName = isWinner, SqlProc ]
{

begin
 declare @bout bit, @iret int
 set @who = convert(tinyint,tsql.modulo2(@who)) + 1
 set @iret =  SQLUser.playerCount(@who)
 if @iret = 0
  set @bout = 1
 else
  set @bout = 0

 return @bout
end;

go
}

}
