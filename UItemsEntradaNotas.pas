//ok
unit UItemsEntradaNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DUtilit,
  IBODataSet, UDataMod, Grids, Wwdbigrd, Wwdbgrid, UComp, DB, UComum, JvExMask,
  JvToolEdit, JvBaseEdits, JvDBControls, IB_Components, ComCtrls, IB_Access,
  rxToolEdit, rxCurrEdit, RXDBCtrl, UConstVar, MessageFunctions, ACBrUtil;

const
   EstaChave = '\EntradaNotasItems';
   NomeDaTabela = 'ENTRADA';
   ChavePrimaria = 'CD_NOTA';

type
  TTipoAtualizacao = (taAlteraMargem, taAlteraPreco);

  TfEntradaNotasItems = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Bt_Sair: TBitBtn;
    Bt_ConcluirNota: TBitBtn;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Label40: TLabel;
    DBEdit16: TDBEdit;
    Label39: TLabel;
    DBEdit15: TDBEdit;
    bt_ImportarPedido: TBitBtn;
    Panel3: TPanel;
    Bt_IncluirItem: TBitBtn;
    Bt_ExcluirItem: TBitBtn;
    Bt_AlterarItem: TBitBtn;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    EditTotal: TJvCalcEdit;
    RxDBCalcEdit5: TRxDBCalcEdit;
    DBEditPrecoVenda: TRxDBCalcEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    RxDBCalcEdit3: TRxDBCalcEdit;
    RxDBCalcEdit6: TRxDBCalcEdit;
    RxDBCalcEdit7: TRxDBCalcEdit;
    RxDBCalcEdit8: TRxDBCalcEdit;
    RxDBCalcEdit4: TRxDBCalcEdit;
    RxDBCalcEdit9: TRxDBCalcEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    SPAlteraEstoque: TIB_StoredProc;
    PanelObsNota: TPanel;
    PanelObsFornec: TPanel;
    DBEdit3: TDBEdit;
    edObsFornec: TEdit;
    PageControl1: TPageControl;
    TabFinanceiro: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    GroupBox5: TGroupBox;
    DBEdit6: TDBEdit;
    GroupBox8: TGroupBox;
    Label1: TLabel;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    RxDBCalcEdit11: TRxDBCalcEdit;
    Label19: TLabel;
    RxDBCalcEdit12: TRxDBCalcEdit;
    Label20: TLabel;
    RxDBCalcEdit13: TRxDBCalcEdit;
    RxDBCalcEdit10: TRxDBCalcEdit;
    Label18: TLabel;
    GroupBox7: TGroupBox;
    DBEdit8: TDBEdit;
    Panel8: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    procedure Bt_SairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_IncluirItemClick(Sender: TObject);
    procedure Bt_ExcluirItemClick(Sender: TObject);
    procedure Bt_AlterarItemClick(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure Bt_ConcluirNotaClick(Sender: TObject);
    procedure DBEditPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure bt_ImportarPedidoClick(Sender: TObject);
    procedure RxDBCalcEdit5Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edObsFornecEnter(Sender: TObject);
    procedure edObsFornecExit(Sender: TObject);
    procedure edObsFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
  private
    TipoAtualizacao : TTipoAtualizacao;
    ChaveDoRegistro : String;
    procedure Filtra;
    procedure LocalizaFornecedor(lfCodigoDoFornecedor: Integer);
    procedure AtualizaItems;
    procedure SomaTotalDaNota;
    procedure PegaItensXML;
    function LocalizaCD_Produto(Cod: string = ''; Cod_Barras: string = ''; Nome: String = ''): String;
    procedure DefineParametrosItens;
    procedure DefineParametrosItensImportacao;
    procedure DefineParametrosItensImpLacre;
    procedure DefineParametrosItensMed;
    procedure MontaSQL_Ins_Ent_Item;
    procedure MontaSQL_Ins_Ent_Item_Imp;
    procedure MontaSQL_Ins_Ent_Item_Imp_Lacres;
    procedure MontaSQL_Ins_Ent_Item_Med;
    procedure ExecutaECommita(Query: TIB_Query);
    function GetCodFornecedor(CNPJ, NOME: string): Integer;
    function Get_CD_PRODUTO_Vinculo(cd_Fornec: Integer; cd_prod_fornec: string): Integer;
    function Get_CD_PRODUTO_Cadastrado(cd_EAN: string): Integer;
    procedure AtualizaItemsXML(CD_Produto: Integer);
    function Get_Info_Produtos(Campo: string; cd_Produto: Integer; Val_Padrao:string = ''): string; overload;
    function Get_Info_Produtos(Campo: string; cd_Produto: Integer; Val_Padrao: Currency = 0): Currency; overload;
    function Get_EstoqueAtual(cd_Prod: Integer): Currency;
    function Get_CustoMedio(EstoqueAtual, CustoAnt, QuantEnt, vUnEnt: Currency;
      Arredonda: Boolean = False; CasasDecimais: Integer = 2): Currency;
    procedure Executa(Query: TIB_Query);
  public
    CD_NOTA   : Integer;
    Modo      : TModos;
  end;

var
  fEntradaNotasItems: TfEntradaNotasItems;
  AbriuAgora : boolean;
  I, J, K: Integer;

implementation

uses UDadosProduto, USelecPedidoCompra, UConcluiNota, UNovaEntradaNotas,
      UModUsuarios, DBFunctions, UNovaContaAPagar, UNFAlteracao,  UConsultaListaNotas, pcnConversao,
      UModPesquisa;

{$R *.dfm}

function TfEntradaNotasItems.LocalizaCD_Produto(Cod: string = ''; Cod_Barras: string = ''; Nome: String = ''):String;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := '';
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
    with IBQ do
    begin
      Active := false;
      SQL.Clear;
      if (Cod_Barras <> '') and (Result = '') then
      begin
        SQL.Add('SELECT COD_BARRAS');
        SQL.Add('FROM PRODUTOS');
        SQL.Add('WHERE (CD_PRODUTO = '+QuotedStr(Cod_Barras)+') or (CODIGO02 = '+QuotedStr(Cod_Barras)+') or ');
        SQL.Add('(CODIGO03 = '+QuotedStr(Cod_Barras)+') or (CODIGO04 = '+QuotedStr(Cod_Barras)+') or (COD_BARRAS = '+QuotedStr(Cod_Barras)+')');
        if not Prepared then Prepare;
        Active := True;
        if RecordCount > 0 then
          Result := FieldByName('COD_BARRAS').AsString;
      end
      else
      if (Cod <> '') and (Result = '') then
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('SELECT COD_BARRAS');
        SQL.Add('FROM PRODUTOS');
        SQL.Add('WHERE (CD_PRODUTO = '+QuotedStr(Cod)+') or (CODIGO02 = '+QuotedStr(Cod)+') or ');
        SQL.Add('(CODIGO03 = '+QuotedStr(Cod)+') or (CODIGO04 = '+QuotedStr(Cod)+') or (COD_BARRAS = '+QuotedStr(Cod)+')');
        if not Prepared then Prepare;
        Active := True;
        if RecordCount > 0 then
          Result := FieldByName('COD_BARRAS').AsString;
      end
      else
      if (Nome <> '') and (Result = '') then
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('SELECT COD_BARRAS');
        SQL.Add('FROM PRODUTOS');
        SQL.Add('WHERE (NM_PRODUTO LIKE ' + QuotedStr('%'+ Nome +'%') +') AND INATIVO = ''F''');
        if not Prepared then Prepare;
        Active := True;
        if RecordCount > 0 then
          Result := FieldByName('COD_BARRAS').AsString;
      end;
    end;
  finally
    fDB.FreeQueryTransacao(IBQ,IBT);
  end;
end;

procedure TfEntradaNotasItems.DefineParametrosItens;
var
  Flag_Item: string;
  CD_PRODUTO: integer;
  Qtd_Total: Currency;
begin
  with DtM.IBTabela2, fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Det.Items[I] do
  begin
    ParamByName('CD_NOTA').AsInteger         := CD_NOTA;
    ParamByName('CD_ITEM').AsInteger         := fDB.GetValorDoGenerator(DtM.IBDatabaseServer,'GEN_ENTRADA_ITEM');

    ParamByName('CD_PRODUTO').AsInteger      := Get_CD_PRODUTO_Vinculo(GetCodFornecedor(
                                                fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Emit.CNPJCPF,
                                                fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Emit.xNome),
                                                Prod.cProd);
    //se n�o estiver vinculado verifico se est� cadastrado
    if ParamByName('CD_PRODUTO').AsInteger = 0 then
    begin
      ParamByName('CD_PRODUTO').AsInteger    := Get_CD_PRODUTO_Cadastrado(Prod.cEAN);
      if Get_CD_PRODUTO_Cadastrado(Prod.cEAN) <> 0 then
        Flag_Item := ixCadastrado
      else
        Flag_Item := ixNaoCadastrado;
    end
    else
      Flag_Item := ixVinculado;
    ParamByName('FLAG').AsString := Flag_Item;

    CD_PRODUTO  := ParamByName('CD_PRODUTO').AsInteger;

    ParamByName('COD_PROD_FORNEC').AsString  := Prod.cProd;
    ParamByName('QUANTIDADE').AsCurrency        := Prod.qCom;
    ParamByName('VALORUNITARIO').AsCurrency  := Prod.vUnCom + ArredondaReal((Prod.vUnCom * ( fEntradasDeNotas.Margem_Adicional_Item / 100)),2);

    if UpperCase(Prod.uCom) = 'CX' then
    begin
      ParamByName('CX_COD_BARRA_CAIXA').AsString  := Prod.cEAN;
      ParamByName('CX_VALORCAIXA').AsCurrency     := Prod.vUnCom + ArredondaReal((Prod.vUnCom * ( fEntradasDeNotas.Margem_Adicional_Item / 100)),2);
      ParamByName('CX_UNDCONVERSAO').AsCurrency   := Get_Info_Produtos('CX_UNDCONVERSAO',CD_PRODUTO,1);
    end
    else
    begin
      ParamByName('CX_COD_BARRA_CAIXA').AsString  := Get_Info_Produtos('CX_COD_BARRA_CAIXA',CD_PRODUTO,'');
      ParamByName('CX_VALORCAIXA').AsString       := '0';
      ParamByName('CX_UNDCONVERSAO').AsCurrency   := 0;
    end;
    ParamByName('SEQUENCIAL').AsInteger       := Prod.nItem;
    ParamByName('VALORTOTAL').AsCurrency      := Prod.vProd + ArredondaReal((Prod.vProd * ( fEntradasDeNotas.Margem_Adicional_Item / 100)),2);
    ParamByName('UNDCONVERSAO').AsCurrency    := Get_Info_Produtos('UNDCONVERSAOENTRADA',CD_PRODUTO,1);
    ParamByName('MARGEMLUCRO').AsCurrency     := Get_Info_Produtos('MARGEM' ,CD_PRODUTO,0);
    ParamByName('MARGEM2').AsCurrency         := Get_Info_Produtos('MARGEM2',CD_PRODUTO,0);
    ParamByName('MARGEM3').AsCurrency         := Get_Info_Produtos('MARGEM3',CD_PRODUTO,0);
    ParamByName('MARGEM4').AsCurrency         := Get_Info_Produtos('MARGEM4',CD_PRODUTO,0);
    ParamByName('MARGEM5').AsCurrency         := Get_Info_Produtos('MARGEM5',CD_PRODUTO,0);

    ParamByName('PRECOVENDA').AsCurrency      := Get_Info_Produtos('PRECOVENDA' ,CD_PRODUTO,0);

    ParamByName('FRETE_VAL').AsCurrency       := Prod.vFrete;
    ParamByName('SEGURO_VAL').AsCurrency      := Prod.vSeg;
    ParamByName('DESCONTO_VAL').AsCurrency    := Prod.vDesc;
    ParamByName('OUTROS_VAL').AsCurrency      := Prod.vOutro;

    ParamByName('ORIGEM').AsString             := OrigToStr(Imposto.ICMS.orig);
    ParamByName('ICMS_CST').AsString           := CSTICMSToStr(Imposto.ICMS.CST);
    ParamByName('ICMS_MODBC').AsString         := modBCToStr(Imposto.ICMS.modBC);
    ParamByName('PREDBCST').AsCurrency         := Imposto.ICMS.pRedBC;
    ParamByName('ICMS_BC_VAL').AsCurrency      := Imposto.ICMS.vBC;
    ParamByName('ICMS_VAL').AsCurrency         := Imposto.ICMS.vICMS;
    ParamByName('ICMS_PORC').AsCurrency        := Imposto.ICMS.pICMS;
    ParamByName('ICMSST_MODBC').AsString       := modBCSTToStr(Imposto.ICMS.modBCST);
    ParamByName('ICMSST_PMVA').AsCurrency      := Imposto.ICMS.pMVAST;
    ParamByName('ICMSST_PRED').AsCurrency      := Imposto.ICMS.pRedBCST;
    ParamByName('ICMSST_BC_VAL').AsCurrency    := Imposto.ICMS.vBCST;
    ParamByName('ICMSST_PORC').AsCurrency      := Imposto.ICMS.pICMSST;
    ParamByName('ICMSST_VAL').AsCurrency       := Imposto.ICMS.vICMSST;
    ParamByName('ICMSSTRET_BC_VAL').AsCurrency := Imposto.ICMS.vBCSTRet;
    ParamByName('ICMSSTRET_VAL').AsCurrency    := Imposto.ICMS.vICMSSTRet;
    ParamByName('ICMS_CRED_SN_PORC').AsCurrency:= Imposto.ICMS.pCredSN;
    ParamByName('ICMS_CRED_SN_VAL').AsCurrency := Imposto.ICMS.vCredICMSSN;

    ParamByName('IPI_CST').AsString      := CSTIPIToStr(Imposto.IPI.CST);
    ParamByName('IPI_CLENQ').AsString    := Imposto.IPI.clEnq;
    ParamByName('IPI_CNPJPROD').AsString := Imposto.IPI.CNPJProd;
    ParamByName('IPI_CSELO').AsString    := Imposto.IPI.cSelo;
    ParamByName('IPI_QSELO').AsInteger   := Imposto.IPI.qSelo;
    ParamByName('IPI_CENQ').AsString     := Imposto.IPI.cEnq;
    ParamByName('IPI_BC_VAL').AsCurrency := Imposto.IPI.vBC;
    ParamByName('IPI_QUNID').AsCurrency  := Imposto.IPI.qUnid;
    ParamByName('IPI_VALUNID').AsCurrency:= Imposto.IPI.vUnid;
    ParamByName('IPI_VAL').AsCurrency    := Imposto.IPI.vIPI;
    ParamByName('IPI_PORC').AsCurrency   := Imposto.IPI.pIPI;

    ParamByName('II_BC_VAL').AsCurrency      := Imposto.II.vBc;
    ParamByName('II_DESPADU_VAL').AsCurrency := Imposto.II.vDespAdu;
    ParamByName('II_VAL').AsCurrency         := Imposto.II.vII;
    ParamByName('II_IOF_VAL').AsCurrency     := Imposto.II.vIOF;

    ParamByName('PIS_CST').AsString               := CSTPISToStr(Imposto.PIS.CST);
    ParamByName('PIS_BC_VAL').AsCurrency          := Imposto.PIS.vBC;
    ParamByName('PIS_PORC').AsCurrency            := Imposto.PIS.pPIS;
    ParamByName('PIS_VAL').AsCurrency             := Imposto.PIS.vPIS;
    ParamByName('PIS_QUANT_BCPROD').AsCurrency    := Imposto.PIS.qBCProd;
    ParamByName('PIS_ALIQPROD_VAL').AsCurrency    := Imposto.PIS.vAliqProd;
    ParamByName('PISST_BC_VAL').AsCurrency        := Imposto.PISST.vBc;
    ParamByName('PISST_PORC').AsCurrency          := Imposto.PISST.pPis;
    ParamByName('PISST_QUANT_BCPROD').AsCurrency  := Imposto.PISST.qBCProd;
    ParamByName('PISST_ALIQPROD_VAL').AsCurrency  := Imposto.PISST.vAliqProd;
    ParamByName('PISST_VAL').AsCurrency           := Imposto.PISST.vPIS;

    ParamByName('COFINS_CST').AsString              := CSTCOFINSToStr(Imposto.COFINS.CST);
    ParamByName('COFINS_BC_VAL').AsCurrency         := Imposto.COFINS.vBC;
    ParamByName('COFINS_PORC').AsCurrency           := Imposto.COFINS.pCOFINS;
    ParamByName('COFINS_VAL').AsCurrency            := Imposto.COFINS.vCOFINS;
    ParamByName('COFINS_QUANT_BCPROD').AsCurrency   := Imposto.COFINS.qBCProd;
    ParamByName('COFINS_ALIQPROD_VAL').AsCurrency   := Imposto.COFINS.vAliqProd;
    ParamByName('COFINSST_BC_VAL').AsCurrency       := Imposto.COFINSST.vBC;
    ParamByName('COFINSST_PORC').AsCurrency         := Imposto.COFINSST.pCOFINS;
    ParamByName('COFINSST_QUANT_BCPROD').AsCurrency := Imposto.COFINSST.qBCProd;
    ParamByName('COFINSST_ALIQPROD_VAL').AsCurrency := Imposto.COFINSST.vAliqProd;
    ParamByName('COFINSST_VAL').AsCurrency          := Imposto.COFINSST.vCOFINS;

    ParamByName('ISSQN_BC_VAL').AsCurrency   := Imposto.ISSQN.vBC;
    ParamByName('ISSQN_ALIQ_VAL').AsCurrency := Imposto.ISSQN.vAliq;
    ParamByName('ISSQN_VAL').AsCurrency      := Imposto.ISSQN.vISSQN;
    ParamByName('ISSQN_CODMUN').AsInteger    := Imposto.ISSQN.cMunFG;
    ParamByName('ISSQN_CLISTSERV').AsInteger := Imposto.ISSQN.cListServ;

    ParamByName('CD_GRUPO').AsString        := Get_Info_Produtos('CD_GRUPO', CD_PRODUTO,'');
    ParamByName('EAN').AsString             := Prod.cEAN;
    ParamByName('NOME_XML').AsString        := Prod.xProd;
    ParamByName('NOME_CADASTRADO').AsString := Get_Info_Produtos('NM_PRODUTO',CD_PRODUTO,'');
    ParamByName('CLASSFISCAL').AsString     := Prod.NCM;
    ParamByName('EXTIPI').AsString          := Prod.EXTIPI;
    ParamByName('CFOP').AsString            := Prod.CFOP;
    ParamByName('UNID_COM').AsString        := Prod.uCom;
    ParamByName('CD_EAN_TRIB').AsString     := Prod.cEANTrib;
    ParamByName('UN_TRIB').AsString         := Prod.uTrib;
    ParamByName('QT_TRIB').AsCurrency       := Prod.qTrib;
    ParamByName('VAL_UN_TRIB').AsCurrency   := Prod.vUnTrib;
    ParamByName('FRETE_VAL').AsCurrency     := Prod.vFrete;
    ParamByName('SEGURO_VAL').AsCurrency    := Prod.vSeg;
    ParamByName('DESCONTO_VAL').AsCurrency  := Prod.vDesc;
    ParamByName('OUTROS_VAL').AsCurrency    := Prod.vOutro;
    ParamByName('INDTOT').AsString          := indTotToStr(Prod.IndTot);
    ParamByName('XPEDIDO').AsString         := Prod.xPed;
    ParamByName('NITEMPEDIDO').AsInteger    := Prod.nItemPed;
    ParamByName('INFOADPROD').AsString      := infAdProd;

    Qtd_Total := Prod.qCom * ParamByName('UNDCONVERSAO').AsCurrency;
    if Qtd_Total < 0 then
      Qtd_Total := Prod.qCom;

    ParamByName('CUSTO_UNITARIO').AsCurrency  := ParamByName('VALORUNITARIO').AsCurrency - (Prod.vDesc/Qtd_Total) + (Prod.vFrete/Qtd_Total) + (Prod.vOutro/Qtd_Total)
                                                + (Prod.vSeg/Qtd_Total) + (Imposto.IPI.vUnid) + (Imposto.ICMS.vICMSST/Qtd_Total)
                                                + (Imposto.II.vII/Qtd_Total);

    ParamByName('CUSTOMEDIO').AsCurrency      := Get_CustoMedio(Get_EstoqueAtual(CD_PRODUTO),
                                                 Get_Info_Produtos('PRECOCUSTO',CD_PRODUTO,0),
                                                 Qtd_Total,
                                                 ParamByName('CUSTO_UNITARIO').AsCurrency,
                                                 True,
                                                 2);

    if Get_Info_Produtos('TIPOCUSTO',CD_PRODUTO,'') <> 'M' then  //diferente de m�dio
    begin
      ParamByName('TIPOCUSTO').AsString       := 'U';
      ParamByName('FRETECHEGADA').AsCurrency  := Get_Info_Produtos('FRETECHEGADA',CD_PRODUTO,0);
    end
    else
    begin
      ParamByName('TIPOCUSTO').AsString       := 'M';
      ParamByName('FRETECHEGADA').AsCurrency  := ParamByName('CUSTO_UNITARIO').AsCurrency;
    end;
    ParamByName('FRETESAIDA').AsCurrency      := Get_Info_Produtos('FRETESAIDA',CD_PRODUTO,0);

    AtualizaItemsXML(ParamByName('CD_PRODUTO').AsInteger);
  end;
end;

function TfEntradaNotasItems.Get_CustoMedio(EstoqueAtual, CustoAnt, QuantEnt, vUnEnt: Currency; Arredonda: Boolean = False; CasasDecimais: Integer = 2): Currency;
begin
  Result := 0;
  try
    Result := ((EstoqueAtual * (((EstoqueAtual * CustoAnt) + (QuantEnt* vUnEnt)) / (EstoqueAtual + QuantEnt)))
              + (QuantEnt * vUnEnt))
              / (EstoqueAtual + QuantEnt);
    if Arredonda then
      Result := ArredondaReal(Result, CasasDecimais);
  finally

  end;
end;

function TfEntradaNotasItems.Get_EstoqueAtual(cd_Prod: Integer): Currency;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := 0;
  fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
  try
    IBQ.Active := False;
    if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT ESTOQUEATUAL');
    IBQ.SQL.Add('FROM ESTOQUE');
    IBQ.SQL.Add('WHERE CD_PRODUTO = :CD_PRODUTO');
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.ParamByName('CD_PRODUTO').AsInteger   := cd_Prod;
    IBQ.Active := True;
    if IBQ.FieldByName('ESTOQUEATUAL').AsCurrency >= 0 then
      Result := IBQ.FieldByName('ESTOQUEATUAL').AsCurrency;
  finally
    fDB.FreeQueryTransacao(IBQ, IBT);
  end;
end;

procedure TfEntradaNotasItems.DefineParametrosItensImportacao;
begin
  with DtM.IBTabela3, fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Det.Items[I].Prod do
  begin
    ParamByName('CD_NOTA').AsInteger       := CD_NOTA;
    ParamByName('CD_ITEM').AsInteger       := StrToInt(cProd);
    ParamByName('NDI').AsString            := DI.Items[J].nDi;
    ParamByName('DDI').AsDateTime          := DI.Items[J].dDi;
    ParamByName('XLOCDESEMB').AsString     := DI.Items[J].xLocDesemb;
    ParamByName('UFDESEMB').AsString       := DI.Items[J].UFDesemb;
    ParamByName('CEXPORTADOR').AsString    := DI.Items[J].cExportador;
  end;
end;

procedure TfEntradaNotasItems.DefineParametrosItensImpLacre;
begin
  with DtM.IBTabela4, fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Det.Items[I].Prod do
  begin
    ParamByName('CD_NOTA').AsInteger       := CD_NOTA;
    ParamByName('CD_ITEM').AsInteger       := StrToInt(cProd);
    ParamByName('NDI').AsString            := DI.Items[J].nDi;
    ParamByName('NADICAO').AsString        := IntToStr(DI.Items[J].adi.Items[K].nAdicao);
    ParamByName('NSEQADIC').AsString       := IntToStr(DI.Items[J].adi.Items[K].nSeqAdi);
    ParamByName('CFABRICANTE').AsString    := DI.Items[J].adi.Items[K].cFabricante;
    ParamByName('VDESCDI').AsString        := FloatToStr(DI.Items[J].adi.Items[K].vDescDI);
  end;
end;

procedure TfEntradaNotasItems.DefineParametrosItensMed;
begin
  with DtM.IBTabela3, fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe.Det.Items[I].Prod do
  begin
    ParamByName('CD_NOTA').AsInteger       := CD_NOTA;
    ParamByName('CD_ITEM').AsInteger       := StrToInt(cProd);
    ParamByName('NLOTE').AsString          := med.Items[J].nLote;
    ParamByName('QLOTE').AsString          := FloatToStr(med.Items[J].qLote);
    ParamByName('DFAB').AsDate             := med.Items[J].dFab;
    ParamByName('DVAL').AsDate             := med.Items[J].dVal;
    ParamByName('VPMC').AsString           := FloatToStr(med.Items[J].vPMC);
  end;
end;

procedure TfEntradaNotasItems.MontaSQL_Ins_Ent_Item;
begin
//todo colocar p pegar o login
  with DtM do
  begin
    IBTabela2.Active := false;
    IBTabela2.SQL.Clear;
    IBTabela2.SQL.Add('insert into ENTRADA_ITEM');
    IBTabela2.SQL.Add('(CD_NOTA, CD_ITEM, CD_PRODUTO, COD_PROD_FORNEC, ');
    IBTabela2.SQL.Add(' QUANTIDADE, VALORUNITARIO, ICMS_PORC, IPI_PORC, ');
    IBTabela2.SQL.Add(' CUSTO_UNITARIO, CX_COD_BARRA_CAIXA, CX_VALORCAIXA, CX_UNDCONVERSAO ,');
    IBTabela2.SQL.Add(' SEQUENCIAL, PRECOCUSTO, VALORTOTAL, UNDCONVERSAO, ');
    IBTabela2.SQL.Add(' MARGEMLUCRO, PRECOVENDA, EAN, NOME_XML,');
    IBTabela2.SQL.Add(' NOME_CADASTRADO, CLASSFISCAL, EXTIPI, CFOP, ');
    IBTabela2.SQL.Add(' UNID_COM, CD_EAN_TRIB, UN_TRIB, QT_TRIB, ');
    IBTabela2.SQL.Add(' VAL_UN_TRIB, FRETE_VAL, SEGURO_VAL, DESCONTO_VAL, ');
    IBTabela2.SQL.Add(' OUTROS_VAL, INDTOT, XPEDIDO, NITEMPEDIDO, ');
    IBTabela2.SQL.Add(' INFOADPROD, ORIGEM, ICMS_CST, ICMS_MODBC, ');
    IBTabela2.SQL.Add(' PREDBCST, ICMS_BC_VAL, ICMS_VAL, ICMSST_MODBC, ');
    IBTabela2.SQL.Add(' ICMSST_PMVA, ICMSST_PRED, ICMSST_BC_VAL, ICMSST_PORC, ');
    IBTabela2.SQL.Add(' ICMSST_VAL , ICMSSTRET_BC_VAL, ICMSSTRET_VAL, ICMS_CRED_SN_PORC, ');
    IBTabela2.SQL.Add(' ICMS_CRED_SN_VAL, IPI_CST, IPI_CLENQ, IPI_CNPJPROD, ');
    IBTabela2.SQL.Add(' IPI_CSELO, IPI_QSELO, IPI_CENQ, IPI_BC_VAL, ');
    IBTabela2.SQL.Add(' IPI_QUNID, IPI_VALUNID, IPI_VAL, II_BC_VAL, ');
    IBTabela2.SQL.Add(' II_DESPADU_VAL, II_VAL, II_IOF_VAL, PIS_CST, ');
    IBTabela2.SQL.Add(' PIS_BC_VAL, PIS_PORC, PIS_VAL, PIS_QUANT_BCPROD, ');
    IBTabela2.SQL.Add(' PIS_ALIQPROD_VAL, PISST_BC_VAL, PISST_PORC, PISST_QUANT_BCPROD, ');
    IBTabela2.SQL.Add(' PISST_ALIQPROD_VAL, PISST_VAL, COFINS_CST, COFINS_BC_VAL, ');
    IBTabela2.SQL.Add(' COFINS_PORC, COFINS_VAL, COFINS_QUANT_BCPROD, COFINS_ALIQPROD_VAL, ');
    IBTabela2.SQL.Add(' COFINSST_BC_VAL, COFINSST_PORC, COFINSST_QUANT_BCPROD, COFINSST_ALIQPROD_VAL, ');
    IBTabela2.SQL.Add(' COFINSST_VAL, ISSQN_BC_VAL, ISSQN_ALIQ_VAL, ISSQN_VAL, ');
    IBTabela2.SQL.Add(' ISSQN_CODMUN, ISSQN_CLISTSERV, FLAG, CD_GRUPO, ');
    IBTabela2.SQL.Add(' MARGEM2, MARGEM3, MARGEM4, MARGEM5, ');
    IBTabela2.SQL.Add(' PRECO2, PRECO3, PRECO4, PRECO5, ');
    IBTabela2.SQL.Add(' CUSTOMEDIO, TIPOCUSTO, FRETECHEGADA, FRETESAIDA)');
    IBTabela2.SQL.Add('Values');
    IBTabela2.SQL.Add('(:CD_NOTA, :CD_ITEM,  :CD_PRODUTO, :COD_PROD_FORNEC, ');
    IBTabela2.SQL.Add(' :QUANTIDADE, :VALORUNITARIO, :ICMS_PORC, :IPI_PORC, ');
    IBTabela2.SQL.Add(' :CUSTO_UNITARIO, :CX_COD_BARRA_CAIXA, :CX_VALORCAIXA, :CX_UNDCONVERSAO, ');
    IBTabela2.SQL.Add(' :SEQUENCIAL, :PRECOCUSTO, :VALORTOTAL, :UNDCONVERSAO, ');
    IBTabela2.SQL.Add(' :MARGEMLUCRO, :PRECOVENDA, :EAN, :NOME_XML, ');
    IBTabela2.SQL.Add(' :NOME_CADASTRADO, :CLASSFISCAL, :EXTIPI, :CFOP, ');
    IBTabela2.SQL.Add(' :UNID_COM, :CD_EAN_TRIB, :UN_TRIB, :QT_TRIB, ');
    IBTabela2.SQL.Add(' :VAL_UN_TRIB, :FRETE_VAL, :SEGURO_VAL, :DESCONTO_VAL, ');
    IBTabela2.SQL.Add(' :OUTROS_VAL, :INDTOT, :XPEDIDO, :NITEMPEDIDO, ');
    IBTabela2.SQL.Add(' :INFOADPROD, :ORIGEM, :ICMS_CST, :ICMS_MODBC, ');
    IBTabela2.SQL.Add(' :PREDBCST, :ICMS_BC_VAL, :ICMS_VAL, :ICMSST_MODBC,');
    IBTabela2.SQL.Add('  :ICMSST_PORC, :ICMSST_PMVA, :ICMSST_PRED, :ICMSST_BC_VAL, ');
    IBTabela2.SQL.Add('  :ICMSST_VAL, :ICMSSTRET_BC_VAL, :ICMSSTRET_VAL, :ICMS_CRED_SN_PORC, ');
    IBTabela2.SQL.Add(' :ICMS_CRED_SN_VAL, :IPI_CST, :IPI_CLENQ, :IPI_CNPJPROD, ');
    IBTabela2.SQL.Add(' :IPI_CSELO, :IPI_QSELO, :IPI_CENQ, :IPI_BC_VAL, ');
    IBTabela2.SQL.Add(' :IPI_QUNID, :IPI_VALUNID, :IPI_VAL, :II_BC_VAL, ');
    IBTabela2.SQL.Add(' :II_DESPADU_VAL, :II_VAL, :II_IOF_VAL, :PIS_CST, ');
    IBTabela2.SQL.Add(' :PIS_BC_VAL, :PIS_PORC, :PIS_VAL, :PIS_QUANT_BCPROD, ');
    IBTabela2.SQL.Add(' :PIS_ALIQPROD_VAL, :PISST_BC_VAL, :PISST_PORC, :PISST_QUANT_BCPROD, ');
    IBTabela2.SQL.Add(' :PISST_ALIQPROD_VAL, :PISST_VAL, :COFINS_CST, :COFINS_BC_VAL, ');
    IBTabela2.SQL.Add(' :COFINS_PORC, :COFINS_VAL, :COFINS_QUANT_BCPROD,:COFINS_ALIQPROD_VAL, ');
    IBTabela2.SQL.Add(' :COFINSST_BC_VAL, :COFINSST_PORC, :COFINSST_QUANT_BCPROD, :COFINSST_ALIQPROD_VAL, ');
    IBTabela2.SQL.Add(' :COFINSST_VAL, :ISSQN_BC_VAL, :ISSQN_ALIQ_VAL, :ISSQN_VAL, ');
    IBTabela2.SQL.Add(' :ISSQN_CODMUN, :ISSQN_CLISTSERV, :FLAG, :CD_GRUPO, ');
    IBTabela2.SQL.Add(' :MARGEM2, :MARGEM3, :MARGEM4, :MARGEM5, ');
    IBTabela2.SQL.Add(' :PRECO2, :PRECO3, :PRECO4, :PRECO5, ');
    IBTabela2.SQL.Add(' :CUSTOMEDIO, :TIPOCUSTO, :FRETECHEGADA, :FRETESAIDA)');
  end;
end;

procedure TfEntradaNotasItems.MontaSQL_Ins_Ent_Item_Imp;
begin
  with DtM do
  begin
    IBTabela3.Active := false;
    IBTabela3.SQL.Clear;
    IBTabela3.SQL.Add('INSERT INTO ENTRADA_ITEM_IMPORTACAO');
    IBTabela3.SQL.Add('(CD_NOTA, CD_ITEM, NDI, DDI, XLOCDESEMB, UFDESEMB, DDESEMB, CEXPORTADOR)');
    IBTabela3.SQL.Add('Values');
    IBTabela3.SQL.Add('(:CD_NOTA, :CD_ITEM, :NDI, :DDI, :XLOCDESEMB, :UFDESEMB, :DDESEMB, :CEXPORTADOR)');
  end;
end;

procedure TfEntradaNotasItems.MontaSQL_Ins_Ent_Item_Imp_Lacres;
begin
  with DtM do
  begin
    IBTabela4.Active := False;
    IBTabela4.SQL.Clear;
    IBTabela4.SQL.Add('INSERT INTO ENTRADA_ITEM_IMPORT_LACRES');
    IBTabela4.SQL.Add('(CD_NOTA, CD_ITEM, NDI, NADICAO, NSEQADIC, CFABRICANTE, VDESCDI)');
    IBTabela4.SQL.Add('Values');
    IBTabela4.SQL.Add('(:CD_NOTA, :CD_ITEM, :NDI, :NADICAO, :NSEQADIC, :CFABRICANTE, :VDESCDI)');
  end;
end;

procedure TfEntradaNotasItems.MontaSQL_Ins_Ent_Item_Med;
begin
  with DtM do
  begin
    IBTabela3.Active := False;
    IBTabela3.SQL.Clear;
    IBTabela3.SQL.Add('INSERT INTO ENTRADA_ITEM_MEDICAMENTO');
    IBTabela3.SQL.Add('(CD_NOTA, CD_ITEM, NLOTE, QLOTE, DFAB, DVAL, VPMC)');
    IBTabela3.SQL.Add('Values');
    IBTabela3.SQL.Add('(:CD_NOTA, :CD_ITEM, :NLOTE, :QLOTE, :DFAB, :DVAL, :VPMC)');
  end;
end;

procedure TfEntradaNotasItems.ExecutaECommita(Query: TIB_Query);
begin
  Query.ExecSQL;
  Query.IB_Transaction.Commit;
end;

procedure TfEntradaNotasItems.Executa(Query: TIB_Query);
begin
  Query.ExecSQL;
end;


function TfEntradaNotasItems.GetCodFornecedor (CNPJ, NOME: string): Integer;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := -1;
  CNPJ := SoNumeros(CNPJ);
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
    IBQ.Active := False;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT CD_FORNECEDOR');
    IBQ.SQL.Add('FROM FORNECEDORES');
    IBQ.SQL.Add('WHERE INATIVO = ''F'' AND CGC = '+QuotedStr(CNPJ));
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.Active := True;
    if IBQ.RecordCount > 0 then
      Result := IBQ.FieldByName('CD_FORNECEDOR').AsInteger
    else
    begin
      //se ainda n�o cadastrou o fornecedor msmo depois de solicitar ao carregar o xml
      if (Modo = mdInclusao) or (Modo = mdInclusaoXML) or (Modo = mdAlteracao) then
      begin
        ItemEsc := mPesq.Pesquisa(pqFornecedores, [mdInclusao, mdInclusaoXML, mdAlteracao], nil, NOME);
        if ItemEsc.CodInt <> CodigoVazio then
        Result := ItemEsc.CodInt;
      end;
    end;
  finally
    fDB.FreeQueryTransacao(IBQ,IBT);
  end;
end;

procedure TfEntradaNotasItems.PegaItensXML;
begin
  with fEntradasDeNotas.ACBrNFe1.NotasFiscais.Items[fEntradasDeNotas.nXML].NFe do
  begin
    for I := 0 to Det.Count-1 do
    begin
      with DtM do
      begin
        try
          AbreAviso('Preparando Entrada de Itens - '+ Inttostr(I+1)+' de '+Inttostr(Det.Count));
          if not IBTabela2.IB_Transaction.InTransaction then IBTabela2.IB_Transaction.StartTransaction;
          if I = 0 then
            MontaSQL_Ins_Ent_Item;
          if not IBTabela2.Prepared then IBTabela2.Prepare;
          DefineParametrosItens;
          ExecutaECommita(IBTabela2);

          //verifica se o item tem dados de importa��o
          if Det.Items[I].Prod.DI.Count > 0 then
          begin
            for J := 0 to Det.Items[I].Prod.DI.Count - 1 do
            begin
              try
                if not IBTabela3.IB_Transaction.InTransaction then IBTabela3.IB_Transaction.StartTransaction;
                if J = 0 then
                  MontaSQL_Ins_Ent_Item_Imp;
                if not IBTabela3.Prepared then IBTabela3.Prepare;
                DefineParametrosItensImportacao;
                ExecutaECommita(IBTabela3);

                for K := 0 to Det.Items[I].Prod.DI.Items[J].adi.Count - 1 do
                begin
                  if not IBTabela4.IB_Transaction.InTransaction then IBTabela4.IB_Transaction.StartTransaction;
                  if k = 0 then
                    MontaSQL_Ins_Ent_Item_Imp_Lacres;
                  if not IBTabela4.Prepared then IBTabela4.Prepare;
                  DefineParametrosItensImpLacre;
                  ExecutaECommita(IBTabela4);
                end;
              except
                IBTabela3.IB_Transaction.RollBack;
                IBTabela4.IB_Transaction.Rollback;
                MensagemDeErro('N�o foi poss�vel adicionar os dados de importa��o!');
              end;
            end;
          end;

          //verifica se o item tem informa��es de medicamentos
          if Det.Items[I].Prod.med.Count > 0 then
          begin
            for J := 0 to Det.Items[I].Prod.med.Count - 1 do
            begin
              try
                if not IBTabela3.IB_Transaction.InTransaction then IBTabela3.IB_Transaction.StartTransaction;
                if J = 0 then
                  MontaSQL_Ins_Ent_Item_Med;
                if not IBTabela3.Prepared then IBTabela3.Prepare;
                DefineParametrosItensMed;
                ExecutaECommita(IBTabela3);
              except
                IBTabela3.IB_Transaction.Rollback;
                MensagemDeErro('N�o foi poss�vel adicionar os dados dos medicamentos!');
              end;
            end;
          end;

        except
          on E: exception do begin
            FechaAviso;
            LogDeErros(E.Message);
            DtM.IBTabela2.IB_Transaction.RollBack;
            MensagemDeErro('N�o foi poss�vel abrir uma nova Nota');
            exit;
          end;
        end;
      end;
    end;
  end;
  Filtra;
end;

procedure TfEntradaNotasItems.Filtra;
begin
  if (not DtM.IBNF.IsEmpty) and (not vazio(DtM.IBNF.FieldByName('CD_NOTA').AsString)) then
  begin
    DtM.IBNFItems.Active := false;
    DtM.IBNFItems.SQL.Clear;
    DtM.IBNFItems.SQL.Add('select ENTRADA_ITEM.*, PRODUTOS.NM_PRODUTO, PRODUTOS.COD_BARRAS from ENTRADA_ITEM');
    DtM.IBNFItems.SQL.Add('left outer join PRODUTOS on ENTRADA_ITEM.CD_PRODUTO = PRODUTOS.CD_PRODUTO');
    DtM.IBNFItems.SQL.Add('where CD_NOTA = '+DtM.IBNF.FieldByName('CD_NOTA').AsString);
    DtM.IBNFItems.SQL.Add('Order By SEQUENCIAL');

    if not DtM.IBNFItems.Prepared then DtM.IBNFItems.Prepare;
    DtM.IBNFItems.Active := true;

    DtM.IBTabela.Active := false;
    DtM.IBTabela.SQL.Clear;
    DtM.IBTabela.SQL.Add('Select Sum(VALORTOTAL) from ENTRADA_ITEM');
    DtM.IBTabela.SQL.Add('where CD_NOTA = '+DtM.IBNF.FieldByName('CD_NOTA').AsString);
    if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
    DtM.IBTabela.Active := true;
    EditTotal.Value := DtM.IBTabela.FieldByName('SUM').AsCurrency;
    fDB.FechaTT(DtM.IBTabela);
  end
  else begin
    DtM.IBNFItems.Active := false;
    DtM.IBNFItems.SQL.Clear;
    DtM.IBNFItems.SQL.Add('select ENTRADA_ITEM.*, PRODUTOS.NM_PRODUTO, PRODUTOS.COD_BARRAS from ENTRADA_ITEM');
    DtM.IBNFItems.SQL.Add('left outer join PRODUTOS on ENTRADA_ITEM.CD_PRODUTO = PRODUTOS.CD_PRODUTO');
    DtM.IBNFItems.SQL.Add('where CD_NOTA = -99999999999');
    if not DtM.IBNFItems.Prepared then DtM.IBNFItems.Prepare;
    DtM.IBNFItems.Active := true;
    EditTotal.Value := 0;
  end;
end;

procedure TfEntradaNotasItems.Bt_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TfEntradaNotasItems.AtualizaItemsXML(CD_Produto: Integer);
var
  NOTA_Desconto_UND       : Currency;
  NOTA_ValorFrete_UND     : Currency;
  NOTA_OutrasDespesas_UND : Currency;
  NOTA_ValorSeguro_UND    : Currency;
  NOTA_ValorIPI_UND       : Currency;
  NOTA_ValorICMSST_UND    : Currency;
  NOTA_ValorII_UND        : Currency;

  PrecoCusto              : Currency;
  PrecoVenda              : Currency;
  PrecoVenda2             : Currency;
  PrecoVenda3             : Currency;
  PrecoVenda4             : Currency;
  PrecoVenda5             : Currency;
  NovaMargem              : Currency;

  IPIValorUnitario        : Currency;
  TributosDespesas        : Currency;
  ValorUnitarioBruto      : Currency;

  TresCasas : Boolean;
begin
  if (DtM.IBNF.IsEmpty) or (vazio(DtM.IBNF.FieldByName('CD_NOTA').AsString)) then
    Exit;

  with DtM do begin
    DtM.IBNFItems.Active := false;

    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select TRESCASAS from PRODUTOS');
    IBTabela.SQL.Add('where CD_PRODUTO = '+IntToStr(CD_Produto));
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := True;
    TresCasas := IBTabela.FieldByName('TRESCASAS').AsString = 'V';
    fDB.FechaTT(IBTabela);
    with IBTabela2 do
    begin
      PrecoCusto := ParamByName('CUSTO_UNITARIO').AsCurrency;

      if ParamByName('TIPOCUSTO').AsString = 'U' then
        PrecoCusto := DivZero(ParamByName('CUSTO_UNITARIO').AsCurrency, ParamByName('UNDCONVERSAO').AsCurrency)
      else
        PrecoCusto := DivZero(ParamByName('CUSTOMEDIO').AsCurrency, ParamByName('UNDCONVERSAO').AsCurrency);

      if not TresCasas then PrecoCusto := TruncaReal(PrecoCusto, 2);

      if PrecoCusto > 0 then
      begin
        PrecoVenda  := PrecoCusto + ((PrecoCusto * Get_Info_Produtos('MARGEM',CD_Produto,0))/100);
        PrecoVenda2 := PrecoCusto + ((PrecoCusto * Get_Info_Produtos('MARGEM2',CD_Produto,0))/100);
        PrecoVenda3 := PrecoCusto + ((PrecoCusto * Get_Info_Produtos('MARGEM3',CD_Produto,0))/100);
        PrecoVenda4 := PrecoCusto + ((PrecoCusto * Get_Info_Produtos('MARGEM4',CD_Produto,0))/100);
        PrecoVenda5 := PrecoCusto + ((PrecoCusto * Get_Info_Produtos('MARGEM5',CD_Produto,0))/100);
      end;
      //� chamado dentro do defineparametrosItens - passa os parametros do IBTABELA2 que sofre commit dentro do PegaItensXML
      IBTabela2.ParamByName('PRECOVENDA').AsCurrency      := PrecoVenda;
      IBTabela2.ParamByName('PRECO2').AsCurrency          := PrecoVenda2;
      IBTabela2.ParamByName('PRECO3').AsCurrency          := PrecoVenda3;
      IBTabela2.ParamByName('PRECO4').AsCurrency          := PrecoVenda4;
      IBTabela2.ParamByName('PRECO5').AsCurrency          := PrecoVenda5;
      IBTabela2.ParamByName('PRECOCUSTO').AsCurrency      := PrecoCusto;
    end;
    PanelObsNota.Visible := not vazio(DtM.IBNF.FieldByName('OBS').AsString);
    edObsFornec.Text := fDB.GetValorDoCampo(DtM.IBDatabaseServer,'OBS', 'FORNECEDORES', 'CD_FORNECEDOR = '+DtM.IBNF.FieldByName('CD_FORNECEDOR').AsString, '');
    PanelObsFornec.Visible := not vazio(edObsFornec.Text);
  end;
end;

procedure TfEntradaNotasItems.AtualizaItems;
var
  RepresentacaoPercentual : Real;
  NOTA_Desconto           : Currency;
  NOTA_ValorFrete         : Currency;
  NOTA_ValorSeguro        : Currency;
  NOTA_OutrasDespesas     : Currency;

  NOTA_Desconto_UND       : Currency;
  NOTA_ValorFrete_UND     : Currency;
  NOTA_OutrasDespesas_UND : Currency;
  NOTA_ValorSeguro_UND    : Currency;

  ValorTotal              : Currency;
  CustoUnitario           : Currency;
  PrecoVenda              : Currency;
  NovaMargem              : Currency;

  IPIValorUnitario        : Currency;
  QuantidadeTotal         : Currency;
  ValorUnitarioBruto      : Currency;

  TresCasas : Boolean;
begin
  if (DtM.IBNF.IsEmpty) or (vazio(DtM.IBNF.FieldByName('CD_NOTA').AsString)) then
    Exit;

  with DtM do begin
    DtM.IBNFItems.Active := false;

    IBTabela.Active := false;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select N.*, P.TRESCASAS from ENTRADA_ITEM N left outer join PRODUTOS P');
    IBTabela.SQL.Add('on N.CD_PRODUTO = P.CD_PRODUTO');
    IBTabela.SQL.Add('where N.CD_NOTA = '+DtM.IBNF.FieldByName('CD_NOTA').AsString);
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := true;

    if not IBTabela2.IB_Transaction.InTransaction then IBTabela2.IB_Transaction.StartTransaction;
    try
      while not IBTabela.Eof do
      begin
        TresCasas := IBTabela.FieldByName('TRESCASAS').AsString = 'V';
        ValorTotal := (IBTabela.FieldByName('VALORUNITARIO').AsCurrency * IBTabela.FieldByName('QUANTIDADE').AsCurrency);
        ValorUnitarioBruto := DivZero(IBTabela.FieldByName('VALORUNITARIO').AsCurrency, IBTabela.FieldByName('UNDCONVERSAO').AsCurrency);

        RepresentacaoPercentual := (ValorTotal * 100) / (IBNF.FieldByName('VR_TOTAL_PROD').AsCurrency * 1);
        NOTA_Desconto       := (RepresentacaoPercentual * IbNF.FieldByName('DESCONTO_TOTAL').AsCurrency)/100;
        NOTA_ValorFrete     := (RepresentacaoPercentual * IbNF.FieldByName('VALOR_FRETE').AsCurrency)/100;
        NOTA_OutrasDespesas := (RepresentacaoPercentual * IbNF.FieldByName('OUTRAS_DESPESAS').AsCurrency)/100;
        NOTA_ValorSeguro    := (RepresentacaoPercentual * IbNF.FieldByName('VALOR_SEGURO').AsCurrency)/100;

        QuantidadeTotal := IBTabela.FieldByName('QUANTIDADE').AsCurrency * IBTabela.FieldByName('UNDCONVERSAO').AsCurrency;

        if QuantidadeTotal > 0 then
        begin
          NOTA_Desconto_UND        := NOTA_Desconto / QuantidadeTotal;
          NOTA_ValorFrete_UND      := NOTA_ValorFrete / QuantidadeTotal;
          NOTA_OutrasDespesas_UND  := NOTA_OutrasDespesas / QuantidadeTotal;
          NOTA_ValorSeguro_UND     := NOTA_ValorSeguro / QuantidadeTotal;

          IPIValorUnitario         := (ValorUnitarioBruto * IBTabela.FieldByName('IPI_PORC').AsCurrency) / 100;

          CustoUnitario := (ValorUnitarioBruto)
                           - NOTA_Desconto_UND
                           + NOTA_ValorFrete_UND
                           + NOTA_ValorSeguro_UND
                           + NOTA_OutrasDespesas_UND
                           + IPIValorUnitario;
        end;

        if not TresCasas then CustoUnitario := TruncaReal(CustoUnitario, 2);

        case TipoAtualizacao of
          taAlteraPreco :
          begin
            if CustoUnitario > 0 then
              PrecoVenda := CustoUnitario + ((CustoUnitario * IBTabela.FieldByName('MARGEMLUCRO').AsCurrency)/100);

            IBTabela2.Active := false;
            IBTabela2.SQL.Clear;
            IBTabela2.SQL.Add('Update ENTRADA_ITEM set PRECOVENDA = :PRECOVENDA, CUSTO_UNITARIO = :CUSTO_UNITARIO');
            IBTabela2.SQL.Add('where CD_NOTA = :CD_NOTA and CD_ITEM = :CD_ITEM');
            if not IBTabela2.Prepared then IBTabela2.Prepare;
            IBTabela2.ParamByName('PRECOVENDA').AsCurrency := PrecoVenda;
            IBTabela2.ParamByName('CUSTO_UNITARIO').AsCurrency := CustoUnitario;
            IBTabela2.ParamByName('CD_NOTA').AsInteger := IBTabela.FieldByname('CD_NOTA').AsInteger;
            IBTabela2.ParamByName('CD_ITEM').AsInteger := IBTabela.FieldByname('CD_ITEM').AsInteger;
            IBTabela2.ExecSQL;
          end;

          taAlteraMargem :
          begin
            if CustoUnitario > 0 then
              NovaMargem :=  DivZero((((IBTabela.FieldByName('PRECOVENDA').AsCurrency) - CustoUnitario)*100) , CustoUnitario);

            IBTabela2.Active := false;
            IBTabela2.SQL.Clear;
            IBTabela2.SQL.Add('Update ENTRADA_ITEM set MARGEMLUCRO = :MARGEMLUCRO, CUSTO_UNITARIO = :CUSTO_UNITARIO');
            IBTabela2.SQL.Add('where CD_NOTA = :CD_NOTA and CD_ITEM = :CD_ITEM');
            if not IBTabela2.Prepared then IBTabela2.Prepare;
            IBTabela2.ParamByName('MARGEMLUCRO').AsCurrency := NovaMargem;
            IBTabela2.ParamByName('CUSTO_UNITARIO').AsCurrency := CustoUnitario;
            IBTabela2.ParamByName('CD_NOTA').AsInteger := IBTabela.FieldByname('CD_NOTA').AsInteger;
            IBTabela2.ParamByName('CD_ITEM').AsInteger := IBTabela.FieldByname('CD_ITEM').AsInteger;
            IBTabela2.ExecSQL;
          end;
        end;

        IBTabela.Next;
      end;
      IBTabela2.IB_Transaction.Commit;

      PanelObsNota.Visible := not vazio(DtM.IBNF.FieldByName('OBS').AsString);
      edObsFornec.Text := fDB.GetValorDoCampo(DtM.IBDatabaseServer,'OBS', 'FORNECEDORES', 'CD_FORNECEDOR = '+DtM.IBNF.FieldByName('CD_FORNECEDOR').AsString, '');
      PanelObsFornec.Visible := not vazio(edObsFornec.Text);
    except
      on E: exception do begin
        LogDeErros(E.Message);
        IBTabela2.IB_Transaction.Rollback;
        MensagemDeErro('N�o foi poss�vel atualizar os itens');
      end;
    end;
    fDB.FechaTT(IBTabela);
  end;
  Filtra;
end;

function TfEntradaNotasItems.Get_CD_PRODUTO_Vinculo(cd_Fornec: Integer; cd_prod_fornec: string): Integer;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := 0;
  fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
  try
    IBQ.Active := False;
    if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT CD_PRODUTO');
    IBQ.SQL.Add('FROM PRODFORNEC');
    IBQ.SQL.Add('WHERE CD_FORNECEDOR = :CD_FORNECEDOR AND COD_PROD_FORNEC = :COD_PROD_FORNEC');
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.ParamByName('CD_FORNECEDOR').AsInteger   := cd_Fornec;
    IBQ.ParamByName('COD_PROD_FORNEC').AsString  := cd_prod_fornec;
    IBQ.Active := True;
    Result := IBQ.FieldByName('CD_PRODUTO').AsInteger;
  finally
    fDB.FreeQueryTransacao(IBQ, IBT);
  end;
end;

function TfEntradaNotasItems.Get_CD_PRODUTO_Cadastrado(cd_EAN: string): Integer;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
  CampoEAN: string;
begin
  Result := 0;
  fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
  try
    IBQ.Active := False;
    if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT PROD_CODIGO_EAN');
    IBQ.SQL.Add('FROM CONFIG_CADASTRO');
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.Active := True;
    case IBQ.FieldByName('PROD_CODIGO_EAN').AsInteger of
      2: CampoEAN := 'CODIGO02';
      3: CampoEAN := 'CODIGO03';
      4: CampoEAN := 'CODIGO04';
      else
      CampoEAN := 'COD_BARRAS';
    end;

    IBQ.Active := False;
    if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT CD_PRODUTO');
    IBQ.SQL.Add('FROM PRODUTOS');
    IBQ.SQL.Add('WHERE '+ CampoEAN +' = :CD_EAN');
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.ParamByName('CD_EAN').AsString  := cd_EAN;
    IBQ.Active := True;
    Result := IBQ.FieldByName('CD_PRODUTO').AsInteger;
  finally
    fDB.FreeQueryTransacao(IBQ, IBT);
  end;
end;

function TfEntradaNotasItems.Get_Info_Produtos(Campo: string; cd_Produto: Integer; Val_Padrao: string = ''): string;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := Val_Padrao;
  fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
  try
    IBQ.Active := False;
    if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
    IBQ.SQL.Clear;
    IBQ.SQL.Add('SELECT ' + Campo);
    IBQ.SQL.Add('FROM PRODUTOS');
    IBQ.SQL.Add('WHERE CD_PRODUTO = :CD_PRODUTO');
    if not IBQ.Prepared then IBQ.Prepare;
    IBQ.ParamByName('CD_PRODUTO').AsInteger   := cd_Produto;
    IBQ.Active := True;
    Result := IBQ.FieldByName(Campo).AsString;
  finally
    fDB.FreeQueryTransacao(IBQ, IBT);
  end;
end;

function TfEntradaNotasItems.Get_Info_Produtos(Campo: string; cd_Produto: Integer; Val_Padrao: Currency): Currency;
var
  IBQ: TIB_Query;
  IBT: TIB_Transaction;
begin
  Result := Val_Padrao;
  if cd_Produto <> 0 then
  begin
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,IBQ,IBT);
    try
      IBQ.Active := False;
      if not IBQ.IB_Transaction.InTransaction then IBQ.IB_Transaction.StartTransaction;
      IBQ.SQL.Clear;
      IBQ.SQL.Add('SELECT ' + Campo);
      IBQ.SQL.Add('FROM PRODUTOS');
      IBQ.SQL.Add('WHERE CD_PRODUTO = :CD_PRODUTO');
      if not IBQ.Prepared then IBQ.Prepare;
      IBQ.ParamByName('CD_PRODUTO').AsInteger   := cd_Produto;
      IBQ.Active := True;
      Result := IBQ.FieldByName(Campo).AsCurrency;
    finally
      fDB.FreeQueryTransacao(IBQ, IBT);
    end;
  end;
