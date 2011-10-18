//ok
unit UNovaEntradaNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, UComum, ExtCtrls, JvDBControls,
   JvExMask, JvToolEdit, JvBaseEdits, Menus, UConstVar, MessageFunctions, IB_Access,
   IB_Components;

type
  TfNovaEntradaNota = class(TForm)
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Bt_LocFornecedor: TBitBtn;
    GroupBox2: TGroupBox;
    LabelDataEmissao: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    LabelBaseCalcICMS: TLabel;
    LabelValorICMS: TLabel;
    LabelBaseICMSSubst: TLabel;
    LabelValorICMSSubst: TLabel;
    LabelValorTotalProd: TLabel;
    LabelValorFrete: TLabel;
    LabelValorSeguro: TLabel;
    LabelOutrasDespesas: TLabel;
    LabelValorTotalIPI: TLabel;
    LabelValorTotalNota: TLabel;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    bt_Ok: TBitBtn;
    bt_Cancelar: TBitBtn;
    RadioGroupTipoNota: TRadioGroup;
    EditCodFornecedor: TEdit;
    EditNumNota: TEdit;
    EditCNPJFornecedor: TEdit;
    EditNomeFornecedor: TEdit;
    LabelObs: TLabel;
    EditObs: TEdit;
    EditBaseCalcICMS: TJvCalcEdit;
    EditValorICMS: TJvCalcEdit;
    EditBaseICMSSubst: TJvCalcEdit;
    EditValorICMSSubst: TJvCalcEdit;
    EditValorTotalProd: TJvCalcEdit;
    EditValorFrete: TJvCalcEdit;
    EditValorSeguro: TJvCalcEdit;
    EditOutrasDespesas: TJvCalcEdit;
    EditValorTotalIPI: TJvCalcEdit;
    EditValorTotalNota: TJvCalcEdit;
    EditDataEmissao: TJvDateEdit;
    EditDataEntrada: TJvDateEdit;
    PopupMenu: TPopupMenu;
    MenuLiga: TMenuItem;
    MenuDesliga: TMenuItem;
    GroupBox4: TGroupBox;
    LabelNatOperacao: TLabel;
    EditNatOperacao: TEdit;
    LabelSerie: TLabel;
    EditSerie: TEdit;
    LabelModelo: TLabel;
    EditModelo: TEdit;
    LabelChaveNFe: TLabel;
    EditChaveNFe: TEdit;
    LabelDescontoGeral: TLabel;
    EditDescontoGeral: TJvCalcEdit;
    CheckBoxDescGeral: TCheckBox;
    LabelValorII: TLabel;
    EditValorII: TJvCalcEdit;
    LabelPIS: TLabel;
    LabelCOFINS: TLabel;
    EditValorPIS: TJvCalcEdit;
    EditValorCofins: TJvCalcEdit;
    Timer1: TTimer;
    procedure bt_OkClick(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditBaseCalcICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorTotalProdExit(Sender: TObject);
    procedure EditCodFornecedorChange(Sender: TObject);
    procedure Bt_LocFornecedorClick(Sender: TObject);
    procedure EditBaseCalcICMSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuPopup(Sender: TObject);
    procedure MenuLigaClick(Sender: TObject);
    procedure MenuDesligaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditNumNotaKeyPress(Sender: TObject; var Key: Char);
    procedure EditCodFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EditValorICMSExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    CompSender : TObject;  // Componente que poderá ser ligado ou desligado
    function TemErro: boolean;
    procedure SomaTotalDaNota;
    procedure DesligaEsteComp(Sender: TObject);
    procedure LigaEsteComp(Sender: TObject);
    procedure CarregaEstadoLigadoDesligado;
    procedure GravaEstadoLigadoDesligado;
    procedure PegaDadosXML;
    function AchouFornecedorXML: Boolean;
  public
    BotaoPressionado : TBotaoPressionado;
    Modo : TModos;
    CD_NOTA : Integer;
    procedure DefineParametros;
  end;

var
  fNovaEntradaNota: TfNovaEntradaNota;
  IV_TIPONOTA : String = 'FP';  // Fiscal, Pedido


implementation

uses DUtilit, UComp, UDataMod,  DBFunctions, UModPesquisa, UConsultaListaNotas,
  UCadLocalizaFornecedor;

{$R *.dfm}

function TfNovaEntradaNota.TemErro: boolean;
var
  Soma  : Currency;
  JaTem : boolean;
begin
  result := false;

  if (not result) and (Vazio(EditCodFornecedor.Text)) then
  begin
    MensagemDeAtencao('É necessário que o campo CÓDIGO do Fornecedor esteja preenchido');
    result := true;
    EditCodFornecedor.SetFocus;
  end;

  if (not result) and (Vazio(EditNumNota.Text)) then
  begin
    MensagemDeAtencao('É necessário que o campo "Nº DA NOTA" esteja preenchido');
    result := true;
    EditNumNota.SetFocus;
  end;

  if (not result) and (not DataValida(EditDataEntrada.Text)) then
  begin
    MensagemDeErro('Data de Entrada Inválida');
    result := true;
    EditDataEntrada.SetFocus;
  end;

  if (not result) and ((Vazio(EditValorTotalProd.Text)) or (EditValorTotalProd.Value <= 0)) then
  begin
    MensagemDeAtencao('É necessário que o campo "VALOR TOTAL PRODUTOS" esteja preenchido');
    result := true;
    EditValorTotalProd.SetFocus;
  end;

  if (not result) and ((Vazio(EditValorTotalNota.Text)) or (EditValorTotalNota.Value <= 0)) then
  begin
    MensagemDeAtencao('É necessário que o campo "VALOR TOTAL DA NOTA" esteja preenchido');
    result := true;
    EditValorTotalNota.SetFocus;
  end;

  if (not result) then
  begin
    DtM.IBTabela.Active := false;
    DtM.IBTabela.SQL.Clear;
    DtM.IBTabela.SQL.Add('Select NUM_DOCUMENTO, CD_FORNECEDOR from ENTRADA');
    DtM.IBTabela.SQL.Add('where NUM_DOCUMENTO = '+QuotedStr(EditNumNota.Text));
    DtM.IBTabela.SQL.Add('and CD_FORNECEDOR = '+QuotedStr(EditCodFornecedor.Text));
    if Modo = mdAlteracao then
      DtM.IBTabela.SQL.Add('and CD_NOTA <> '+ DtM.IBNF.FieldByName('CD_NOTA').AsString);

    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.Active := true;
    JaTem := DtM.IBTabela.RecordCount > 0;
    fDB.FechaTT(DtM.IBTabela);
    if JaTem then
    begin
      if MensagemDeConfirmacao('Já existe uma nota do Fornecedor '+EditNomeFornecedor.Text+PL+
                                  'com o nº '+EditNumNota.Text+' lançado anteriormente.'+PL+
                                  'Deseja continuar?') <> mrYes then
      begin
        EditNumNota.SetFocus;
        result := true;
      end;
    end;
  end;

  if (not result)  then
  begin
    Soma := EditValorTotalProd.Value + EditValorFrete.Value + EditValorSeguro.Value +
            EditOutrasDespesas.Value + EditValorII.Value + EditValorTotalIPI.Value +
            EditValorICMSSubst.Value;
    if CheckBoxDescGeral.Checked then
      Soma := Soma - ((Soma * EditDescontoGeral.Value)/100)
    else
      Soma := Soma - EditDescontoGeral.Value;
    if TruncaReal(Soma, 2) <> TruncaReal(EditValorTotalNota.Value, 2) then
      if (MessageBox(0, 'O Valor Total da Nota é diferente da soma do '+#13+#10+'Total dos Produtos, Frete, Seguro, Outras Despesas, II, IPI e ICMS ST.'+#13+#10+''+#13+#10+'Continua assim mesmo?', 'Atenção', MB_ICONWARNING or MB_YESNO or MB_APPLMODAL or MB_DEFBUTTON2) <> idYes) then
        result := true;
  end;

end;

procedure TfNovaEntradaNota.Timer1Timer(Sender: TObject);
begin
  bt_Cancelar.Click;
end;

procedure TfNovaEntradaNota.bt_OkClick(Sender: TObject);
var
  desc : Currency;
begin
  SomaTotalDaNota;
  if TemErro then
    Exit;

  desc := (EditValorTotalProd.Value + EditValorFrete.Value + EditValorSeguro.Value +
           EditOutrasDespesas.Value + EditValorICMSSubst.Value + EditValorII.Value + EditValorTotalIPI.Value) *
           EditDescontoGeral.Value / 100;

  if CheckBoxDescGeral.Checked then EditDescontoGeral.Value := desc;

  BotaoPressionado := bpOk;  
  AbreAviso('Preparando Nova Entrada');
  Close;
end;

procedure TfNovaEntradaNota.DefineParametros;
begin
  with DtM do
  begin
    IBTabela.ParamByName('CD_NOTA').AsInteger          := CD_NOTA;
    IBTabela.ParamByName('TIPO_NOTA').AsString         := IV_TIPONOTA[RadioGroupTipoNota.ItemIndex];
    IBTabela.ParamByName('CD_FORNECEDOR').AsString     := EditCodFornecedor.Text;
    IBTabela.ParamByName('CNPJ').AsString              := EditCNPJFornecedor.Text;
    IBTabela.ParamByName('NM_FORNECEDOR').AsString     := EditNomeFornecedor.Text;
    IBTabela.ParamByName('NUM_DOCUMENTO').AsString     := EditNumNota.Text;
    IBTabela.ParamByName('CFOP').AsString              := '';
    IBTabela.ParamByName('DT_EMISSAO').AsDate          := EditDataEmissao.Date;
    IBTabela.ParamByName('DT_ENTRADA').AsDate          := EditDataEntrada.Date;
    IBTabela.ParamByName('OBS').AsString               := EditObs.Text;
    IBTabela.ParamByName('ICMS_BASE').AsCurrency       := EditBaseCalcICMS.Value;
    IBTabela.ParamByName('ICMS_VALOR').AsCurrency      := EditValorICMS.Value;
    IBTabela.ParamByName('ICMS_BASESUBST').AsCurrency  := EditBaseICMSSubst.Value;
    IBTabela.ParamByName('ICMS_VALORSUBST').AsCurrency := EditValorICMSSubst.Value;
    IBTabela.ParamByName('VR_TOTAL_PROD').AsCurrency   := EditValorTotalProd.Value;
    IBTabela.ParamByName('VALOR_FRETE').AsCurrency     := EditValorFrete.Value;
    IBTabela.ParamByName('VALOR_SEGURO').AsCurrency    := EditValorSeguro.Value;
    IBTabela.ParamByName('OUTRAS_DESPESAS').AsCurrency := EditOutrasDespesas.Value;
    IBTabela.ParamByName('VALOR_IPI').AsCurrency       := EditValorTotalIPI.Value;
    IBTabela.ParamByName('VALOR_TOTAL_NOTA').AsCurrency:= EditValorTotalNota.Value;
    IBTabela.ParamByName('DESCONTO_TOTAL').AsCurrency  := EditDescontoGeral.Value;
    IBTabela.ParamByName('NOTA_FECHADA').AsString      := 'F';
    IBTabela.ParamByName('NAT_OPERACAO').AsString      := EditNatOperacao.Text;
    IBTabela.ParamByName('SERIE').AsString             := EditSerie.Text;
    IBTabela.ParamByName('MODELO').AsString            := EditModelo.Text;
    IBTabela.ParamByName('CHAVE_NFE').AsString         := EditChaveNFe.Text;
    IBTabela.ParamByName('VALOR_II').AsCurrency        := EditValorII.Value;
    IBTabela.ParamByName('VALOR_PIS').AsCurrency       := EditValorPIS.Value;
    IBTabela.ParamByName('VALOR_COFINS').AsCurrency    := EditValorCofins.Value;

    if fEntradasDeNotas.TipoNota = tpnCheia then
      IBTabela.ParamByName('ACRES_DESC_ESPECIAL').AsString    := 'F'
    else
      IBTabela.ParamByName('ACRES_DESC_ESPECIAL').AsString    := 'V';
  end;
end;

procedure TfNovaEntradaNota.bt_CancelarClick(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
  Close;
end;

function TfNovaEntradaNota.AchouFornecedorXML: Boolean;
var
  IBQ: tIB_Query;
  IBT: TIB_Transaction;
begin
  Result := False;
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
    with IBQ do
    begin
      Active := false;
      SQL.Clear;
      SQL.Add('SELECT CD_FORNECEDOR,');
      SQL.Add('       NM_FORNECEDOR,');
      SQL.Add('       CGC');
      SQL.Add('FROM FORNECEDORES');
      SQL.Add('WHERE INATIVO = ''F'' AND CGC LIKE '+QuotedStr(EditCNPJFornecedor.Text));
      if not Prepared then Prepare;
      Active := true;
      Result := RecordCount > 0;
      if not Result then
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('SELECT CD_FORNECEDOR,');
        SQL.Add('       NM_FORNECEDOR,');
        SQL.Add('       CGC');
        SQL.Add('FROM FORNECEDORES');
        SQL.Add('WHERE INATIVO = ''F'' AND NM_FORNECEDOR LIKE '+ QuotedStr('%'+EditNomeFornecedor.Text+'%'));
        if not Prepared then Prepare;
        Active := True;
        Result := RecordCount > 0;
      end;
      if Result then
      begin
        EditCodFornecedor.Text  := FieldByName('CD_FORNECEDOR').AsString;
        EditNomeFornecedor.Text := FieldByName('NM_FORNECEDOR').AsString;
      end;
    end;
  finally
    fDB.FreeQueryTransacao(IBQ,IBT);
  end;
end;

procedure TfNovaEntradaNota.PegaDadosXML;
begin
  with fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe do
  begin
    RadioGroupTipoNota.ItemIndex := 0;
    EditCNPJFornecedor.Text := Emit.CNPJCPF;
    EditNomeFornecedor.Text := Emit.xNome;
    EditNumNota.Text        := IntToStr(Ide.cNF);
    EditSerie.Text          := IntToStr(Ide.serie);
    EditModelo.Text         := IntToStr(Ide.modelo);
    EditDataEmissao.Date    := Ide.dEmi;

    EditDataEntrada.Date    := CM.NowDoServidor;
    EditNatOperacao.Text    := Ide.natOp;
    EditChaveNFe.Text       := procNFe.chNFe;

    EditBaseCalcICMS.Value    := Total.ICMSTot.vBC;
    EditValorICMS.Value       := Total.ICMSTot.vICMS;
    EditBaseICMSSubst.Value   := Total.ICMSTot.vBCST;
    EditValorICMSSubst.Value  := Total.ICMSTot.vST;
    EditValorTotalProd.Value  := Total.ICMSTot.vProd + ArredondaReal((Total.ICMSTot.vProd * (fEntradasDeNotas.Margem_Adicional_Item/100)),2);
    CheckBoxDescGeral.Checked := False;
    EditDescontoGeral.Value   := Total.ICMSTot.vDesc;
    EditValorFrete.Value      := Total.ICMSTot.vFrete;
    EditValorSeguro.Value     := Total.ICMSTot.vSeg;
    EditValorII.Value         := Total.ICMSTot.vII;
    EditValorTotalIPI.Value   := Total.ICMSTot.vIPI;
    EditValorPIS.Value        := Total.ICMSTot.vPIS;
    EditValorCofins.Value     := Total.ICMSTot.vCOFINS;
    EditOutrasDespesas.Value  := Total.ICMSTot.vOutro;
    EditValorTotalNota.Value  := Total.ICMSTot.vNF + ArredondaReal((Total.ICMSTot.vNF * (fEntradasDeNotas.Margem_Adicional_Item/100)),2);
  end;
end;

procedure TfNovaEntradaNota.FormShow(Sender: TObject);
begin
  if fEntradasDeNotas.TipoNota = tpnMeia then
    try
      fEntradasDeNotas.Margem_Adicional_Item := StrToCurr(InputBox('Margem de Custo','Entre com o percentual da diferença no valor de custo:','0'));
    except
      ShowMessage('Percentual digitado inválido, digite somente valores numéricos!');
      Exit;
    end
  else
    fEntradasDeNotas.Margem_Adicional_Item := 0;

  if Modo = mdInclusao then
    EditDataEntrada.Date := CM.NowDoServidor
  else
  if Modo = mdInclusaoXML then
  begin
    PegaDadosXML;
    if not AchouFornecedorXML then
    begin
      Application.CreateForm(TfCadLocalizaFornecedor,fCadLocalizaFornecedor);
      fCadLocalizaFornecedor.ShowModal;
      FreeAndNil(fCadLocalizaFornecedor);
      if BotaoPressionado = bpFechar then
        Timer1.Enabled := True;
    end;
  end;
  CarregaEstadoLigadoDesligado;
  EditCodFornecedor.SetFocus;

  FechaAviso;
  Screen.Cursor := crDefault;
end;

procedure TfNovaEntradaNota.FormCreate(Sender: TObject);
begin
  BotaoPressionado := bpCancelado;
end;

procedure TfNovaEntradaNota.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    Ord('L') : if (Shift = [ssAlt]) and (Bt_LocFornecedor.Enabled) then Bt_LocFornecedor.Click;
    vk_F3    : if Bt_LocFornecedor.Enabled then Bt_LocFornecedor.Click;
    vk_F10   : if Bt_Ok.Enabled then Bt_Ok.Click;
    vk_Escape: if Bt_Cancelar.Enabled then Bt_Cancelar.Click;
  end;
end;

procedure TfNovaEntradaNota.EditCodFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) and (Vazio(EditCodFornecedor.Text)) then Bt_LocFornecedor.Click; 
  if CM.F3OuAltDown(key, shift) and (Bt_LocFornecedor.Enabled) then Bt_LocFornecedor.Click;
end;

procedure TfNovaEntradaNota.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfNovaEntradaNota.EditBaseCalcICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfNovaEntradaNota.SomaTotalDaNota;
var
  desc: Real;
begin
  if not CheckBoxDescGeral.Checked then
    EditValorTotalNota.Value := EditValorTotalProd.Value +
                              EditValorFrete.Value +
                              EditValorSeguro.Value +
                              EditOutrasDespesas.Value +
                              EditValorICMSSubst.Value +
                              EditValorII.Value +
                              EditValorTotalIPI.Value -
                              EditDescontoGeral.Value
  else
  begin
    desc := (EditValorTotalProd.Value +
             EditValorFrete.Value +
             EditValorSeguro.Value +
             EditOutrasDespesas.Value +
             EditValorICMSSubst.Value +
             EditValorII.Value +
             EditValorTotalIPI.Value) *
             EditDescontoGeral.Value /
             100;
    EditValorTotalNota.Value := EditValorTotalProd.Value +
                                EditValorFrete.Value +
                                EditValorSeguro.Value +
                                EditOutrasDespesas.Value +
                                EditValorICMSSubst.Value +
                                EditValorII.Value +
                                EditValorTotalIPI.Value -
                                desc;
  end;
end;



procedure TfNovaEntradaNota.EditValorTotalProdExit(Sender: TObject);
begin
  SomaTotalDaNota;
end;

procedure TfNovaEntradaNota.EditCodFornecedorChange(Sender: TObject);
var
  CodFornec : String;
  CNPJ : String;
begin
  if not Vazio(EditCodFornecedor.Text) then
  begin
    with DtM do begin
      IBTabela.Active := false;
      IBTabela.SQL.Clear;
      IBTabela.SQL.Add('Select CD_FORNECEDOR, NM_FORNECEDOR, CGC from FORNECEDORES');
      IBTabela.SQL.Add('where CD_FORNECEDOR > 0 and CD_FORNECEDOR = '+TiraEspacos(EditCodFornecedor.Text));
      if not IBTabela.Prepared then IBTabela.Prepare;
      IBTabela.Active := true;
      if not IBTabela.IsEmpty then
      begin
        EditNomeFornecedor.Text := IBTabela.FieldByName('NM_FORNECEDOR').AsString;
        EditCNPJFornecedor.Text := IBTabela.FieldByName('CGC').AsString;
      end
      else begin
        EditNomeFornecedor.Clear;
        EditCNPJFornecedor.Clear;
      end;
      fDB.FechaTT(IBTabela);
    end;
  end
end;

procedure TfNovaEntradaNota.Bt_LocFornecedorClick(Sender: TObject);
begin
  if (Modo = mdInclusao) or (Modo = mdInclusaoXML) or (Modo = mdAlteracao) then
  begin
    ItemEsc := mPesq.Pesquisa(pqFornecedores, [mdInclusao, mdInclusaoXML, mdAlteracao], nil, EditNomeFornecedor.Text);
    if ItemEsc.CodInt <> CodigoVazio then
      EditCodFornecedor.Text := ItemEsc.CodExt;
    EditNumNota.SetFocus;
  end;
end;

procedure TfNovaEntradaNota.EditBaseCalcICMSMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
begin
  if Button = mbRight then
  begin
         if ((Sender = EditBaseCalcICMS) or (Sender = LabelBaseCalcICMS)) then CompSender := EditBaseCalcICMS
    else if ((Sender = EditValorICMS) or (Sender = LabelValorICMS)) then CompSender := EditValorICMS
    else if ((Sender = EditBaseICMSSubst) or (Sender = LabelBaseICMSSubst)) then CompSender := EditBaseICMSSubst
    else if ((Sender = EditValorICMSSubst) or (Sender = LabelValorICMSSubst)) then CompSender := EditValorICMSSubst
    else if ((Sender = EditValorFrete) or (Sender = LabelValorFrete)) then CompSender := EditValorFrete
    else if ((Sender = EditValorSeguro) or (Sender = LabelValorSeguro)) then CompSender := EditValorSeguro
    else if ((Sender = EditOutrasDespesas) or (Sender = LabelOutrasDespesas)) then CompSender := EditOutrasDespesas
    else if ((Sender = EditValorTotalIPI) or (Sender = LabelValorTotalIPI)) then CompSender := EditValorTotalIPI
    else if ((Sender = EditValorII) or (Sender = LabelValorII)) then CompSender := EditValorII
    else if ((Sender = EditValorPIS) or (Sender = LabelPIS)) then CompSender := EditValorPIS
    else if ((Sender = EditValorCofins) or (Sender = LabelCOFINS)) then CompSender := EditValorCofins
    else if ((Sender = EditObs) or (Sender = LabelObs)) then CompSender := EditObs
    else if ((Sender = EditDataEmissao) or (Sender = LabelDataEmissao)) then CompSender := EditDataEmissao
    else if ((Sender = RadioGroupTipoNota)) then CompSender := RadioGroupTipoNota
    else if ((Sender = EditDescontoGeral) or (Sender = LabelDescontoGeral) or (Sender = CheckBoxDescGeral)) then CompSender := EditDescontoGeral
    else if ((Sender = EditSerie) or (Sender = LabelSerie)) then CompSender := EditSerie
    else if ((Sender = EditModelo) or (Sender = LabelModelo)) then CompSender := EditModelo
    else if ((Sender = EditNatOperacao) or (Sender = LabelNatOperacao)) then CompSender := EditNatOperacao
    else if ((Sender = EditChaveNFe) or (Sender = LabelChaveNFe)) then CompSender := EditChaveNFe;

    GetCursorPos(pt);
    PopUpMenu.Popup(pt.X , pt.Y);
  end;
end;

procedure TfNovaEntradaNota.PopupMenuPopup(Sender: TObject);
begin
  MenuLiga.Enabled    := (CompSender as TControl).Tag = 100;
  MenuDesliga.Enabled := (CompSender as TControl).Tag = 111;
end;

procedure TfNovaEntradaNota.MenuLigaClick(Sender: TObject);
begin
  LigaEsteComp(CompSender);
end;

procedure TfNovaEntradaNota.MenuDesligaClick(Sender: TObject);
begin
  DesligaEsteComp(CompSender);
end;

procedure TfNovaEntradaNota.DesligaEsteComp(Sender: TObject);
begin
       if (Sender = EditBaseCalcICMS)   then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelBaseCalcICMS); end
  else if (Sender = EditValorICMS)      then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelValorICMS); end
  else if (Sender = EditBaseICMSSubst)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelBaseICMSSubst); end
  else if (Sender = EditValorICMSSubst) then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelValorICMSSubst); end
  else if (Sender = EditValorFrete)     then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelValorFrete); end
  else if (Sender = EditValorSeguro)    then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelValorSeguro); end
  else if (Sender = EditOutrasDespesas) then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelOutrasDespesas); end
  else if (Sender = EditValorTotalIPI)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelValorTotalIPI); end
  else if (Sender = EditValorII)        then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(Self, LabelValorII); end
  else if (Sender = EditValorPIS)       then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(Self, LabelPIS); end
  else if (Sender = EditValorCofins)    then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(Self, LabelCOFINS); end
  else if (Sender = EditObs)            then begin TEdit(Sender as TControl).Text := '';       {*} DesligaComponente(self, LabelObs); end
  else if (Sender = EditSerie)          then begin TEdit(Sender as TControl).Text := '';       {*} DesligaComponente(Self, LabelSerie); end
  else if (Sender = EditModelo)         then begin TEdit(Sender as TControl).Text := '';       {*} DesligaComponente(Self, LabelModelo); end
  else if (Sender = EditNatOperacao)    then begin TEdit(Sender as TControl).Text := '';       {*} DesligaComponente(Self, LabelNatOperacao); end
  else if (Sender = EditChaveNFe)       then begin TEdit(Sender as TControl).Text := '';       {*} DesligaComponente(Self, LabelChaveNFe); end
  else if (Sender = EditDataEmissao)    then begin TJvDateEdit(Sender as TControl).Text := ''; {*} DesligaComponente(self, LabelDataEmissao); end
  else if (Sender = RadioGroupTipoNota) then begin TRadioGroup(Sender as TControl).ItemIndex := 1; {*} DesligaComponente(self, RadioGroupTipoNota); end
  else if (Sender = EditDescontoGeral)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelDescontoGeral); DesligaComponente(self, CheckBoxDescGeral); CheckBoxDescGeral.Checked := false end;

  DesligaComponente(self, Sender, true, clBtnFace, clGrayText, false, 100);
