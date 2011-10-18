//ok
unit UDadosProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, UComum, UComp,
  DUtilit, DB, wwdblook, Menus, JvToolEdit, JvBaseEdits, JvExMask,
  JvSpin, JvDBControls, JvExExtCtrls, JvDBRadioPanel, UConstVar,  UDiverso, MessageFunctions,
  JvHint, JvComponentBase, JvBalloonHint, JvgHint, IB_Access;

const
  EstaChave = '\DadosDosProdutos';
  
type
  TMargemPreco = record
    Margem2 : Currency;
    Margem3 : Currency;
    Margem4 : Currency;
    Margem5 : Currency;
    Preco2  : Currency;
    Preco3  : Currency;
    Preco4  : Currency;
    Preco5  : Currency;
  end;

  TModoEntrada = (mdCadastro, mdCompleto);

  TfDadosDoProduto = class(TForm)
    PopupMenu: TPopupMenu;
    MenuLiga: TMenuItem;
    MenuDesliga: TMenuItem;
    PanelCadastro: TPanel;
    GroupBoxProduto: TGroupBox;
    Label17: TLabel;
    lbCapCodigo: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label38: TLabel;
    btCadastrarProduto: TSpeedButton;
    Bt_Pesquisar: TSpeedButton;
    btAlterarProduto: TSpeedButton;
    lbCaptionPesoLiquido: TLabel;
    lbCaptionPesoBruto: TLabel;
    lbCodigo: TLabel;
    lbFabricante: TLabel;
    lbUnidade: TLabel;
    lbPesoLiquido: TLabel;
    lbPesoBruto: TLabel;
    lbNMProduto: TLabel;
    Label26: TLabel;
    edNMProduto: TEdit;
    EditCodProdFornec: TEdit;
    MemoObsProduto: TMemo;
    BitBtn1: TBitBtn;
    edGrupo: TEdit;
    PanelQuantidade: TPanel;
    GroupBoxValorEQuantidade: TGroupBox;
    Label22: TLabel;
    btAlteraEstoque: TSpeedButton;
    Panel2: TPanel;
    Label7: TLabel;
    LabelUndConversao: TLabel;
    Label6: TLabel;
    edQuantidade: TJvCalcEdit;
    edUndConversao: TJvCalcEdit;
    btGrade: TBitBtn;
    btNumSerie: TBitBtn;
    edEstoqueAtual: TJvCalcEdit;
    Label32: TLabel;
    Label33: TLabel;
    PanelFinanceiro: TPanel;
    GroupBox1: TGroupBox;
    PanelCusto: TPanel;
    GroupBoxPrecoVenda: TGroupBox;
    Label16: TLabel;
    Label19: TLabel;
    edMargemLucro: TJvCalcEdit;
    edPrecoVenda: TJvCalcEdit;
    GroupBoxCustoUnitario: TGroupBox;
    edCustoUnitario: TJvCalcEdit;
    PanelImpDesp: TPanel;
    GroupBoxImpostoseDepesas: TGroupBox;
    PanelObs: TPanel;
    Label24: TLabel;
    MemoObs: TMemo;
    lbCaptionEstoqueMinimo: TLabel;
    edQuantTotal: TJvCalcEdit;
    GroupBox3: TGroupBox;
    Label47: TLabel;
    edTotalAcrescimos: TJvCalcEdit;
    Label48: TLabel;
    GroupBox9: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label35: TLabel;
    edOutrosVal: TJvCalcEdit;
    edFreteVal: TJvCalcEdit;
    edSeguroVal: TJvCalcEdit;
    edDescontoVal: TJvCalcEdit;
    GroupBox4: TGroupBox;
    LabelIPIPorc: TLabel;
    edIPIValorUnit: TJvCalcEdit;
    LabelIPIValorUnit: TLabel;
    GroupBoxCaixaFechada: TGroupBox;
    Label31: TLabel;
    Label29: TLabel;
    edCodCaixa: TEdit;
    CBCaixaFechada: TCheckBox;
    edUndConvCaixa: TJvCalcEdit;
    edEstoqueMinimo: TJvCalcEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edValorTotal: TJvCalcEdit;
    edQuantidade2: TJvCalcEdit;
    Bevel2: TBevel;
    edIPIValorTotal: TJvCalcEdit;
    LabelIPIValorTotal: TLabel;
    PanelLigaImpDesp: TPanel;
    btLigaImpDesp: TSpeedButton;
    GroupBox2: TGroupBox;
    edValorUnitario: TJvCalcEdit;
    PanelInforme: TPanel;
    lbInforme: TLabel;
    PanelInforme2: TPanel;
    PanelValoresAtuais: TPanel;
    GroupBoxValoresAtuais: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    bt_UltimasVendas: TSpeedButton;
    bt_VendaMensal: TSpeedButton;
    Bt_UltimasCompras: TSpeedButton;
    bt_AuditEstoque: TSpeedButton;
    Label44: TLabel;
    lbUltimoReajuste: TLabel;
    lbCapInformacoes: TLabel;
    edCustoAtual: TJvCalcEdit;
    edMargemAtual: TJvCalcEdit;
    edPrecoVendaAtual: TJvCalcEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label27: TLabel;
    lbUltimaCompra: TLabel;
    Label30: TLabel;
    lbUltimaVenda: TLabel;
    PanelInfoFiscal: TPanel;
    GroupBoxFiscal: TGroupBox;
    LabelExIPI: TLabel;
    LabelClassFiscal: TLabel;
    LabelCFOP: TLabel;
    edEXIPI: TJvCalcEdit;
    edClassFiscal: TJvCalcEdit;
    edCFOP: TJvCalcEdit;
    edICMSSTVal: TJvCalcEdit;
    Label8: TLabel;
    edIIVal: TJvCalcEdit;
    Label10: TLabel;
    Label20: TLabel;
    edIPIVal: TJvCalcEdit;
    Bevel5: TBevel;
    LabelIPICST: TLabel;
    LabelIPIClEnq: TLabel;
    LabelIPICodEnq: TLabel;
    LabelIPIQuantSelo: TLabel;
    LabelIPIBC: TLabel;
    edIPIBC: TJvCalcEdit;
    LabelIPICodSelo: TLabel;
    edIPICST: TEdit;
    edIPIClassEnq: TEdit;
    edIPICodEnq: TEdit;
    edIPICodSelo: TEdit;
    edIPIQtdSelo: TEdit;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    LabelICMSValorTotal: TLabel;
    LabelICMSCST: TLabel;
    LabelICMSBC: TLabel;
    edICMSValorTotal: TJvCalcEdit;
    edICMSPorc: TJvCalcEdit;
    edICMSBC: TJvCalcEdit;
    edICMSCST: TEdit;
    LabelICMSPorc: TLabel;
    GroupBox7: TGroupBox;
    LabelICMSSTBC: TLabel;
    LabelICMSSTPorcMVA: TLabel;
    LabelICMSSTPorcRedBC: TLabel;
    LabelICMSSTPorc: TLabel;
    edICMSSTBC: TJvCalcEdit;
    edICMSSTPorc: TJvCalcEdit;
    edICMSSTPorcRedBC: TJvCalcEdit;
    edICMSSTPorcMVA: TJvCalcEdit;
    LabelICMSSTValorTotal: TLabel;
    edICMSSTValorTotal: TJvCalcEdit;
    LabelICMSSTBCRetido: TLabel;
    edICMSSTBCRetido: TJvCalcEdit;
    LabelICMSSTValorTotalRetido: TLabel;
    edICMSSTValorTotalRetido: TJvCalcEdit;
    GroupBox8: TGroupBox;
    LabelIIValorTotal: TLabel;
    LabelIIValDespAduaneira: TLabel;
    edIIValorTotal: TJvCalcEdit;
    edIIValDespAduaneira: TJvCalcEdit;
    LabelIIBC: TLabel;
    edIIBC: TJvCalcEdit;
    LabelIIValIOF: TLabel;
    edIIValIOF: TJvCalcEdit;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    LabelPISValorTotal: TLabel;
    LabelPISCST: TLabel;
    LabelPISBC: TLabel;
    LabelPISPorc: TLabel;
    edPISValorTotal: TJvCalcEdit;
    edPISPorc: TJvCalcEdit;
    edPISBC: TJvCalcEdit;
    edPISCST: TEdit;
    LabelPISValorAliquota: TLabel;
    edPISValorAliquota: TJvCalcEdit;
    edPISQtdVendida: TJvCalcEdit;
    LabelPISQtdVendida: TLabel;
    GroupBox12: TGroupBox;
    LabelPISSTValorTotal: TLabel;
    LabelPISSTBC: TLabel;
    LabelPISSTPorc: TLabel;
    LabelPISSTValorAliquota: TLabel;
    LabelPISSTQtdVendida: TLabel;
    edPISSTValorTotal: TJvCalcEdit;
    edPISSTPorc: TJvCalcEdit;
    edPISSTBC: TJvCalcEdit;
    edPISSTValorAliquota: TJvCalcEdit;
    edPISSTQtdVendida: TJvCalcEdit;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    LabelCOFINSValorTotal: TLabel;
    LabelCOFINSCST: TLabel;
    LabelCOFINSBC: TLabel;
    LabelCOFINSPorc: TLabel;
    LabelCOFINSValorAliquota: TLabel;
    LabelCOFINSQtdVendida: TLabel;
    edCOFINSValorTotal: TJvCalcEdit;
    edCOFINSPorc: TJvCalcEdit;
    edCOFINSBC: TJvCalcEdit;
    edCOFINSCST: TEdit;
    edCOFINSAliquotaValor: TJvCalcEdit;
    edCOFINSQtdVendida: TJvCalcEdit;
    GroupBox15: TGroupBox;
    LabelCOFINSSTValorTotal: TLabel;
    LabelCOFINSSTBC: TLabel;
    LabelCOFINSSTPorc: TLabel;
    LabelCOFINSSTValorAliquota: TLabel;
    LabelCOFINSSTQtdVendida: TLabel;
    edCOFINSSTValorTotal: TJvCalcEdit;
    edCOFINSSTPorc: TJvCalcEdit;
    edCOFINSSTBC: TJvCalcEdit;
    edCOFINSSTValorAliquota: TJvCalcEdit;
    edCOFINSSTQtdVendida: TJvCalcEdit;
    CBAtualizaSimilares: TCheckBox;
    edPrecoCusto: TJvCalcEdit;
    Label14: TLabel;
    cbUtilizaCustoMedio: TCheckBox;
    gbFrete: TGroupBox;
    Label3: TLabel;
    Label9: TLabel;
    edFreteChegada: TJvCalcEdit;
    edFreteSaida: TJvCalcEdit;
    PanelBaixo: TPanel;
    Panel1: TPanel;
    Bt_Cancelar: TBitBtn;
    Bt_Ok: TBitBtn;
    Bt_Incluir: TBitBtn;
    PanelItem: TPanel;
    Label23: TLabel;
    Bt_Anterior: TBitBtn;
    Bt_Proximo: TBitBtn;
    EditSequencial: TJvSpinEdit;
    btMedicamento: TBitBtn;
    edIPIPorc: TJvCalcEdit;
    procedure Bt_CancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_IncluirClick(Sender: TObject);
    procedure Bt_PesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCodProdFornecExit(Sender: TObject);
    procedure Bt_OkClick(Sender: TObject);
    procedure Bt_AnteriorClick(Sender: TObject);
    procedure Bt_ProximoClick(Sender: TObject);
    procedure EditCSTExit(Sender: TObject);
    procedure edMargemLucroExit(Sender: TObject);
    procedure edPrecoVendaExit(Sender: TObject);
    procedure edQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edIPIPorcExit(Sender: TObject);
    procedure CBCaixaFechadaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuLigaClick(Sender: TObject);
    procedure MenuDesligaClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure LabelCOFINSSTValorAliquotaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvDBRadioPanel1Change(Sender: TObject);
    procedure edCustoUnitarioChange(Sender: TObject);
    procedure rbCustoMedioClick(Sender: TObject);
    procedure rbCustoAtualClick(Sender: TObject);
    procedure edPrecoVendaEnter(Sender: TObject);
    procedure edMargemLucroEnter(Sender: TObject);
    procedure edNMProdutoChange(Sender: TObject);
    procedure btCadastrarProdutoClick(Sender: TObject);
    procedure btAlterarProdutoClick(Sender: TObject);
    procedure btGradeClick(Sender: TObject);
    procedure btNumSerieClick(Sender: TObject);
    procedure edQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure edGrupoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btAlteraEstoqueClick(Sender: TObject);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edQuantidadeChange(Sender: TObject);
    procedure btLigaImpDespClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Bt_UltimasComprasClick(Sender: TObject);
    procedure bt_AuditEstoqueClick(Sender: TObject);
    procedure bt_UltimasVendasClick(Sender: TObject);
    procedure bt_VendaMensalClick(Sender: TObject);
    procedure edFreteChegadaKeyPress(Sender: TObject; var Key: Char);
    procedure edFreteSaidaKeyPress(Sender: TObject; var Key: Char);
    procedure cbUtilizaCustoMedioClick(Sender: TObject);
    procedure btMedicamentoClick(Sender: TObject);
  private
    CompSender : TObject;  // Componente que poder� ser ligado ou desligado
    ChaveDoRegistro : String;
    CustoMedio : Currency;
    ENT_PrecoVenda : Currency;
    ENT_Margem     : Currency;
    TamGroupBox    : word;
    TamForm        : word;
    posCheckValAtuais : word;
    AturaDoForm    : Integer;
    MargemPreco    : TMargemPreco;
    MargemPadrao   : Currency;
    Margem2Padrao  : Currency;
    Margem3Padrao  : Currency;
    Margem4Padrao  : Currency;
    Margem5Padrao  : Currency;
    ImpDespVisivel : boolean;

    function  TemErro: boolean;
    procedure LigaDesligaImpDesp;
    procedure GravaDados(gdInclusao: boolean);
    procedure VerificaTresCasasDecimais;
    procedure DesligaEsteComp(Sender: TObject);
    procedure LigaEsteComp(Sender: TObject);
    procedure GravaEstadoLigadoDesligado;
    procedure CarregaEstadoLigadoDesligado;
    procedure VerificaTipoCusto;
    procedure AjustaEstadoDoComponente(aeComponente: TObject);
    procedure LimpaDados;
    procedure EscondeExibePanelInforme(eeVisivel: boolean);
    function TrocaStringsSeVazia(De, Para: string): string;
  public
    CodigoDoProduto : Integer;
    CodItem : String;
    CodItemPedidoCompra : Integer;
    Modo   : TModos;
    ModoEntrada : TModoEntrada;
    CDNota : Integer;
    LockPrecoVenda: boolean;
    procedure CalculaCampos;
    procedure MostraDados;
    procedure LocalizaProduto(lpCodigoDoProduto: Integer);
  end;

