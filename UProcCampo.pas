//ok
unit UProcCampo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, MessageFunctions;

type
  TfProcCampo = class(TForm)
    RadioGroup1: TRadioGroup;
    Bt_Ok: TBitBtn;
    Bt_Cancela: TBitBtn;
    GroupBox: TGroupBox;
    CheckBoxIncremental: TCheckBox;
    CheckBoxComposta: TCheckBox;
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_CancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Ok : boolean;
    { Public declarations }
  end;

var
  fProcCampo: TfProcCampo;

implementation

uses UComum;

{$R *.dfm}

procedure TfProcCampo.Bt_OkClick(Sender: TObject);
begin
  Ok := true;
  Close;
end;

procedure TfProcCampo.Bt_CancelaClick(Sender: TObject);
begin
  Ok := false;
  Close;
end;

procedure TfProcCampo.FormShow(Sender: TObject);
begin
  FechaAviso;
  Screen.Cursor := crDefault;
end;

end.