end;

procedure TfNovaEntradaNota.LigaEsteComp(Sender: TObject);
begin
       if (Sender = EditBaseCalcICMS)   then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelBaseCalcICMS); end
  else if (Sender = EditValorICMS)      then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorICMS); end
  else if (Sender = EditBaseICMSSubst)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelBaseICMSSubst); end
  else if (Sender = EditValorICMSSubst) then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorICMSSubst); end
  else if (Sender = EditValorFrete)     then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorFrete); end
  else if (Sender = EditValorSeguro)    then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorSeguro); end
  else if (Sender = EditOutrasDespesas) then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelOutrasDespesas); end
  else if (Sender = EditValorTotalIPI)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorTotalIPI); end
  else if (Sender = EditValorII)        then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelValorII); end
  else if (Sender = EditValorPIS)       then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelPIS); end
  else if (Sender = EditValorCofins)    then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelCOFINS); end
  else if (Sender = EditObs)            then begin TEdit(Sender as TControl).Text := '';       {*} LigaComponente(self, LabelObs); end
  else if (Sender = EditSerie)          then begin TEdit(Sender as TControl).Text := '';       {*} LigaComponente(Self, LabelSerie); end
  else if (Sender = EditModelo)         then begin TEdit(Sender as TControl).Text := '';       {*} LigaComponente(Self, LabelModelo); end
  else if (Sender = EditNatOperacao)    then begin TEdit(Sender as TControl).Text := '';       {*} LigaComponente(Self, LabelNatOperacao); end
  else if (Sender = EditChaveNFe)       then begin TEdit(Sender as TControl).Text := '';       {*} LigaComponente(Self, LabelChaveNFe); end
  else if (Sender = EditDataEmissao)    then begin TJvDateEdit(Sender as TControl).Text := ''; {*} LigaComponente(self, LabelDataEmissao); end
  else if (Sender = RadioGroupTipoNota) then begin TRadioGroup(Sender as TControl).ItemIndex := 0; {*} LigaComponente(self, RadioGroupTipoNota); end
  else if (Sender = EditDescontoGeral)  then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} LigaComponente(self, LabelDescontoGeral); LigaComponente(self, CheckBoxDescGeral); CheckBoxDescGeral.Checked := false end;

  LigaComponente(self, Sender, true, clWindow, clWindowText, 111);

  TCustomEdit(Sender as TControl).SetFocus;
  TCustomEdit(Sender as TControl).SelectAll;