end;

procedure TfEntradaNotasItems.FormShow(Sender: TObject);
begin
  DtM.IBNF.Active := false;
  DtM.IBNF.SQL.Clear;
  DtM.IBNF.SQL.Add('Select * from ENTRADA');
  DtM.IBNF.SQL.Add('where CD_NOTA = :CD_NOTA');
  if not DtM.IBNF.Prepared then DtM.IBNF.Prepare;
  DtM.IBNF.ParamByName('CD_NOTA').AsInteger := CD_NOTA;
  DtM.IBNF.Active := true;
  if (DtM.IBNF.IsEmpty) or (vazio(DtM.IBNF.FieldByName('CD_NOTA').AsString)) then
    Exit;

  if Modo = mdInclusaoXML then
    PegaItensXML;

  Filtra;
  AtualizaItems;


  AbriuAgora := false;
  Bt_IncluirItem.SetFocus;
  DetonaXPManifest(self);
  FechaAviso;
  Screen.Cursor := crDefault;
  PageControl1.TabIndex := 0;
end;

procedure TfEntradaNotasItems.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    vk_F2    : if (Shift = []) and (Bt_IncluirItem.Enabled)    then Bt_IncluirItem.Click;
    vk_F4    : if (Shift = []) and (Bt_ExcluirItem.Enabled)    then Bt_ExcluirItem.Click;
    vk_F5    : if (Shift = []) and (Bt_AlterarItem.Enabled)    then Bt_AlterarItem.Click;
    vk_F11   : if (Shift = []) and (Bt_ConcluirNota.Enabled)   then Bt_ConcluirNota.Click;
    vk_F9    : if (Shift = []) and (bt_ImportarPedido.Enabled) then bt_ImportarPedido.Click;
    vk_Escape: Bt_Sair.Click;
  end;
