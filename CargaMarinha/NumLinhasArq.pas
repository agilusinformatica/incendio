function NumLinhasArq(Arqtexto:String): integer;
var
  f: Textfile;
  linha, cont: integer;
begin
  linha := 0;
  cont := 0;
  AssignFile(f, Arqtexto);
  Reset(f);
  try
    while not eof(f) Do
    begin
      ReadLn(f);
      Inc(Cont);
    end;
  finally
    Closefile(f);
  end;
  result := cont;
end;
