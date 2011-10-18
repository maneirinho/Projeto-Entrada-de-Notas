unit UEditaProdFornec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UConstVar, Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, Buttons,
  UComum, MessageFunctions;

type
  TfEditaProdFornec = class(TForm)
    Label2: TLabel;
    edPrecoCusto: TJvCalcEdit;
    Label1: TLabel;
    edQuantidade: TJvCalcEdit;
    Label3: TLabel;
    edSubtotal: TJvCalcEdit;
    btOk: TBitBtn;
    btCancela: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edPrecoCustoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    BotaoPressionado : TBotaoPressionado;
  end;

var
  fEditaProdFornec: TfEditaProdFornec;

implementation

{$R *.dfm}

procedure TfEditaProdFornec.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfEditaProdFornec.btCancelaClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfEditaProdFornec.FormCreate(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
end;

procedure TfEditaProdFornec.btOkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;
  Close;
end;

procedure TfEditaProdFornec.edPrecoCustoExit(Sender: TObject);
begin
  edSubtotal.Value := edPrecoCusto.Value * edQuantidade.Value;
end;

procedure TfEditaProdFornec.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : btCancela.Click;
  end;
end;

procedure TfEditaProdFornec.FormShow(Sender: TObject);
begin
  FechaAviso;
  Screen.Cursor := crDefault;
end;

end.
