Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.makeMoves
Class User.makeMoves [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod makeMoves(player As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648)) As %Library.Integer [ Language = tsql, SqlName = makeMoves, SqlProc ]
{

begin
 set nocount on
 declare @row varchar(1), @piece tinyint, @cell varchar(2), @nextcell varchar(2), @count tinyint, @jumps varchar(5), @tmp varchar(2), @comp bit, @jumpset bit
 select @comp = case when @player = 1 then 1 else 0 end, @jumpset = 0
 exec RemoveMoves @player
 declare curMMoves cursor for
  select row, case when @player = 2 then player else comp end pieces 
  from check_table order by row desc
 open curMMoves
 fetch next from curMMoves into @row, @piece
 while @@fetch_status = 0
 begin
  if @piece > 0
  begin
   --print @player
   set @count = convert(tinyint,tsql.modulo2((ascii(@row)+1)))+1
   while @count < 9
   begin 
    --print 'calling convert ' || @comp || ', '||@count
    set @cell = @row + convert(varchar(1), @count)
    if (@comp = 0) and (SQLUser.isCellEmpty(@cell) = 0)
    begin
     --print @cell
     set @jumps = SQLUser.canJump(2, @cell)
     --print @jumps
     if len(@jumps)=2
     begin
      exec createMove @cell, @jumps, 2, 1
      set @jumpset = 1
      
     end
     else if len(@jumps)>2
     begin
      set @tmp = right(@jumps, 2)
      exec createMove @cell, @tmp, 2, 1
      select @tmp = left(@jumps, 2), @jumpset = 1
      exec createMove @cell, @tmp, 2, 1
     end
     
     if SQLUser.isKing(@cell) = 1
     begin
      set @jumps = SQLUser.canJumpBack(2, @cell)
      if len(@jumps)=2
      begin
       exec createMove @cell, @jumps, 2, 1
       set @jumpset = 1
       
      end
      else if len(@jumps)>2
      begin
       set @tmp = right(@jumps, 2)
       exec createMove @cell, @tmp, 2, 1
       select @tmp = left(@jumps, 2), @jumpset = 1
       exec createMove @cell, @tmp, 2, 1
      end
     end     
    end
    if (@jumpset = 0) and (SQLUser.isCellEmpty(@cell) = 0) and (SQLUser.whosIn(@cell) = @player)
    begin
     --cache{b:player=2}
     set @nextcell = SQLUser.canMoveLeft(@player, @cell)
     if @nextcell<>''
     begin
      exec createMove @cell, @nextcell, @player
     end 
     set @nextcell = SQLUser.canMoveRight(@player, @cell)
     if @nextcell<>''
     begin
      exec createMove @cell, @nextcell, @player
     end 
     
     if SQLUser.isKing(@cell) = 1
     begin
      set @jumps = SQLUser.canMoveBack(@player, @cell)
      if len(@jumps) = 2
       exec createMove @cell, @jumps, @player
      else if len(@jumps) > 2
      begin
       set @tmp = right(@jumps, 2)
       exec createMove @cell, @tmp, @player
       set @tmp = left(@jumps, 2)
       exec createMove @cell, @tmp, @player
      end
     end
    end
    set @count = @count + 2
   end
  end
  fetch next from curMMoves into @row, @piece
 end
 close curMMoves
 deallocate curMMoves
end;

go
}

}

