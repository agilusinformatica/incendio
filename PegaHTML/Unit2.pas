unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, MSHTML, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    WebBrowser1: TWebBrowser;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
  private
    function WebFormGet(const formNumber: integer;
      const document: IHTMLDocument2): IHTMLFormElement;
    function WebFormNames(const document: IHTMLDocument2): TStringList;
    procedure WebFormSetFieldValue(const document: IHTMLDocument2;
      const formNumber: integer; const fieldName, newValue: string);
    procedure WebFormSubmit(const document: IHTMLDocument2;
      const formNumber: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
function TForm2.WebFormNames(const document: IHTMLDocument2): TStringList;
var
  forms : IHTMLElementCollection;
  form : IHTMLFormElement;
  idx : integer;
begin
  forms := document.Forms as IHTMLElementCollection;
  result := TStringList.Create;
  for idx := 0 to -1 + forms.length do
  begin
    form := forms.item(idx,0) as IHTMLFormElement;
    result.Add(form.name) ;
  end;
end;

function TForm2.WebFormGet(const formNumber: integer; const document: IHTMLDocument2): IHTMLFormElement;
var
  forms : IHTMLElementCollection;
begin
  forms := document.Forms as IHTMLElementCollection;
  result := forms.Item(formNumber,'') as IHTMLFormElement
end;

procedure TForm2.WebFormSetFieldValue(const document: IHTMLDocument2; const formNumber: integer; const fieldName, newValue: string) ;
var
  form : IHTMLFormElement;
  field: IHTMLElement;
begin
  form := WebFormGet(formNumber, document) ;
  if form = nil then Exit;

  field := form.Item(fieldName,'') as IHTMLElement;
  if field = nil then Exit;

  if field.tagName = 'INPUT' then (field as IHTMLInputElement).value := newValue;
  if field.tagName = 'SELECT' then (field as IHTMLSelectElement).value := newValue;
  if field.tagName = 'TEXTAREA' then (field as IHTMLTextAreaElement).value := newValue;
end;

procedure TForm2.WebFormSubmit(
  const document: IHTMLDocument2;
  const formNumber: integer) ;
var
  form : IHTMLFormElement;
begin
  form := WebFormGet(formNumber, document);
  form.submit;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www010.dataprev.gov.br/cws/contexto/hiscre/index.html');
end;

procedure TForm2.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  CurWebrowser : IWebBrowser;
  TopWebBrowser: IWebBrowser;
  FonteHTML, TextoBusca: WideString;
begin
  CurWebrowser := pDisp as IWebBrowser;
  TopWebBrowser := (ASender as TWebBrowser).DefaultInterface;
  if CurWebrowser <> TopWebBrowser then // para pegar somente o frame interno
  begin
    FonteHTML := (CurWebrowser.Document as IHTMLDocument2).body.parentElement.outerHTML;
    TextoBusca := '<TITLE>Histórico de Créditos - Pesquisa Individual</TITLE>';
    if Pos(TextoBusca, FonteHTML) > 0 then
    begin
      {
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'nb', '0677492073');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'DiaNascimento', '13');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'MesNascimento', '03');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'AnoNascimento', '1935');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'nome', 'IVONE SANTIAGO');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'cpf', '84345640849');
      }
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'nb', '0479237344');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'DiaNascimento', '04');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'MesNascimento', '11');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'AnoNascimento', '1947');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'nome', 'JOSE SINESIO RODRIGUES');
      WebFormSetFieldValue((CurWebrowser.Document as IHTMLDocument2), 0, 'cpf', '07036981849');
    end;
    TextoBusca := '<TITLE>Detalhamento de Crédito</TITLE>';
    if Pos(TextoBusca, FonteHTML) > 0 then
    begin
      Memo1.Lines.Text := FonteHTML;


    end;
  end;
end;

end.
