//ok
unit UFormModoExclusivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UConstVar, Dialogs, JvExControls, JvLabel, ExtCtrls, Gradpan, StdCtrls, Buttons;

type
  TModoModoExclusivo = (mmEsperar, mmDesbloquear);

  TfFormModoExclusivo = class(TForm)
    GradPan1: TGradPan;
    lbAguarde: TJvLabel;
    JvLabel3: TJvLabel;
    jvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    lbLinha1: TJvLabel;
    lbLinha2: TJvLabel;
    lbLinha3: TJvLabel;
    btFechar: TBitBtn;
    Timer1: TTimer;
    btDesbloquear: TBitBtn;
    btManterBloqueado: TBitBtn;
    procedure btFecharClick(Sender: TObject);
    procedure btManterBloqueadoClick(Sender: TObject);
    procedure btDesbloquearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    PodeFechar : boolean;
  public
    ModoModoExclusivo : TModoModoExclusivo;
    IPExclusivo : word;
  end;

var
  fFormModoExclusivo: TfFormModoExclusivo;

implementation

uses UComum, DBFunctions, UDataMod;

{$R *.dfm}

procedure TfFormModoExclusivo.btFecharClick(Sender: TObject);
begin
  PodeFechar := false;
  AbortaAplicacao := true;
  Application.Terminate;
end;

procedure TfFormModoExclusivo.btManterBloqueadoClick(Sender: TObject);
begin
  PodeFechar := true;
  Close;
end;

procedure TfFormModoExclusivo.btDesbloquearClick(Sender: TObject);
begin
  CM.DesligaModoExclusivo;
  PodeFechar := true;
  Close;
end;

procedure TfFormModoExclusivo.FormShow(Sender: TObject);
begin
  case ModoModoExclusivo of
    mmEsperar:
    begin
      lbAguarde.Caption := 'Aguarde...';
      lbLinha1.Caption  := 'O Sistema est� ocupado com Processamento Exclusivo';
      lbLinha2.Caption  := 'para o Computador com Endere�o IP Final';
      lbLinha3.Caption  := 'XXX.XXX.XXX.'+IntToStr(IPExclusivo);
      btFechar.Visible          := true;
      btDesbloquear.Visible     := false;
      btManterBloqueado.Visible := false;
      Timer1.Enabled := true;
    end;
    mmDesbloquear:
    begin
      lbAguarde.Caption := 'Aten��o!';
      lbLinha1.Caption  := 'O Sistema est� sendo executado em Modo Exclusivo para este Computador.';
      lbLinha2.Caption  := 'Nenhum outro terminal da rede poder� ter acesso ao Sistema';
      lbLinha3.Caption  := 'at� que este Computador Desbloqueie este acesso';
      btFechar.Visible          := false;
      btDesbloquear.Visible     := true;
      btManterBloqueado.Visible := true;
    end;
  end;
end;

procedure TfFormModoExclusivo.Timer1Timer(Sender: TObject);
var
  i : word;
begin
  i := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'MODOEXCLUSIVO', false);
  if i <= 0 then
  begin
    Timer1.Enabled := false;
    PodeFechar := true;
    Close;
  end;
end;

procedure TfFormModoExclusivo.FormCreate(Sender: TObject);
begin
  PodeFechar := false;
end;

procedure TfFormModoExclusivo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := PodeFechar;
end;

end.
