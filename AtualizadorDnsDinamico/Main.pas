unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinCaramel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxSkinsForm, IniFiles, cxContainer, Menus, StdCtrls, idHttp,
  cxButtons, cxLabel, ExtCtrls, cxMaskEdit, cxSpinEdit, cxTextEdit, StrUtils,
  cxNavigator, cxListBox, AppEvnts;

type
  TfrmMain = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ConexaoAgilus: TADOConnection;
    tbDns: TADOQuery;
    dsDns: TDataSource;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    edTempoAtualizacao: TcxSpinEdit;
    cxLabel2: TcxLabel;
    Timer: TTimer;
    lbProgresso: TcxLabel;
    SkinController: TdxSkinController;
    lbErros: TcxListBox;
    cxLabel3: TcxLabel;
    ApplicationEvents1: TApplicationEvents;
    View: TcxGridTableView;
    ViewEndereco: TcxGridColumn;
    ViewIp: TcxGridColumn;
    ViewUltimaAtualizacao: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    FTempoDecorrido: integer;
    procedure SetTempoDecorrido(const Value: integer);
    { Private declarations }
    property TempoDecorrido: integer read FTempoDecorrido write SetTempoDecorrido;
    procedure ProcessarAtualizacao;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

function PegaFonteEnderecoInternet(const URL: String): String;
var
  Http: TidHttp;
begin
  Http := TIdHTTP.Create;
  Http.HandleRedirects := True;
  try
    Result := Http.Get(URL);
  finally
    Http.Free;
  end;
end;

function PegaIpReverso(Endereco: string): string;
var
  item, Response: String;
  Start, Finish: Integer;
begin
  Response := PegaFonteEnderecoInternet('http://tracert.com/resolver?arg='+Endereco);
  if Pos('>Could not resolve ', Response) > 0 then
  begin
    Result := EmptyStr;
  end
  else
  begin
    Start := Pos('>Resolution of ', Response) + 1;
    Finish := PosEx('<', Response, Start)-1;
    Result := '';
    item := Copy(Response,Finish,1);
    while item <> ' ' do
    begin
      Result := item+Result;
      Dec(Finish);
      item := Copy(Response,Finish,1);
    end;
  end;
end;

procedure TfrmMain.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  lbErros.Items.Add(FormatDateTime('dd/MM/yyyy - hh:nn:ss', Now) + ' - ' + E.Message);
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
begin
  ProcessarAtualizacao;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'config.ini');
  try
    IniFile.WriteInteger('Configuracao', 'QtdeMinutosAtualizacao', edTempoAtualizacao.Value);
  finally
    IniFile.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  server, database: string;
begin
  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'config.ini');
  try
    server := IniFile.ReadString('Sql','server', '');
    database := IniFile.ReadString('Sql','database', '');

    ConexaoAgilus.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+database+';Data Source='+server;

    edTempoAtualizacao.Value := IniFile.ReadInteger('Configuracao', 'QtdeMinutosAtualizacao', 10);
  finally
    IniFile.Free;
  end;

  Caption := Caption + ' - '+database;

  TempoDecorrido := 0;
end;

procedure TfrmMain.ProcessarAtualizacao;
var
  IP: string;
  i: integer;
begin
  Timer.Enabled := False;
  TempoDecorrido := 0;

  for i := View.DataController.RowCount - 1 downto 0 do
    View.DataController.DeleteRecord(i);

  ConexaoAgilus.Open('atualizacaodns','atualizacaodns');

  try
    if tbDns.Active then
      tbDns.Close;

    tbDns.Open;
    i := 0;
    while not tbDns.Eof do
    begin
      // atualiza o IP, se necessário
      IP := PegaIpReverso(tbDns.FieldByName('lip_dns_dinamico').AsString);
      if IP <> tbDns.FieldByName('lip_endereco_ip').AsString then
      begin
        tbDns.Edit;
        tbDns.FieldByName('lip_endereco_ip').AsString := IP;
        tbDns.FieldByName('lip_ultima_atualizacao_dns').AsDateTime := Now;
        tbDns.Post;
      end;

      // preenche a linha do grid
      View.DataController.AppendRecord;
      View.DataController.Values[i, ViewEndereco.Index] := tbDns.FieldByName('lip_dns_dinamico').AsString;
      View.DataController.Values[i, ViewIp.Index] := tbDns.FieldByName('lip_endereco_ip').AsString;
      View.DataController.Values[i, ViewUltimaAtualizacao.Index] := tbDns.FieldByName('lip_ultima_atualizacao_dns').AsDateTime;
      Inc(i);

      tbDns.Next;
    end;
  finally
    ConexaoAgilus.Close;
    Timer.Enabled := True;
  end;
end;

procedure TfrmMain.SetTempoDecorrido(const Value: integer);
begin
  FTempoDecorrido := Value;
  lbProgresso.Caption := FormatDateTime('hh:nn:ss', EncodeTime(Value div 60 div 60, Value div 60, Value mod 60, 0));
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  TempoDecorrido := TempoDecorrido+1;
  if TempoDecorrido >= edTempoAtualizacao.Value*60 then
    ProcessarAtualizacao;
end;

end.
