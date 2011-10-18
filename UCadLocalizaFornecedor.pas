unit UCadLocalizaFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExControls, JvGradient;

type
  TfCadLocalizaFornecedor = class(TForm)
    JvGradient1: TJvGradient;
    btnLocalizar: TBitBtn;
    btnCadastrar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadLocalizaFornecedor: TfCadLocalizaFornecedor;

implementation

uses UConsultaListaNotas, UNovaEntradaNotas, UConstVar, UModPesquisa,
  UCadastroPadrao, UCadFornecedores, pcnConversao;

{$R *.dfm}

procedure TfCadLocalizaFornecedor.btnCadastrarClick(Sender: TObject);
begin
  Application.CreateForm(TfCadFornecedores, fCadFornecedores);
  fCadFornecedores.EsteCadastro := cadFornecedores;
  AbreCad.EntraNaInclusao := True;
  with fCadFornecedores.RegDadosInclusao, fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe do
  begin
    CGC := Emit.CNPJCPF;
    IE  := Emit.IE;
    xNome := Emit.xNome;
    xFant := Emit.xFant;
    IEST  := Emit.IEST;
    IM    := Emit.IM;
    CNAE  := Emit.CNAE;
    CRT   := CRTToStr(Emit.CRT);
    Fone  := Emit.EnderEmit.fone;
    CEP   := IntToStr(Emit.EnderEmit.CEP);
    xLgr  := Emit.EnderEmit.xLgr;
    nro   := Emit.EnderEmit.nro;
    xCpl  := Emit.EnderEmit.xCpl;
    xBairro := Emit.EnderEmit.xBairro;
    cMun    := IntToStr(Emit.EnderEmit.cMun);
    xMun    := Emit.EnderEmit.xMun;
    UF      := Emit.EnderEmit.UF;
    cPais   := IntToStr(Emit.EnderEmit.cPais);
  end;
  fCadFornecedores.ShowModal;
  FreeAndNil(fCadFornecedores);
end;

procedure TfCadLocalizaFornecedor.btnCancelarClick(Sender: TObject);
begin
  fNovaEntradaNota.BotaoPressionado := bpFechar;
  close;
end;

procedure TfCadLocalizaFornecedor.btnLocalizarClick(Sender: TObject);
begin
  if (fNovaEntradaNota.Modo = mdInclusao) or (fNovaEntradaNota.Modo = mdInclusaoXML) or (fNovaEntradaNota.Modo = mdAlteracao) then
  begin
    ItemEsc := mPesq.Pesquisa(pqFornecedores, [mdInclusao, mdInclusaoXML, mdAlteracao], nil, fNovaEntradaNota.EditNomeFornecedor.Text);
    if ItemEsc.CodInt <> CodigoVazio then
      fNovaEntradaNota.EditCodFornecedor.Text := ItemEsc.CodExt;
    fNovaEntradaNota.EditNumNota.SetFocus;
  end;
end;



procedure TfCadLocalizaFornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_Escape: if (Shift = []) then btnCancelar.Click;
    vk_F2    : if (Shift = []) and (btnCadastrar.Enabled) then btnCadastrar.Click;
    vk_F3    : if (Shift = []) and (btnLocalizar.Enabled) then btnLocalizar.Click;
  end;
end;

end.
