//todo umodusuarios
unit UAltEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, JvExMask,
  JvToolEdit, JvBaseEdits, MessageFunctions;

type
  TfEstoqueSimples = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxCalcEdit1: TJvCalcEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxCalcEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CodProduto  : Integer;
    CodGrade    : Integer;
    CodDeposito : Integer;
  end;

var
  fEstoqueSimples: TfEstoqueSimples;

implementation

uses UComum, UModUsuarios;

{$R *.dfm}

procedure TfEstoqueSimples.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfEstoqueSimples.BitBtn1Click(Sender: TObject);
begin
  CM.AlteraEstoque(CodProduto, CodGrade, CodDeposito, RXCalcEdit1.Value, 0, 'C', 'Correção no Cadastro de Produtos', RegUsuario.Login);
  Close;
end;

procedure TfEstoqueSimples.RxCalcEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfEstoqueSimples.FormCreate(Sender: TObject);
begin
  CodProduto  := 0;
  CodGrade    := 0;
  CodDeposito := 0;
end;

procedure TfEstoqueSimples.FormShow(Sender: TObject);
begin
  RxCalcEdit1.Value := CM.PegaEstoque(CodProduto, CodGrade, CodDeposito);
  FechaAviso;
  Screen.Cursor := crDefault;
end;

end.
