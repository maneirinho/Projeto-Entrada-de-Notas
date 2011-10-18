//ok
unit UNFAlteracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfNFAlteracao = class(TForm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    btOk: TBitBtn;
    Panel1: TPanel;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNFAlteracao: TfNFAlteracao;

implementation

uses UComum;

{$R *.dfm}

procedure TfNFAlteracao.btOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfNFAlteracao.FormCreate(Sender: TObject);
begin
  RadioGroup1.ItemIndex := CM.BuscaValorDoComponente(self, RadioGroup1, 1);
end;

procedure TfNFAlteracao.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  CM.SalvaValorDoComponente(self, RadioGroup1, RadioGroup1.ItemIndex);
end;

end.
