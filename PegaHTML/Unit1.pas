unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, httpsend, OleCtrls, SHDocVw, ComCtrls, ActiveX, StrUtils,
  ExtCtrls, Buttons, Grids;

type
  TRubrica = Record
    Codigo: String;
    Descricao: String;
    Valor: String;
    Sinal: String;
  End;

  TRubricas = ^TRubrica;

  TSegurado = record
    NumeroBeneficio    : string;
    Nome               : string;
    Especie            : string;
    DescEspecie        : string;
    Pal                : string;
    Competencia        : string;
    PeriodoInicial     : TDateTime;
    PeriodoFinal       : TDateTime;
    MeioPagamento      : string;
    Oml                : string;
    DtDisponivelInicial: TDateTime;
    DtDisponivelFinal  : TDateTime;
    DtCalcCredito      : TDateTime;
    Origem             : string;
    DtPagamento        : TDateTime;
    ContaCorrente	     : string;
    Retorno1		       : string;
    Retorno2		       : string;
    Retorno3		       : string;
    Retorno4		       : string;
    Retorno5		       : string;
    Banco		    	     : string;
    CodBanco		       : string;
    Agencia		  	     : string;
    EnderecoBanco      : string;
    ValorBruto         : Currency;
    ValorDesconto      : Currency;
    ValorLiquido       : Currency;
    ListaRubrica       : TList;
  end;

  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    WebBrowser: TWebBrowser;
    Button2: TButton;
    edMatricula: TLabeledEdit;
    edDtNasc: TLabeledEdit;
    Panel1: TPanel;
    edNome: TLabeledEdit;
    edFormaPgto: TLabeledEdit;
    edBanco: TLabeledEdit;
    BitBtn1: TBitBtn;
    edCampo: TLabeledEdit;
    edValor: TLabeledEdit;
    Grid: TStringGrid;
    btCarregar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btCarregarClick(Sender: TObject);
  private
    procedure CarregaHTML(HTMLCode: string; WebBrowser: TWebBrowser);
    { Private declarations }
  public
    function AchaCampo(NomeCampo, Texto: String): String;
    function CarregaSegurado(Pagina: String): TSegurado;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CarregaHTML(HTMLCode: string; WebBrowser: TWebBrowser);
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
        sl.Text := HTMLCode;
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


function TForm1.CarregaSegurado(Pagina: String): TSegurado;
var Segurado: TSegurado;
    ValorAuxiliar, TextoAuxiliar: String;
    Rubrica: TRubricas;
    PosIni: Integer;