end;

procedure TfEntradaNotasItems.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfEntradaNotasItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDB.FechaTT(DtM.IBNF);
  fDB.FechaTT(DtM.IBNFItems);

  Action := caFree;
  wwDBGrid1.SaveToIniFile;
  SalvaIntegerNoRegistro(ChaveDoRegistro, PageControl1.Name, PageControl1.ActivePageIndex);
end;

procedure TfEntradaNotasItems.FormCreate(Sender: TObject);
begin
  TipoAtualizacao := taAlteraMargem;
  ChaveDoRegistro := RegChaveForms+EstaChave;

  CM.InicializaGrid(TeclaTaPressionada(vk_Shift), self, wwDBGrid1);
//  wwDBGrid1.LoadFromIniFile;

  DataSource1.DataSet := DtM.IBNF;
  DataSource2.DataSet := DtM.IBNFItems;

  PageControl1.ActivePageIndex := LeIntegerDoRegistro(ChaveDoRegistro, PageControl1.Name, 1);
end;

procedure TfEntradaNotasItems.Bt_IncluirItemClick(Sender: TObject);
var
  Seq, Q : integer;
begin
  Bt_IncluirItem.SetFocus;
  Application.CreateForm(TfDadosDoProduto, fDadosDoProduto);
  fDadosDoProduto.Modo := mdInclusao;
  fDadosDoProduto.Caption := fDadosDoProduto.Caption + ' - Incluir Item';
  fDadosDoProduto.CodItemPedidoCompra := 0;
  case PageControl1.ActivePageIndex of
    0 : fDadosDoProduto.ModoEntrada := mdCompleto;
  end;
  Q := DtM.IBNFItems.RecordCount;
  fDadosDoProduto.CBCaixaFechada.OnClick(fDadosDoProduto.CBCaixaFechada);
  fDadosDoProduto.LockPrecoVenda := false;

  Seq := fDB.GetValorDaQuery(DtM.IBDatabaseServer,'Select coalesce(max(SEQUENCIAL), 0) from ENTRADA_ITEM where CD_NOTA = '+DtM.IBNF.FieldByName('CD_NOTA').AsString, 0);
  if Seq = 0 then fDadosDoProduto.EditSequencial.Value := 1
             else fDadosDoProduto.EditSequencial.Value := Seq + 1;

  fDadosDoProduto.CDNota := CD_NOTA;
  fDadosDoProduto.ShowModal;
  FreeAndNil(fDadosDoProduto);

  DtM.IBNFItems.DisableControls;
  filtra;
  if Q < DtM.IBNFItems.RecordCount then DtM.IBNFItems.Last;
  DtM.IBNFItems.EnableControls;

  DtM.IBNF.RefreshRows;
