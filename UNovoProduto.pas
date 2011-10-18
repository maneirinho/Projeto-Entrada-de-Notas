//ok
unit UNovoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvExMask, JvToolEdit, JvBaseEdits,
  UComum, JvDBControls, DBCtrls, wwdblook, Buttons, Mask, Menus, ComCtrls,
  UConstVar, ExtDlgs, MessageFunctions;

type
  TfNovoProduto = class(TForm)
    Label2: TLabel;
    lbUnidade: TLabel;
    edDescricao: TEdit;
    btOk: TBitBtn;
    btCancelar: TBitBtn;
    btPesquisar: TBitBtn;
    PopupMenu: TPopupMenu;
    MenuLiga: TMenuItem;
    MenuDesliga: TMenuItem;
    edUnidade: TComboBox;
    PageControl1: TPageControl;
    TabCadastro: TTabSheet;
    TabObs: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    bt_GeraCodigo: TSpeedButton;
    lbFabricante: TLabel;
    lbDescrAbrev: TLabel;
    lbLocalizacao: TLabel;
    lbAplicacao: TLabel;
    lbPesoLiquido: TLabel;
    lbPesoBruto: TLabel;
    lbEstoqueMinimo: TLabel;
    lbDesconto: TLabel;
    lbDesconto2: TLabel;
    lbComissao: TLabel;
    Label45: TLabel;
    lbQuantDigitos: TLabel;
    btGrupos: TBitBtn;
    GroupBoxCodigos: TGroupBox;
    lbCodigo2: TLabel;
    lbCodigo3: TLabel;
    lbCodigo4: TLabel;
    edCodigo2: TEdit;
    edCodigo3: TEdit;
    edCodigo4: TEdit;
    edCodBalanca: TEdit;
    GroupBoxCaixaFechada: TGroupBox;
    lbUndConvEmbalagem: TLabel;
    lbUndConvEmbalagem2: TLabel;
    lbCodEmbalagem: TLabel;
    edCodEmbalagem: TEdit;
    edUndConvEmbalagem: TJvCalcEdit;
    edCodigo: TEdit;
    edFabricante: TEdit;
    edDescrAbrev: TEdit;
    edLocalizacao: TEdit;
    edAplicacao: TEdit;
    edPesoLiquido: TJvCalcEdit;
    edPesoBruto: TJvCalcEdit;
    edEstoqueMinimo: TJvCalcEdit;
    chUnidadeFracionada: TCheckBox;
    edDimensoes: TEdit;
    edDesconto: TJvCalcEdit;
    edComissao: TJvCalcEdit;
    chControlaNumSerie: TCheckBox;
    edGrupo: TEdit;
    Memo1: TMemo;
    TabFoto: TTabSheet;
    Image1: TImage;
    Bt_Foto: TBitBtn;
    Bt_ApagaFoto: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    chCodBalanca: TCheckBox;
    chTresCasas: TCheckBox;
    grpFisco: TGroupBox;
    lbClassFiscal: TLabel;
    edClassFiscal: TEdit;
    GroupBoxFisco: TGroupBox;
    Label8: TLabel;
    lbAliquota: TLabel;
    lbAliquota2: TLabel;
    lbIPI: TLabel;
    lbIPI2: TLabel;
    edAliquota: TJvCalcEdit;
    edIPI: TJvCalcEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure btGruposClick(Sender: TObject);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure bt_GeraCodigoClick(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure edCodBalancaKeyPress(Sender: TObject; var Key: Char);
    procedure edPrecoCustoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodEmbalagemChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure edFabricanteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuPopup(Sender: TObject);
    procedure MenuLigaClick(Sender: TObject);
    procedure MenuDesligaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edDescricaoExit(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCodigoExit(Sender: TObject);
    procedure edCodigoEnter(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure Bt_FotoClick(Sender: TObject);
    procedure Bt_ApagaFotoClick(Sender: TObject);
    procedure edCST1Enter(Sender: TObject);
  private
    CompSender        : TObject;  // Componente que poder� ser ligado ou desligado
    EstaChave         : String;      // Chave de registro resumida (Ex: \CadProdutos)
    ChaveDoRegistro   : String;      // Chave de registro Completa composta da RegChave + EstaChave
    procedure CarregaEstadoLigadoDesligado;
    procedure GravaEstadoLigadoDesligado;
    procedure LigaEsteComp(Sender: TObject);
    procedure DesligaEsteComp(Sender: TObject);
    function TemErroNaGravacao: boolean;
    procedure SelecionaEsteRegistro;
    procedure AjustaEstadoDoComponente(aeComponente: TObject);
  public
    BotaoPressionado : TBotaoPressionado;
    NovoRegistro     : Integer;
  end;

var
  fNovoProduto: TfNovoProduto;

implementation

uses DUtilit, UComp, IB_Components, UModPesquisa, UCadGruposProdutos, UModUsuarios,
     DBFunctions, UDataMod, UConsultaListaNotas;

{$R *.dfm}

procedure TfNovoProduto.btCancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

procedure TfNovoProduto.btGruposClick(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgCadGrupos, 'L') then Exit;
  Application.CreateForm(TfCadGruposProdutos, fCadGruposProdutos);
  fCadGruposProdutos.CD_GRUPO := edGrupo.Tag;
  fCadGruposProdutos.AbrirNoUltimo := true;
  fCadGruposProdutos.ModoCadastro := true;
  fCadGruposProdutos.ShowModal;
  if fCadGruposProdutos.BotaoPressionado = bpOk then
  begin
    edGrupo.Tag := fCadGruposProdutos.CD_GRUPO;
    edGrupo.Text := CM.StringGrupo(edGrupo.Tag);
  end;
  FreeAndNil(fCadGruposProdutos);
end;

procedure TfNovoProduto.edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    BtGrupos.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfNovoProduto.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', 'A'..'Z', 'a'..'z', #13,#27,#8]) then
    key := #0;
end;

procedure TfNovoProduto.bt_GeraCodigoClick(Sender: TObject);
begin
  edCodigo.Text := CM.GeraCodigo;
end;

procedure TfNovoProduto.edDescricaoEnter(Sender: TObject);
begin
  if Vazio(edCodigo.Text) then bt_GeraCodigo.Click;
end;

procedure TfNovoProduto.edCodBalancaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#13,#27,#8]) then
    key := #0;
end;

procedure TfNovoProduto.edPrecoCustoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfNovoProduto.edCodEmbalagemChange(Sender: TObject);
begin
  if Vazio(edCodEmbalagem.Text) then
  begin
    DesligaComponente(self, edUndConvEmbalagem);
    DesligaComponente(self, lbUndConvEmbalagem);
    DesligaComponente(self, lbUndConvEmbalagem2);
  end
  else begin
    LigaComponente(self, edUndConvEmbalagem);
    LigaComponente(self, lbUndConvEmbalagem);
    LigaComponente(self, lbUndConvEmbalagem2);
    lbUndConvEmbalagem2.Font.Color  := clNavy;
  end;
end;

procedure TfNovoProduto.FormCreate(Sender: TObject);
begin
  EstaChave    := '\CadProdutos';
  ChaveDoRegistro := RegChaveForms+EstaChave;
  BotaoPressionado := bpCancelado;
  PageControl1.TabIndex := 0;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select first 1 PROD_UNIDADEPADRAO, PROD_ESTMINIMOPADRAO, PROD_MARGEMPADRAO, PROD_MARGEM2PADRAO, PROD_MARGEM3PADRAO, PROD_MARGEM4PADRAO, PROD_MARGEM5PADRAO, ');
    IBTabela.SQL.Add(' PROD_DESCMAX_PADRAO, PROD_COMISSAO_PADRAO, PROD_IPI_PADRAO, PROD_ICMS_PADRAO,  ');
    IBTabela.SQL.Add(' PROD_NCM_PADRAO, PROD_CONTNUMSERIE_PADRAO, PROD_UNDFRAC_PADRAO from CONFIG_CADASTRO');
    IBTabela.Active := true;
    edUnidade.ItemIndex   := LocalizaTString(edUnidade.Items, IBTabela.FieldByName('PROD_UNIDADEPADRAO').AsString, []);
    edEstoqueMinimo.Value := IBTabela.FieldByName('PROD_ESTMINIMOPADRAO').AsCurrency;

    edDesconto.Value      := IBTabela.FieldByName('PROD_DESCMAX_PADRAO').AsCurrency;
    edComissao.Value      := IBTabela.FieldByName('PROD_COMISSAO_PADRAO').AsCurrency;
    edIPI.Value           := IBTabela.FieldByName('PROD_IPI_PADRAO').AsCurrency;
    edAliquota.Value      := IBTabela.FieldByName('PROD_ICMS_PADRAO').AsCurrency;
    edClassFiscal.Text    := IBTabela.FieldByName('PROD_NCM_PADRAO').AsString;
    chControlaNumSerie.Checked  := IBTabela.FieldByName('PROD_CONTNUMSERIE_PADRAO').AsString = 'V';
    chUnidadeFracionada.Checked := IBTabela.FieldByName('PROD_UNDFRAC_PADRAO').AsString = 'V';

    fDB.FechaTT(IBTabela);
  end;
  edAliquota.Value := 0;
end;

function TfNovoProduto.TemErroNaGravacao: boolean;
var
  JaTem : boolean;
begin
  result := false;

  if (not result) and (Vazio(edCodigo.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio que o campo C�DIGO esteja preenchido');
    edCodigo.SetFocus;
  end;

  if (not result) and (not ENumeroInteiro(TiraEspacos(edCodigo.Text)[1])) then
  begin
    result := true;
    MensagemDeAtencao('O primeiro caracter do c�digo deve ser sempre um caracter num�rico');
    edCodigo.SetFocus;
  end;
  
  if (not result) then
  begin
    with CM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select COD_BARRAS from PRODUTOS');
      IBTabela.SQL.Add('where COD_BARRAS = '+QuotedStr(edCodigo.Text));
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      JaTem := IBTabela.RecordCount > 0;
      fDB.FechaTT(IBTabela);
    end;
    
    if JaTem then
    begin
      result := true;
      MensagemDeErro('C�digo j� cadastrado');
      edCodigo.SetFocus;
    end;
  end;

  if (not result) and (vazio(edGrupo.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio que o campo GRUPO esteja preenchido');
    edGrupo.SetFocus;
  end;

  if (not result) and (Vazio(edDescricao.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio que o campo DESCRI��O esteja preenchido');
    edDescricao.SetFocus;
  end;

  if (not result) then
  begin
    with CM do
    begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select NM_PRODUTO from PRODUTOS');
      IBTabela.SQL.Add('where NM_PRODUTO = '+QuotedStr(edDescricao.Text));
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      JaTem := IBTabela.RecordCount > 0;
      fDB.FechaTT(IBTabela);
    end;

    if JaTem then
    begin
      if MensagemDeConfirmacao('A descri��o para este produto j� existe'+PL+
                                  'Deseja continuar?', 'A T E N � � O') = mrNo then
      begin
        result := true;
        edDescricao.SetFocus;
      end;
    end;
  end;

  if (not result) and (Vazio(edUnidade.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio que o campo UNIDADE esteja preenchido');
    edUnidade.SetFocus;
  end;

  if (not result) then
  begin
    if (chCodBalanca.Checked) and ((edUnidade.Text <> 'UN')and(edUnidade.Text <> 'KG')) then
    begin
      result := true;
      MensagemDeErro('S� � permitido usar unidades "UN" ou "KG" para produtos com c�digo de balan�a');
      edUnidade.SetFocus;
    end;
  end;

  if (not result) and (chCodBalanca.Checked) then
  begin
    if StrToInt(edCodBalanca.Text) < 1 then
    begin
      result := true;
      MensagemDeErro('O C�digo de Balan�a deve ser maior que zero');
      edCodBalanca.SetFocus;
    end;

    if CM.JaTemCodBalanca(edCodBalanca.Text, mdInclusao, 0) then
    begin
      result := true;
      MensagemDeErro('C�digo de Balan�a j� cadastrado!');
      edCodBalanca.SetFocus;
    end;
  end;

end;

procedure TfNovoProduto.SelecionaEsteRegistro;
begin
  try ItemEsc.CodInt := NovoRegistro; except end;
  try ItemEsc.CodExt := IntToStr(NovoRegistro); except end;
end;

procedure TfNovoProduto.btOkClick(Sender: TObject);
begin
  BotaoPressionado := bpOk;

  NovoRegistro := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_CD_PRODUTO');

  if (chCodBalanca.Checked) and ((StrToIntZ(edCodBalanca.Text, 0) < 1) or (Vazio(edCodBalanca.Text))) then
    edCodBalanca.Text := IntToStr(CM.PegaCodBalanca(mdInclusao, 0));

  if TemErroNaGravacao then Exit;

  try
    AbreAviso('Gravando dados do Produto');
    Screen.Cursor := crHourGlass;
    with CM.IBTabela do
    begin
      if not IB_Transaction.InTransaction then IB_Transaction.StartTransaction;
      try
        Active := false;
        SQL.Clear;
        SQL.Add('Insert into PRODUTOS(');
        SQL.Add('CD_PRODUTO,');
        SQL.Add('NM_PRODUTO,');
        SQL.Add('COD_BARRAS,');
        SQL.Add('CD_GRUPO,');
        SQL.Add('UNIDADE,');
        SQL.Add('CX_COD_BARRA_CAIXA,');
        SQL.Add('CX_UNDCONVERSAO,');
        SQL.Add('PESOLIQUIDO,');
        SQL.Add('PESOBRUTO,');
        SQL.Add('DESCONTOMAXIMO,');
        SQL.Add('COMISSAO,');
        SQL.Add('BAL_COD_BALANCA,');
        SQL.Add('BAL_GERARCODBALANCA,');
        SQL.Add('LOCALIZACAO,');
        SQL.Add('PRECOCUSTO,');
        SQL.Add('MARGEM,');
        SQL.Add('PRECOVENDA,');
        SQL.Add('PDV_PRECOVENDA,');
        SQL.Add('ESTOQUEMINIMO,');
        SQL.Add('INATIVO,');
        SQL.Add('ALIQUOTA,');
        SQL.Add('CLASSFISCAL,');
        SQL.Add('IPI,');
        SQL.Add('FABRICANTE,');
        SQL.Add('TRESCASAS,');
        SQL.Add('DIMENSOES,');
        SQL.Add('EXPORTAR,');
        SQL.Add('REF_PROMOCAO,');
        SQL.Add('PRECOPROPESO,');
        SQL.Add('DESCRICAO_ABREV,');
        SQL.Add('CODIGO02,');
        SQL.Add('CODIGO03,');
        SQL.Add('CODIGO04,');
        SQL.Add('OBS,');
        SQL.Add('FOTO,');
        SQL.Add('APLICACAO,');
        SQL.Add('TIPOCUSTO,');
        SQL.Add('ULTIMOCUSTO,');
        SQL.Add('CONTROLANUMSERIE,');
        SQL.Add('UND_FRACIONADA');
        SQL.Add(')Values(');
        SQL.Add(':CD_PRODUTO,');
        SQL.Add(':NM_PRODUTO,');
        SQL.Add(':COD_BARRAS,');
        SQL.Add(':CD_GRUPO,');
        SQL.Add(':UNIDADE,');
        SQL.Add(':CX_COD_BARRA_CAIXA,');
        SQL.Add(':CX_UNDCONVERSAO,');
        SQL.Add(':PESOLIQUIDO,');
        SQL.Add(':PESOBRUTO,');
        SQL.Add(':DESCONTOMAXIMO,');
        SQL.Add(':COMISSAO,');
        SQL.Add(':BAL_COD_BALANCA,');
        SQL.Add(':BAL_GERARCODBALANCA,');
        SQL.Add(':LOCALIZACAO,');
        SQL.Add(':PRECOCUSTO,');
        SQL.Add(':MARGEM,');
        SQL.Add(':PRECOVENDA,');
        SQL.Add(':PDV_PRECOVENDA,');
        SQL.Add(':ESTOQUEMINIMO,');
        SQL.Add(':INATIVO,');
        SQL.Add(':ALIQUOTA,');
        SQL.Add(':CLASSFISCAL,');
        SQL.Add(':IPI,');
        SQL.Add(':FABRICANTE,');
        SQL.Add(':TRESCASAS,');
        SQL.Add(':DIMENSOES,');
        SQL.Add(':EXPORTAR,');
        SQL.Add(':REF_PROMOCAO,');
        SQL.Add(':PRECOPROPESO,');
        SQL.Add(':DESCRICAO_ABREV,');
        SQL.Add(':CODIGO02,');
        SQL.Add(':CODIGO03,');
        SQL.Add(':CODIGO04,');
        SQL.Add(':OBS,');
        SQL.Add(':FOTO,');
        SQL.Add(':APLICACAO,');
        SQL.Add(':TIPOCUSTO,');
        SQL.Add(':ULTIMOCUSTO,');
        SQL.Add(':CONTROLANUMSERIE,');
        SQL.Add(':UND_FRACIONADA');
        SQL.Add(')');

        if not Prepared then Prepare;
        ParamByName('CD_PRODUTO').AsInteger         := NovoRegistro;
        ParamByName('NM_PRODUTO').AsString          := edDescricao.Text;
        ParamByName('COD_BARRAS').AsString          := edCodigo.Text;
        ParamByName('CD_GRUPO').AsInteger           := edGrupo.Tag;
        ParamByName('UNIDADE').AsString             := edUnidade.Text;
        ParamByName('CX_COD_BARRA_CAIXA').AsString  := edCodEmbalagem.Text;
        ParamByName('CX_UNDCONVERSAO').AsCurrency   := edUndConvEmbalagem.Value;
        ParamByName('PESOLIQUIDO').AsCurrency       := edPesoLiquido.Value;
        ParamByName('PESOBRUTO').AsCurrency         := edPesoBruto.Value;
        ParamByName('DESCONTOMAXIMO').AsCurrency    := edDesconto.Value;
        ParamByName('COMISSAO').AsCurrency          := edComissao.Value;
        ParamByName('BAL_COD_BALANCA').AsString     := edCodBalanca.Text;
        ParamByName('BAL_GERARCODBALANCA').AsString := BooleanToChar(chCodBalanca.Checked);
        ParamByName('LOCALIZACAO').AsString         := edLocalizacao.Text;
        ParamByName('ESTOQUEMINIMO').AsCurrency     := edEstoqueMinimo.Value;
        ParamByName('INATIVO').AsString             := 'F';
        ParamByName('ALIQUOTA').AsCurrency          := edAliquota.Value;
        ParamByName('CLASSFISCAL').AsString         := edClassFiscal.Text;
        ParamByName('IPI').AsString                 := edIPI.Text;
        ParamByName('FABRICANTE').AsString          := edFabricante.Text;
        ParamByName('TRESCASAS').AsString           := BooleanToChar(chTresCasas.Checked);
        ParamByName('DIMENSOES').AsString           := edDimensoes.Text;
        ParamByName('EXPORTAR').AsString            := 'F';
        ParamByName('REF_PROMOCAO').AsInteger       := 0;
        ParamByName('PRECOPROPESO').AsString        := 'F';
        ParamByName('DESCRICAO_ABREV').AsString     := edDescrAbrev.Text;
        ParamByName('CODIGO02').AsString            := edCodigo2.Text;
        ParamByName('CODIGO03').AsString            := edCodigo3.Text;
        ParamByName('CODIGO04').AsString            := edCodigo4.Text;
        ParamByName('OBS').Assign(Memo1.Lines);
        ParamByName('FOTO').Assign(Image1.Picture);
        ParamByName('APLICACAO').AsString           := edAplicacao.Text;
        ParamByName('TIPOCUSTO').AsString           := 'U';
        ParamByName('ULTIMOCUSTO').AsCurrency       := 0;
        ParamByName('CONTROLANUMSERIE').AsString    := BooleanToChar(chControlaNumSerie.Checked);
        ParamByName('UND_FRACIONADA').AsString      := BooleanToChar(chUnidadeFracionada.Checked);
        ExecSQL;

        // REFPRODUTOS

        Active := false;
        SQL.Clear;
        SQL.Add('Insert into REFPRODUTOS(');
        SQL.Add('CD_PRODUTO');
        SQL.Add(')Values(');
        SQL.Add(':CD_PRODUTO');
        SQL.Add(')');

        if not Prepared then Prepare;
        ParamByName('CD_PRODUTO').AsInteger := NovoRegistro;
        ExecSQL;
        IB_Transaction.Commit;
        fNovoProduto.Close;
      except
        on E: Exception do
        begin
          IB_Transaction.Rollback;
          MensagemDeErro('N�o foi poss�vel cadastrar este produto'+PL+E.Message);
        end;
      end;
      SelecionaEsteRegistro;
    end;
  finally
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

//##############################################################################
// Come�a LIGA / DESLIGA COMPONENTE
//##############################################################################

procedure TfNovoProduto.edFabricanteMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
  NaoPode : boolean;
begin
  NaoPode := false;
  if Button = mbRight then
  begin
         if ((Sender = edCodigo2)        or (Sender = lbCodigo2)) then CompSender := edCodigo2
    else if ((Sender = edCodigo3)        or (Sender = lbCodigo3)) then CompSender := edCodigo3
    else if ((Sender = edCodigo4)        or (Sender = lbCodigo4)) then CompSender := edCodigo4
    else if ((Sender = edCodBalanca)     or (Sender = chCodBalanca))  then CompSender := edCodBalanca
    else if ((Sender = chControlaNumSerie))  then CompSender := chControlaNumSerie
    else if ((Sender = edFabricante)     or (Sender = lbFabricante))  then CompSender := edFabricante
    else if ((Sender = edLocalizacao)    or (Sender = lbLocalizacao)) then CompSender := edLocalizacao
    else if ((Sender = edPesoLiquido)    or (Sender = lbPesoLiquido)) then CompSender := edPesoLiquido
    else if ((Sender = edPesoBruto)      or (Sender = lbPesoBruto))   then CompSender := edPesoBruto
    else if ((Sender = edEstoqueMinimo)  or (Sender = lbEstoqueMinimo))  then CompSender := edEstoqueMinimo
    else if ((Sender = edAplicacao)      or (Sender = lbAplicacao))      then CompSender := edAplicacao
    else if ((Sender = edDesconto)       or (Sender = lbDesconto))       then CompSender := edDesconto
    else if ((Sender = edComissao)       or (Sender = lbComissao))       then CompSender := edComissao
    else if ((Sender = edDescrAbrev)     or (Sender = lbDescrAbrev))     then CompSender := edDescrAbrev
    else if ((Sender = edUnidade)        or (Sender = lbUnidade))        then CompSender := edUnidade
    else if ((Sender = edCodEmbalagem)   or (Sender = lbCodEmbalagem))   then CompSender := edCodEmbalagem
    else if ((Sender = edAliquota)       or (Sender = lbAliquota) or (Sender = lbAliquota2)) then CompSender := edAliquota
    else if ((Sender = edClassFiscal)    or (Sender = lbClassFiscal))    then CompSender := edClassFiscal
    else if ((Sender = edIPI)            or (Sender = lbIPI))            then CompSender := edIPI
    else NaoPode := true;

    if not NaoPode then
    begin
      GetCursorPos(pt);
      PopUpMenu.Popup(pt.X , pt.Y);
    end;  
  end;
end;

procedure TfNovoProduto.PopupMenuPopup(Sender: TObject);
begin
  MenuLiga.Enabled    := (CompSender as TControl).Tag = 100;
  MenuDesliga.Enabled := (CompSender as TControl).Tag = 111;
end;

procedure TfNovoProduto.DesligaEsteComp(Sender: TObject);
begin
       if (Sender = edCodigo2)          then begin DesligaComponente(self, lbCodigo2); end
  else if (Sender = edCodigo3)          then begin DesligaComponente(self, lbCodigo3); end
  else if (Sender = edCodigo4)          then begin DesligaComponente(self, lbCodigo4); end
  else if (Sender = edCodBalanca)       then begin DesligaComponente(self, chCodBalanca); DesligaComponente(self, edCodBalanca); end
  else if (Sender = chControlaNumSerie) then begin DesligaComponente(self, chControlaNumSerie); end
  else if (Sender = edFabricante)       then begin DesligaComponente(self, lbFabricante); end
  else if (Sender = edLocalizacao)      then begin DesligaComponente(self, lbLocalizacao); end
  else if (Sender = edPesoLiquido)      then begin DesligaComponente(self, lbPesoLiquido); end
  else if (Sender = edPesoBruto)        then begin DesligaComponente(self, lbPesoBruto); end
  else if (Sender = edEstoqueMinimo)    then begin DesligaComponente(self, lbEstoqueMinimo); end
  else if (Sender = edAplicacao)        then begin DesligaComponente(self, lbAplicacao); end
  else if (Sender = edDesconto)         then begin DesligaComponente(self, lbDesconto); DesligaComponente(self, lbDesconto2); end
  else if (Sender = edComissao)         then begin DesligaComponente(self, lbComissao); end
  else if (Sender = edDescrAbrev)       then begin DesligaComponente(self, lbDescrAbrev); end
  else if (Sender = edUnidade)          then begin DesligaComponente(self, lbUnidade); end
  else if (Sender = edCodEmbalagem)     then begin DesligaComponente(self, lbCodEmbalagem);  DesligaComponente(self, edUndConvEmbalagem); DesligaComponente(self, lbUndConvEmbalagem); DesligaComponente(self, lbUndConvEmbalagem2); end
  else if (Sender = edAliquota)         then begin DesligaComponente(self, lbAliquota); DesligaComponente(self, lbAliquota2); end
  else if (Sender = edClassFiscal)      then begin DesligaComponente(self, lbClassFiscal); end
  else if (Sender = edIPI)              then begin DesligaComponente(self, lbIPI); DesligaComponente(self, lbIPI2); end;

  DesligaComponente(self, Sender, true, clBtnFace, clGrayText, false, 100);
end;

procedure TfNovoProduto.LigaEsteComp(Sender: TObject);
begin
       if (Sender = edCodigo2)          then begin LigaComponente(self, lbCodigo2); end
  else if (Sender = edCodigo3)          then begin LigaComponente(self, lbCodigo3); end
  else if (Sender = edCodigo4)          then begin LigaComponente(self, lbCodigo4); end
  else if (Sender = edCodBalanca)       then begin LigaComponente(self, chCodBalanca); LigaComponente(self, edCodBalanca); end
  else if (Sender = chControlaNumSerie) then begin LigaComponente(self, chControlaNumSerie); end
  else if (Sender = edFabricante)       then begin LigaComponente(self, lbFabricante); end
  else if (Sender = edLocalizacao)      then begin LigaComponente(self, lbLocalizacao); end
  else if (Sender = edPesoLiquido)      then begin LigaComponente(self, lbPesoLiquido); end
  else if (Sender = edPesoBruto)        then begin LigaComponente(self, lbPesoBruto); end
  else if (Sender = edEstoqueMinimo)    then begin LigaComponente(self, lbEstoqueMinimo); end
  else if (Sender = edAplicacao)        then begin LigaComponente(self, lbAplicacao); end
  else if (Sender = edDesconto)         then begin LigaComponente(self, lbDesconto); LigaComponente(self, lbDesconto2); end
  else if (Sender = edComissao)         then begin LigaComponente(self, lbComissao); end
  else if (Sender = edDescrAbrev)       then begin LigaComponente(self, lbDescrAbrev); end
  else if (Sender = edUnidade)          then begin LigaComponente(self, lbUnidade); end
  else if (Sender = edCodEmbalagem)     then begin LigaComponente(self, lbCodEmbalagem);  DesligaComponente(self, edUndConvEmbalagem); DesligaComponente(self, lbUndConvEmbalagem); DesligaComponente(self, lbUndConvEmbalagem2); end
  else if (Sender = edAliquota)         then begin LigaComponente(self, lbAliquota); LigaComponente(self, lbAliquota2); end
  else if (Sender = edClassFiscal)      then begin LigaComponente(self, lbClassFiscal); end
  else if (Sender = edIPI)              then begin LigaComponente(self, lbIPI); LigaComponente(self, lbIPI2); end;

  LigaComponente(self, Sender, true, clWindow, clWindowText, 111);

  try
    TCustomEdit(Sender as TControl).SetFocus;
    TCustomEdit(Sender as TControl).SelectAll;
  except
  end;  
end;

procedure TfNovoProduto.MenuLigaClick(Sender: TObject);
begin
  LigaEsteComp(CompSender);
end;

procedure TfNovoProduto.MenuDesligaClick(Sender: TObject);
begin
  DesligaEsteComp(CompSender);
end;

procedure TfNovoProduto.GravaEstadoLigadoDesligado;
begin
  SalvaIntegerNoRegistro(ChaveDoRegistro, edCodigo2.Name,          edCodigo2.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edCodigo3.Name,          edCodigo3.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edCodigo4.Name,          edCodigo4.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edCodBalanca.Name,       edCodBalanca.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, chControlaNumSerie.Name, chControlaNumSerie.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edFabricante.Name,       edFabricante.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edLocalizacao.Name,      edLocalizacao.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edPesoLiquido.Name,      edPesoLiquido.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edPesoBruto.Name,        edPesoBruto.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edEstoqueMinimo.Name,    edEstoqueMinimo.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edAplicacao.Name,        edAplicacao.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edDesconto.Name,         edDesconto.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edComissao.Name,         edComissao.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edDescrAbrev.Name,       edDescrAbrev.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edUnidade.Name,          edUnidade.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edCodEmbalagem.Name,     edCodEmbalagem.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edAliquota.Name,         edAliquota.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edClassFiscal.Name,      edClassFiscal.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edIPI.Name,              edIPI.Tag);
end;

procedure TfNovoProduto.AjustaEstadoDoComponente(aeComponente:TObject);
begin
  (aeComponente as TControl).Tag := LeIntegerDoRegistro(ChaveDoRegistro, (aeComponente as TControl).Name, 111);
  if (aeComponente as TControl).Tag = 100 then DesligaEsteComp(aeComponente)
                                          else LigaEsteComp(aeComponente);
end;

procedure TfNovoProduto.CarregaEstadoLigadoDesligado;
begin
  AjustaEstadoDoComponente(edCodigo2);
  AjustaEstadoDoComponente(edCodigo3);
  AjustaEstadoDoComponente(edCodigo4);
  AjustaEstadoDoComponente(edCodBalanca);
  AjustaEstadoDoComponente(chControlaNumSerie);
  AjustaEstadoDoComponente(edFabricante);
  AjustaEstadoDoComponente(edLocalizacao);
  AjustaEstadoDoComponente(edPesoLiquido);
  AjustaEstadoDoComponente(edPesoBruto);
  AjustaEstadoDoComponente(edEstoqueMinimo);
  AjustaEstadoDoComponente(edAplicacao);
  AjustaEstadoDoComponente(edDesconto);
  AjustaEstadoDoComponente(edComissao);
  AjustaEstadoDoComponente(edDescrAbrev);
  AjustaEstadoDoComponente(edUnidade);
  AjustaEstadoDoComponente(edCodEmbalagem);
  AjustaEstadoDoComponente(edAliquota);
  AjustaEstadoDoComponente(edClassFiscal);
  AjustaEstadoDoComponente(edIPI);
end;

//##############################################################################
// Termina LIGA / DESLIGA COMPONENTE
//##############################################################################

procedure TfNovoProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F3    : if (Shift = []) and (btPesquisar.Enabled)  then btPesquisar.Click;
    vk_F10   : if (Shift = []) and (btOk.Enabled)         then btOk.Click;
  end;
end;

procedure TfNovoProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfNovoProduto.edDescricaoExit(Sender: TObject);
begin
  if Vazio(edDescrAbrev.Text) then edDescrAbrev.Text := edDescricao.Text;
end;

procedure TfNovoProduto.btPesquisarClick(Sender: TObject);
begin
  mPesq.Pesquisa(pqProdutos, []);
end;

procedure TfNovoProduto.FormShow(Sender: TObject);
begin
  edCodEmbalagem.OnChange(edCodEmbalagem);
  CarregaEstadoLigadoDesligado;
  if edUnidade.Tag = 100 then edUnidade.ItemIndex := LocalizaTString(edUnidade.Items, 'UN', []);
  edDescricao.SetFocus;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfNovoProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaEstadoLigadoDesligado;
end;

procedure TfNovoProduto.edCodigoExit(Sender: TObject);
begin
  lbQuantDigitos.Visible := false;
  edCodigo.Text := TiraEspacos(edCodigo.Text);

  if length(edCodigo.Text) > 13 then
    edCodigo.Text := copy(edCodigo.Text, length(edCodigo.Text)-12, 13);
end;

procedure TfNovoProduto.edCodigoEnter(Sender: TObject);
begin
  edCodigoChange(self);
  lbQuantDigitos.Visible := true;
end;

procedure TfNovoProduto.edCodigoChange(Sender: TObject);
begin
  lbQuantDigitos.Caption := PoeZeros(length(edCodigo.Text), 2)+' d�gitos';
end;

procedure TfNovoProduto.Bt_FotoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TfNovoProduto.Bt_ApagaFotoClick(Sender: TObject);
begin
  Image1.Picture := nil;
end;

procedure TfNovoProduto.edCST1Enter(Sender: TObject);
begin
//  edDescricaoCST.Lines.Text := CM.DescricaodaCST((Sender as TDBEdit).Text);
end;

end.
