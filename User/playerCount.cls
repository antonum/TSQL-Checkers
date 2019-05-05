Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.playerCount
Class User.playerCount [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod playerCount(who As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648)) As %Library.Integer [ Language = tsql, SqlName = playerCount, SqlProc ]
{

begin
 declare @num int 
 select @num = sum(case 
  when @who = 1 then Comp
  when @who = 2 then Player
  else 0 end)
 from
  check_table
 
 return isnull(@num, 0)
end;

go
}

}
