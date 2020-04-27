unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, XMLDoc, xmldom;

type
  TForm1 = class(TForm)
    mmXml: TMemo;
    Splitter1: TSplitter;
    Panel1: TPanel;
    resultado: TMemo;
    edtXPath: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  xml: TXMLDocument;
  noBusca: IDOMNodeSelect;
  nosResultado: IDOMNodeList;
  i: Integer;
begin
  xml := nil;
  try
    xml := TXMLDocument.Create(nil);
    xml.XML := mmXML.Lines;
    xml.Active := true;
    noBusca := (xml.DOMDocument.documentElement as IDOMNodeSelect);
    nosResultado := noBusca.selectNodes(edtXPath.Text);
    Self.resultado.Lines.Clear;
    if (nosResultado.length = 0) then
    begin
      ShowMessage('Pesquisa não retornou resultado.');
    end
    else
    begin
      for i := 0 to nosResultado.length - 1 do begin
        Self.resultado.Lines.Add(nosResultado[i].nodeName + ': ' +
          nosResultado[i].firstChild.nodeValue);
      end;
    end;
  finally
    xml.Free;
  end;
end;

end.
