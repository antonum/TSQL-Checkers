Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.compMove
Class User.compMove [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod compMove() As %Library.Integer [ Language = tsql, SqlName = compMove, SqlProc ]
{

begin
 set nocount on
 declare @row varchar(1), @piece tinyint, @count tinyint, @cell varchar(4), @next varchar(5), @bcont bit, @tmp varchar(2)
 set @bcont = 1
 declare curCMove cursor for 
  select row, comp from SQLUser.check_table order by row desc
 open curCMove
 fetch next from curCMove into @row, @piece
 while @@fetch_status = 0 and @bcont = 1
 begin
  set @count = convert(tinyint,tsql.modulo2((ascii(@row)+1)))+1
  while @count < 9
  begin
   if (@piece & convert(tinyint, power(2, (8-@count)))) > 0
   begin
    set @cell = @row + convert(varchar(1), @count)
    set @next = SQLUser.canJump(1, @cell)
    if len(@next) = 2
    begin
     exec Jump 1, @cell, @next
     set @bcont = 0
    end
    else if len(@next)>2
    begin
     set @tmp = case when tsql.modulo2(convert(int, 10 * rand()))=0 then right(@next, 2) else left(@next, 2) end --random
     exec Jump 1, @cell, @tmp
     set @bcont = 0
    end
    
    if SQLUser.isKing(@cell) = 1
    begin
     set @next = SQLUser.canBackJump(1, @cell)
     if len(@next) = 2
     begin
      exec Jump 1, @cell, @next
      set @bcont = 0
     end
     else if len(@next)>2
     begin
      set @tmp = case when tsql.modulo2(convert(int, 10 * rand()))=0 then right(@next, 2) else left(@next, 2) end --random
      exec Jump 1, @cell, @tmp
      set @bcont = 0
     end
    end
   end
   set @count = @count + 2
  end
  fetch next from curCMove into @row, @piece  
 end
 close curCMove
 deallocate curCMove
 if @bcont = 1
 begin
  set @cell = ''
  select top 1 @cell = right(moves, 4)
  from moves_table where comp = 1 order by newid()
  if isnull(@cell, '') <> ''
  begin
   set @next = right(@cell, 2)
   set @cell = left(@cell, 2)
   exec moveit 1, @cell, @next
  end
 end
end;

go
}

}

