//ok
unit UExcluirGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  UConstVar, UComum, Dialogs, StdCtrls, Buttons, ExtCtrls, MessageFunctions;

type
  TfExcluirGrupo = class(TForm)
    Label1: TLabel;
    lbOsProdutosQueFaziam: TLabel;
    lbOldGrupo: TLabel;
    lbOldGrupo2: TLabel;
    lbApartirDeAgora: TLabel;
    edGrupo: TEdit;
    btBuscaGrupo: TBitBtn;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    Bevel1: TBevel;
    lbAssociados: TLabel;
    procedure btBuscaGrupoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    BotaoPressionado : TBotaoPressionado;
    NovoGrupo : Integer;
  end;

var
  fExcluirGrupo: TfExcluirGrupo;

implementation

uses DUtilit, UModUsuarios, UCadGruposProdutos;

{$R *.dfm}

procedure TfExcluirGrupo.btBuscaGrupoClick(Sender: TObject);
var
  FormGrupos : TfCadGruposProdutos;
begin
  if not mUsers.TemAcessoPermissao(sgCadGrupos, 'L') then Exit;
  FormGrupos := TfCadGruposProdutos.Create(self);
  FormGrupos.CD_GRUPO := edGrupo.Tag;
  FormGrupos.ModoCadastro := true;
  FormGrupos.ModoExclusao := true;
  FormGrupos.ShowModal;
  if FormGrupos.BotaoPressionado = bpOk then
  begin
    edGrupo.Tag := FormGrupos.CD_GRUPO;
    if edGrupo.Tag = 0 then edGrupo.Text := ''
                       else edGrupo.Text := CM.StringGrupo(edGrupo.Tag);
  end;
  FreeAndNil(FormGrupos);
end;

procedure TfExcluirGrupo.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfExcluirGrupo.btOkClick(Sender: TObject);
begin
  if (edGrupo.Visible) and (vazio(edGrupo.Text)) then
  begin
    MensagemDeAtencao('É necessário informar um novo GRUPO para os produtos que pertenciam ao GRUPO que será excluído!');
    Exit;
  end;

  NovoGrupo := edGrupo.Tag;
  BotaoPressionado := bpOk;
  Close;
end;

procedure TfExcluirGrupo.FormCreate(Sender: TObject);
begin
  NovoGrupo := 0;
  BotaoPressionado := bpCancelado;
end;

procedure TfExcluirGrupo.edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    btBuscaGrupo.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

end.
