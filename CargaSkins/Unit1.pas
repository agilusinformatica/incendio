unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ZLib;

type
  TArrayFileName = array of TFileName;

type
  TForm1 = class(TForm)
    Connection: TADOConnection;
    tbSkin: TADOQuery;
    tbSkinskn_codigo: TAutoIncField;
    tbSkinskn_descricao: TStringField;
    tbSkinskn_conteudo: TBlobField;
    Button1: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    cbAtualizar: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GetTempDirectory: string;
begin
  SetLength(Result, MAX_PATH);
  if GetTempPath(MAX_PATH, PChar(Result)) > 0 then
    Result := string(PChar(Result))
  else
    Result := '';
end;

procedure Comprimir(ArquivoCompacto: TFileName; Arquivos: array of TFileName);
var
  FileInName: String;
  FileEntrada, FileSaida: TFileStream;
  Compressor: TCompressionStream;
  NumArq, I, TamanhoNomeArquivo, TamanhoArquivo: Integer;
  Fim: Byte ;
begin
  FileSaida := TFileStream.Create(ArquivoCompacto, fmCreate or fmShareExclusive);
  Compressor := TCompressionStream.Create( clMax, FileSaida);
  NumArq := Length(Arquivos);
  Compressor.Write(NumArq, SizeOf(Integer));
  try
    for I := Low(Arquivos) to High(Arquivos) do
    begin
      FileEntrada := TFileStream.Create(Arquivos[I], fmOpenRead and fmShareExclusive);
      try
        FileInName := ExtractFileName(Arquivos[I]);
        TamanhoNomeArquivo := Length(FileInName);
        Compressor.Write(TamanhoNomeArquivo, SizeOf(Integer));
        Compressor.Write(FileInName[1], TamanhoNomeArquivo);
        TamanhoArquivo := FileEntrada.Size;
        Compressor.Write(TamanhoArquivo, SizeOf(Integer));
        Compressor.CopyFrom(FileEntrada, TamanhoArquivo);
        Fim := 0;
        Compressor.Write(Fim, SizeOf(Byte));
      finally
        FileEntrada.Free;
      end;
    end;
  finally
    FreeAndNil(Compressor);
    FreeAndNil(FileSaida);
  end;
end;

function Descomprimir(ArquivoZip: TFileName; DiretorioDestino, ArquivoSaida: string): TArrayFileName;
var
  NomeSaida: String;
  FileEntrada, FileOut: TFileStream;
  Descompressor: TDecompressionStream;
  NumArq, I, TamanhoNomeArquivo,TamanhoArquivo: Integer;
  Fim: Byte;
begin
  FileEntrada := TFileStream.Create(ArquivoZip, fmOpenRead and fmShareExclusive);
  Descompressor := TDecompressionStream.Create(FileEntrada);
  Descompressor.Read(NumArq,SizeOf(Integer));
  try
    I:=0;
    while I < NumArq  do
    begin
      Descompressor.Read(TamanhoNomeArquivo,SizeOf(Integer));
      SetLength(NomeSaida, TamanhoNomeArquivo);
      Descompressor.Read(NomeSaida[1],TamanhoNomeArquivo);
      Descompressor.Read(TamanhoArquivo,SizeOf(Integer));
      FileOut := TFileStream.Create(IncludeTrailingPathDelimiter(DiretorioDestino) + ArquivoSaida, fmCreate or fmShareExclusive);
      try
        FileOut.CopyFrom(Descompressor,TamanhoArquivo);
      finally
        FileOut.Free;
      end;
      Descompressor.Read(Fim, SizeOf(Byte));
      SetLength(Result, High(Result)+2);
      //Result[High(Result)] := NomeSaida;
      Result[High(Result)] := ArquivoSaida;
      Inc(I);
    end;
  finally
    FreeAndNil(Descompressor);
    FreeAndNil(FileEntrada);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Rec: TSearchRec;
  Folder, ArquivoUDL, NomeArquivo, NomeArquivoCompacto, NomeSkin: string;
  fs: TFileStream;
begin
  Screen.Cursor := crHourGlass;
  try
    ArquivoUDL := ExtractFilePath(Application.ExeName)+'\'+ 'agilus.udl';
    if not FileExists(ArquivoUDL) then
      raise Exception.Create('Arquivo de conexão com sistema não encontrado');
    Connection.Close;
    Connection.ConnectionString := 'FILE NAME='+ArquivoUDL;
    Connection.Connected := True;
    Folder := IncludeTrailingPathDelimiter(Edit2.Text);
    if FindFirst(Folder+'*.skinres', faAnyFile, Rec) = 0 then
    begin
      tbSkin.Open;
      try
        repeat
          NomeArquivo := Rec.Name;
          NomeSkin := Copy(NomeArquivo,1,Pos('.',NomeArquivo)-1);
          if Pos('AllSkins', NomeArquivo) = 0 then
          begin
            if not tbSkin.Locate('skn_descricao', NomeSkin, []) then
            begin
              NomeArquivoCompacto := IncludeTrailingPathDelimiter(GetTempDirectory)+ChangeFileExt(NomeArquivo, '.skinreszip');
              Comprimir(NomeArquivoCompacto, [Folder+NomeArquivo]);
              fs := TFileStream.Create(NomeArquivoCompacto, fmOpenRead or fmShareExclusive);
              try
                if not tbSkin.Locate('skn_descricao',NomeSkin,[]) then
                begin
                  tbSkin.Append;
                  tbSkinskn_descricao.Value := NomeSkin;
                  tbSkinskn_conteudo.LoadFromStream(fs);
                  tbSkin.Post;
                end
                else
                begin
                  if cbAtualizar.Checked then
                  begin
                    tbSkin.Edit;
                    tbSkinskn_conteudo.LoadFromStream(fs);
                    tbSkin.Post;
                  end;
                end;
              finally
                fs.Free;
                DeleteFile(NomeArquivoCompacto);
              end;
            end;
          end;
        until FindNext(Rec) <> 0;
      finally
        FindClose(Rec);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  Close;

end;

end.
