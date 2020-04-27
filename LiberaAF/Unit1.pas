unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxEdit, cxInplaceContainer, StdCtrls,
  DB, ADODB, cxDBVGrid, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxVGrid,
  cxFormats;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Conexao: TADOConnection;
    tbAf: TADOQuery;
    Button1: TButton;
    cxVerticalGrid1: TcxDBVerticalGrid;
    Button2: TButton;
    DataSource1: TDataSource;
    tbAfcon_nome: TWideStringField;
    tbAfcon_cpf: TWideStringField;
    tbAfaf_valor: TBCDField;
    tbAfaf_data: TDateTimeField;
    tbAfbcolib_descricao: TWideStringField;
    tbAfitb_qtde_parcelas: TSmallintField;
    tbAfenc_data_entrada: TDateTimeField;
    cxVerticalGrid1con_nome: TcxDBEditorRow;
    cxVerticalGrid1con_cpf: TcxDBEditorRow;
    cxVerticalGrid1af_valor: TcxDBEditorRow;
    cxVerticalGrid1af_data: TcxDBEditorRow;
    cxVerticalGrid1bcolib_descricao: TcxDBEditorRow;
    cxVerticalGrid1itb_qtde_parcelas: TcxDBEditorRow;
    cxVerticalGrid1enc_data_entrada: TcxDBEditorRow;
    Command: TADOCommand;
    tbAfenc_codigo: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  with tbAf do
  begin
    Close;
    Parameters.ParamByName('CodAf').Value := StrToInt(Trim(Edit1.Text));
    Open;
    if IsEmpty then
    begin
      Close;
      raise Exception.Create('AF não localizado');
    end;

    if FieldByName('enc_codigo').IsNull then
    begin
      Application.MessageBox('AF já está liberado', 'Aviso', mb_iconwarning+mb_ok);
      Close;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not tbAf.Active then
    raise Exception.Create('AF não consultado');

  Command.Parameters.ParamByName('CodAf').Value := StrToInt(Trim(Edit1.Text));
  Command.Execute;
  tbAf.Close;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  tbAf.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Conexao.Open('agilus','awrpu07!@$AFAFAsdfqrasfafJMYJYJ&* $%');
  FormatSettings.ShortDateFormat := 'dd/MM/yyyy';
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.ThousandSeparator := '.';
  cxFormatController.UseDelphiDateTimeFormats := True;

end;

end.
