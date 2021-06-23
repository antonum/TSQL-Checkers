Class tsql.Utils Extends %RegisteredObject
{

ClassMethod MODULO2(num As %Integer) As %Integer [ Language = tsql, SqlName = MODULO2, SqlProc ]
{
begin
	declare @res INT
	cache {set res=num#2}
	return @res
end;

go
}

/// compensates for OCNVERT(BIT,x) where x>0
ClassMethod BITCONVERT(num As %Integer) As %Integer [ Language = tsql, SqlName = BITCONVERT, SqlProc ]
{
begin
	declare @res INT
	cache {set res=(num>0)}
	return @res
end;

go
}

ClassMethod execddl(ddl As %String) [ SqlName = EXECDDL, SqlProc ]
{
	s file="tsqltemp.sql"
	s logfile="tsqltemp.log"
	s temp="tsqltemp.tmp"
	open file:"NW"
	use file
	write ddl
	close file
	open temp:"NW"
	use temp
	do ##class(%TSQL.Manager).Import("MSSQL",file,logfile,0,1) 
	close temp
	use 0
	quit 1
}

}