begin
  Posini := Pos('var nb', Pagina);
  if PosIni = 0 then
    raise Exception.Create('Texto fora do padrão exigido');
  Pagina := Copy(Pagina, Posini, Length(Pagina));
  Segurado.NumeroBeneficio    := AchaCampo('var nb', Pagina);
  Segurado.Nome               := AchaCampo('var nome', Pagina);
  Segurado.Especie            := AchaCampo('var especie', Pagina);
  Segurado.DescEspecie        := AchaCampo('var descespecie', Pagina);
  Segurado.Pal                := AchaCampo('var pal', Pagina);
  Segurado.Competencia        := AchaCampo('var competencia', Pagina);
  if ValorAuxiliar <> '' then
    Segurado.PeriodoInicial      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.PeriodoInicial      := 0;
  if ValorAuxiliar <> '' then
    Segurado.PeriodoFinal      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.PeriodoFinal      := 0;
  Segurado.MeioPagamento      := AchaCampo('var meiopagto', Pagina);
  Segurado.Oml                := AchaCampo('var oml', Pagina);
  if ValorAuxiliar <> '' then
    Segurado.DtDisponivelInicial      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.DtDisponivelInicial      := 0;
  if ValorAuxiliar <> '' then
    Segurado.DtDisponivelFinal      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.DtDisponivelFinal      := 0;
  if ValorAuxiliar <> '' then
    Segurado.DtCalcCredito      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.DtCalcCredito      := 0;
  Segurado.Origem             := AchaCampo('var origem', Pagina);
  if ValorAuxiliar <> '' then
    Segurado.DtPagamento      := StrToDateTime(ValorAuxiliar)
  else
    Segurado.DtPagamento      := 0;
  Segurado.ContaCorrente      := AchaCampo('var contacorrente', Pagina);
  Segurado.Retorno1           := AchaCampo('var retorno1', Pagina);
  Segurado.Retorno2           := AchaCampo('var retorno2', Pagina);
  Segurado.Retorno3           := AchaCampo('var retorno3', Pagina);
  Segurado.Retorno4           := AchaCampo('var retorno4', Pagina);
  Segurado.Retorno5           := AchaCampo('var retorno5', Pagina);
  Segurado.Banco              := AchaCampo('var banco', Pagina);
  Segurado.CodBanco           := AchaCampo('var codbanco', Pagina);
  Segurado.Agencia            := AchaCampo('var agencia', Pagina);
  Segurado.EnderecoBanco      := AchaCampo('var enderecobanco', Pagina);
  if ValorAuxiliar <> '' then
    Segurado.ValorBruto      := StrToCurr(ValorAuxiliar)
  else
    Segurado.ValorBruto      := 0;
  if ValorAuxiliar <> '' then
    Segurado.ValorDesconto      := StrToCurr(ValorAuxiliar)
  else
    Segurado.ValorDesconto      := 0;
  if ValorAuxiliar <> '' then
    Segurado.ValorLiquido      := StrToCurr(ValorAuxiliar)
  else
    Segurado.ValorLiquido      := 0;
  Segurado.ListaRubrica        := TList.Create;

  TextoAuxiliar := Pagina;
  posIni := pos('//imprime', TextoAuxiliar);
  while posini > 0 do
  begin
    TextoAuxiliar := Copy(TextoAuxiliar, Posini, length(TextoAuxiliar));
    posIni := pos(#13, TextoAuxiliar) + 1;
    TextoAuxiliar     := Copy(TextoAuxiliar, Posini, length(TextoAuxiliar));
    Rubrica           := new(TRubricas);
    Rubrica^.Codigo    := AchaCampo('rubrica', TextoAuxiliar);
    Rubrica^.Descricao := AchaCampo('descrub', TextoAuxiliar);
    Rubrica^.Valor     := AchaCampo('vlrub', TextoAuxiliar);
    Rubrica^.Sinal     := AchaCampo('sinal', TextoAuxiliar);

    if Trim(Rubrica^.Codigo) <> '' then
      Segurado.ListaRubrica.Add(Rubrica);

    posIni := pos('//imprime', TextoAuxiliar);
  end;
  Result := Segurado;
end;

function TForm1.AchaCampo(NomeCampo, Texto: String): String;
var PosIni, PosFim: Integer;
    TextoAuxiliar: String;
begin
  result := '';
  posIni := pos(NomeCampo, Texto);
  if PosIni = 0 then
    raise Exception.Create('Campo não encontrado!');
  TextoAuxiliar := copy(texto, posini, length(Texto));
  posini := pos('''', TextoAuxiliar) + 1;
  TextoAuxiliar := copy(TextoAuxiliar, posini, length(Texto));
  posfim := pos('''', TextoAuxiliar) - 1;
  Result := copy(TextoAuxiliar, 1, posFim);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  edValor.Text := AchaCampo(edCampo.Text, memo1.Text);
end;

procedure TForm1.btCarregarClick(Sender: TObject);
var
  Segurado: TSegurado;
  i: integer;
begin
  Segurado := CarregaSegurado(Memo1.Text);
  edNome.Text := Segurado.Nome;
  edFormaPgto.Text := Segurado.MeioPagamento;
  edBanco.Text := Segurado.Banco;

  Grid.Cells[0, 0] := 'Código';
  Grid.Cells[1, 0] := 'Descrição';
  Grid.Cells[2, 0] := 'Valor';
  Grid.Cells[3, 0] := 'Sinal';
  Grid.RowCount := Segurado.ListaRubrica.Count + 1;

  for i := 0 to Segurado.ListaRubrica.Count - 1 do
  begin
    Grid.Cells[0, i+1] := TRubricas(Segurado.ListaRubrica.Items[i]).Codigo;
    Grid.Cells[1, i+1] := TRubricas(Segurado.ListaRubrica.Items[i]).Descricao;
    Grid.Cells[2, i+1] := TRubricas(Segurado.ListaRubrica.Items[i]).Valor;
    Grid.Cells[3, i+1] := TRubricas(Segurado.ListaRubrica.Items[i]).Sinal;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  teste: THTTPSend;
begin
  teste := thttpsend.Create;
  teste.UserName := 'agilux';
  teste.Password := 'xx32kk';

  if teste.HTTPMethod('OPEN', 'http://173.192.144.100:89/admin/agil/1_detalha.php?nb=' + edMatricula.Text + '&data_nasc=' + edDtNasc.Text) then
    Memo1.Lines.LoadFromStream(teste.Document);

  teste.Free;

  btCarregarClick(Self);

  {
  Strings := TStringList.Create;
  try
    if HttpGetText(Edit1.Text, Strings) then
      Memo1.Lines.Assign(Strings);
  finally
    Strings.Free;
  end;
  PageControl1.ActivePageIndex := 0;}
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Texto: string;
begin
  Texto := Memo1.Lines.Text;
  Texto := AnsiReplaceStr(Texto, 'parent.RAIZ_HTML_GATEWAY', QuotedStr('http://www3.dataprev.gov.br/cws') );
  {Texto := AnsiReplaceStr(Texto, 'parent.RAIZ_HTML_GATEWAY', 'RAIZ_HTML_GATEWAY' );
  Texto := AnsiReplaceStr(Texto, 'parent.RAIZ_COMS_BIN', 'RAIZ_COMS_BIN' );
  Texto := AnsiReplaceStr(Texto, 'parent.nb', 'nb' );
  Texto := AnsiReplaceStr(Texto, 'parent.erro ', 'erro ' );
  Texto := AnsiReplaceStr(Texto, 'parent.erroconfere', 'erroconfere' );
  Texto := AnsiReplaceStr(Texto, 'parent.exibeErro', 'exibeErro' );}
  CarregaHTML(Texto, WebBrowser);
  PageControl1.ActivePageIndex := 1;
end;

end.



