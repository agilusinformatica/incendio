unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, djson;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Splitter1: TSplitter;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

type
  TResultado = class
    beneficio: string;
    nome: string;
    dataNascimento: string;
    cpf: string;
    especie: record
      codigo: string;
      descricao: string
    end;
    dadosBancarios: record
      banco: record
        codigo: string;
        nome: string;
      end;
      agencia: record
        codigo: string;
        nome: string;
        orgaoPagador: string;
        endereco: record
          endereco: string;
          bairro: string;
          cidade: string;
          cep: string;
          uf: string
        end
      end;
      meioPagamento: record
        tipo: string;
        numero: string;
      end
    end;
  end;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  resultado: TdJSON;
  contrato: TdJSON;
begin
  resultado := TdJSON.Parse(memo1.lines.text);
  for contrato in resultado['contratosEmprestimo'] do
  begin
    showMessage(DateToStr(contrato['dataInicioContrato'].AsDateTime));
  end;
end;

end.