end;

procedure TfEntradaNotasItems.Bt_ExcluirItemClick(Sender: TObject);
var
  CodItem : String;
  Book : TBookMark;
begin
  if not DtM.IBNFItems.IsEmpty then
  begin
    if MensagemDeConfirmacao('Deseja realmente apagar este item da Nota?') = mrYes then
    begin
      DtM.IBNFItems.DisableControls;
      CodItem := DtM.IBNFItems.FieldByName('CD_ITEM').AsString;
      DtM.IBNFItems.Next;
      Book := DtM.IBNFItems.GetBookmark;
      DtM.IBNFItems.Active := false;
      if not DtM.IBTabela.IB_Transaction.InTransaction then DtM.IBTabela.IB_Transaction.StartTransaction;
      DtM.IBTabela.Active := false;
      DtM.IBTabela.SQL.Clear;
      DtM.IBTabela.SQL.Add('Delete from ENTRADA_ITEM');
      DtM.IBTabela.SQL.Add('where CD_NOTA = '+DtM.IBNF.FieldByName('CD_NOTA').AsString);
      DtM.IBTabela.SQL.Add('and CD_ITEM = '+CodItem);
      if not DtM.IBTabela.Prepared then DtM.IBTabela.Prepare;
      DtM.IBTabela.ExecSQL;
      DtM.IBTabela.IB_Transaction.Commit;
      filtra;
      try
        DtM.IBNFItems.GotoBookmark(Book);
      except
        on E: exception do begin
          LogDeErros(E.Message);
        end;
      end;
      DtM.IBNFItems.EnableControls;
      DtM.IBNF.RefreshRows;
    end;
  end;
