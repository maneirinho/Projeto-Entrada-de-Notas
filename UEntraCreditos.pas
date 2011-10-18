//ok
unit UEntraCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExControls, JvComponent, JvGradient,
  UComum, ExtCtrls, UConstVar, MessageFunctions;

type
  TfEntraCreditos = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    JvGradient1: TJvGradient;
    Image1: TImage;
    Label2: TLabel;
    LabelID: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Modo : TModos;
  end;

var
  fEntraCreditos: TfEntraCreditos;

implementation

uses DUtilit, UDataMod;// , UValidacao    UValidade,

{$R *.dfm}

procedure TfEntraCreditos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfEntraCreditos.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfEntraCreditos.BitBtn1Click(Sender: TObject);
var
  ChaveAntiga, ChaveValida : Boolean;
  S : String;
  V1, V2, V3, V4 :String;
  msgTentativas: String;
begin
  ChaveValida := TRUE;
end;

procedure TfEntraCreditos.Edit1Change(Sender: TObject);
begin
  if length(TEdit(sender as TControl).Text) = 5 then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TfEntraCreditos.FormCreate(Sender: TObject);
begin
  Modo := mdAlteracao;
  LabelID.Caption := PoeZeros(RegCreditos.ID, 3);
end;

procedure TfEntraCreditos.FormShow(Sender: TObject);
begin
  //FechaAviso;
  Screen.Cursor := crDefault;
end;

end.
