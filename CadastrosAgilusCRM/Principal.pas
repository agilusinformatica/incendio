unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinCaramel, dxSkinsDefaultPainters, StdCtrls, cxButtons,
  dxSkinsForm;

type
  TfrmPrincipal = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    SkinController: TdxSkinController;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses CadProduto, ListRegiao, ListSeguradora, ListProduto, ListPlanoSaude,
  ListPlanoSaudeGenerico, ListFaixaIdade;

{$R *.dfm}

procedure TfrmPrincipal.cxButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListProduto, frmListProduto);
  frmListProduto.ShowModal();
end;

procedure TfrmPrincipal.cxButton2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListRegiao, frmListRegiao);
  frmListRegiao.ShowModal();
end;

procedure TfrmPrincipal.cxButton3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListSeguradora, frmListSeguradora);
  frmListSeguradora.ShowModal();
end;

procedure TfrmPrincipal.cxButton4Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListPlanoSaude, frmListPlanoSaude);
  frmListPlanoSaude.ShowModal();
end;

procedure TfrmPrincipal.cxButton5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListPlanoSaudeGenerico, frmListPlanoSaudeGenerico);
  frmListPlanoSaudeGenerico.ShowModal();
end;

procedure TfrmPrincipal.cxButton6Click(Sender: TObject);
begin
  Application.CreateForm(TfrmListFaixaIdade, frmListFaixaIdade);
  frmListFaixaIdade.ShowModal();
end;

end.