var
  fDadosDoProduto: TfDadosDoProduto;
  CustoMedioProd, CustoAtualProd, UltimoCustoProd, UltimoCustoMedioProd: Currency;

implementation

uses UDataMod, IB_Components, UNFGrades, UEntradaNumSerie, UModUsuarios, DBFunctions,
     UTabela, UNovoProduto, UModPesquisa, UCadGruposProdutos, UCadProdutos,
     ULotesProduto;
{$R *.dfm}

procedure TfDadosDoProduto.Bt_CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfDadosDoProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfDadosDoProduto.Bt_IncluirClick(Sender: TObject);
begin
  if edQuantidade.Value = 0 then edQuantidade.Value := DtM.QuantidadeNFGrade(CodigoDoProduto, CDNota);

  if TemErro then Exit;
  GravaDados(true);

  if CodItemPedidoCompra <> CodigoVazio then
  begin
    with DtM do
    begin
      if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
      try
        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('Update PEDIDOSDECOMPRA_ITEMS set BAIXADO = :BAIXADO');
        IBTabela.SQL.Add('where CD_ITEM = :CD_ITEM');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('BAIXADO').AsString := 'V';
        IBTabela.ParamByName('CD_ITEM').AsInteger := CodItemPedidoCompra;
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except
        on E: exception do begin
          LogDeErros(E.Message);
          IBTabela.IB_Transaction.Rollback;
          MensagemDeErro('N�o foi poss�vel baixar este item de pedido de compra');
        end;
      end;
    end;
  end;

  Close;
end;

procedure TfDadosDoProduto.LocalizaProduto(lpCodigoDoProduto: Integer);
begin
  DtM.IBTabela.Active := false;
  DtM.IBTabela.SQL.Clear;
  DtM.IBTabela.SQL.Add('Select P.CD_PRODUTO, P.COD_BARRAS, P.NM_PRODUTO, P.PRECOCUSTO, P.UNIDADE, P.BAL_COD_BALANCA, P.TRESCASAS, P.CX_COD_BARRA_CAIXA, P.CX_UNDCONVERSAO, P.OBS,       ');
  DtM.IBTabela.SQL.Add('R.DT_ULTIMACOMPRA, R.DT_ULTIMAVENDA, P.DT_ULTIMOREAJUSTE, P.FABRICANTE, P.CD_GRUPO, P.IPI, coalesce(P.UNDCONVERSAOENTRADA, 1) as UNDCONVERSAOENTRADA,           ');
  DtM.IBTabela.SQL.Add('coalesce(P.PRECOVENDA, 0) as PRECOVENDA, coalesce(P.MARGEM, 0) as MARGEM, P.CUSTOMEDIO, P.ULTIMOCUSTO, P.TIPOCUSTO, P.PRECOVENDAANTERIOR, P.PRECOCUSTOANTERIOR, ');
  DtM.IBTabela.SQL.Add('P.PESOBRUTO, P.PESOLIQUIDO, P.ESTOQUEMINIMO, P.MARGEM2, P.MARGEM3, P.MARGEM4, P.MARGEM5, P.PRECO2, P.PRECO3, P.PRECO4, P.PRECO5, P.FRETESAIDA, P.FRETECHEGADA,  ');
  DtM.IBTabela.SQL.Add('P.CLASSFISCAL          ');
  DtM.IBTabela.SQL.Add('FROM PRODUTOS P');
  DtM.IBTabela.SQL.Add('left outer join REFPRODUTOS R on R.CD_PRODUTO = P.CD_PRODUTO');
  DtM.IBTabela.SQL.Add('where P.CD_PRODUTO = '+IntToStr(lpCodigoDoProduto));
  if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
  DtM.IBTabela.Active := true;

  lbCodigo.Caption         := DtM.IBTabela.FieldByName('COD_BARRAS').AsString;
  edNMProduto.Text         := DtM.IBTabela.FieldByName('NM_PRODUTO').AsString;
  edClassFiscal.Value      := StrToInt(TrocaStringsSeVazia(DtM.IBTabela.FieldByName('CLASSFISCAL').AsString,'0'));
  edPrecoVendaAtual.Value  := DtM.IBTabela.FieldByName('PRECOVENDA').AsCurrency;
  UltimoCustoProd          := DtM.IBTabela.FieldByName('ULTIMOCUSTO').AsCurrency;
  UltimoCustoMedioProd     := DtM.IBTabela.FieldByName('CUSTOMEDIO').AsCurrency;
  edCustoAtual.Value       := DtM.IBTabela.FieldByName('PRECOCUSTO').AsCurrency;
  edFreteChegada.Value     := DtM.IBTabela.FieldByName('FRETECHEGADA').AsCurrency;
  edFreteSaida.Value       := DtM.IBTabela.FieldByName('FRETESAIDA').AsCurrency;

  DtM.IBTabela.FieldByName('OBS').AssignTo(MemoObsProduto.Lines);

  if DtM.IBTabela.FieldByName('MARGEM2').AsCurrency > 0 then MargemPreco.Margem2 := DtM.IBTabela.FieldByName('MARGEM2').AsCurrency
                                                        else MargemPreco.Margem2 := Margem2Padrao;
  if DtM.IBTabela.FieldByName('MARGEM3').AsCurrency > 0 then MargemPreco.Margem3 := DtM.IBTabela.FieldByName('MARGEM3').AsCurrency
                                                        else MargemPreco.Margem3 := Margem3Padrao;
  if DtM.IBTabela.FieldByName('MARGEM4').AsCurrency > 0 then MargemPreco.Margem4 := DtM.IBTabela.FieldByName('MARGEM4').AsCurrency
                                                        else MargemPreco.Margem4 := Margem4Padrao;
  if DtM.IBTabela.FieldByName('MARGEM5').AsCurrency > 0 then MargemPreco.Margem5 := DtM.IBTabela.FieldByName('MARGEM5').AsCurrency
                                                        else MargemPreco.Margem5 := Margem5Padrao;

  MargemPreco.Preco2  := DtM.IBTabela.FieldByName('PRECO2').AsCurrency;
  MargemPreco.Preco3  := DtM.IBTabela.FieldByName('PRECO3').AsCurrency;
  MargemPreco.Preco4  := DtM.IBTabela.FieldByName('PRECO4').AsCurrency;
  MargemPreco.Preco5  := DtM.IBTabela.FieldByName('PRECO5').AsCurrency;

  edEstoqueAtual.Value := CM.PegaEstoque(lpCodigoDoProduto);
  lbUnidade.Caption      := DtM.IBTabela.FieldByName('UNIDADE').AsString;
  if DtM.IBTabela.FieldByName('MARGEM').AsCurrency > 0 then
  begin
    edMargemLucro.Value  := DtM.IBTabela.FieldByName('MARGEM').AsCurrency;
    edMargemAtual.Value  := DtM.IBTabela.FieldByName('MARGEM').AsCurrency;
  end
  else begin
    edMargemLucro.Value  := MargemPadrao;
    edMargemAtual.Value  := MargemPadrao;
  end;

  lbUltimaCompra.Visible   := DtM.IBTabela.FieldByName('DT_ULTIMACOMPRA').IsNotNull;
  lbUltimaCompra.Caption   := FormatDateTime('dd/mm/yyyy', DtM.IBTabela.FieldByName('DT_ULTIMACOMPRA').AsDateTime);
  lbUltimaVenda.Visible    := DtM.IBTabela.FieldByName('DT_ULTIMAVENDA').IsNotNull;
  lbUltimaVenda.Caption    := FormatDateTime('dd/mm/yyyy', DtM.IBTabela.FieldByName('DT_ULTIMAVENDA').AsDateTime);
  lbUltimoReajuste.Visible := DtM.IBTabela.FieldByName('DT_ULTIMOREAJUSTE').IsNotNull;
  lbUltimoReajuste.Caption := FormatDateTime('dd/mm/yyyy', DtM.IBTabela.FieldByName('DT_ULTIMOREAJUSTE').AsDateTime);

  lbFabricante.Caption   := DtM.IBTabela.FieldByName('FABRICANTE').AsString;
  lbPesoBruto.Caption    := FormatCurr(',0.000;-,0.000', DtM.IBTabela.FieldByName('PESOBRUTO').AsCurrency);
  lbPesoLiquido.Caption  := FormatCurr(',0.000;-,0.000', DtM.IBTabela.FieldByName('PESOLIQUIDO').AsCurrency);
  edEstoqueMinimo.Value  := DtM.IBTabela.FieldByName('ESTOQUEMINIMO').AsCurrency;
  edIPIPorc.Value        := DtM.IBTabela.FieldByName('IPI').AsCurrency;
  edUndConversao.Value   := DtM.IBTabela.FieldByName('UNDCONVERSAOENTRADA').AsCurrency;
  edGrupo.Tag            := DtM.IBTabela.FieldByName('CD_GRUPO').AsInteger;
  edGrupo.Text           := CM.StringGrupo(edGrupo.Tag);
  VerificaTipoCusto;

  if vazio(edCodCaixa.Text) then
  begin
    edCodCaixa.Text      := DtM.IBTabela.FieldByName('CX_COD_BARRA_CAIXA').AsString;
    edUndConvCaixa.Value := DtM.IBTabela.FieldByName('CX_UNDCONVERSAO').AsCurrency;
  end;
  CBCaixaFechada.Checked := not Vazio(edCodCaixa.Text);
  CBCaixaFechada.OnClick(CBCaixaFechada);

  CodigoDoProduto := DtM.IBTabela.FieldByName('CD_PRODUTO').AsInteger;
  CustoMedio := CM.PegaCustoMedio(CodigoDoProduto);
  VerificaTresCasasDecimais;
  fDB.FechaTT(DtM.IBTabela);

  edCustoAtual.Hint := '�ltimo Custo R$ ' + FormatCurr(',0.00',UltimoCustoProd) + PL + '�ltimo Custo M�dio R$ ' + FormatCurr(',0.00',UltimoCustoMedioProd);
