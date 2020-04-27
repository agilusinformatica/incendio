unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxButtonEdit,
  cxDBLookupComboBox, cxProgressBar, cxCheckBox, cxContainer, ComCtrls, dxCore,
  cxDateUtils, Menus, cxShellBrowserDialog, cxPropertiesStore, dxSkinsForm,
  StdCtrls, cxButtons, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxLabel, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGrid, Dados, StrUtils;

type
  TfrmMain = class(TForm)
    cxGrid1: TcxGrid;
    Grid: TcxGridTableView;
    ColumnArquivo: TcxGridColumn;
    ColumnProgresso: TcxGridColumn;
    ColumnQtdeLinhas: TcxGridColumn;
    ColumnMarca: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel4: TcxLabel;
    beArquivo: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ProgressBar: TcxProgressBar;
    SkinController: TdxSkinController;
    PropertiesStore: TcxPropertiesStore;
    BrowserDialog: TcxShellBrowserDialog;
    cbNaoLimparDadosGravados: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure beArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.beArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  BrowserDialog.Path := beArquivo.Text;
  if BrowserDialog.Execute then
    beArquivo.Text := BrowserDialog.Path;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
var
  i, Ret, LinhaProgressoAtual, QtdeRegistros, Contador: integer;
  Arqs: TSearchRec;
begin
  if not DirectoryExists(beArquivo.Text) then
    raise Exception.Create('Pasta não encontrada');

  for i := Grid.DataController.RowCount - 1 downto 0 do
    Grid.DataController.DeleteRecord(i);

  Ret := FindFirst(IncludeTrailingBackslash(beArquivo.Text)+'*.*', faAnyFile, Arqs);
  try
    LinhaProgressoAtual := 1;
    while Ret = 0 do
    begin
      if (Arqs.Name <> '.') and (Arqs.Name <> '..') then
      begin
        Grid.DataController.AppendRecord;
        Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnArquivo.Index] := Arqs.Name;
        Grid.DataController.Values[Grid.DataController.RowCount-1, ColumnMarca.Index] := False;
      end;
      Ret := FindNext(Arqs);
    end;
  finally
    FindClose(Arqs);
  end;
end;

procedure TfrmMain.cxButton2Click(Sender: TObject);
var
  Arquivo: TextFile;
  i, QtdeTotal, QtdeArquivo: integer;
  nome, NomeBanco, linha: string;
  SqlInsert: WideString;

  function NomeArquivo: string;
  begin
    Result := IncludeTrailingBackslash(beArquivo.Text)+Grid.DataController.Values[i, ColumnArquivo.Index];
  end;

  function NumLinhasArq(Arqtexto: String): integer;
  begin
    AssignFile(Arquivo, ArqTexto );
    Reset(Arquivo);
    Result := 0;
    try
      repeat
        Readln( Arquivo );
        Inc(Result);
      until Eof(Arquivo);
    finally
      CloseFile(Arquivo);
    end;
  end;