end;

procedure TfEntradaNotasItems.Bt_AlterarItemClick(Sender: TObject);
var
  book : TBookMark;
begin
  if DtM.IBNFItems.IsEmpty then
  begin
    MensagemDeErro('N�o h� items nesta Nota para Alterar');
    Exit;
  end;
  Book := DtM.IBNFItems.GetBookmark;
  AbreAviso('Carregando Item');
  Application.CreateForm(TfDadosDoProduto, fDadosDoProduto);
  case PageControl1.ActivePageIndex of
    0 : fDadosDoProduto.ModoEntrada := mdCompleto;
  end;
  fDadosDoProduto.Modo := mdAlteracao;
  fDadosDoProduto.CodItemPedidoCompra := 0;
  fDadosDoProduto.Caption := fDadosDoProduto.Caption + ' - Alterar Item';
  fDadosDoProduto.CodItem := DtM.IBNFItems.FieldByName('CD_ITEM').AsString;
  fDadosDoProduto.LockPrecoVenda := DtM.IBNFItems.FieldByName('LOCK_PRECOVENDA').AsString = 'V';

  fDadosDoProduto.MostraDados;
  fDadosDoProduto.CDNota := CD_NOTA;

  fDadosDoProduto.ShowModal;
  FreeAndNil(fDadosDoProduto);

  DtM.IBNF.Refresh;
  DtM.IBNFItems.DisableControls;
  filtra;
  try
    DtM.IBNFItems.GotoBookmark(Book);
  except
    on E: exception do begin
      LogDeErros(E.Message);
    end;
  end;
  DtM.IBNFItems.EnableControls;
