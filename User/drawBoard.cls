Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.drawBoard
Class User.drawBoard [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod drawBoard() As %Library.Integer [ Language = tsql, SqlName = drawBoard, SqlProc ]
{

begin
set nocount on
 declare @row varchar(1), @c tinyint, @p tinyint, @pk tinyint, @ck tinyint, @count tinyint, @cell varchar(2)
 declare curDBoard cursor for
 select row, player, comp, pking, cking from check_table
 order by row
 
 open curDBoard
 fetch next from curDBoard into @row, @p, @c, @pk, @ck
 print '      1       2       3       4       5       6       7       8     '
 print '  |----------------------------------------------------------------|'
 while @@fetch_status = 0
 begin
  select @count = 1  
  print case when tsql.modulo2(ascii(@row))=0 then 
   '  |        ////////        ////////        ////////        ////////|'
  else
   '  |////////        ////////        ////////        ////////        |'
  end
  while @count < 3
  begin
   --Cache' may observe order of operators different from MS-SQL
   --translation like a&b>0 => (a&b)>0 may be required
   print 
   case when tsql.modulo2(ascii(@row))=0 then case when @count = 2 then @row + ' ' else '  ' end +
    '|        //' + case when (@p & @pk & 64) > 0 then 'K++K' when (@p & 64) > 0 then 'MMMM' when (@c & @ck & 64) > 0 then 'K  K' when (@c & 64) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 16) > 0 then 'K++K' when (@p & 16) > 0 then 'MMMM' when (@c & @ck & 16) > 0 then 'K  K'  when (@c & 16) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 4) > 0 then 'K++K' when (@p & 4) > 0 then 'MMMM' when (@c & @ck & 4) > 0 then 'K  K'  when (@c & 4) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 1) > 0 then 'K++K' when (@p & 1) > 0 then 'MMMM' when (@c & @ck & 1) > 0 then 'K  K'  when (@c & 1) > 0 then '0000' else '////' end +
    '//|' 
   else case when @count = 2 then @row + ' ' else '  ' end +
    '|//' + case when (@p & @pk & 128) > 0 then 'K++K' when (@p & 128) > 0 then 'MMMM' when (@c & @ck & 128) > 0 then 'K  K' when (@c & 128) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 32) > 0 then 'K++K' when (@p & 32) > 0 then 'MMMM' when (@c & @ck & 32) > 0 then 'K  K' when (@c & 32) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 8) > 0 then 'K++K' when (@p & 8) > 0 then 'MMMM' when (@c & @ck & 8) > 0 then 'K  K' when (@c & 8) > 0 then '0000' else '////' end +
    '//        //' + case when (@p & @pk & 2) > 0 then 'K++K' when (@p & 2) > 0 then 'MMMM' when (@c & @ck & 2) > 0 then 'K  K' when (@c & 2) > 0 then '0000' else '////' end +
    '//        |' 
   end
   set @count = @count + 1
  end 

  print case when tsql.modulo2(ascii(@row))=0 then 
   '  |        ////////        ////////        ////////        ////////|'
  else
   '  |////////        ////////        ////////        ////////        |'
  end
  fetch next from curDBoard into @row, @p, @c, @pk, @ck
 end
 close curDBoard
 deallocate curDBoard
 print '  |----------------------------------------------------------------|'
 print '      1       2       3       4       5       6       7       8     '
 print ''
 print ' "Xit" to quit.  "Checkers help" for instructions.'
end;
go
}

}
