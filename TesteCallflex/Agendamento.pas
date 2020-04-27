unit Agendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, callflex_mid_TLB;

type
  TfrmAgendamento = class(TForm)
    cmdCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtNome: TEdit;
    txtClientId: TEdit;
    txtTel: TEdit;
    txtData: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    txtQueue: TEdit;
    cmdPublic: TButton;
    cmdPrivate: TButton;
    procedure cmdPublicClick(Sender: TObject);
    procedure cmdPrivateClick(Sender: TObject);
    procedure cmdAgendarClick(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    clx: Tcallflex_middle;
  end;

implementation

{$R *.dfm}

procedure TfrmAgendamento.cmdAgendarClick(Sender: TObject);
begin
  ShowMessage('Agendamento PRIVADO não implementado.');
end;

procedure TfrmAgendamento.cmdCancelClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmAgendamento.cmdPublicClick(Sender: TObject);
var
  Nome:WideString;
  ClientId:WideString;
  Tel:WideString;
  Data:WideString;
  Queue:SmallInt;
begin
  Nome := txtNome.Text;
  ClientId := txtClientId.Text;
  Tel := txtTel.Text;
  Data := txtData.Text;
  Queue := strtoint(txtQueue.Text);

  if not clx.fSchedulePublic(Nome, ClientId, Tel, Data, Queue) then
    ShowMessage('Ocorreu um erro ao tentar agendar.');
end;

procedure TfrmAgendamento.cmdPrivateClick(Sender: TObject);
var
  Nome:WideString;
  ClientId:WideString;
  Tel:WideString;
  Data:WideString;
begin
  Nome := txtNome.Text;
  ClientId := txtClientId.Text;
  Tel := txtTel.Text;
  Data := txtData.Text;

  if not clx.fSchedulePrivate(Nome, ClientId, Tel, Data) then
    ShowMessage('Ocorreu um erro ao tentar agendar.');
end;

procedure TfrmAgendamento.FormCreate(Sender: TObject);
begin
  txtNome.Text := 'Nome';
  txtclientid.Text := '1234';
  txtdata.Text := FormatDateTime('yyyy/mm/dd hh:nn', (Now + 0.041)) + ':00';
end;

end.
