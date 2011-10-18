//ok
unit UNumSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UConstVar, Dialogs, StdCtrls, UComum, Buttons, ExtCtrls, MMJPanel;

type
  TfNumSerie = class(TForm)
    PanelProduto: TMMJPanel;
    Edit1: TEdit;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    BotaoPressionado : TBotaoPressionado;
  end;

var
  fNumSerie: TfNumSerie;

implementation

{$R *.dfm}

procedure TfNumSerie.FormCreate(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Edit1.MaxLength := 45;
end;

procedure TfNumSerie.btOkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;
  Close;
end;

procedure TfNumSerie.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfNumSerie.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