end;

procedure TfEntradaNotasItems.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if DtM.IBNFItems.FieldByName('FLAG').AsString = 'V' then
  begin
    if DtM.IBNFItems.FieldByName('CONFERIDO').AsString <> 'V' then
      aBrush.Color := $00FFFFB9 //azul claro
    else
      aBrush.Color := $00CCE3CC; //verde claro
  end
  else
  if DtM.IBNFItems.FieldByName('FLAG').AsString = 'N' then
    aBrush.Color := $00AEAEFF  //vermelho claro
  else
  if DtM.IBNFItems.FieldByName('FLAG').AsString = 'C' then
    aBrush.Color := $00D5A8A8;  //roxo claro

  if Highlight then
  begin
    ABrush.Color := IntensificaCor(ABrush.Color,-50);
    AFont.Color  := clBlack;
  end;
end;

procedure TfEntradaNotasItems.wwDBGrid1DblClick(Sender: TObject);
begin
  Bt_AlterarItem.Click;
end;

procedure TfEntradaNotasItems.Bt_ConcluirNotaClick(Sender: TObject);
type
  TRegContaAPagar = record
    NumNF : String;
    Valor : Currency;
    Fornecedor: String;
  end;
var
  CodigoSimilar : Integer;
  PrecoCusto, PrecoVenda : Currency;
  Margem : Real;
  RegContaAPagar : TRegContaAPagar;
  CdNota : Integer;
  LancarEmContasAPagar,
  ConciliarPrecosParaPDV : Boolean;
  Dep : word;
  QuantidadeUnitaria : Currency;
  QuantidadeAlterada : integer;
