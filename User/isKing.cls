Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.isKing
Class User.isKing [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod isKing(cell As %Library.String(MAXLEN=2)) As %Library.Boolean [ Language = tsql, SqlName = isKing, SqlProc ]
{

begin
 declare @bret bit
 declare @cking int, @pking int, @pcking int
 select @cking=cking,@pking=pking
 from SQLUser.check_table
 where row = left(@cell, 1)
 set @pcking=(@cking | @pking)
 set @bret = case when (@pcking & convert(tinyint, (power(2, (8-convert(tinyint, right(@cell, 1))))))) > 0 
 then 1 else 0 end
 return @bret
end;

go
}

}

