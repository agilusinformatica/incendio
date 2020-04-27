unit CadProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinCaramel, dxSkinsDefaultPainters,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxLabel, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, DB, cxDBData, cxCheckBox, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ADODB,
  Menus, StdCtrls, cxButtons, StrUtils, dxSkinsCore;

type
  TfrmCadProduto = class(TForm)
    cbSeguradora: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNome: TcxTextEdit;
    cbRegiao: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    cbAtivo: TcxCheckBox;
    cxLabel4: TcxLabel;
    edMaximoVidas: TcxTextEdit;
    cxLabel5: TcxLabel;
    edCodSeguradora: TcxTextEdit;
    tbPlanoSaude: TADOQuery;
    vwPlanoSaude: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsPlanoSaude: TDataSource;
    vwPlanoSaudeId: TcxGridDBColumn;
    vwPlanoSaudeNome: TcxGridDBColumn;
    vwPlanoSaudeMarca: TcxGridDBColumn;
    tbFaixaIdade: TADOQuery;
    dsFaixaIdade: TDataSource;
    vwFaixaIdade: TcxGridDBTableView;
    gridFaixaIdadeLevel1: TcxGridLevel;
    gridFaixaIdade: TcxGrid;
    vwFaixaIdadeId: TcxGridDBColumn;
    vwFaixaIdadeIdadeInicial: TcxGridDBColumn;
    vwFaixaIdadeIdadeFinal: TcxGridDBColumn;
    vwFaixaIdadeEmpresaId: TcxGridDBColumn;
    vwFaixaIdadePlanoSaudeId: TcxGridDBColumn;
    vwFaixaIdadevalor: TcxGridDBColumn;
    vwFaixaIdademarca: TcxGridDBColumn;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    tbFaixaIdadeId: TIntegerField;
    tbFaixaIdadeIdadeInicial: TIntegerField;
    tbFaixaIdadeIdadeFinal: TIntegerField;
    tbFaixaIdadeEmpresaId: TIntegerField;
    tbFaixaIdadePlanoSaudeId: TIntegerField;
    tbFaixaIdadevalor: TBCDField;
    tbFaixaIdademarca: TBooleanField;
    tbPlanoSaudeId: TAutoIncField;
    tbPlanoSaudeNome: TWideMemoField;
    tbPlanoSaudeSeguradoraId: TIntegerField;
    tbPlanoSaudePlanoSaudeGenericoId: TIntegerField;
    tbPlanoSaudeMarca: TBooleanField;
    procedure cbSeguradoraPropertiesChange(Sender: TObject);
    procedure tbPlanoSaudeAfterScroll(DataSet: TDataSet);
    procedure edMaximoVidasKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vwPlanoSaudeMarcaPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodProduto: integer;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses dados, funcao;

{$R *.dfm}

procedure TfrmCadProduto.cbSeguradoraPropertiesChange(Sender: TObject);
begin
  tbPlanoSaude.Close;
  tbFaixaIdade.Close;
  if cbSeguradora.EditValue <> null then
  begin
    tbPlanoSaude.Parameters.ParamByName('SeguradoraId').Value := cbSeguradora.EditValue;
    tbPlanoSaude.Parameters.ParamByName('ProdutoId').Value := CodProduto;
    tbPlanoSaude.Open;
    tbFaixaIdade.Parameters.ParamByName('SeguradoraId').Value := cbSeguradora.EditValue;
    tbFaixaIdade.Parameters.ParamByName('ProdutoId').Value := CodProduto;
    tbFaixaIdade.Open;
  end;
end;

procedure TfrmCadProduto.cxButton1Click(Sender: TObject);
var
  Query: TADOQuery;
  SQL: TStringBuilder;
  i, j: integer;