begin
  if not mUsers.TemAcessoPermissao(sgEntradaDeNotas, 'A') then Exit;
  if DtM.IBNF.IsEmpty then
  begin
    MensagemDeAtencao('N�o h� notas para concluir');
    Exit;
  end;

  Application.CreateForm(TfConcluiNota, fConcluiNota);
  fConcluiNota.ShowModal;
  if fConcluiNota.BotaoPressionado = bpOk then
  begin
    LancarEmContasAPagar := fConcluiNota.CheckBoxContasAPagar.Checked;
    ConciliarPrecosParaPDV := fConcluiNota.CheckBoxConciliarPrecos.Checked;
  end
  else Exit;

  // Pega o dep�sito de Entradas
  Dep := fConcluiNota.DepositoEntrada;
  FreeAndNil(fConcluiNota);

  if EditTotal.Value <> DtM.IBNF.FieldByName('VR_TOTAL_PROD').AsCurrency then
    if MensagemDeConfirmacao('O Valor Total definido � diferente da Soma do Valor dos items!'+PL+
                                'Deseja continuar assim mesmo?') <> mrYes then
      Exit;


  //  Fecha Nota
  with DtM do begin
    AbreAviso('Concluindo nota', 0, 0, 0, 0);
    Screen.Cursor := crHourGlass;
    try
      Bt_ConcluirNota.Enabled := false;
      CdNota := IBNF.FieldByName('CD_NOTA').AsInteger;
      with RegContaAPagar do
      begin
        NumNF := DtM.IBNF.FieldByName('NUM_DOCUMENTO').AsString;
        Valor := DtM.IBNF.FieldByName('VALOR_TOTAL_NOTA').AsCurrency;
        Fornecedor := DtM.IBNF.FieldByName('CD_FORNECEDOR').AsString;
      end;
      IBNFItems.First;

      SPAlteraEstoque.IB_Transaction := IBTabela.IB_Transaction;
      if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
      try
        while not IBNFItems.Eof do
        begin
          QuantidadeUnitaria := IBNFItems.FieldByName('QUANTIDADE').AsCurrency*IBNFItems.FieldByName('UNDCONVERSAO').AsCurrency;
          CM.PegaDadosDoProduto(IBNFItems.FieldByName('CD_PRODUTO').AsInteger);

          // Altera informa��es...
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('update REFPRODUTOS set');
          IBTabela.SQL.Add('DT_ULTIMACOMPRA = :DT_ULTIMACOMPRA,');
          IBTabela.SQL.Add('ULTIMOFORNECEDOR = :ULTIMOFORNECEDOR');
          IBTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO');

          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('CD_PRODUTO').AsInteger       := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
          IBTabela.ParamByName('DT_ULTIMACOMPRA').AsDate     := IBNF.FieldByName('DT_ENTRADA').AsDateTime;
          IBTabela.ParamByName('ULTIMOFORNECEDOR').AsInteger := IBNF.FieldByName('CD_FORNECEDOR').AsInteger;
          IBTabela.ExecSQL;

          // Altera Quantidade em Estoque
          if DtM.QuantidadeNFGrade(IBNFItems.FieldByName('CD_PRODUTO').AsInteger, CDNota) > 0 then
          begin
            // Se tem GRADE
            IBTabela2.Active := false;
            IBTabela2.SQL.Clear;
            IBTabela2.SQL.Add('select G.CD_GRADE, G.COD_BARRAS, G.NM_GRADE, coalesce(NG.QUANTIDADE, 0) as QUANTIDADE     ');
            IBTabela2.SQL.Add('from GRADES G                                                                             ');
            IBTabela2.SQL.Add('left outer join ENTRADA_GRADE NG on ((NG.CD_GRADE = G.CD_GRADE) and (NG.CD_NOTA = :CD_NOTA))  ');
            IBTabela2.SQL.Add('where G.CD_PRODUTO = :CD_PRODUTO and NG.QUANTIDADE > 0                                    ');
            if not IBTabela2.Prepared then IBTabela2.Prepare;
            IBTabela2.ParamByName('CD_PRODUTO').AsInteger := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
            IBTabela2.ParamByName('CD_NOTA').AsInteger    := CdNota;
            IBTabela2.Active := true;
            while not IBTabela2.eof do
            begin
              SPAlteraEstoque.Active := false;
              SPAlteraEstoque.IB_Transaction := IBTabela.IB_Transaction;
              SPAlteraEstoque.StoredProcName := 'SP_ALTERAESTOQUE';
              if not SPAlteraEstoque.Prepared then SPAlteraEstoque.Prepare;
              SPAlteraEstoque.ParamByName('ICD_PRODUTO').AsInteger  := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
              SPAlteraEstoque.ParamByName('ICD_GRADE').AsInteger    := IBTabela2.FieldByName('CD_GRADE').AsInteger;
              SPAlteraEstoque.ParamByName('ICD_DEPOSITO').AsInteger := Dep;
              SPAlteraEstoque.ParamByName('IQUANTIDADE').AsCurrency := IBTabela2.FieldByName('QUANTIDADE').AsCurrency;
              SPAlteraEstoque.ParamByName('IPESO').AsCurrency       := IBTabela2.FieldByName('QUANTIDADE').AsCurrency * RegProduto.PesoBruto;
              SPAlteraEstoque.ParamByName('ILOGIN').AsString        := RegUsuario.Login;
              SPAlteraEstoque.ParamByName('IOPERACAO').AsString     := 'E';
              SPAlteraEstoque.ParamByName('IHISTORICO').AsString    := 'ENTRADA DE MERCADORIA';
              SPAlteraEstoque.ExecProc;
              IBTabela2.Next;
            end;
            fDB.FechaTT(IBTabela2);
          end
          else begin
            // Se N�O tem GRADE
            SPAlteraEstoque.Active := false;
            SPAlteraEstoque.IB_Transaction := IBTabela.IB_Transaction;
            SPAlteraEstoque.StoredProcName := 'SP_ALTERAESTOQUE';
            if not SPAlteraEstoque.Prepared then SPAlteraEstoque.Prepare;
            SPAlteraEstoque.ParamByName('ICD_PRODUTO').AsInteger  := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
            SPAlteraEstoque.ParamByName('ICD_GRADE').AsInteger    := 0;
            SPAlteraEstoque.ParamByName('ICD_DEPOSITO').AsInteger := Dep;
            SPAlteraEstoque.ParamByName('IQUANTIDADE').AsCurrency := QuantidadeUnitaria;
            SPAlteraEstoque.ParamByName('IPESO').AsCurrency       := QuantidadeUnitaria * RegProduto.PesoBruto;
            SPAlteraEstoque.ParamByName('ILOGIN').AsString        := RegUsuario.Login;
            SPAlteraEstoque.ParamByName('IOPERACAO').AsString     := 'E';
            SPAlteraEstoque.ParamByName('IHISTORICO').AsString    := 'ENTRADA DE MERCADORIA';
            SPAlteraEstoque.ExecProc;
          end;

          // Registra os N�meros de S�ries
          if DtM.QuantidadeNFNumSerie(IBNFItems.FieldByName('CD_PRODUTO').AsInteger, CdNota) > 0 then
          begin
            IBTabela2.Active := false;
            IBTabela2.SQL.Clear;
            IBTabela2.SQL.Add('select * from ENTRADA_NUMSERIE where CD_NOTA = :CD_NOTA and CD_PRODUTO = :CD_PRODUTO ');
            if not IBTabela2.Prepared then IBTabela2.Prepare;
            IBTabela2.ParamByName('CD_NOTA').AsInteger := CDNota;
            IBTabela2.ParamByName('CD_PRODUTO').AsInteger := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
            IBTabela2.Active := true;
            while not IBTabela2.eof do
            begin
              try
                IBTabela.Active := false;
                IBTabela.SQL.Clear;
                IBTabela.SQL.Add('insert into NUMSERIE');
                IBTabela.SQL.Add('( CD_PRODUTO,  NUMSERIE,  CD_NOTAENTRADA,  NUM_DOC_VENDA,  DISPONIVEL)');
                IBTabela.SQL.Add('values');
                IBTabela.SQL.Add('(:CD_PRODUTO, :NUMSERIE, :CD_NOTAENTRADA, :NUM_DOC_VENDA, :DISPONIVEL)');
                if not IBTabela.Prepared then IBTabela.Prepare;
                IBTabela.ParamByName('CD_PRODUTO').AsInteger     := IBNFItems.FieldByName('CD_PRODUTO').AsInteger;
                IBTabela.ParamByName('NUMSERIE').AsString        := IBTabela2.FieldByName('NUMSERIE').AsString;
                IBTabela.ParamByName('CD_NOTAENTRADA').AsInteger := CDNota;
                IBTabela.ParamByName('NUM_DOC_VENDA').AsInteger  := 0;
                IBTabela.ParamByName('DISPONIVEL').AsString      := 'V';
                IBTabela.ExecSQL;
              except
              end;
              IBTabela2.Next;
            end;
          end;

          // Altera o Pre�o do Produto
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('update PRODUTOS set');
//          if IBNFItems.FieldByName('PRECOCUSTO').Value > 0 then  AQUI
            IBTabela.SQL.Add('PRECOCUSTO   = :PRECOCUSTO,');
          IBTabela.SQL.Add('CUSTOMEDIO   = :CUSTOMEDIO,');
          IBTabela.SQL.Add('ULTIMOCUSTO  = :ULTIMOCUSTO,');
          IBTabela.SQL.Add('TIPOCUSTO    = :TIPOCUSTO,');
          IBTabela.SQL.Add('MARGEM       = :MARGEM,');
          IBTabela.SQL.Add('PRECOVENDA   = :PRECOVENDA,');
          IBTabela.SQL.Add('MARGEM2      = :MARGEM2,');
          IBTabela.SQL.Add('MARGEM3      = :MARGEM3,');
          IBTabela.SQL.Add('MARGEM4      = :MARGEM4,');
          IBTabela.SQL.Add('MARGEM5      = :MARGEM5,');
          IBTabela.SQL.Add('PRECO2       = :PRECO2,');
          IBTabela.SQL.Add('PRECO3       = :PRECO3,');
          IBTabela.SQL.Add('PRECO4       = :PRECO4,');
          IBTabela.SQL.Add('PRECO5       = :PRECO5,');
          IBTabela.SQL.Add('INATIVO      = :INATIVO,');
          IBTabela.SQL.Add('IPI          = :IPI,');
          IBTabela.SQL.Add('FRETECHEGADA = :FRETECHEGADA,');
          IBTabela.SQL.Add('FRETESAIDA   = :FRETESAIDA,');
          IBTabela.SQL.Add('UNDCONVERSAOENTRADA = :UNDCONVERSAOENTRADA,');
          if not Vazio(IBNFItems.FieldByName('CD_GRUPO').AsString) then
            IBTabela.SQL.Add('CD_GRUPO = :CD_GRUPO,');
          IBTabela.SQL.Add('DT_ULTIMOREAJUSTE = current_date,');
          IBTabela.SQL.Add('CX_COD_BARRA_CAIXA = :CX_COD_BARRA_CAIXA,');
          IBTabela.SQL.Add('CX_UNDCONVERSAO = :CX_UNDCONVERSAO');
          IBTabela.SQL.Add('where CD_PRODUTO = :CD_PRODUTO');

          if not IBTabela.Prepared then IBTabela.Prepare;
          IBTabela.ParamByName('CD_PRODUTO').Value               := IBNFItems.FieldByName('CD_PRODUTO').Value;
          IBTabela.ParamByName('INATIVO').AsString               := 'F';
          IBTabela.ParamByName('PRECOCUSTO').Value               := IBNFItems.FieldByName('PRECOCUSTO').Value;
          IBTabela.ParamByName('ULTIMOCUSTO').Value              := IBNFItems.FieldByName('CUSTO_UNITARIO').Value;
          IBTabela.ParamByName('CUSTOMEDIO').Value               := IBNFItems.FieldByName('CUSTOMEDIO').Value;
          IBTabela.ParamByName('TIPOCUSTO').Value                := IBNFItems.FieldByName('TIPOCUSTO').Value;
          IBTabela.ParamByName('MARGEM').AsCurrency              := IBNFItems.FieldByName('MARGEMLUCRO').AsCurrency;
          IBTabela.ParamByName('PRECOVENDA').AsCurrency          := IBNFItems.FieldByName('PRECOVENDA').AsCurrency;
          IBTabela.ParamByName('MARGEM2').AsCurrency             := IBNFItems.FieldByName('MARGEM2').AsCurrency;
          IBTabela.ParamByName('MARGEM3').AsCurrency             := IBNFItems.FieldByName('MARGEM3').AsCurrency;
          IBTabela.ParamByName('MARGEM4').AsCurrency             := IBNFItems.FieldByName('MARGEM4').AsCurrency;
          IBTabela.ParamByName('MARGEM5').AsCurrency             := IBNFItems.FieldByName('MARGEM5').AsCurrency;
          IBTabela.ParamByName('PRECO2').AsCurrency              := IBNFItems.FieldByName('PRECO2').AsCurrency;
          IBTabela.ParamByName('PRECO3').AsCurrency              := IBNFItems.FieldByName('PRECO3').AsCurrency;
          IBTabela.ParamByName('PRECO4').AsCurrency              := IBNFItems.FieldByName('PRECO4').AsCurrency;
          IBTabela.ParamByName('PRECO5').AsCurrency              := IBNFItems.FieldByName('PRECO5').AsCurrency;
          IBTabela.ParamByName('IPI').AsCurrency                 := IBNFItems.FieldByName('IPI').AsCurrency;
          IBTabela.ParamByName('FRETECHEGADA').AsCurrency        := IBNFItems.FieldByName('FRETECHEGADA').AsCurrency;
          IBTabela.ParamByName('FRETESAIDA').AsCurrency          := IBNFItems.FieldByName('FRETESAIDA').AsCurrency;
          IBTabela.ParamByName('UNDCONVERSAOENTRADA').AsCurrency := IBNFItems.FieldByName('UNDCONVERSAO').AsCurrency;
          IBTabela.ParamByName('CX_COD_BARRA_CAIXA').Value       := IBNFItems.FieldByName('CX_COD_BARRA_CAIXA').Value;
          IBTabela.ParamByName('CX_UNDCONVERSAO').Value          := IBNFItems.FieldByName('CX_UNDCONVERSAO').Value;

          if not Vazio(IBNFItems.FieldByName('CD_GRUPO').AsString) then
            IBTabela.ParamByName('CD_GRUPO').AsInteger     := IBNFItems.FieldByName('CD_GRUPO').AsInteger;
          IBTabela.ExecSQL;

          // Atualiza Similares
          if IBNFItems.FieldByName('ATUALIZASIMILARES').AsString = 'V' then
          begin
            IBTabela.Active := false;
            IBTabela.SQL.Clear;
            IBTabela.SQL.Add('Select CD_SIMILAR, PRECOCUSTO, PRECOVENDA, MARGEM from PRODUTOS');
            IBTabela.SQL.Add('where CD_SIMILAR > 0 and CD_PRODUTO = '+IBNFItems.FieldByName('CD_PRODUTO').AsString);
            if not IBTabela.Prepared then IBTabela.Prepare;
            IBTabela.Active := true;

            if IBTabela.FieldByName('CD_SIMILAR').IsNull then CodigoSimilar := 0
                                                         else CodigoSimilar := IBTabela.FieldByName('CD_SIMILAR').AsInteger;
            PrecoCusto  := IBTabela.FieldByName('PRECOCUSTO').AsCurrency;
            PRECOVENDA := IBTabela.FieldByName('PRECOVENDA').AsCurrency;
            MARGEM := IBTabela.FieldByName('MARGEM').AsCurrency;
            fDB.FechaTT(IBTabela);

            if CodigoSimilar > 0 then
            begin
              IBTabela.Active := false;
              IBTabela.SQL.Clear;
              IBTabela.SQL.Add('Update PRODUTOS set');
              IBTabela.SQL.Add('PRECOCUSTO = :PRECOCUSTO,');
              IBTabela.SQL.Add('MARGEM = :MARGEM,');
              IBTabela.SQL.Add('PRECOVENDA = :PRECOVENDA,');
              // Tira a v�rgula
              IBTabela.SQL[IBTabela.SQL.Count-1] := copy(IBTabela.SQL[IBTabela.SQL.Count-1], 1, Length(IBTabela.SQL[IBTabela.SQL.Count-1])-1);
              IBTabela.SQL.Add('where CD_SIMILAR = :CD_SIMILAR');

              if not IBTabela.Prepared then IBTabela.Prepare;
              IBTabela.ParamByName('PRECOCUSTO').Value  := PrecoCusto;
              IBTabela.ParamByName('MARGEM').Value := MARGEM;
              IBTabela.ParamByName('PRECOVENDA').Value := PRECOVENDA;
              IBTabela.ParamByName('CD_SIMILAR').Value  := CodigoSimilar;
              IBTabela.ExecSQL;
            end;
          end;
          IBNFItems.Next;
        end;

        IBTabela.Active := false;
        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('Update ENTRADA set NOTA_FECHADA = :NOTA_FECHADA');
        IBTabela.SQL.Add('where CD_NOTA = :CD_NOTA');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('NOTA_FECHADA').AsString := 'V';
        IBTabela.ParamByName('CD_NOTA').Value := IBNF.FieldByName('CD_NOTA').Value;
        IBTabela.ExecSQL;
        IBTabela.IB_Transaction.Commit;
      except
        on E: exception do begin
          LogDeErros(E.Message);
          IBTabela.IB_Transaction.Rollback;
          MensagemDeErro('N�o foi poss�vel concluir esta nota');
          Exit;
        end;
      end;

      IBNF.Active := false;
      IBNF.Active := true;
    finally
      Bt_ConcluirNota.Enabled := true;
      FechaAviso;
      Screen.Cursor := crDefault;
    end;
  end;
  MensagemDeInformacao('Nota conclu�da');

  if LancarEmContasAPagar then
  begin
    Application.CreateForm(TfNovaContaAPagar, fNovaContaAPagar);
    fNovaContaAPagar.EditRefNotaFiscal.Text := RegContaAPagar.NumNF;
    fNovaContaAPagar.CD_Nota := CdNota;
    fNovaContaAPagar.EditCodFornecedor.Text := RegContaAPagar.Fornecedor;
    fNovaContaAPagar.edValorTotal.Value := RegContaAPagar.Valor;
    fNovaContaAPagar.ShowModal;
    FreeAndNil(fNovaContaAPagar);
  end;

  if ConciliarPrecosParaPDV then
  begin
    with DtM do
    begin
      try
        if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
        IBTabela.Active := False;

        IBTabela.SQL.Clear;
        IBTabela.SQL.Add('UPDATE PRODUTOS SET PDV_PRECOVENDA = PRECOVENDA                              ');
        IBTabela.SQL.Add('where (PDV_PRECOVENDA <> PRECOVENDA)                                         ');
        IBTabela.SQL.Add('and CD_PRODUTO in (Select CD_PRODUTO from ENTRADA_ITEM where CD_NOTA = :CD_NOTA) ');
        if not IBTabela.Prepared then IBTabela.Prepare;
        IBTabela.ParamByName('CD_NOTA').AsInteger := IBNF.FieldByName('CD_NOTA').Value;
        IBTabela.ExecSQL;
        QuantidadeAlterada := IBTabela.RowsAffected;
        IBTabela.IB_Transaction.Commit;
        MensagemDeInformacao(IntToStr(QuantidadeAlterada)+' produtos tiveram seus pre�os sincronizados');
      except
        on E: exception do begin
          LogDeErros(E.Message);
          IBTabela.IB_Transaction.RollBack;
        end;
      end;
    end;
  end;

  Close;
