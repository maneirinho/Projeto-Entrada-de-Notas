//ok
unit UFrmAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvGradient, ComCtrls, StdCtrls, ExtCtrls, DUtilit,
  Buttons;

type
  TFrmAguarde = class(TForm)
    JvGradient1: TJvGradient;
    pnlTitulo: TPanel;
    Timer1: TTimer;
    pnlDuplicidades: TPanel;
    pnlTotais: TPanel;
    Bevel1: TBevel;
    lblTotalRegistros: TLabel;
    lblRegAtual: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    lbvelocidade: TLabel;
    Label5: TLabel;
    LbTempoExecucao: TLabel;
    Label6: TLabel;
    LbTempoEstimado: TLabel;
    LbDuplicidades: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    pnlUnificacao: TPanel;
    JvGradient2: TJvGradient;
    Label1: TLabel;
    ProgressBar: TProgressBar;
    lblMensagem: TLabel;
    JvGradient3: TJvGradient;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Inic, Agor : TTime;
    Ho, Mi, Se, Ms: word;
    Media : real;
    UltTime: TTime;
    cont : integer;
    { Private declarations }
  public
    Num_Reg, Qtde_Reg, Atual_Reg : Integer;
    Cancelado : boolean;
    Duplicidades : Integer;
    procedure ExibeMensagem(msg : string);
    { Public declarations }
  end;

var
  FrmAguarde: TFrmAguarde;

implementation

{$R *.dfm}

{ TFrmAguarde }

procedure TFrmAguarde.BitBtn1Click(Sender: TObject);
begin
  Cancelado := true;
end;

procedure TFrmAguarde.ExibeMensagem(msg: string);
begin
  lblMensagem.Caption := msg;
end;

procedure TFrmAguarde.FormShow(Sender: TObject);
begin
  Timer1.Enabled := true;
  Inic := Time;
  Agor := Inic;
  UltTime := Inic;
  Cancelado := false;
end;

procedure TFrmAguarde.Timer1Timer(Sender: TObject);
begin
  Agor := now;
  lbTempoExecucao.Caption := TimeToStr(Agor-Inic);
  Qtde_Reg := strtoint(lblTotalRegistros.Caption);
  LbDuplicidades.Caption := inttostr(Duplicidades);

  DecodeTime(Agor-UltTime, Ho, Mi, Se, MS);
  Se := (Ho*3600) + (Mi*60) + (Se);

  if Se > 0 then Media := Num_Reg / Se
            else Media := 0;

  UltTime := now;
  Num_Reg := 0;
  if Media > 0 then
  begin
    lbVelocidade.Caption := FormatCurr(',0.##', Media);
    lbTempoEstimado.Caption := TimeToStr(AjustaTime(0, 0, trunc((Qtde_Reg - Atual_Reg) / Media), 0));
  end;
end;

end.