end;

procedure TfDadosDoProduto.VerificaTipoCusto;
begin
  if cbUtilizaCustoMedio.Checked then
    edPrecoCusto.Value := CustoMedioProd
  else
    edPrecoCusto.Value := CustoAtualProd;

  CalculaCampos;
end;

procedure TfDadosDoProduto.VerificaTresCasasDecimais;
var
  CasasDecimais : word;
  Formatacao : String;

  procedure AjustaComponente(var Comp:TjvCalcEdit);
  begin
    Comp.DecimalPlaces := CasasDecimais;
    Comp.DisplayFormat := Formatacao;
  end;

begin
  if DtM.IBTabela.FieldByName('TRESCASAS').AsString = 'V' then
  begin
    CasasDecimais := 3;
    Formatacao := ',0.000';
  end
  else begin
    CasasDecimais := 2;
    Formatacao := ',0.00';
  end;

  AjustaComponente(edValorUnitario);
  AjustaComponente(edValorTotal);
  AjustaComponente(edCustoUnitario);
  AjustaComponente(edPrecoVenda);
  AjustaComponente(edCustoAtual);
  AjustaComponente(edPrecoVendaAtual);
  AjustaComponente(edPrecoCusto);
  AjustaComponente(edFreteChegada);
  AjustaComponente(edFreteSaida);
end;

procedure TfDadosDoProduto.Bt_PesquisarClick(Sender: TObject);
begin
  ItemEsc := mPesq.Pesquisa(pqProdutos, [mdInclusao, mdAlteracao], nil, edNMProduto.Text, '', false, FornecedorVinculado, true, false);
  if ItemEsc.CodInt > 0 then
  begin
    LocalizaProduto(ItemEsc.CodInt);
    edQuantidade.SetFocus;
  end;
end;

procedure TfDadosDoProduto.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_Escape : Close;
    vk_F2     : if (Shift = []) then btCadastrarProduto.Click;
    vk_F3     : if (Shift = []) then begin
//                  Bt_Pesquisar.SetFocus;
                  Bt_Pesquisar.Click;
                end;
    vk_F5     : if (Shift = []) then btAlterarProduto.Click;
    vk_F6     : if (Shift = []) then btGrade.Click;
    vk_F7     : if (Shift = []) then btNumSerie.Click;
    VK_F8     : if (Shift = []) then btMedicamento.Click;

    vk_F10    : if (Shift = []) then
                begin
                  if Bt_Incluir.Visible then Bt_Incluir.Click
                  else if Bt_Ok.Visible then Bt_Ok.Click;
                end;
    vk_Left   : if (Shift = [ssAlt]) and (Bt_Anterior.Visible) then Bt_Anterior.Click;
    VK_RIGHT  : if (Shift = [ssAlt]) and (Bt_Proximo.Visible) then Bt_Proximo.Click;
  end;
end;

procedure TfDadosDoProduto.EditCodProdFornecExit(Sender: TObject);
begin
  if (Bt_Cancelar.Focused)or(Bt_Ok.Focused)or(Bt_Incluir.Focused)or(Bt_Proximo.Focused)or(Bt_Anterior.Focused)or(not Vazio(edNMProduto.Text)) then
    Exit;

  if not Vazio(EditCodProdFornec.Text) then
  begin
    DtM.IBTabela.Active := false;
    DtM.IBTabela.SQL.Clear;
    DtM.IBTabela.SQL.Add('Select * from PRODFORNEC');
    DtM.IBTabela.SQL.Add('where COD_PROD_FORNEC = '+QuotedStr(EditCodProdFornec.Text));
    DtM.IBTabela.SQL.Add('and CD_FORNECEDOR = '+DtM.IBNF.FieldByName('CD_FORNECEDOR').AsString);
    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.Active := true;
    if not DtM.IBTabela.IsEmpty then
      LocalizaProduto(DtM.IBTabela.FieldByName('CD_PRODUTO').AsInteger)
    else begin
      ItemEsc := mPesq.Pesquisa(pqProdutos, [mdInclusao, mdAlteracao], nil, edNMProduto.Text, '', false, FornecedorVinculado, true);
      if ItemEsc.CodInt > 0 then
        LocalizaProduto(ItemEsc.CodInt);
    end;
    fDB.FechaTT(DtM.IBTabela);
  end
  else begin
    Bt_Pesquisar.Click
  end;
end;

