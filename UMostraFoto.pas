unit UMostraFoto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TfMostraFoto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMostraFoto: TfMostraFoto;

implementation

{$R *.dfm}

procedure TfMostraFoto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE, VK_RETURN : Close;
  end;
end;

procedure TfMostraFoto.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