end;

procedure TfNovaEntradaNota.GravaEstadoLigadoDesligado;
begin
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditBaseCalcICMS', EditBaseCalcICMS.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorICMS', EditValorICMS.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditBaseICMSSubst', EditBaseICMSSubst.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorICMSSubst', EditValorICMSSubst.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorFrete', EditValorFrete.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorSeguro', EditValorSeguro.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditOutrasDespesas', EditOutrasDespesas.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorTotalIPI', EditValorTotalIPI.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorII', EditValorII.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorPIS', EditValorPIS.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditValorCOFINS', EditValorCOFINS.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditObs', EditObs.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(Self), 'EditSerie', EditSerie.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(Self), 'EditModelo', EditModelo.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(Self), 'EditNatOperacao', EditNatOperacao.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(Self), 'EditChaveNFe', EditChaveNFe.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditDataEmissao', EditDataEmissao.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'RadioGroupTipoNota', RadioGroupTipoNota.Tag);
  SalvaIntegerNoRegistro(CM.ChaveDesteForm(self), 'EditDescontoGeral', EditDescontoGeral.Tag);
end;

procedure TfNovaEntradaNota.CarregaEstadoLigadoDesligado;
begin
  EditBaseCalcICMS.Tag   := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditBaseCalcICMS', 111);
  EditValorICMS.Tag      := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorICMS', 111);
  EditBaseICMSSubst.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditBaseICMSSubst', 111);
  EditValorICMSSubst.Tag := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorICMSSubst', 111);
  EditValorFrete.Tag     := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorFrete', 111);
  EditValorSeguro.Tag    := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorSeguro', 111);
  EditOutrasDespesas.Tag := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditOutrasDespesas', 111);
  EditValorTotalIPI.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorTotalIPI', 111);
  EditValorII.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorII', 111);
  EditValorPIS.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorPIS', 111);
  EditValorCOFINS.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditValorCOFINS', 111);
  EditObs.Tag            := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditObs', 111);
  EditSerie.Tag          := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditSerie', 111);
  EditModelo.Tag         := LeIntegerDoRegistro(CM.ChaveDesteForm(Self), 'EditModelo', 111);
  EditChaveNFe.Tag       := LeIntegerDoRegistro(CM.ChaveDesteForm(Self), 'EditChaveNFe', 111);
  EditNatOperacao.Tag    := LeIntegerDoRegistro(CM.ChaveDesteForm(Self), 'EditNatOperacao', 111);
  EditDataEmissao.Tag    := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditDataEmissao', 111);
  RadioGroupTipoNota.Tag := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'RadioGroupTipoNota', 111);
  EditDescontoGeral.Tag  := LeIntegerDoRegistro(CM.ChaveDesteForm(self), 'EditDescontoGeral', 111);

  if EditBaseCalcICMS.Tag    = 100 then DesligaEsteComp(EditBaseCalcICMS);
  if EditValorICMS.Tag       = 100 then DesligaEsteComp(EditValorICMS);
  if EditBaseICMSSubst.Tag   = 100 then DesligaEsteComp(EditBaseICMSSubst);
  if EditValorICMSSubst.Tag  = 100 then DesligaEsteComp(EditValorICMSSubst);
  if EditValorFrete.Tag      = 100 then DesligaEsteComp(EditValorFrete);
  if EditValorSeguro.Tag     = 100 then DesligaEsteComp(EditValorSeguro);
  if EditOutrasDespesas.Tag  = 100 then DesligaEsteComp(EditOutrasDespesas);
  if EditValorTotalIPI.Tag   = 100 then DesligaEsteComp(EditValorTotalIPI);
  if EditValorII.Tag         = 100 then DesligaEsteComp(EditValorII);
  if EditValorPIS.Tag        = 100 then DesligaEsteComp(EditValorPIS);
  if EditValorCOFINS.Tag     = 100 then DesligaEsteComp(EditValorCOFINS);
  if EditObs.Tag             = 100 then DesligaEsteComp(EditObs);
  if EditSerie.Tag           = 100 then DesligaEsteComp(EditSerie);
  if EditModelo.Tag          = 100 then DesligaEsteComp(EditModelo);
  if EditChaveNFe.Tag        = 100 then DesligaEsteComp(EditChaveNFe);
  if EditNatOperacao.Tag     = 100 then DesligaEsteComp(EditNatOperacao);
  if EditDataEmissao.Tag     = 100 then DesligaEsteComp(EditDataEmissao);
  if RadioGroupTipoNota.Tag  = 100 then DesligaEsteComp(RadioGroupTipoNota);
  if EditDescontoGeral.Tag   = 100 then DesligaEsteComp(EditDescontoGeral);
end;


procedure TfNovaEntradaNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaEstadoLigadoDesligado;
end;

procedure TfNovaEntradaNota.EditNumNotaKeyPress(Sender: TObject; var Key: Char);
begin
//todo
//  if not (key in SetSoNumeros) then key := #0;
end;

procedure TfNovaEntradaNota.EditCodFornecedorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in SetNumeros) then
    ItemEsc := mPesq.PesquisaDireto(key, pqFornecedores, [], EditCodFornecedor);
end;

procedure TfNovaEntradaNota.EditValorICMSExit(Sender: TObject);
begin
  if EditValorTotalProd.Value = 0 then
    EditValorTotalProd.Value := EditBaseCalcICMS.Value;
  SomaTotalDaNota;
end;

end.