function TfDadosDoProduto.TemErro: boolean;
begin
  result := false;

  if (not result) and (Vazio(edNMProduto.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar o Produto');
    EditCodProdFornec.SetFocus;
  end;

  if (not result) and (edQuantidade.Value = 0) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar a Quantidade');
    edQuantidade.SetFocus;
  end;

  if (not result) and (edUndConversao.Value = 0) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar a Unidade de Convers�o');
    edUndConversao.SetFocus;
  end;

  if (not result) and (edPrecoVenda.Value = 0) and (ModoEntrada = mdCompleto) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar o Pre�o de Venda');
    edPrecoVenda.SetFocus;
  end;

  if (not result) and (Vazio(edGrupo.Text)) then
  begin
    result := true;
    MensagemDeAtencao('� necess�rio informar o Grupo');
    edGrupo.SetFocus;
  end;

  if (not result) and (CM.TemGrades(CodigoDoProduto)) then
  begin
    if DtM.QuantidadeNFGrade(CodigoDoProduto, CDNota) <> (edQuantidade.Value * CM.UmSeZero(edUndConversao.Value)) then
    begin
      result := true;
      MensagemDeAtencao('A quantidade do ITEM n�o confere com a quantidade da GRADE');
      btGrade.Click;
    end;
  end;

  if (not result) then
  begin
    if DtM.QuantidadeNFNumSerie(CodigoDoProduto, CDNota) > 0 then
    begin
      if DtM.QuantidadeNFNumSerie(CodigoDoProduto, CDNota) <> (edQuantidade.Value * CM.UmSeZero(edUndConversao.Value)) then
      begin
        result := not MensagemDeConfirmacao('A quantidade do ITEM n�o confere com a quantidade de N�MEROS DE S�RIE'+PL+PL+'Continua assim mesmo?', 'ATEN��O !!!', mbNo) = mrYes;
        if result then btNumSerie.Click;
      end;
    end;
  end;
end;

procedure TfDadosDoProduto.GravaDados(gdInclusao: boolean);
var
  slCampos, slExcecoes, slSQL : TStrings;
  JaTem : Boolean;
  CodProdFornec : String;
  CDNota,
  CodFornec : Integer;
  DataEntrada : TDate;
begin
  with DtM do
  begin
    CDNota      := IBNF.FieldByName('CD_NOTA').AsInteger;
    CodFornec   := IBNF.FieldByName('CD_FORNECEDOR').AsInteger;
    DataEntrada := IBNF.FieldByName('DT_ENTRADA').AsDateTime;

    slSQL      := TStringList.Create;
    slCampos   := TStringList.Create;
    slExcecoes := TStringList.Create;
    DtM.IBDatabaseServer.SchemaCache.GetTableFields('ENTRADA_ITEM', slCampos);
    slExcecoes.Add('CD_ITEM');
    slExcecoes.Add('DT_CADASTRO');
    slExcecoes.Add('ULTIMAALTERACAO');

    if gdInclusao then
      GeraSQLInsertUpdate('ENTRADA_ITEM', slCampos, slExcecoes, '', rmInclusao, slSQL)
    else
      GeraSQLInsertUpdate('ENTRADA_ITEM', slCampos, slExcecoes, 'CD_NOTA = '+IBNF.FieldByName('CD_NOTA').AsString+' and CD_ITEM = '+CodItem, rmAlteracao, slSQL);

    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL := slSQL;
    slSQL.Free;
    slCampos.Free;
    slExcecoes.Free;

    //essa linha t� salvando no diret�rio o arquivo SQLTeste.txt
    fDB.SalvaSQL(IBTabela.SQL);
    Log('SQL.txt',IBTabela.SQL.Text);
    if not IBTabela.Prepared then IBTabela.Prepare;
    if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
    try
      IBTabela.ParamByName('CD_NOTA').AsInteger         := IBNF.FieldByName('CD_NOTA').AsInteger;
      IBTabela.ParamByName('COD_PROD_FORNEC').AsString  := EditCodProdFornec.Text;
      IBTabela.ParamByName('CD_PRODUTO').AsInteger      := CodigoDoProduto;
      IBTabela.ParamByName('ICMS_CST').AsString         := IBNFItems.FieldByName('ICMS_CST').AsString;
      IBTabela.ParamByName('QUANTIDADE').AsCurrency     := edQuantidade.Value;
      IBTabela.ParamByName('VALORUNITARIO').AsCurrency  := edValorUnitario.Value;
      IBTabela.ParamByName('ICMS_PORC').AsCurrency      := IBNFItems.FieldByName('ICMS_PORC').AsCurrency;
      IBTabela.ParamByName('IPI_PORC').AsCurrency       := IBNFItems.FieldByName('IPI_PORC').AsCurrency;
      IBTabela.ParamByName('UNDCONVERSAO').AsCurrency   := edUndConversao.Value;
      IBTabela.ParamByName('MARGEMLUCRO').AsCurrency    := edMargemLucro.Value;

      if CBAtualizaSimilares.Checked then IBTabela.ParamByName('ATUALIZASIMILARES').AsString := 'V'
                                     else IBTabela.ParamByName('ATUALIZASIMILARES').AsString := 'F';

      IBTabela.ParamByName('CUSTO_UNITARIO').AsCurrency     := edCustoUnitario.Value;
      IBTabela.ParamByName('PRECOVENDA').AsCurrency         := edPrecoVenda.Value;
      IBTabela.ParamByName('CX_COD_BARRA_CAIXA').AsString   := edCodCaixa.Text;
      IBTabela.ParamByName('CX_VALORCAIXA').AsCurrency      := IBNFItems.FieldByName('CX_VALORCAIXA').AsCurrency;
      IBTabela.ParamByName('CX_UNDCONVERSAO').AsCurrency    := edUndConvCaixa.Value;
      IBTabela.ParamByName('SEQUENCIAL').AsInteger          := trunc(EditSequencial.Value);
      IBTabela.ParamByName('CD_GRUPO').AsInteger            := edGrupo.Tag;
      IBTabela.ParamByName('LOGIN').AsString                := RegUsuario.Login;
      IBTabela.ParamByName('OBS').Assign(MemoObs.Lines);
      IBTabela.ParamByName('LOCK_PRECOVENDA').AsString      := BooleanToChar(LockPrecoVenda);
      IBTabela.ParamByName('CUSTOMEDIO').AsCurrency         := ArredondaReal(CustoMedioProd,2);
      IBTabela.ParamByName('PRECOCUSTO').AsCurrency     := edPrecoCusto.Value;
      if cbUtilizaCustoMedio.Checked then IBTabela.ParamByName('TIPOCUSTO').AsString := 'M'
                                     else IBTabela.ParamByName('TIPOCUSTO').AsString := 'U';
      IBTabela.ParamByName('MARGEM2').AsCurrency        := MargemPreco.Margem2;
      IBTabela.ParamByName('MARGEM3').AsCurrency        := MargemPreco.Margem3;
      IBTabela.ParamByName('MARGEM4').AsCurrency        := MargemPreco.Margem4;
      IBTabela.ParamByName('MARGEM5').AsCurrency        := MargemPreco.Margem5;
      IBTabela.ParamByName('PRECO2').AsCurrency         := MargemPreco.Preco2;
      IBTabela.ParamByName('PRECO3').AsCurrency         := MargemPreco.Preco3;
      IBTabela.ParamByName('PRECO4').AsCurrency         := MargemPreco.Preco4;
      IBTabela.ParamByName('PRECO5').AsCurrency         := MargemPreco.Preco5;
      IBTabela.ParamByName('VALORTOTAL').AsCurrency     := edValorUnitario.Value * edQuantidade.Value;
      IBTabela.ParamByName('FRETECHEGADA').AsCurrency   := edFreteChegada.Value;
      IBTabela.ParamByName('FRETESAIDA').AsCurrency     := edFreteSaida.Value;
      IBTabela.ParamByName('DELETADO').AsString         := 'F';
      IBTabela.ParamByName('EAN').AsString              := IBNFItems.FieldByName('EAN').AsString;
      IBTabela.ParamByName('NOME_XML').AsString         := IBNFItems.FieldByName('NOME_XML').AsString;
      IBTabela.ParamByName('NOME_CADASTRADO').AsString  := IBNFItems.FieldByName('NOME_CADASTRADO').AsString;
      IBTabela.ParamByName('CLASSFISCAL').AsString      := edClassFiscal.Text;
      IBTabela.ParamByName('EXTIPI').AsString           := edEXIPI.Text;
      IBTabela.ParamByName('CFOP').AsString             := edCFOP.Text;
      IBTabela.ParamByName('UNID_COM').AsString         := IBNFItems.FieldByName('UNID_COM').AsString;
      IBTabela.ParamByName('CD_EAN_TRIB').AsString      := IBNFItems.FieldByName('CD_EAN_TRIB').AsString;
      IBTabela.ParamByName('UN_TRIB').AsString          := IBNFItems.FieldByName('UN_TRIB').AsString;
      IBTabela.ParamByName('QT_TRIB').AsString          := IBNFItems.FieldByName('QT_TRIB').AsString;
      IBTabela.ParamByName('VAL_UN_TRIB').AsCurrency    := IBNFItems.FieldByName('VAL_UN_TRIB').AsCurrency;
      IBTabela.ParamByName('FRETE_VAL').AsCurrency      := edFreteVal.Value;
      IBTabela.ParamByName('SEGURO_VAL').AsCurrency     := edSeguroVal.Value;
      IBTabela.ParamByName('DESCONTO_VAL').AsCurrency   := edDescontoVal.Value;
      IBTabela.ParamByName('OUTROS_VAL').AsCurrency     := edOutrosVal.Value;
      IBTabela.ParamByName('INDTOT').AsInteger          := IBNFItems.FieldByName('INDTOT').AsInteger;
      IBTabela.ParamByName('XPEDIDO').AsString          := IBNFItems.FieldByName('XPEDIDO').AsString;
      IBTabela.ParamByName('NITEMPEDIDO').AsInteger     := IBNFItems.FieldByName('NITEMPEDIDO').AsInteger;

      IBTabela.ParamByName('INFOADPROD').Value          := IBNFItems.FieldByName('INFOADPROD').Value;

      IBTabela.ParamByName('ORIGEM').AsInteger            := IBNFItems.FieldByName('ORIGEM').AsInteger;
      IBTabela.ParamByName('ICMS_MODBC').AsString         := IBNFItems.FieldByName('ICMS_MODBC').AsString;
      IBTabela.ParamByName('PREDBCST').AsCurrency         := IBNFItems.FieldByName('PREDBCST').AsCurrency;
      IBTabela.ParamByName('ICMS_BC_VAL').AsCurrency      := IBNFItems.FieldByName('ICMS_BC_VAL').AsCurrency;
      IBTabela.ParamByName('ICMS_VAL').AsCurrency         := IBNFItems.FieldByName('ICMS_VAL').AsCurrency;

      IBTabela.ParamByName('ICMSST_MODBC').AsString          := IBNFItems.FieldByName('ICMSST_MODBC').AsString;
      IBTabela.ParamByName('ICMSST_PMVA').AsCurrency         := IBNFItems.FieldByName('ICMSST_PMVA').AsCurrency;
      IBTabela.ParamByName('ICMSST_PRED').AsCurrency         := IBNFItems.FieldByName('ICMSST_PRED').AsCurrency;
      IBTabela.ParamByName('ICMSST_BC_VAL').AsCurrency       := IBNFItems.FieldByName('ICMSST_BC_VAL').AsCurrency;
      IBTabela.ParamByName('ICMSST_PORC').AsCurrency         := IBNFItems.FieldByName('ICMSST_PORC').AsCurrency;
      IBTabela.ParamByName('ICMSSTRET_BC_VAL').AsCurrency    := IBNFItems.FieldByName('ICMSSTRET_BC_VAL').AsCurrency;
      IBTabela.ParamByName('ICMSSTRET_VAL').AsCurrency       := IBNFItems.FieldByName('ICMSSTRET_VAL').AsCurrency;
      IBTabela.ParamByName('ICMS_CRED_SN_PORC').AsCurrency   := IBNFItems.FieldByName('ICMS_CRED_SN_PORC').AsCurrency;
      IBTabela.ParamByName('ICMS_CRED_SN_VAL').AsCurrency    := IBNFItems.FieldByName('ICMS_CRED_SN_VAL').AsCurrency;

      IBTabela.ParamByName('IPI_CST').AsString       := IBNFItems.FieldByName('IPI_CST').AsString;
      IBTabela.ParamByName('IPI_CLENQ ').AsString    := IBNFItems.FieldByName('IPI_CLENQ').AsString;
      IBTabela.ParamByName('IPI_CNPJPROD').AsString  := IBNFItems.FieldByName('IPI_CNPJPROD').AsString;
      IBTabela.ParamByName('IPI_CSELO').AsString     := IBNFItems.FieldByName('IPI_CSELO').AsString;
      IBTabela.ParamByName('IPI_QSELO').AsString     := IBNFItems.FieldByName('IPI_QSELO').AsString;
      IBTabela.ParamByName('IPI_CENQ').AsString      := IBNFItems.FieldByName('IPI_CENQ').AsString;
      IBTabela.ParamByName('IPI_BC_VAL').AsCurrency  := IBNFItems.FieldByName('IPI_BC_VAL').AsCurrency;
      IBTabela.ParamByName('IPI_QUNID').AsCurrency   := IBNFItems.FieldByName('IPI_QUNID').AsCurrency;
      IBTabela.ParamByName('IPI_VALUNID').AsCurrency := IBNFItems.FieldByName('IPI_VALUNID').AsCurrency;
      IBTabela.ParamByName('IPI_VAL').AsCurrency     := edIPIVal.Value;

      IBTabela.ParamByName('II_BC_VAL').AsCurrency      := IBNFItems.FieldByName('II_BC_VAL').AsCurrency;
      IBTabela.ParamByName('II_DESPADU_VAL').AsCurrency := IBNFItems.FieldByName('II_DESPADU_VAL').AsCurrency;
      IBTabela.ParamByName('II_VAL').AsCurrency         := edIIVal.Value;
      IBTabela.ParamByName('II_IOF_VAL').AsCurrency     := IBNFItems.FieldByName('II_IOF_VAL').AsCurrency;

      IBTabela.ParamByName('PIS_CST').AsString       := IBNFItems.FieldByName('PIS_CST').AsString;
      IBTabela.ParamByName('PIS_BC_VAL').AsCurrency  := IBNFItems.FieldByName('PIS_BC_VAL').AsCurrency;
      IBTabela.ParamByName('PIS_PORC').AsCurrency    := IBNFItems.FieldByName('PIS_PORC').AsCurrency;
      IBTabela.ParamByName('PIS_VAL').AsCurrency     := IBNFItems.FieldByName('PIS_VAL').AsCurrency;

      IBTabela.ParamByName('PIS_QUANT_BCPROD').AsCurrency   := IBNFItems.FieldByName('PIS_QUANT_BCPROD').AsCurrency;
      IBTabela.ParamByName('PIS_ALIQPROD_VAL').AsCurrency   := IBNFItems.FieldByName('PIS_ALIQPROD_VAL').AsCurrency;
      IBTabela.ParamByName('PISST_BC_VAL').AsCurrency       := IBNFItems.FieldByName('PISST_BC_VAL').AsCurrency;
      IBTabela.ParamByName('PISST_PORC').AsCurrency         := IBNFItems.FieldByName('PISST_PORC').AsCurrency;
      IBTabela.ParamByName('PISST_QUANT_BCPROD').AsCurrency := IBNFItems.FieldByName('PISST_QUANT_BCPROD').AsCurrency;
      IBTabela.ParamByName('PISST_ALIQPROD_VAL').AsCurrency := IBNFItems.FieldByName('PISST_ALIQPROD_VAL').AsCurrency;
      IBTabela.ParamByName('PISST_VAL').AsCurrency          := IBNFItems.FieldByName('PISST_VAL').AsCurrency;

      IBTabela.ParamByName('COFINS_CST').AsString           := IBNFItems.FieldByName('COFINS_CST').AsString;
      IBTabela.ParamByName('COFINS_BC_VAL').AsCurrency      := IBNFItems.FieldByName('COFINS_BC_VAL').AsCurrency;
      IBTabela.ParamByName('COFINS_PORC').AsCurrency        := IBNFItems.FieldByName('COFINS_PORC').AsCurrency;
      IBTabela.ParamByName('COFINS_VAL').AsCurrency         := IBNFItems.FieldByName('COFINS_VAL').AsCurrency;
      IBTabela.ParamByName('COFINS_QUANT_BCPROD').AsCurrency:= IBNFItems.FieldByName('COFINS_QUANT_BCPROD').AsCurrency;
      IBTabela.ParamByName('COFINS_ALIQPROD_VAL').AsCurrency:= IBNFItems.FieldByName('COFINS_ALIQPROD_VAL').AsCurrency;

      IBTabela.ParamByName('COFINSST_BC_VAL').AsCurrency       := IBNFItems.FieldByName('COFINSST_BC_VAL').AsCurrency;
      IBTabela.ParamByName('COFINSST_PORC').AsCurrency         := IBNFItems.FieldByName('COFINSST_PORC').AsCurrency;
      IBTabela.ParamByName('COFINSST_QUANT_BCPROD').AsCurrency := IBNFItems.FieldByName('COFINSST_QUANT_BCPROD').AsCurrency;
      IBTabela.ParamByName('COFINSST_ALIQPROD_VAL').AsCurrency := IBNFItems.FieldByName('COFINSST_ALIQPROD_VAL').AsCurrency;
      IBTabela.ParamByName('COFINSST_VAL').AsCurrency          := IBNFItems.FieldByName('COFINSST_VAL').AsCurrency;

      IBTabela.ParamByName('ISSQN_BC_VAL').AsCurrency    := IBNFItems.FieldByName('ISSQN_BC_VAL').AsCurrency;
      IBTabela.ParamByName('ISSQN_ALIQ_VAL').AsCurrency  := IBNFItems.FieldByName('ISSQN_ALIQ_VAL').AsCurrency;
      IBTabela.ParamByName('ISSQN_VAL').AsCurrency       := IBNFItems.FieldByName('ISSQN_VAL').AsCurrency;
      IBTabela.ParamByName('ISSQN_CODMUN').AsString      := IBNFItems.FieldByName('ISSQN_CODMUN').AsString;
      IBTabela.ParamByName('ISSQN_CLISTSERV').AsString   := IBNFItems.FieldByName('ISSQN_CLISTSERV').AsString;
      IBTabela.ParamByName('ICMSST_VAL').AsCurrency      := edICMSSTVal.Value;

      if (not Vazio(edNMProduto.Text)) then
      begin
        if not Vazio(CodProdFornec) then CM.VinculaProdFornec(CodProdFornec, CodigoDoProduto, CodFornec, DataEntrada, CDNota);
        IBTabela.ParamByName('FLAG').AsString       := 'V';
        IBTabela.ParamByName('CONFERIDO').AsString  := 'V';
      end
      else
      begin
        IBTabela.ParamByName('FLAG').AsString       := IBNFItems.FieldByName('FLAG').AsString;
        IBTabela.ParamByName('CONFERIDO').AsString  := 'F';
      end;

      IBTabela.ExecSQL;
      IBTabela.IB_Transaction.Commit;
    except
      on E: exception do begin
        LogDeErros(E.Message);
        IBTabela.IB_Transaction.Rollback;
        MensagemDeErro('N�o foi poss�vel gravar este item.');
        exit;
      end;
    end;

    // Cria o v�nculo do C�digo do Produto do Fornecedor
    if Vazio(EditCodProdFornec.Text) then CodProdFornec := RegProduto.Cod_Barras
                                     else CodProdFornec := EditCodProdFornec.Text;
    if Vazio(CodProdFornec) then CodProdFornec := IntToStr(CodigoDoProduto);
  end;

end;

procedure TfDadosDoProduto.Bt_OkClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  Close;
end;

function TfDadosDoProduto.TrocaStringsSeVazia(De,Para:string):string;
begin
  if Vazio(De) then
    Result := Para
  else
    Result := De;
end;

procedure TfDadosDoProduto.MostraDados;
begin
  with DtM do begin
    LocalizaProduto(IBNFItems.FieldByName('CD_PRODUTO').AsInteger);
    LockPrecoVenda            := IBNFItems.FieldByName('LOCK_PRECOVENDA').AsString = 'V';
    EditCodProdFornec.Text    := IBNFItems.FieldByName('COD_PROD_FORNEC').AsString;
    edEXIPI.Value             := StrToInt(TrocaStringsSeVazia(IBNFItems.FieldByName('EXTIPI').AsString,'0'));
    edCFOP.Value              := StrToInt(TrocaStringsSeVazia(IBNFItems.FieldByName('CFOP').AsString,'0'));
    edQuantidade.Value        := IBNFItems.FieldByName('QUANTIDADE').AsCurrency;
    edValorUnitario.Value     := IBNFItems.FieldByName('VALORUNITARIO').AsCurrency;
    CustoMedioProd            := IBNFItems.FieldByName('CUSTOMEDIO').AsCurrency;
    CustoAtualProd            := edValorUnitario.Value;

    edFreteVal.Value          := IBNFItems.FieldByName('FRETE_VAL').AsCurrency;
    edSeguroVal.Value         := IBNFItems.FieldByName('SEGURO_VAL').AsCurrency;
    edDescontoVal.Value       := IBNFItems.FieldByName('DESCONTO_VAL').AsCurrency;
    edOutrosVal.Value         := IBNFItems.FieldByName('OUTROS_VAL').AsCurrency;
    edICMSSTVal.Value         := IBNFItems.FieldByName('ICMSST_VAL').AsCurrency;
    edIIVal.Value             := IBNFItems.FieldByName('II_VAL').AsCurrency;
    edIPIVal.Value            := IBNFItems.FieldByName('IPI_VAL').AsCurrency;

    edIPICST.Text             := IBNFItems.FieldByName('IPI_CST').AsString;
    edIPIClassEnq.Text        := IBNFItems.FieldByName('IPI_CLENQ').AsString;
    edIPICodEnq.Text          := IBNFItems.FieldByName('IPI_CENQ').AsString;
    edIPIQtdSelo.Text         := IBNFItems.FieldByName('IPI_QSELO').AsString;
    edIPICodSelo.Text         := IBNFItems.FieldByName('IPI_CSELO').AsString;
    edIPIBC.Value             := IBNFItems.FieldByName('IPI_BC_VAL').AsCurrency;
    edIPIPorc.Value           := IBNFItems.FieldByName('IPI_PORC').AsCurrency;
    edIPIValorUnit.Value      := IBNFItems.FieldByName('IPI_VALUNID').AsCurrency;
    edIPIValorTotal.Value     := IBNFItems.FieldByName('IPI_VAL').AsCurrency;

    edICMSCST.Text            := IBNFItems.FieldByName('ORIGEM').AsString + IBNFItems.FieldByName('ICMS_CST').AsString;
    edICMSBC.Value            := IBNFItems.FieldByName('ICMS_BC_VAL').AsCurrency;
    edICMSPorc.Value          := IBNFItems.FieldByName('ICMS_PORC').AsCurrency;
    edICMSValorTotal.Value    := IBNFItems.FieldByName('ICMS_VAL').AsCurrency;

    edICMSSTPorcMVA.Value     := IBNFItems.FieldByName('ICMSST_PMVA').AsCurrency;
    edICMSSTPorcRedBC.Value   := IBNFItems.FieldByName('ICMSST_PRED').AsCurrency;
    edICMSSTBC.Value          := IBNFItems.FieldByName('ICMSST_BC_VAL').AsCurrency;
    edICMSSTPorc.Value        := IBNFItems.FieldByName('ICMSST_PORC').AsCurrency;
    edICMSSTValorTotal.Value  := IBNFItems.FieldByName('ICMSST_VAL').AsCurrency;
    edICMSSTBCRetido.Value    := IBNFItems.FieldByName('ICMSSTRET_BC_VAL').AsCurrency;
    edICMSSTValorTotalRetido.Value := IBNFItems.FieldByName('ICMSSTRET_VAL').AsCurrency;

    edIIBC.Value              := IBNFItems.FieldByName('II_BC_VAL').AsCurrency;
    edIIValDespAduaneira.Value:= IBNFItems.FieldByName('II_DESPADU_VAL').AsCurrency;
    edIIValIOF.Value          := IBNFItems.FieldByName('II_IOF_VAL').AsCurrency;
    edIIValorTotal.Value      := IBNFItems.FieldByName('II_VAL').AsCurrency;

    edPISCST.Text             := IBNFItems.FieldByName('PIS_CST').AsString;
    edPISBC.Value             := IBNFItems.FieldByName('PIS_BC_VAL').AsCurrency;
    edPISPorc.Value           := IBNFItems.FieldByName('PIS_PORC').AsCurrency;
    edPISValorAliquota.Value  := IBNFItems.FieldByName('PIS_ALIQPROD_VAL').AsCurrency;
    edPISQtdVendida.Value     := IBNFItems.FieldByName('PIS_QUANT_BCPROD').AsCurrency;
    edPISValorTotal.Value     := IBNFItems.FieldByName('PIS_VAL').AsCurrency;

    edPISSTBC.Value           := IBNFItems.FieldByName('PISST_BC_VAL').AsCurrency;
    edPISSTPorc.Value         := IBNFItems.FieldByName('PISST_PORC').AsCurrency;
    edPISSTValorAliquota.Value:= IBNFItems.FieldByName('PISST_ALIQPROD_VAL').AsCurrency;
    edPISSTQtdVendida.Value   := IBNFItems.FieldByName('PISST_QUANT_BCPROD').AsCurrency;
    edPISSTValorTotal.Value   := IBNFItems.FieldByName('PISST_VAL').AsCurrency;

    edCOFINSCST.Text          := IBNFItems.FieldByName('COFINS_CST').AsString;
    edCOFINSBC.Value          := IBNFItems.FieldByName('COFINS_BC_VAL').AsCurrency;
    edCOFINSPorc.Value        := IBNFItems.FieldByName('COFINS_PORC').AsCurrency;
    edCOFINSAliquotaValor.Value:= IBNFItems.FieldByName('COFINS_ALIQPROD_VAL').AsCurrency;
    edCOFINSQtdVendida.Value  := IBNFItems.FieldByName('COFINS_QUANT_BCPROD').AsCurrency;
    edCOFINSValorTotal.Value  := IBNFItems.FieldByName('COFINS_VAL').AsCurrency;

    edCOFINSSTBC.Value        := IBNFItems.FieldByName('COFINSST_BC_VAL').AsCurrency;
    edCOFINSSTPorc.Value      := IBNFItems.FieldByName('COFINSST_PORC').AsCurrency;
    edCOFINSSTValorAliquota.Value:= IBNFItems.FieldByName('COFINSST_ALIQPROD_VAL').AsCurrency;
    edCOFINSSTQtdVendida.Value:= IBNFItems.FieldByName('COFINSST_QUANT_BCPROD').AsCurrency;
    edCOFINSSTValorTotal.Value:= IBNFItems.FieldByName('COFINSST_VAL').AsCurrency;

    MargemPreco.Margem2       := IBNFItems.FieldByName('MARGEM2').AsCurrency;
    MargemPreco.Margem3       := IBNFItems.FieldByName('MARGEM3').AsCurrency;
    MargemPreco.Margem4       := IBNFItems.FieldByName('MARGEM4').AsCurrency;
    MargemPreco.Margem5       := IBNFItems.FieldByName('MARGEM5').AsCurrency;
    MargemPreco.Preco2        := IBNFItems.FieldByName('PRECO2').AsCurrency;
    MargemPreco.Preco3        := IBNFItems.FieldByName('PRECO3').AsCurrency;
    MargemPreco.Preco4        := IBNFItems.FieldByName('PRECO4').AsCurrency;
    MargemPreco.Preco5        := IBNFItems.FieldByName('PRECO5').AsCurrency;

    edUndConversao.Value    := IBNFItems.FieldByName('UNDCONVERSAO').AsCurrency;
    edMargemLucro.Value     := IBNFItems.FieldByName('MARGEMLUCRO').AsCurrency;
    edPrecoVenda.Value      := IBNFItems.FieldByName('PRECOVENDA').AsCurrency;

    edFreteChegada.Value    := IBNFItems.FieldByName('FRETECHEGADA').AsCurrency;
    edFreteSaida.Value      := IBNFItems.FieldByName('FRETESAIDA').AsCurrency;
    CBAtualizaSimilares.Checked := IBNFItems.FieldByName('ATUALIZASIMILARES').AsString = 'V';
    edGrupo.Tag               := IBNFItems.FieldByName('CD_GRUPO').AsInteger;
    edGrupo.Text              := CM.StringGrupo(edGrupo.Tag);
    MemoObs.Lines.Assign(IBNFItemsINFOADPROD);

    edCodCaixa.Text      := IBNFItems.FieldByName('CX_COD_BARRA_CAIXA').AsString;
    edUndConvCaixa.Value := IBNFItems.FieldByName('CX_UNDCONVERSAO').AsCurrency;

    EditSequencial.Value   := IBNFItems.FieldByName('SEQUENCIAL').AsInteger;

    CBCaixaFechada.Checked := not Vazio(edCodCaixa.Text);
    CBCaixaFechada.OnClick(CBCaixaFechada);
    case StrToChar(IBNFItems.FieldByName('TIPOCUSTO').AsString, 'U') of
//      'U': rbCustoAtual.Checked := true;
      'M': cbUtilizaCustoMedio.Checked := true;
    end;
    CalculaCampos;
  end;
  cbUtilizaCustoMedio.Hint := 'Custo M�dio R$ ' + FormatCurr(',0.00',CustoMedioProd) + PL + 'Custo Atual R$ ' + FormatCurr(',0.00',CustoAtualProd);
end;

procedure TfDadosDoProduto.Bt_AnteriorClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  DtM.IBNFItems.Refresh;
  DtM.IBNFItems.Prior;
  CodItem := DtM.IBNFItems.FieldByname('CD_ITEM').AsString;
  MostraDados;
end;

procedure TfDadosDoProduto.bt_AuditEstoqueClick(Sender: TObject);
begin
  Application.CreateForm(TfTabela, fTabela);
  fTabela.Caption := 'Auditoria de Estoque - '+ lbCodigo.Caption+ ' - '+edNMProduto.Text;
  fTabela.ChaveEntrada := CodigoDoProduto;
  fTabela.MostrarOQue := mqAuditoriaEstoque;
  fTabela.ShowModal;
  fTabela.Free;
end;

procedure TfDadosDoProduto.Bt_ProximoClick(Sender: TObject);
begin
  if TemErro then Exit;
  GravaDados(false);
  DtM.IBNFItems.Refresh;
  DtM.IBNFItems.Next;
  CodItem := DtM.IBNFItems.FieldByname('CD_ITEM').AsString;
  MostraDados;
end;

procedure TfDadosDoProduto.Bt_UltimasComprasClick(Sender: TObject);
begin
  Application.CreateForm(TfTabela, fTabela);
  fTabela.Caption := '�ltimas Compras - '+ lbCodigo.Caption+ ' - '+edNMProduto.Text;
  fTabela.ChaveEntrada := CodigoDoProduto;
  fTabela.MostrarOQue := mqProdUltimasCompras;
  fTabela.ShowModal;
  fTabela.Free;
end;

procedure TfDadosDoProduto.bt_UltimasVendasClick(Sender: TObject);
begin
  Application.CreateForm(TfTabela, fTabela);
  fTabela.Caption := '�ltimas Vendas - '+ lbCodigo.Caption+ ' - '+edNMProduto.Text;
  fTabela.ChaveEntrada := CodigoDoProduto;
  fTabela.MostrarOQue := mqProdUltimasVendas;
  fTabela.ShowModal;
  fTabela.Free;
end;

procedure TfDadosDoProduto.bt_VendaMensalClick(Sender: TObject);
begin
  Application.CreateForm(TfTabela, fTabela);
  fTabela.Caption := 'Venda Mensal - '+ lbCodigo.Caption+ ' - '+edNMProduto.Text;
  fTabela.ChaveEntrada := CodigoDoProduto;
  fTabela.MostrarOQue := mqProdVendaMensal;
  fTabela.ShowModal;
  fTabela.Free;
end;

procedure TfDadosDoProduto.CalculaCampos;
var
  ValorUnitarioBruto      : Currency;
  RepresentacaoPercentual : Currency;

  NOTADesconto_UND        : Currency;
  NOTAFrete_UND           : Currency;
  NOTADespesas_UND        : Currency;
  NOTASeguro_UND          : Currency;
  NOTAST_UND              : Currency;
  NOTAII_UND              : Currency;
  NOTAIPI_UND             : Currency;

  TotalAcrescimos         : Currency;

  CustoMedioAtualizado    : Currency;
  Lucro                   : Currency;

  EstoquePositivo         : Currency;
begin
  edValorTotal.Value := (edValorUnitario.Value * edQuantidade.Value);
  edQuantTotal.Value := edQuantidade.Value * edUndConversao.Value;
  if edUndConversao.Value > 0 then ValorUnitarioBruto := edValorUnitario.Value / edUndConversao.Value
                              else ValorUnitarioBruto := 0;

  RepresentacaoPercentual := (edValorTotal.Value * 100) / (DtM.IbNF.FieldByName('VR_TOTAL_PROD').AsCurrency * 1);

  if (edUndConversao.Value > 0) and (edQuantidade.Value > 0) then
  begin
    NOTADesconto_UND   := DtM.IBNFItems.FieldByName('DESCONTO_VAL').AsCurrency / edQuantTotal.Value;
    NOTAFrete_UND      := DtM.IBNFItems.FieldByName('FRETE_VAL').AsCurrency / edQuantTotal.Value;
    NOTADespesas_UND   := DtM.IBNFItems.FieldByName('OUTROS_VAL').AsCurrency / edQuantTotal.Value;
    NOTASeguro_UND     := DtM.IBNFItems.FieldByName('SEGURO_VAL').AsCurrency / edQuantTotal.Value;
    NOTAST_UND         := DtM.IBNFItems.FieldByName('ICMSST_VAL').AsCurrency / edQuantTotal.Value;
    NOTAII_UND         := DtM.IBNFItems.FieldByName('II_VAL').AsCurrency / edQuantTotal.Value;
    NOTAIPI_UND        := DtM.IBNFItems.FieldByName('IPI_VAL').AsCurrency / edQuantTotal.Value;

    TotalAcrescimos := NOTADespesas_UND
                     + NOTASeguro_UND
                     + NOTAFrete_UND
                     - NOTADesconto_UND
                     + NOTAST_UND
                     + NOTAII_UND
                     + NOTAIPI_UND;

    edTotalAcrescimos.Value := TotalAcrescimos;
    edCustoUnitario.Value := ValorUnitarioBruto + TotalAcrescimos;
  end;

  EstoquePositivo := edEstoqueAtual.Value + edQuantTotal.Value;     // Estoque + Quantidade
  if EstoquePositivo < 1 then EstoquePositivo := 1;
  if edQuantTotal.Value > 0 then
  begin
    CustoMedioAtualizado := ((CustoMedio * edEstoqueAtual.Value)
                            + (edCustoUnitario.Value * edQuantTotal.Value))
                            / (EstoquePositivo);
  end
  else begin
    CustoMedioAtualizado := CustoMedio;
  end;

  CustoAtualProd := edCustoUnitario.Value;
  CustoMedioProd := CustoMedioAtualizado;

  if cbUtilizaCustoMedio.Checked then edPrecoCusto.Value := CustoMedioProd else edPrecoCusto.Value := CustoAtualProd;

  if edPrecoCusto.Value > 0 then
  begin
    if not LockPrecoVenda then
      edPrecoVenda.Value := edPrecoCusto.Value + ((edPrecoCusto.Value * edMargemLucro.Value)/100)
    else begin
      Lucro := edPrecoVenda.Value - edPrecoCusto.Value;
      edMargemLucro.Value := (100 * Lucro) / edPrecoCusto.Value;
    end;
  end;

  if LockPrecoVenda then edPrecoVenda.Font.Color := clBlue
                    else edPrecoVenda.Font.Color := clWindowText;
end;

procedure TfDadosDoProduto.EditCSTExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfDadosDoProduto.edMargemLucroExit(Sender: TObject);
begin
  if (edMargemLucro.Value <> ENT_Margem) and (Sender = edMargemLucro) then
    LockPrecoVenda := false;

  CalculaCampos;
end;

procedure TfDadosDoProduto.edPrecoVendaExit(Sender: TObject);
var
  Lucro : real;
begin
  if edPrecoCusto.Value > 0 then
  begin
    Lucro := edPrecoVenda.Value - edPrecoCusto.Value;
    edMargemLucro.Value := (100 * Lucro) / edPrecoCusto.Value;
  end;

  if (edPrecoVenda.Value <> ENT_PrecoVenda) and (Sender = edPrecoVenda) then
    LockPrecoVenda := true;

  CalculaCampos;
end;

procedure TfDadosDoProduto.edQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfDadosDoProduto.edIPIPorcExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfDadosDoProduto.CBCaixaFechadaClick(Sender: TObject);
begin
  if CBCaixaFechada.Checked then
  begin
    LigaComponente(self, Label29);
    LigaComponente(self, Label31);
    LigaComponente(self, edCodCaixa);
    LigaComponente(self, edUndConvCaixa);
  end
  else begin
    DesligaComponente(self, Label29);
    DesligaComponente(self, Label31);
    DesligaComponente(self, edCodCaixa);
    DesligaComponente(self, edUndConvCaixa);
  end;
end;

procedure TfDadosDoProduto.cbUtilizaCustoMedioClick(Sender: TObject);
begin
  VerificaTipoCusto;
end;

procedure TfDadosDoProduto.DesligaEsteComp(Sender: TObject);
begin
       if (Sender = edUndConversao)   then begin TJvCalcEdit(Sender as TControl).Value := 1; {*} DesligaComponente(self, LabelUndConversao); end
  else if (Sender = edIPIPorc)        then begin TJvCalcEdit(Sender as TControl).Value := 0; {*} DesligaComponente(self, LabelIPIPorc); edIPIValorUnit.Color:=clBtnFace; edIPIValorTotal.Color:=clBtnFace; edIPIValorUnit.Font.Color:=clGrayText; edIPIValorTotal.Font.Color:=clGrayText; end;
  DesligaComponente(self, Sender, true, clBtnFace, clGrayText, false, 100);
end;

procedure TfDadosDoProduto.LigaEsteComp(Sender: TObject);
begin
       if (Sender = edUndConversao)     then begin LigaComponente(self, LabelUndConversao); end
  else if (Sender = edIPIPorc)          then begin LigaComponente(self, LabelIPIPorc); edIPIValorUnit.Color:=clMoneyGreen; edIPIValorTotal.Color:=clMoneyGreen; edIPIValorUnit.Font.Color:=clMaroon; edIPIValorTotal.Font.Color:=clMaroon; end;

  LigaComponente(self, Sender, true, clWindow, clWindowText, 111);

  try
    TCustomEdit(Sender as TControl).SetFocus;
    TCustomEdit(Sender as TControl).SelectAll;
  except
  end;  
end;

procedure TfDadosDoProduto.MenuLigaClick(Sender: TObject);
begin
  LigaEsteComp(CompSender);
end;

procedure TfDadosDoProduto.MenuDesligaClick(Sender: TObject);
begin
  DesligaEsteComp(CompSender);
end;

procedure TfDadosDoProduto.PopupMenuPopup(Sender: TObject);
begin
  MenuLiga.Enabled    := (CompSender as TControl).Tag = 100;
  MenuDesliga.Enabled := (CompSender as TControl).Tag = 111;
end;

procedure TfDadosDoProduto.LabelCOFINSSTValorAliquotaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt : TPoint;
  NaoPode : boolean;
begin
  NaoPode := false;
  if Button = mbRight then
  begin
         if ((Sender = edIPIPorc) or (Sender = LabelIPIPorc) or (Sender = LabelIPIValorUnit) or (Sender = LabelIPIValorTotal) or (Sender = edIPIValorUnit) or (Sender = edIPIValorTotal)) then CompSender := edIPIPorc
    else if ((Sender = edUndConversao) or (Sender = LabelUndConversao)) then CompSender := edUndConversao;

    if not NaoPode then
    begin
      GetCursorPos(pt);
      PopUpMenu.Popup(pt.X , pt.Y);
    end;
  end;
end;

procedure TfDadosDoProduto.GravaEstadoLigadoDesligado;
begin
  SalvaIntegerNoRegistro(ChaveDoRegistro, edIPIPorc.Name,        edIPIPorc.Tag);
  SalvaIntegerNoRegistro(ChaveDoRegistro, edUndConversao.Name,   edUndConversao.Tag);
end;

procedure TfDadosDoProduto.AjustaEstadoDoComponente(aeComponente:TObject);
var
  T : word;
  Nome : String;
begin
  Nome := (aeComponente as TControl).Name;
  T := LeIntegerDoRegistro(ChaveDoRegistro, Nome, 111);
  (aeComponente as TControl).Tag := T;
  if (aeComponente as TControl).Tag = 100 then DesligaEsteComp(aeComponente)
                                          else LigaEsteComp(aeComponente);
end;

procedure TfDadosDoProduto.CarregaEstadoLigadoDesligado;
begin
//  AjustaEstadoDoComponente(edIPIPorc);
  AjustaEstadoDoComponente(edUndConversao);
end;

procedure TfDadosDoProduto.FormCreate(Sender: TObject);
begin
  ChaveDoRegistro := RegChaveForms+EstaChave;
  ModoEntrada := mdCompleto;
  TamGroupBox := PanelFinanceiro.Height;
  TamForm := Height;
  ImpDespVisivel := true;
  btLigaImpDesp.Left := 0;
  btLigaImpDesp.Top := 0;
  btLigaImpDesp.Height := PanelLigaImpDesp.Height;
  btLigaImpDesp.Width := PanelLigaImpDesp.Width;

  edNMProdutoChange(self);
  AturaDoForm := Height;

  with CM do
  begin
    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select first 1 PROD_MARGEMPADRAO, PROD_MARGEM2PADRAO, PROD_MARGEM3PADRAO, PROD_MARGEM4PADRAO, PROD_MARGEM5PADRAO from CONFIG_CADASTRO');
    IBTabela.Active := true;
    MargemPadrao  := IBTabela.FieldByName('PROD_MARGEMPADRAO').AsCurrency;
    Margem2Padrao := IBTabela.FieldByName('PROD_MARGEM2PADRAO').AsCurrency;
    Margem3Padrao := IBTabela.FieldByName('PROD_MARGEM3PADRAO').AsCurrency;
    Margem4Padrao := IBTabela.FieldByName('PROD_MARGEM4PADRAO').AsCurrency;
    Margem5Padrao := IBTabela.FieldByName('PROD_MARGEM5PADRAO').AsCurrency;
    fDB.FechaTT(IBTabela);
  end;
end;

procedure TfDadosDoProduto.EscondeExibePanelInforme(eeVisivel:boolean);
begin
  if eeVisivel then
  begin
    PanelInforme.Color  := clBtnFace;
    PanelInforme.Left   := 0;
    PanelInforme.Top    := GroupBoxProduto.Top + Bt_Pesquisar.Top + Bt_Pesquisar.Height + 1;
    PanelInforme.Width  := Width;
    PanelInforme.Height := Height - PanelInforme.Top - Panel1.Height - Panel1.Height - 5;

    lbInforme.Width := Width;
    lbInforme.Top := (PanelInforme.Height div 2) - (lbInforme.Height div 2);

    PanelInforme2.Color := clBtnFace;
    PanelInforme2.Top := 0;
    PanelInforme2.Left := GroupBoxProduto.Left +  Bt_Pesquisar.Left + Bt_Pesquisar.Width + 1;
    PanelInforme2.Height := PanelInforme2.Top + PanelInforme.Top + 2;
    PanelInforme2.Width := Width - PanelInforme2.Left;
  end;
  PanelInforme.Visible := eeVisivel;
  PanelInforme2.Visible := eeVisivel;
end;

procedure TfDadosDoProduto.FormShow(Sender: TObject);
begin
  FornecedorVinculado := DtM.IBNF.FieldByName('CD_FORNECEDOR').AsInteger;
  if (CodItemPedidoCompra <> CodigoVazio) or (Modo = mdAlteracao) then edQuantidade.SetFocus;

  if Modo = mdAlteracao then
  begin
    PanelItem.Visible := true;
    Bt_Incluir.Visible := false;
    Bt_Ok.Visible := true;

    EscondeExibePanelInforme(false);
  end
  else begin
    PanelItem.Visible := false;
    Bt_Incluir.Visible := true;
    Bt_Ok.Visible := false;
  end;

  LigaDesligaImpDesp;
  case ModoEntrada of
    mdCadastro :
    begin
      PanelFinanceiro.Visible := false;
      Height := TamForm - PanelFinanceiro.Height;
    end;
    mdCompleto :
    begin
      Height := TamForm;
      PanelFinanceiro.Visible := true;
    end;
  end;

  CarregaEstadoLigadoDesligado;
  ImpDespVisivel := LeBooleanDoRegistro(ChaveDoRegistro, 'ImpostosDespesas', true);
  LigaDesligaImpDesp;
  EditCodProdFornec.SetFocus;
  edQuantTotal.Height := 1;

  DetonaXPManifest(self);
  edNMProdutoChange(self);

  Screen.Cursor := crDefault;
  FechaAviso;
end;

procedure TfDadosDoProduto.LimpaDados;
begin
  lbCodigo.Caption := '';
  lbNMProduto.Caption := '';
  lbUltimoReajuste.Caption := '';
  lbFabricante.Caption := '';
  edGrupo.Text := '';
  lbUltimaCompra.Caption := '';
  lbUltimaVenda.Caption := '';
  lbUnidade.Caption := '';
  edEstoqueMinimo.Value := 0;
  edEstoqueAtual.Value := 0;
  lbPesoLiquido.Caption := '';
  lbPesoBruto.Caption := '';
  MemoObsProduto.Clear;
end;

procedure TfDadosDoProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaEstadoLigadoDesligado;
  SalvaBooleanNoRegistro(ChaveDoRegistro, 'ImpostosDespesas', ImpDespVisivel);
end;

procedure TfDadosDoProduto.JvDBRadioPanel1Change(Sender: TObject);
begin
  VerificaTipoCusto;
end;

procedure TfDadosDoProduto.edCustoUnitarioChange(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfDadosDoProduto.edFreteChegadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfDadosDoProduto.edFreteSaidaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfDadosDoProduto.rbCustoMedioClick(Sender: TObject);
begin
  VerificaTipoCusto;
end;

procedure TfDadosDoProduto.rbCustoAtualClick(Sender: TObject);
begin
  VerificaTipoCusto;
end;

procedure TfDadosDoProduto.edPrecoVendaEnter(Sender: TObject);
begin
  ENT_PrecoVenda := edPrecoVenda.Value;
end;

procedure TfDadosDoProduto.edMargemLucroEnter(Sender: TObject);
begin
  ENT_Margem := edMargemLucro.Value;
end;

procedure TfDadosDoProduto.edNMProdutoChange(Sender: TObject);
begin
  lbNMProduto.Caption := edNMProduto.Text;
  if Vazio(edNMProduto.Text) then
  begin
    LimpaDados;
    Bt_UltimasCompras.Enabled := false;
    Bt_UltimasVendas.Enabled  := false;
    Bt_VendaMensal.Enabled    := false;
    bt_AuditEstoque.Enabled   := false;
    btAlterarProduto.Visible  := false;
    lbCapCodigo.Visible       := false;
    btGrade.Enabled           := false;
    btNumSerie.Enabled        := false;
    EscondeExibePanelInforme(true);
  end
  else begin
    Bt_UltimasCompras.Enabled := true;
    Bt_UltimasVendas.Enabled  := true;
    Bt_VendaMensal.Enabled    := true;
    bt_AuditEstoque.Enabled   := true;
    btAlterarProduto.Visible  := true;
    lbCapCodigo.Visible       := true;
    btGrade.Enabled           := true;
    btNumSerie.Enabled        := true;
    EscondeExibePanelInforme(false);
  end;
end;

procedure TfDadosDoProduto.btCadastrarProdutoClick(Sender: TObject);
begin
  CodigoDoProduto := 0;
  Application.CreateForm(TfNovoProduto, fNovoProduto);
  fNovoProduto.ShowModal;
  if fNovoProduto.BotaoPressionado = bpOk then
    CodigoDoProduto := fNovoProduto.NovoRegistro;
  FreeAndNil(fNovoProduto);

  if CodigoDoProduto > 0 then
  begin
    LocalizaProduto(CodigoDoProduto);
    edQuantidade.SetFocus;
  end;
end;

procedure TfDadosDoProduto.btAlterarProdutoClick(Sender: TObject);
begin
  if not Vazio(edNMProduto.Text) then
  begin
    Application.CreateForm(TfCadProdutos, fCadProdutos);
    AbreCad.EntraNaAlteracao := CodigoDoProduto;
    fCadProdutos.ShowModal;
    if fCadProdutos.BotaoPressionado = bpOk then
      CodigoDoProduto := ItemEsc.CodInt;
    FreeAndNil(fCadProdutos);
    LocalizaProduto(CodigoDoProduto);
  end;
end;

procedure TfDadosDoProduto.btGradeClick(Sender: TObject);
begin
  if (CodigoDoProduto <= 0) then Exit;
  Application.CreateForm(TfEntradaGrades, fEntradaGrades);
  fEntradaGrades.CodProduto := CodigoDoProduto;
  fEntradaGrades.CdNota     := CDNOTA;
  fEntradaGrades.CodGrupo   := edGrupo.Tag;
  fEntradaGrades.ShowModal;
  FreeAndNil(fEntradaGrades);
end;

procedure TfDadosDoProduto.btNumSerieClick(Sender: TObject);
begin
  if (CodigoDoProduto <= 0) then Exit;
  Application.CreateForm(TfEntradaNumSerie, fEntradaNumSerie);
  fEntradaNumSerie.Cd_Produto := CodigoDoProduto;
  fEntradaNumSerie.Cd_Nota    := CDNOTA;
  fEntradaNumSerie.lbCodProduto.Caption  := lbCodigo.Caption;
  fEntradaNumSerie.lbNomeProduto.Caption := lbNMProduto.Caption;
  fEntradaNumSerie.QuantidadeEsperada    := trunc(edQuantidade.Value * edUndConversao.Value);
  fEntradaNumSerie.ShowModal;
  if edQuantidade.Value = 0 then
  begin
    if edUndConversao.Value < 1 then edUndConversao.Value := 1;
    edQuantidade.Value := (fEntradaNumSerie.QuantidadeTotal / edUndConversao.Value);
  end;
  FreeAndNil(fEntradaNumSerie);
end;

procedure TfDadosDoProduto.edQuantidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key in [vk_Return, vk_Tab] then
    if CM.TemGrades(CodigoDoProduto) and ((edQuantidade.Value = 0) or ((edQuantidade.Value * edUndConversao.Value) <> DtM.QuantidadeNFGrade(CodigoDoProduto, CDNota))) then
      btGrade.Click;
end;

procedure TfDadosDoProduto.BitBtn1Click(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgCadGrupos, 'L') then Exit;
  Application.CreateForm(TfCadGruposProdutos, fCadGruposProdutos);
  fCadGruposProdutos.CD_GRUPO := edGrupo.Tag;
  fCadGruposProdutos.ModoCadastro := true;
  fCadGruposProdutos.ShowModal;
  if fCadGruposProdutos.BotaoPressionado = bpOk then
  begin
    edGrupo.Tag := fCadGruposProdutos.CD_GRUPO;
    edGrupo.Text := CM.StringGrupo(edGrupo.Tag);
  end;
  FreeAndNil(fCadGruposProdutos);
end;

procedure TfDadosDoProduto.edGrupoKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    BitBtn1.Click;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfDadosDoProduto.btAlteraEstoqueClick(Sender: TObject);
begin
  CM.AlteraEstoque(CodigoDoProduto);
  edEstoqueAtual.Value := CM.PegaEstoque(CodigoDoProduto);
end;

procedure TfDadosDoProduto.edQuantidadeExit(Sender: TObject);
begin
  CalculaCampos;
end;

procedure TfDadosDoProduto.edQuantidadeChange(Sender: TObject);
begin
  edQuantidade2.Value := edQuantidade.Value;
end;

procedure TfDadosDoProduto.LigaDesligaImpDesp;
begin
  PanelImpDesp.Visible := ImpDespVisivel;

  PanelImpDesp.Align := alCustom;
  PanelImpDesp.Top   := 29;
  PanelImpDesp.Align := alTop;

  PanelFinanceiro.Height := TamGroupBox;
  Height := TamForm;

  if not PanelImpDesp.Visible then
  begin
    PanelFinanceiro.Height := PanelFinanceiro.Height - PanelImpDesp.Height;
    Height := Height - PanelImpDesp.Height;
  end;

  edNMProdutoChange(self);
end;

procedure TfDadosDoProduto.btLigaImpDespClick(Sender: TObject);
begin
  ImpDespVisivel := not ImpDespVisivel;

  LigaDesligaImpDesp;
end;

procedure TfDadosDoProduto.btMedicamentoClick(Sender: TObject);
begin
  Application.CreateForm(TFLotesItems, FLotesItems);
  FLotesItems.ShowModal;
  if (DtM.IBNFLotesItems.RecordCount > 0) and (FLotesItems.ValorMax < edPrecoVenda.Value) then
  begin
    MensagemDeAtencao('Pre�o M�ximo ao Consumidor (R$ '+FormatCurr(',0.00',FLotesItems.ValorMax)+') Menor do que o Pre�o de Venda! Verifique');
    edPrecoVenda.SetFocus;
    edPrecoVenda.SelectAll;
  end;
  FreeAndNil(FLotesItems);

end;

procedure TfDadosDoProduto.FormResize(Sender: TObject);
begin
  edNMProdutoChange(self);
end;

end.