begin
  SQL := TStringBuilder.Create;
  Sql.Append('set xact_abort on'); Sql.AppendLine;
  Sql.Append('begin transaction'); Sql.AppendLine;
  if CodProduto = 0 then
  begin
    Sql.Append('declare @produtoId int'); Sql.AppendLine;
    Sql.Append('insert into produto(nome, empresaId) values('+QuotedStr(edNome.Text)+',1)'); Sql.AppendLine;
    Sql.Append('select @produtoId = @@identity'); Sql.AppendLine;

    SQL.Append('insert into produtoSeguroSaude(Id,RegiaoId,SeguradoraId,Ativo,CodigoSeguradora,QtdeMaximoVidas) values('); Sql.AppendLine;
    SQL.Append('@produtoId,'); Sql.AppendLine;
    SQL.Append(IntToStr(cbRegiao.EditValue)+','); Sql.AppendLine;
    SQL.Append(IntToStr(cbSeguradora.EditValue)+','); Sql.AppendLine;
    SQL.Append(IfThen(cbAtivo.Checked,'1','0')+','); Sql.AppendLine;
    SQL.Append(QuotedStr(edCodSeguradora.Text)+','); Sql.AppendLine;
    SQL.Append(edMaximoVidas.Text+')'); Sql.AppendLine;
  end
  else
  begin
    Sql.Append('declare @produtoId int = '+IntToStr(CodProduto)); Sql.AppendLine;

    SQL.Append('update produto set nome = '+QuotedStr(edNome.Text)+' where Id = @produtoId'); Sql.AppendLine;

    SQL.Append('update produtoSeguroSaude set '); Sql.AppendLine;
    SQL.Append('RegiaoId = '+IntToStr(cbRegiao.EditValue)+','); Sql.AppendLine;
    SQL.Append('SeguradoraId = '+IntToStr(cbSeguradora.EditValue)+','); Sql.AppendLine;
    SQL.Append('Ativo = '+IfThen(cbAtivo.Checked,'1','0')+','); Sql.AppendLine;
    SQL.Append('CodigoSeguradora = '+QuotedStr(edCodSeguradora.Text)+','); Sql.AppendLine;
    SQL.Append('QtdeMaximoVidas = ' +edMaximoVidas.Text); Sql.AppendLine;
    SQL.Append('where Id = @produtoId'); Sql.AppendLine;

    SQL.Append('delete ProdutoPlanoSaude where ProdutoId = @produtoId'); Sql.AppendLine;
  end;

  SQL.Append('declare @produtoPlanoSaudeId int'); Sql.AppendLine;
  tbPlanoSaude.First;
  while not tbPlanoSaude.Eof do
  begin
    if tbPlanoSaude.FieldByName('marca').AsBoolean then
    begin
      SQL.Append('insert into ProdutoPlanoSaude(ProdutoId, PlanoSaudeId) values('); Sql.AppendLine;
      SQL.Append('@produtoId,'); Sql.AppendLine;
      SQL.Append(tbPlanoSaude.FieldByName('Id').AsString+')'); Sql.AppendLine;
      SQL.Append('select @produtoPlanoSaudeId = @@identity'); Sql.AppendLine;

      tbFaixaIdade.First;
      while not tbFaixaIdade.Eof do
      begin
        if tbFaixaIdade.FieldByName('marca').AsBoolean then
        begin
          SQL.Append('insert into FaixaIdadePlano(Valor, FaixaIdadeId, ProdutoPlanoSaudeId) values('); Sql.AppendLine;
          SQL.Append(Funcao.FormataVlrSql(tbFaixaIdade.FieldByName('Valor').Value)+','); Sql.AppendLine;
          SQL.Append(tbFaixaIdade.FieldByName('Id').AsString+','); Sql.AppendLine;
          SQL.Append('@produtoPlanoSaudeId)'); Sql.AppendLine;
        end;

        tbFaixaIdade.Next;
      end;
    end;

    tbPlanoSaude.Next;
  end;

  Sql.Append('commit'); Sql.AppendLine;
  //ShowMessage(SQL.ToString);
  dmDados.Conexao.Execute(SQL.ToString);

  if CodProduto = 0 then
    CodProduto := Funcao.PegaValorSQL('select max(id) from produto where empresaId = 1');

  ModalResult := mrOk;
  Close;
end;

procedure TfrmCadProduto.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadProduto.edMaximoVidasKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in [#13, #9, #8, '0'..'9']) then
    key := #0;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  if CodProduto > 0 then
    cbSeguradora.Enabled := False;
end;

procedure TfrmCadProduto.tbPlanoSaudeAfterScroll(DataSet: TDataSet);
begin
  tbFaixaIdade.Filtered := False;
  tbFaixaIdade.Filter := 'PlanoSaudeId = '+DataSet.FieldByName('Id').AsString;
  tbFaixaIdade.Filtered := True;
  gridFaixaIdade.Visible := tbPlanoSaude.FieldByName('marca').AsBoolean;
end;

procedure TfrmCadProduto.vwPlanoSaudeMarcaPropertiesChange(Sender: TObject);
begin
  gridFaixaIdade.Visible := tbPlanoSaudeMarca.Value;
end;

end.
