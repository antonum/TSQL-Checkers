Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.nextRight
Class User.nextRight [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod nextRight(who As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648), cell As %Library.String(MAXLEN=2)) As %Library.String [ Language = tsql, SqlName = nextRight, SqlProc ]
{

begin
 declare @ret varchar(2), @shift int
 select @ret = '', @shift = case when (@who = 1) then 1 else -1 end
 if SQLUser.validCell(@cell) = 1 and right(@cell, 1) <> '8'
 begin
  set @cell = char(ascii(left(@cell, 1))+@shift) + convert(char(1), convert(tinyint, right(@cell, 1))+1)
  if SQLUser.validCell(@cell) = 1
   set @ret = @cell
 end

 return ltrim(rtrim(@ret))
end;

go
}

}

