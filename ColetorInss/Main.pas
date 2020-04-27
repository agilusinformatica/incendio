unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  cxGraphics, cxControls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, ADODB, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, Menus, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ExtCtrls, ActnList, OleCtrls, SHDocVw,
  cxLookAndFeels, cxLookAndFeelPainters, ActiveX, IniFiles, cxFormats;

type
  TForm1 = class(TForm)
    HTTP: TIdHTTP;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ConexaoAgilus: TADOConnection;
    tbColetorInss: TADOQuery;
    dsColetorInss: TDataSource;
    tbColetorInsscin_codigo: TAutoIncField;
    tbColetorInsscin_beneficio: TStringField;
    tbColetorInsscin_data_consulta: TDateTimeField;
    tbColetorInsscin_resultado: TMemoField;
    cxGrid1DBTableView1cin_codigo: TcxGridDBColumn;
    cxGrid1DBTableView1cin_beneficio: TcxGridDBColumn;
    cxGrid1DBTableView1cin_data_consulta: TcxGridDBColumn;
    cxGrid1DBTableView1cin_resultado: TcxGridDBColumn;
    WebBrowser1: TWebBrowser;
    ActionList1: TActionList;
    acConsultar: TAction;
    Panel1: TPanel;
    edDataBase: TcxDateEdit;
    cxButton1: TcxButton;
    procedure acConsultarExecute(Sender: TObject);
    procedure tbColetorInssAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
    url: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Resultado;

{$R *.dfm}

procedure CarregaHTML(Texto: string; WebBrowser: TWebBrowser);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  WebBrowser.Navigate('about:blank') ;
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := Texto;
        sl.SaveToStream(ms) ;
        ms.Seek(0, 0) ;
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms)) ;
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

procedure TForm1.acConsultarExecute(Sender: TObject);
var
  Resultado: string;
begin
  tbColetorInss.Parameters.ParamByName('DataBase').Value := edDataBase.EditValue;
  tbColetorInss.Open;
  tbColetorInss.First;
  while not tbColetorInss.Eof do
  begin
    Resultado := HTTP.Get(url+tbColetorInsscin_beneficio.Value);
    if Resultado <> '' then
    begin
      tbColetorInss.Edit;
      tbColetorInsscin_resultado.Value := Resultado;
      tbColetorInsscin_data_consulta.Value := Now;
      tbColetorInss.Post;
    end;

    tbColetorInss.Next;
    Application.ProcessMessages;
  end;
end;

procedure TForm1.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if tbColetorInsscin_resultado.AsString <> EmptyStr then
  begin
    Application.CreateForm(TfrmResultado, frmResultado);
    frmResultado.TextoConsulta := tbColetorInsscin_resultado.AsString;
    frmResultado.ShowModal;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  server, database: string;
begin
  FormatSettings.ShortDateFormat := 'dd/MM/yyyy';
  cxFormatController.UseDelphiDateTimeFormats := True;

  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'config.ini');
  try
    server := IniFile.ReadString('Sql','server', '');
    database := IniFile.ReadString('Sql','database', '');
    url := IniFile.ReadString('Consulta','url', '');
    HTTP.Request.Username := IniFile.ReadString('Consulta','usuario','');
    HTTP.Request.Password := IniFile.ReadString('Consulta','senha','');


    ConexaoAgilus.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+database+';Data Source='+server;
    ConexaoAgilus.Open('coletorinss','coletorinss');
  finally
    IniFile.Free;
  end;
end;

procedure TForm1.tbColetorInssAfterScroll(DataSet: TDataSet);
begin
  CarregaHTML(tbColetorInsscin_resultado.Value, WebBrowser1);
end;

end.