begin
  ProgressBar.Properties.Marquee := True;
  ProgressBar.Properties.Text := 'Contando linhas...';

  QtdeTotal := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin
    if (Grid.DataController.Values[i, ColumnMarca.Index] = True) then
    begin

      Grid.DataController.Values[i, ColumnQtdeLinhas.Index] := NumLinhasArq(NomeArquivo());
      QtdeTotal := QtdeTotal + Grid.DataController.Values[i, ColumnQtdeLinhas.Index];
    end;
    Application.ProcessMessages;
  end;

  ProgressBar.Properties.Marquee := False;
  ProgressBar.Properties.Text := '';
  ProgressBar.Properties.ShowTextStyle := cxtsPercent;
  ProgressBar.Properties.Max := QtdeTotal;

  if not cbNaoLimparDadosGravados.Checked then
    dmDados.ConexaoAgilus.Execute('truncate table dcont');


  QtdeTotal := 0;
  for i := 0 to Grid.DataController.RowCount - 1 do
  begin
    if (Grid.DataController.Values[i, ColumnMarca.Index] = True) then
    begin
      QtdeArquivo := 0;
      SqlInsert := '';
      nome := ExtractFileName(UpperCase(NomeArquivo()));
      if RightStr(nome, 8) = ' PENS D8' then
        NomeBanco := ReplaceStr(nome, ' PENS D8', '');
      if RightStr(nome, 8) = ' SERV D8' then
        NomeBanco := ReplaceStr(nome, ' SERV D8', '');
      AssignFile(Arquivo, NomeArquivo());
      Reset(Arquivo);
      try
        repeat
          Readln( Arquivo, linha );
          if RightStr(nome, 8) = ' PENS D8' then
          begin
            SqlInsert := SqlInsert +
              'insert into dcont(TIPO_FUNCIONAL, UF, ORGAO, UPAG, MATRICULA, MATRICULA_INSTITUIDOR, ' +
                                'CPF, NOME, BANCO, SITUACAO_FUNCONAL, NUMERO_CONTRATO, PMT, QTD_PARCELAS_ABERTAS) values('+
              QuotedStr('PENSIONISTA')+', '+                               // TIPO_FUNCIONAL
              QuotedStr(Copy(linha, 30, 2))+', '+                          // UF
              QuotedStr(Copy(linha, 1, 5))+', '+                           // ORGAO
              QuotedStr(Copy(linha, 21, 9))+', '+                          // UPAG
              QuotedStr('00'+Copy(linha, 13, 8))+', '+                     // MATRICULA
              QuotedStr(Copy(linha, 5, 7))+', '+                           // MATRICULA_INSTITUIDOR

              QuotedStr(Copy(linha, 77, 11))+', '+                         // CPF
              QuotedStr(Copy(linha, 32, 45))+', '+                         // NOME
              QuotedStr(NomeBanco)+', '+                                   // BANCO
              QuotedStr(Copy(linha, 114, 12))+', '+                        // SITUACAO_FUNCIONAL
              QuotedStr(Copy(linha, 126, 20))+', '+                        // NUMERO_CONTRATO
              QuotedStr(Copy(linha, 94, 9)+','+Copy(linha, 103, 2))+', '+  // PMT
              QuotedStr(Copy(linha, 105, 3))+')';                          // QTD_PARCELAS_ABERTAS
          end;
          if RightStr(nome, 8) = ' SERV D8' then
          begin
            SqlInsert := SqlInsert +
              'insert into dcont(TIPO_FUNCIONAL, UF, ORGAO, UPAG, MATRICULA, MATRICULA_INSTITUIDOR, ' +
                                'CPF, NOME, BANCO, SITUACAO_FUNCONAL, NUMERO_CONTRATO, PMT, QTD_PARCELAS_ABERTAS) values('+
              QuotedStr('SERVIDOR')+', '+                                  // TIPO_FUNCIONAL
              QuotedStr(Copy(linha, 22, 2))+', '+                          // UF
              QuotedStr(Copy(linha, 1, 5))+', '+                           // ORGAO
              QuotedStr(Copy(linha, 13, 9))+', '+                          // UPAG
              QuotedStr('000'+Copy(linha, 6, 7))+', '+                     // MATRICULA
              QuotedStr('')+', '+                                          // MATRICULA_INSTITUIDOR

              QuotedStr(Copy(linha, 74, 11))+', '+                         // CPF
              QuotedStr(Copy(linha, 24, 50))+', '+                         // NOME
              QuotedStr(NomeBanco)+', '+                                   // BANCO
              QuotedStr(Copy(linha, 111, 12))+', '+                        // SITUACAO_FUNCIONAL
              QuotedStr(Copy(linha, 123, 20))+', '+                        // NUMERO_CONTRATO
              QuotedStr(Copy(linha, 91, 9)+','+Copy(linha, 100, 2))+', '+  // PMT
              QuotedStr(Copy(linha, 102, 3))+')';                          // QTD_PARCELAS_ABERTAS
          end;
          Inc(QtdeArquivo);
          Inc(QtdeTotal);
          if QtdeArquivo mod 1000 = 0 then
          begin
            dmDados.ConexaoAgilus.Execute(SqlInsert);
            Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(QtdeArquivo / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
            ProgressBar.Position := QtdeTotal;
            Application.ProcessMessages;
            SqlInsert := '';
          end;
        until Eof(Arquivo);

        if SqlInsert <> '' then
        begin
          dmDados.ConexaoAgilus.Execute(SqlInsert);
          Grid.DataController.Values[i, ColumnProgresso.Index] := Trunc(QtdeArquivo / Grid.DataController.Values[i, ColumnQtdeLinhas.Index] * 100 );
          ProgressBar.Position := QtdeTotal;
          Application.ProcessMessages;
        end;
      finally
        CloseFile(Arquivo);
      end;
    end;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  arquivoUDL: string;
begin
  ArquivoUDL := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'conexao.udl';

  if not FileExists(ArquivoUDL) then
    raise Exception.Create('Arquivo de conexão com sistema não encontrado');

  dmDados.ConexaoAgilus.ConnectionString := 'FILE NAME='+ArquivoUDL;
  dmDados.ConexaoAgilus.LoginPrompt := True;
  dmDados.ConexaoAgilus.Open('claudio', '');
end;

end.