end;

procedure TfEntradaNotasItems.LocalizaFornecedor(lfCodigoDoFornecedor: Integer);
begin
end;

procedure TfEntradaNotasItems.DBEditPrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '.' then key := ',';
end;

procedure TfEntradaNotasItems.bt_ImportarPedidoClick(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgEntradaDeNotas, 'A') then Exit;
  Panel2.Visible := false;
  Application.CreateForm(TfSelecPedidoCompra, fSelecPedidoCompra);
  fSelecPedidoCompra.CodFornecedor := DtM.IBNF.FieldByName('CD_FORNECEDOR').AsInteger;
  fSelecPedidoCompra.ShowModal;
  FreeAndNil(fSelecPedidoCompra);
  Panel2.Visible := true;

  DtM.IBNFItems.DisableControls;
  filtra;
  DtM.IBNFItems.EnableControls;

  DtM.IBNF.RefreshRows;
end;

procedure TfEntradaNotasItems.SomaTotalDaNota;
begin
  RxDBCalcEdit9.Value := RxDBCalcEdit4.Value +
                         RxDBCalcEdit5.Value +
                         RxDBCalcEdit6.Value +
                         RxDBCalcEdit7.Value +
                         RxDBCalcEdit8.Value;
end;


procedure TfEntradaNotasItems.RxDBCalcEdit5Exit(Sender: TObject);
begin
  SomaTotalDaNota;
end;

procedure TfEntradaNotasItems.BitBtn1Click(Sender: TObject);
begin
  if not mUsers.TemAcessoPermissao(sgEntradaDeNotas, 'A') then Exit;
  Application.CreateForm(TfNovaEntradaNota, fNovaEntradaNota);
  fNovaEntradaNota.Modo := mdAlteracao;
  with DtM, fNovaEntradaNota do
  begin
    EditCodFornecedor.Text   := IBNF.FieldByName('CD_FORNECEDOR').AsString;
    EditNumNota.Text         := IBNF.FieldByName('NUM_DOCUMENTO').AsString;
    EditDataEmissao.Date     := IBNF.FieldByName('DT_EMISSAO').AsDateTime;
    EditDataEntrada.Date     := IBNF.FieldByName('DT_ENTRADA').AsDateTime;
    EditBaseCalcICMS.Value   := IBNF.FieldByName('ICMS_BASE').AsCurrency;
    EditValorICMS.Value      := IBNF.FieldByName('ICMS_VALOR').AsCurrency;
    EditBaseICMSSubst.Value  := IBNF.FieldByName('ICMS_BASESUBST').AsCurrency;
    EditValorICMSSubst.Value := IBNF.FieldByName('ICMS_VALORSUBST').AsCurrency;
    EditValorTotalProd.Value := IBNF.FieldByName('VR_TOTAL_PROD').AsCurrency;
    EditValorFrete.Value     := IBNF.FieldByName('VALOR_FRETE').AsCurrency;
    EditValorSeguro.Value    := IBNF.FieldByName('VALOR_SEGURO').AsCurrency;
    EditOutrasDespesas.Value := IBNF.FieldByName('OUTRAS_DESPESAS').AsCurrency;
    EditValorTotalIPI.Value  := IBNF.FieldByName('VALOR_IPI').AsCurrency;
    EditValorTotalNota.Value := IBNF.FieldByName('VALOR_TOTAL_NOTA').AsCurrency;
    EditDescontoGeral.Value  := IBNF.FieldByName('DESCONTO_TOTAL').AsCurrency;
    EditObs.Text             := IBNF.FieldByName('OBS').AsString;
    EditNatOperacao.Text     := IBNF.FieldByName('NAT_OPERACAO').AsString;
    EditSerie.Text           := IBNF.FieldByName('SERIE').AsString;
    EditModelo.Text          := IBNF.FieldByName('MODELO').AsString;
    EditChaveNFe.Text        := IBNF.FieldByName('CHAVE_NFE').AsString;
    EditValorII.Value        := IBNF.FieldByName('VALOR_II').AsCurrency;
    EditValorPIS.Value       := IBNF.FieldByName('VALOR_PIS').AsCurrency;
    EditValorCofins.Value    := IBNF.FieldByName('VALOR_COFINS').AsCurrency;
    case StrToChar(IBNF.FieldByName('TIPO_NOTA').AsString, 'F') of
      'F' : RadioGroupTipoNota.ItemIndex := 0;
      'P' : RadioGroupTipoNota.ItemIndex := 1;
    end;
  end;

  fNovaEntradaNota.ShowModal;
  try
    if fNovaEntradaNota.BotaoPressionado <> bpOk then Exit
    else begin
      with DtM, fNovaEntradaNota do
      begin
        try
          AbreAviso('Gravando Dados da Nota');
          fNovaEntradaNota.CD_NOTA := self.CD_NOTA;
          if not IBTabela.IB_Transaction.InTransaction then IBTabela.IB_Transaction.StartTransaction;
          IBTabela.Active := false;
          IBTabela.SQL.Clear;
          IBTabela.SQL.Add('update ENTRADA set');
          IBTabela.SQL.Add(' TIPO_NOTA        = :TIPO_NOTA,');
          IBTabela.SQL.Add(' CD_FORNECEDOR    = :CD_FORNECEDOR,');
          IBTabela.SQL.Add(' CNPJ             = :CNPJ,');
          IBTabela.SQL.Add(' NM_FORNECEDOR    = :NM_FORNECEDOR,');
          IBTabela.SQL.Add(' NUM_DOCUMENTO    = :NUM_DOCUMENTO, ');
          IBTabela.SQL.Add(' CFOP             = :CFOP,');
          IBTabela.SQL.Add(' DT_EMISSAO       = :DT_EMISSAO,');
          IBTabela.SQL.Add(' DT_ENTRADA       = :DT_ENTRADA,');
          IBTabela.SQL.Add(' OBS              = :OBS,');
          IBTabela.SQL.Add(' ICMS_BASE        = :ICMS_BASE,');
          IBTabela.SQL.Add(' ICMS_VALOR       = :ICMS_VALOR, ');
          IBTabela.SQL.Add(' ICMS_BASESUBST   = :ICMS_BASESUBST,');
          IBTabela.SQL.Add(' ICMS_VALORSUBST  = :ICMS_VALORSUBST,');
          IBTabela.SQL.Add(' VR_TOTAL_PROD    = :VR_TOTAL_PROD,');
          IBTabela.SQL.Add(' VALOR_FRETE      = :VALOR_FRETE, ');
          IBTabela.SQL.Add(' VALOR_SEGURO     = :VALOR_SEGURO,');
          IBTabela.SQL.Add(' OUTRAS_DESPESAS  = :OUTRAS_DESPESAS,');
          IBTabela.SQL.Add(' VALOR_IPI        = :VALOR_IPI,');
          IBTabela.SQL.Add(' VALOR_TOTAL_NOTA = :VALOR_TOTAL_NOTA, ');
          IBTabela.SQL.Add(' DESCONTO_TOTAL   = :DESCONTO_TOTAL,');
          IBTabela.SQL.Add(' NOTA_FECHADA     = :NOTA_FECHADA,');
          IBTabela.SQL.Add(' ULTIMAALTERACAO  = :ULTIMAALTERACAO,');
          IBTabela.SQL.Add(' NAT_OPERACAO     = :NAT_OPERACAO,');
          IBTabela.SQL.Add(' SERIE            = :SERIE,');
          IBTabela.SQL.Add(' MODELO           = :MODELO,');
          IBTabela.SQL.Add(' CHAVE_NFE        = :CHAVE_NFE,');
          IBTabela.SQL.Add(' VALOR_II         = :VALOR_II,');
          IBTabela.SQL.Add(' VALOR_PIS        = :VALOR_PIS,');
          IBTabela.SQL.Add(' VALOR_COFINS     = :VALOR_COFINS');
          IBTabela.SQL.Add(' where CD_NOTA    = :CD_NOTA');

          if not IBTabela.Prepared then IBTabela.Prepare;
          fNovaEntradaNota.DefineParametros;
          IBTabela.ExecSQL;
          IBTabela.IB_Transaction.Commit;
        except
          on E: exception do begin
            FechaAviso;
            LogDeErros(E.Message);
            IBTabela.IB_Transaction.RollBack;
            MensagemDeErro('N�o foi poss�vel gravar os dados desta Nota');
            exit;
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(fNovaEntradaNota);
    FechaAviso;
  end;

  DtM.IBNF.Refresh;

  if DtM.IBNFItems.RecordCount > 0 then
  begin
    Application.CreateForm(TfNFAlteracao, fNFAlteracao);
    fNFAlteracao.ShowModal;
    case fNFAlteracao.RadioGroup1.ItemIndex of
      0 : TipoAtualizacao := taAlteraPreco;
      1 : TipoAtualizacao := taAlteraMargem;
    end;
    FreeAndNil(fNFAlteracao);
  end;

  AtualizaItems;
end;

procedure TfEntradaNotasItems.edObsFornecEnter(Sender: TObject);
begin
  edObsFornec.Color := clWindow;
end;

procedure TfEntradaNotasItems.edObsFornecExit(Sender: TObject);
begin
  fDB.DefineValores(DtM.IBDatabaseServer,'FORNECEDORES', ['OBS', edObsFornec.Text], 'CD_FORNECEDOR = '+ DtM.IBNF.FieldByName('CD_FORNECEDOR').AsString , false);
  edObsFornec.Color := clCream;
end;

procedure TfEntradaNotasItems.edObsFornecKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) and (Shift = []) then wwDBGrid1.SetFocus;
end;

end.
