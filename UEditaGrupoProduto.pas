//ok
unit UEditaGrupoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UConstVar, Dialogs, StdCtrls, UComum, Buttons;

type
  TfEditaGrupoProduto = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Bt_Ok: TBitBtn;
    Bt_Cancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bt_CancelarClick(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    BotaoPressionado : TBotaoPressionado;
  end;

var
  fEditaGrupoProduto: TfEditaGrupoProduto;

implementation

{$R *.dfm}

procedure TfEditaGrupoProduto.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TfEditaGrupoProduto.FormCreate(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
end;

procedure TfEditaGrupoProduto.Bt_CancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfEditaGrupoProduto.Bt_OkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;
  Close;
end;

end.
