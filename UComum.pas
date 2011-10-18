unit UComum;

interface

uses
  SysUtils, Classes, Dialogs, Windows, DUtilit, Gauges,
  Controls, Forms, DB, StdCtrls, ComCtrls, UConstVar, Graphics,
  RDprint, ExtCtrls, IB_SessionProps, IBODataset, IB,
  Wwdbgrid, IB_Access, DBFunctions, UVersao,
  IB_Components, MessageFunctions;

type
  TCM = class(TDataModule)
    IBTabela: TIB_Query;
    IBTabelaLocal: TIB_Query;
    IBTransacao: TIB_Transaction;
    IBTransacaoLocal: TIB_Transaction;
    IBAuxTabela: TIB_Query;
    IBAuxTransacao: TIB_Transaction;
    RDprintNF: TRDprint;
    SPTransacao: TIB_Transaction;
    TRPing: TIB_Transaction;
    SP_Ping: TIB_StoredProc;
    IB_SessionProps1: TIB_SessionProps;
    StoredProcServer: TIB_StoredProc;
    SPTransacaoLocal: TIB_Transaction;
    StoredProcLocal: TIB_StoredProc;
    IBPing: TIB_Query;
    TransaPing: TIB_Transaction;
    IBAReceber: TIBOQuery;
    IBAReceberDT_EMISSAO: TDateTimeField;
    IBAReceberNUM_DOCUMENTO: TStringField;
    IBAReceberVENCIMENTOATUAL: TDateField;
    IBAReceberATRASO: TIntegerField;
    IBAReceberVALORATUAL: TBCDField;
    IBAReceberJUROS: TBCDField;
    IBAReceberSUBTOTAL: TBCDField;
    IBAReceberDESC_TIPO_PAGAMENTO: TStringField;
    IBAReceberNM_CLIENTE: TStringField;
    IBAReceberCD_CLIENTE: TIntegerField;
    IBAReceberNUM_DOC_VENDA: TIntegerField;
    IBAReceberVALORORIGINAL: TBCDField;
    IBAReceberVENCIMENTOORIGINAL: TDateField;
    IBAReceberABATIDO: TBCDField;
    IBAReceberNUM_TERMINAL: TSmallintField;
    IBAReceberNOMEVENDEDOR: TStringField;
    IBAReceberLOGIN: TStringField;
    IBAReceberOBS: TStringField;
    IBAReceberNUM_BANCO: TStringField;
    IBAReceberAGENCIA: TStringField;
    IBAReceberNUM_CHEQUE: TStringField;
    IBAReceberNUM_CONTA: TStringField;
    IBAReceberPARCELA: TStringField;
    IBAReceberNUM_DOC_CONTA: TIntegerField;
    IBAReceberCH_STATUS: TSmallintField;
    IBAReceberCH_DT_STATUS: TDateTimeField;
    IBAReceberCH_REPASSADO_PARA: TStringField;
    IBAReceberCH_CD_CONTA_CLIENTE: TIntegerField;
    IBAReceberCH_DEP_NUM_CONTA: TIntegerField;
    IBAReceberSEQUENCIAL: TIntegerField;
    IBAReceberTIPO_PAGAMENTO: TSmallintField;
    IBAReceberVENDEDOR: TIntegerField;
    IBAReceberIMPRIMIU: TStringField;
    IBAReceberIMPRIMIR: TStringField;
    IBAReceberOP_NUM_TERMINAL: TSmallintField;
    IBAReceberINATIVO: TStringField;
    TrAReceber: TIBOTransaction;
    IBTabela3: TIB_Query;
    IBTransacao3: TIB_Transaction;
    IBAReceberTITULAR_CPF: TStringField;
    IBAReceberTITULAR_NOME: TStringField;
    IBAReceberQTDE_PARCELAS: TSmallintField;
    IBAReceberVALOR_TOTALPARCELAS: TBCDField;
    IBAReceberBAIXADO: TStringField;
    IBAReceberBX_JUROS: TBCDField;
    IBAReceberBX_ATRASO: TIntegerField;
    IBAReceberBX_DATA: TDateTimeField;
    IBAReceberBX_OBS: TStringField;
    IBAReceberBX_LOGIN: TStringField;
    IBAReceberBX_NUM_TERMINAL: TSmallintField;
    IBAReceberBOL_NOSSONUMERO: TIntegerField;
    IBAReceberCONTA_ATRASO_MULTA: TBCDField;
    IBAReceberCONTA_ATRASO_JUROSAODIA: TBCDField;
    IBAReceberACRES_DESC_VALOR: TBCDField;
    IBAReceberBX_ACRES_DESC_VALOR: TBCDField;
    IBAReceberATRASO_MULTA: TBCDField;
    IBAReceberATRASO_JUROSAODIA: TBCDField;
    IBAReceberCALCULAMULTAJUROS: TStringField;
    IBAReceberCALCULASALDODADIVIDA: TStringField;
    IBAReceberCALCULALIMITECREDITO: TStringField;
    IBAReceberBLOQUEADO: TStringField;
    IBAReceberBLOQUEIOMANUAL: TStringField;
    IBAReceberMAIORATRASO: TSmallintField;
    IBAReceberSALDODADIVIDA: TBCDField;
    IBAReceberNUM_NF: TIntegerField;
  private
    ok : boolean;
    procedure LimpaDadosDoRepresentante;
    procedure CarregaConfigCadastro;
  public
    function PegaGrade(pgCdProduto: Integer): boolean;
    procedure MostraItems(miNumDocumento: Integer; miTipoDocumento: char);
    procedure AlteraEstoque(aeCodProduto: Integer); overload;
    function PegaNomeProduto(npCdProduto:Integer; npCdGrade:Integer; npDescricaoCadastrada:String;
      npDescricaoAlterada:String=''; npDescricaoAbreviada:String=''; npUsarDescrAbrev:boolean=false;
      npNumSerie:String=''):String;
    function CodigoWeb(cwCodigo: Integer): Integer;
    function TemCodVenda: Boolean;
    function VerificaVersaoDoFirebird(vvConexao:TIBODatabase):boolean;
    function FormStr(fAlinhamento: Char; fTexto: String; fTamanho: Integer;
      fAcentuacao:char='A'): String;
    function FormataEndereco(MultiLinhas:Boolean;  Endereco:string=''; Numero:string='';
      Bairro:string=''; Cidade:string=''; Estado:string=''; Cep:string='';
      Complemento:string=''): string;
    procedure GravaErro(Mensagem:String);
    function IdentificaConexao: TIBODatabase;
    function PegaNumDAV(var pnNumDAV: Integer): boolean;
    function TemST(tsCST: String): boolean;
    function E_Tributado(tsCST: String): boolean;
    procedure MostraTodasAsCSTs;
    function DescricaodaCST(CST: String): String;
    procedure IniciaModuloComum(imcBaseServer, imcBaseLocal: TIBODatabase);
    procedure PegaInformacoesDoTerminal;
    procedure CarregaValoresIniciais;
    function PegaFiltroPesqMunicipio(pfEstadoSigla: String): String;
    function CalcSubTotalLiquido(csValorUnit: Currency; csQuantidade: Real;
      csComprimento: Real = 0; csLargura: Real = 0; csEspessura: Real = 0;
      csPesoLiquido: Real = 0): Currency;
    procedure CalculaPorcValor(var acPorcValor: TRegValorPorc;
      acValorBruto: Currency);
    procedure InicializaGrid(rgRestaurar: boolean; rgForm: TForm;
      var rgDBGrid: TwwDBGrid; rgNomeAdicional: String = '');
    function TemConexaoServidorFOCUS(tcExibeMensagens: boolean = true): boolean;
    procedure LigaModoExclusivo;
    procedure DesligaModoExclusivo;
    Procedure VerificaModoExclusivo;
    function StringGrupo(sgCdGrupo: Integer): String;
    function PrimeiraData: TDateTime;
    function UltimaData: TDateTime;
    procedure FechaAviso;
    function MaiorCodigo(mcTabela, mcCampo: String;
      mcConexao: TIBODatabase): Integer;
    procedure AcertaEstoque;
    function VinculaProdFornec(vpfCodVinculo: String;
      vpfCDProduto, vpfCDFornecedor: Integer; vpfUltimaCompra: TDate = 0;
      vpfUltimaNota: Integer = 0): boolean;
    function PegaDepositoEntradaOuSaida(pdEntradaOuSaida: Char): Integer;
    function MediaDeVendaDiariaDoProduto(mvCodProduto, mvPeriodo: Integer)
      : Currency;
    function UmSeZero(Valor: Real): Real;
    function TemGrades(tgCdProduto: Integer): boolean;
    procedure UpgradeChaveRegistro;
    procedure PegaNumNF(var pnNumNF: String);
    procedure ExportaConfLocal;
    procedure PegaResolucao;
    procedure ConfigLocalPadraoSeVazio;
    function PegaDadosDoRepresentante(drCodRepresentante: Integer;
      drTabela: TIBOQuery): boolean;
    function AlteraEstoque(aeCdProduto, aeCdGrade, aeCdDeposito: Integer;
      aeQuantidade, aePeso: Currency; aeOperacao: Char;
      aeHistorico, aeLogin: String): boolean; overload;
    function PegaNomeDoCPFCNPJ(pnCPFCNPJ: String): String;
    procedure ConfigPadraoSeVazio;
    function FormJaTaCriado(NomeDoForm: TForm): boolean;
    function CPFComChequeDevolvido(CPF: String): boolean;
    function CPFComContaBloqueada(CPF: String): boolean;
    procedure VerificaVendaConfirmada(vvNumDocumento: Integer);
    function LocalizaComboBox(lcComboBox: TComboBox; lcValor: Integer): Integer;
    function F3OuAltDown(key: word; Shift: TShiftState): boolean;
    function PegaCustoMedio(pcProduto: Integer): Currency;
    function SitMarca(SitStr: String): TSitMarca;
    procedure TiraSelecRegistros(tsrTABELA: Integer);
    procedure AtivaTriggers;
    procedure DesativaTriggers;
    procedure DefineConstantes;
    function ChaveDesteForm(cfForm: TForm): String;
    function QuantidadeDeTerminaisCadastrados: Integer;
    procedure ConciliaRefProdutos;
    procedure ConciliaRefClientes;
    function BuscaRegistro(brCompCodigo, brCompDescricao: TObject;
      brTabela, brCampoCodigo, brCampoDescricao: String;
      brFiltro: String = ''; brBuscaInativos: boolean = false): String;
    procedure InstalaFonte(ifFonteNome, ifFonteArquivo: String);
    procedure BuscaTexto(btQuery: TIBOQuery; btTexto, btSelect: String;
      btCampos: Array of String;
      btTabela, btFiltro, btOrdenacao: String; btComposta: boolean);
    procedure LimpaDadosDoProduto;
    function PegaDadosDoProduto(dpCodProduto: Integer; dpCodGrade: Integer = 0;
      dpPegaFoto: boolean = false): boolean;
    function NowDoServidor: TDateTime;
    function HoraDoServidor: TTime;
    function MargemDeLucroOculta(Margem: Real; Exibicao: String): String;
    function PegaCodBarras(pcCodigoInterno: Integer): String;
    procedure LimpaDadosDaEmpresa;
    procedure IncluiEmExclusoes(ieEvento: Integer; ieDescricao: String);
    procedure LimpaRegistrosSelecionados;
    procedure VerificaDependencia(vdTabela, vdCampo, vdDescricao: String;
      vdEsteRegistro: Integer; var vdTexto: String);
    procedure MarcaSelecao(msTabela: Integer; Situacao: TSitMarca;
      Sequencial: array of Integer; SitAtual: TSitMarca = smDesmarcado);
    function SalvaValorDoComponente(svForm: TForm; svComponente: TObject;
      svValor: Variant): boolean;
    function BuscaValorDoComponente(svForm: TForm; svComponente: TObject;
      svDefault: Variant): Variant;
    function ModeloEtiquetaTaInativo(viCodEtiqueta: String): boolean;
    function PegaEstoque(peCdProduto: Integer; peCdGrade: Integer = 0;
      peCdDeposito: Integer = 0): Currency;
    function GeraCodigo: String;
    function PegaCodBalanca(pcModo: TModos; pcCDproduto: Integer): Integer;
    function JaTemCodBalanca(jtCodigo: String; jtModo: TModos;
      jtCdProduto: Integer): boolean;
    procedure LimpaDadosDoFornecedor;
    function PegaDadosDoFornecedor(dfCodFornecedor: Integer;
      dfTabela: TIBOQuery): boolean;
    procedure ZeraPagamento(var zpRegPed: TRegPedido);
    function PegaChaveDoRegistro: boolean;
    function TemDepositos: Boolean;
  end;

  function Diretorio_LOG:String;

var
  CM: TCM;

implementation

Uses UAguarde, JPeg, UCalculadora, Variants, UModUsuarios, IB_Session,
     RegExport, Registry, USelecProdNumSerie, Math, UFormModoExclusivo,
     UDiverso, pcnConversao, UIni, JvLabel, UDataMod,  UEstoquesDepositos, UEstoquesGrades,
     USelecGrade, UAltEstoque, UMostraItensDaConta;

{$R *.dfm}

procedure TCM.AlteraEstoque(aeCodProduto:Integer);
begin
  if not mUsers.TemAcessoPermissao(sgEstoque, 'A') then Exit;

  if CM.TemDepositos then
  begin
    Application.CreateForm(TfEstoqueDepositos, fEstoqueDepositos);
    fEstoqueDepositos.CodProduto := aeCodProduto;
    fEstoqueDepositos.ShowModal;
    FreeAndNil(fEstoqueDepositos);
  end
  else begin
    if CM.TemGrades(aeCodProduto) then
    begin
      Application.CreateForm(TfEstoqueGrades, fEstoqueGrades);
      fEstoqueGrades.CodProduto := aeCodProduto;
      fEstoqueGrades.ShowModal;
      FreeAndNil(fEstoqueGrades);
    end
    else begin
      Application.CreateForm(TfEstoqueSimples, fEstoqueSimples);
      fEstoqueSimples.CodProduto := aeCodProduto;
      fEstoqueSimples.ShowModal;
      FreeAndNil(fEstoqueSimples);
    end;
  end;
end;

function TCM.AlteraEstoque(aeCdProduto, aeCdGrade, aeCdDeposito:Integer; aeQuantidade:Currency; aePeso:Currency; aeOperacao:char; aeHistorico:String; aeLogin:String):boolean;
begin
  StoredProcServer.Active := false;
  try
    if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
    StoredProcServer.StoredProcName := 'SP_ALTERAESTOQUE';
    if not StoredProcServer.Prepared then StoredProcServer.Prepare;
    StoredProcServer.ParamByName('ICD_PRODUTO').AsInteger  := aeCdProduto;
    StoredProcServer.ParamByName('ICD_GRADE').AsInteger    := aeCdGrade;
    StoredProcServer.ParamByName('ICD_DEPOSITO').AsInteger := aeCdDeposito;
    StoredProcServer.ParamByName('IQUANTIDADE').AsCurrency := aeQuantidade;
    StoredProcServer.ParamByName('IPESO').AsCurrency       := aePeso;
    StoredProcServer.ParamByName('ILOGIN').AsString        := aeLogin;
    StoredProcServer.ParamByName('IOPERACAO').AsString     := aeOperacao;
    StoredProcServer.ParamByName('IHISTORICO').AsString    := aeHistorico;
    StoredProcServer.ParamByName('IDIM_COMPRIMENTO').AsCurrency := 0;
    StoredProcServer.ParamByName('IDIM_LARGURA').AsCurrency     := 0;
    StoredProcServer.ParamByName('IDIM_ESPESSURA').AsCurrency   := 0;
    StoredProcServer.ExecProc;
    StoredProcServer.IB_Transaction.Commit;
    result := true;
  except
    result := false;
  end;
end;

function TCM.PegaGrade(pgCdProduto:Integer):boolean;
begin
  RegProduto.Grade.CD_Grade := CodigoVazio;
  RegProduto.Grade.CodBarras := '';
  RegProduto.Grade.Descricao := '';
  result := false;
  if CM.TemGrades(pgCdProduto) then
  begin
    try
      Application.CreateForm(TfSelecionaGrade, fSelecionaGrade);
      fSelecionaGrade.CD_PRODUTO := pgCdProduto;
      fSelecionaGrade.ShowModal;
      if fSelecionaGrade.BotaoPressionado <> bpOk then Exit;

      RegProduto.Grade.CD_Grade  := fSelecionaGrade.CD_GRADE;
      RegProduto.Grade.CodBarras := fSelecionaGrade.COD_BARRAS;
      RegProduto.Grade.Descricao := fSelecionaGrade.NM_GRADE;
      result := true;
    finally
      FreeAndNil(fSelecionaGrade);
    end;
  end
  else result := true;
end;

procedure TCM.MostraItems(miNumDocumento:Integer; miTipoDocumento:char);
begin
  try
    if fMostraItensDaConta <> nil then
    begin
      fMostraItensDaConta.Release;
      fMostraItensDaConta := nil;
      Exit;
    end;
  except
  end;

  if miNumDocumento > 0 then
  begin
    Application.CreateForm(TfMostraItensDaConta, fMostraItensDaConta);
    fMostraItensDaConta.Num_Documento := miNumDocumento;
    case miTipoDocumento of
      'P' : fMostraItensDaConta.Chamada := chPedidos;
      'O' : fMostraItensDaConta.Chamada := chOrcamentos;
      'V' : fMostraItensDaConta.Chamada := chVendasFechadas;
    end;
    fMostraItensDaConta.ShowModal;
    fMostraItensDaConta.Release;
    fMostraItensDaConta := nil;
  end;
end;

function TCM.FormJaTaCriado(NomeDoForm:TForm):boolean;
var
  I : Integer;
begin
  result := true;
  try
    I := NomeDoForm.Top;
  except
    result := false;
  end;
end;

function TCM.PegaNomeProduto(npCdProduto:Integer; npCdGrade:Integer; npDescricaoCadastrada:String; npDescricaoAlterada:String=''; npDescricaoAbreviada:String=''; npUsarDescrAbrev:boolean=false; npNumSerie:String=''):String;
var
  SP : TIB_StoredProc;
begin
  case Modulo of
    moGER : SP := StoredProcServer;
    moPDV : SP := StoredProcLocal;
  end;

  SP.Active := false;
  SP.StoredProcName := 'SP_NOME_PRODUTO';
  if not SP.Prepared then SP.Prepare;
  SP.ParamByName('ICD_PRODUTO').AsInteger := npCdProduto;
  SP.ParamByName('ICD_GRADE').AsInteger := npCdGrade;
  SP.ParamByName('IDESCRICAO_CADASTRADA').AsString := npDescricaoCadastrada;
  SP.ParamByName('IDESCRICAO_ALTERADA').AsString   := npDescricaoAlterada;
  SP.ParamByName('IDESCRICAO_ABREVIADA').AsString  := npDescricaoAbreviada;
  SP.ParamByName('IUSAR_DESCR_ABREV').AsString := BooleanToChar(npUsarDescrAbrev);
  SP.ParamByName('IEXIBIR_COD_GRADE').AsString := BooleanToChar(ConfigCadastro.GradeExibirCodigo);
  SP.ParamByName('IEXIBIR_NUMSERIE').AsString  := BooleanToChar(ConfigCadastro.Prod_ExibirNumSerie);
  SP.ParamByName('INUMSERIE').AsString := trim(npNumSerie);
  SP.ExecProc;
  result := SP.ParamByName('DESCRICAO').AsString;
end;

function TCM.CodigoWeb(cwCodigo:Integer):Integer;
begin
  result := cwCodigo;
  if (RegWeb.CD_Empresa > 0) then result := StrToInt(IntToStr(cwCodigo) + PoeZeros(RegWeb.CD_Empresa, 3));
end;

function TCM.TemCodVenda:Boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    try
      fDB.CreateQueryTransacao(IdentificaConexao, EstaTabela, EstaTransacao);

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select count(*) C from CODIGOVENDA');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;
      result := EstaTabela.FieldByName('C').AsInteger > 0;
    except
      result := false;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

Procedure Delay (Seconds: Real);
var Later:  TDateTime;
Begin
  Later := Now + (Seconds / (24.0 * 60.0 * 60.0));
  while Now < Later do Application.ProcessMessages;
end;

Procedure Pause (Seconds: Real);
Begin
  Delay(Seconds/1000);
end;

function TCM.TemDepositos:Boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    try
      fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select count(*) C from DEPOSITOS');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;
      result := EstaTabela.FieldByName('C').AsInteger > 0;
    except
      result := false;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;


procedure TCM.LimpaDadosDoProduto;
begin
  RegProduto.CD_Produto       := CodigoVazio;
  RegProduto.Nm_Produto       := '';
  RegProduto.DescricaoAbrev   := '';
  RegProduto.Cod_Barras       := '';
  RegProduto.Codigo2          := '';
  RegProduto.Codigo3          := '';
  RegProduto.Codigo4          := '';
  RegProduto.MargemLucro      := 0;
  RegProduto.Preco            := 0;
  RegProduto.PrecoCusto       := 0;
  RegProduto.FreteChegada     := 0;
  RegProduto.FreteSaida       := 0;
  RegProduto.ICMS             := 0;
  RegProduto.IPI              := 0;
  RegProduto.NCM              := '';
  RegProduto.Origem           := 0;
  RegProduto.SubstTribut      := false;
  RegProduto.ECF_Sit_Tribut     := 'N';
  RegProduto.Unidade          := '';
  RegProduto.DescontoMax      := 0;
  RegProduto.Estoque          := 0;
  RegProduto.PrecoProPeso     := false;
  RegProduto.PesoLiquido      := 0;
  RegProduto.PesoBruto        := 0;
  RegProduto.CX_Quantidade    := 0;
  RegProduto.CasasDecimais    := 2;
  RegProduto.UNDFracionada    := false;
  RegProduto.ControlaNumSerie := false;
  RegProduto.NumSerie         := '';
  RegProduto.Grade.CD_Grade   := CodigoVazio;
  RegProduto.Grade.CodBarras  := '';
  RegProduto.Grade.Descricao  := '';
  RegProduto.Foto.Assign(nil);
end;

function TCM.PegaDadosDoProduto(dpCodProduto:Integer; dpCodGrade:Integer=0; dpPegaFoto:Boolean=False):Boolean;
var
  dpTabela    : TIB_Query;
  dpTransacao : TIB_Transaction;
  dpPrecoProm : Currency;
  jpgImg      : TJPEGImage;
begin
  try
    RegProduto.CD_Produto := CodigoVazio;

    fDB.CreateQueryTransacao(IdentificaConexao, dpTabela, dpTransacao);
    dpTabela.Active := false;

    dpTabela.SQL.Clear;
    dpTabela.SQL.Add('SELECT P.CD_PRODUTO, NM_PRODUTO, DESCRICAO_ABREV, P.COD_BARRAS, MARGEM, PDV_PRECOVENDA, PRECOCUSTO, ');
    dpTabela.SQL.Add('ALIQUOTA, UNIDADE, DESCONTOMAXIMO, PRECOPROPESO, PESOLIQUIDO, PESOBRUTO, CLASSFISCAL,               ');
    dpTabela.SQL.Add('UND_FRACIONADA, CX_UNDCONVERSAO, TRESCASAS,                                                         ');
    dpTabela.SQL.Add('CONTROLANUMSERIE, CODIGO02, CODIGO03, CODIGO04, FRETECHEGADA, FRETESAIDA,                           ');
    dpTabela.SQL.Add('IPI, ECF_SIT_TRIBUT, ORIGEM, SUBSTTRIBUTARIA');
    if dpPegaFoto then dpTabela.SQL.Add(', P.FOTO ');
    if CodVenda.CodigoDaVenda > 0 then dpTabela.SQL.Add(', CV.PRECO as PRECO_CV');
    if dpCodGrade > 0 then dpTabela.SQL.Add(', GR.NM_GRADE, GR.COD_BARRAS as CODBARRAS_GRADE');
    dpTabela.SQL.Add('FROM PRODUTOS P');
    if CodVenda.CodigoDaVenda > 0 then dpTabela.SQL.Add('left outer join SP_TIPOPRECO(P.CD_PRODUTO, '+IntToStr(CodVenda.CodigoDaVenda)+') CV on 1=1');
    if dpCodGrade > 0 then dpTabela.SQL.Add('left outer join GRADES GR on ((GR.CD_PRODUTO = P.CD_PRODUTO) and (GR.CD_GRADE = '+IntToStr(dpCodGrade)+'))');
    dpTabela.SQL.Add('where P.CD_PRODUTO = :CD_PRODUTO');
    fDB.SalvaSQL(dpTabela.SQL);
    if not dpTabela.Prepared then dpTabela.Prepare;
    dpTabela.ParamByName('CD_PRODUTO').AsInteger := dpCodProduto;
    dpTabela.Active := true;

    if dpTabela.IsEmpty then
    begin
      result := false;
      LimpaDadosDoProduto;
    end
    else begin
      result := true;
      RegProduto.CD_Produto     := dpTabela.FieldByName('CD_PRODUTO').AsInteger;
      RegProduto.Cod_Barras     := dpTabela.FieldByName('COD_BARRAS').AsString;
      RegProduto.Codigo2        := dpTabela.FieldByName('CODIGO02').AsString;
      RegProduto.Codigo3        := dpTabela.FieldByName('CODIGO03').AsString;
      RegProduto.Codigo4        := dpTabela.FieldByName('CODIGO04').AsString;
      RegProduto.Nm_Produto     := dpTabela.FieldByname('NM_PRODUTO').AsString;
      RegProduto.DescricaoAbrev := dpTabela.FieldByname('DESCRICAO_ABREV').AsString;

      if dpCodGrade > 0 then
      begin
        RegProduto.Grade.CD_Grade  := dpCodGrade;
        RegProduto.Grade.CodBarras := dpTabela.FieldByname('CODBARRAS_GRADE').AsString;
        RegProduto.Grade.Descricao := dpTabela.FieldByname('NM_GRADE').AsString;
      end
      else begin
        RegProduto.Grade.CD_Grade  := 0;
        RegProduto.Grade.CodBarras := '';
        RegProduto.Grade.Descricao := '';
      end;

      if dpTabela.FieldByName('TRESCASAS').AsString = 'V' then RegProduto.CasasDecimais := 3
                                                          else RegProduto.CasasDecimais := 2;

      RegProduto.MargemLucro    := dpTabela.FieldByName('MARGEM').AsCurrency;

      if CodVenda.CodigoDaVenda > 0 then RegProduto.Preco := dpTabela.FieldByName('PRECO_CV').AsCurrency
                                    else RegProduto.Preco := dpTabela.FieldByName('PDV_PRECOVENDA').AsCurrency;
      RegProduto.Preco          := RoundTo(RegProduto.Preco, RegProduto.CasasDecimais*(-1));
      RegProduto.PrecoCusto     := RoundTo(dpTabela.FieldByName('PRECOCUSTO').AsCurrency, RegProduto.CasasDecimais*(-1));
      RegProduto.FreteChegada   := RoundTo(dpTabela.FieldByName('FRETECHEGADA').AsCurrency, RegProduto.CasasDecimais*(-1));
      RegProduto.FreteSaida     := RoundTo(dpTabela.FieldByName('FRETESAIDA').AsCurrency, RegProduto.CasasDecimais*(-1));
      RegProduto.ICMS           := dpTabela.FieldByName('ALIQUOTA').AsCurrency;
      RegProduto.IPI            := dpTabela.FieldByName('IPI').AsCurrency;
      RegProduto.Unidade        := dpTabela.FieldByName('UNIDADE').AsString;
      RegProduto.Origem         := dpTabela.FieldByName('ORIGEM').AsInteger;
      RegProduto.Origem         := dpTabela.FieldByName('ORIGEM').AsInteger;
      RegProduto.SubstTribut    := dpTabela.FieldByName('SUBSTTRIBUTARIA').AsString = 'V';
      RegProduto.ECF_Sit_Tribut := StrToChar(dpTabela.FieldByName('ECF_SIT_TRIBUT').AsString, 'N');
      RegProduto.NCM            := dpTabela.FieldByName('CLASSFISCAL').AsString;
      RegProduto.DescontoMax    := dpTabela.FieldByName('DESCONTOMAXIMO').AsCurrency;
      RegProduto.Estoque        := CM.PegaEstoque(dpCodProduto, dpCodGrade);
      RegProduto.PrecoProPeso   := dpTabela.FieldByName('PRECOPROPESO').AsString = 'V';
      RegProduto.PesoLiquido    := dpTabela.FieldByName('PESOLIQUIDO').AsCurrency;
      RegProduto.PesoBruto      := dpTabela.FieldByName('PESOBRUTO').AsCurrency;
      if RegProduto.PesoLiquido = 0 then RegProduto.PesoLiquido := 1;
      if RegProduto.PesoBruto   = 0 then RegProduto.PesoBruto := 1;
      RegProduto.ControlaNumSerie := dpTabela.FieldByName('CONTROLANUMSERIE').AsString = 'V';
      RegProduto.UNDFracionada := TRUE;
      RegProduto.UNDFracionada := dpTabela.FieldByName('UND_FRACIONADA').AsString = 'V';

      RegProduto.CX_Quantidade     := dpTabela.FieldByName('CX_UNDCONVERSAO').AsCurrency;
      if dpPegaFoto then
      begin
        jpgImg := TJPEGImage.Create;
        try
          dpTabela.FieldByname('FOTO').AssignTo(jpgImg);
          RegProduto.Foto.Assign(jpgImg);
        except
        end;
        jpgImg.free;
      end;

      repeat until RegProduto.CD_Produto <> CodigoVazio;
    end;
  finally
    fDB.FechaTT(dpTabela);
    fDB.FreeQueryTransacao(dpTabela, dpTransacao);
  end;
end;

{
function TCM.PegaDadosDaEmpresa(var deRegEmpresa:TRegEmpresa; deCodEmpresa:Integer=0):Boolean;
var
  deTabela     : TIB_Query;
  deTransacao  : TIB_Transaction;
  jpgImg       : TJPEGImage;
begin
  deRegEmpresa.Cd_Empresa := CodigoVazio;

  fDB.CreateQueryTransacao(IdentificaConexao, deTabela, deTransacao);
  if deCodEmpresa = 0 then deCodEmpresa := fDB.GetValorDoCampo(IdentificaConexao,'CUPOM_EMPRESA', 'CONFIG', '', 0);

  deTabela.Active := false;
  deTabela.SQL.Clear;
  if deCodEmpresa > 0 then
  begin
    deTabela.SQL.Add('SELECT * FROM EMPRESAS E WHERE E.CD_EMPRESA = :CD_EMPRESA');
    if not deTabela.Prepared then deTabela.Prepare;
    deTabela.ParamByName('CD_EMPRESA').AsInteger := deCodEmpresa;
  end
  else begin
    deTabela.SQL.Add('SELECT first 1 * FROM EMPRESAS');
    if not deTabela.Prepared then deTabela.Prepare;
  end;
  deTabela.Active := true;

  if deTabela.IsEmpty then
  begin
    result := false;
    LimpaDadosDaEmpresa;
  end
  else begin
    result := true;
    deRegEmpresa.DadosPreenc     := true;
    deRegEmpresa.Cd_Empresa      := deTabela.FieldByname('CD_EMPRESA').AsInteger;
    deRegEmpresa.Nm_Empresa      := deTabela.FieldByname('NM_EMPRESA').AsString;
    deRegEmpresa.NomeFantasia    := deTabela.FieldByname('NOMEFANTASIA').AsString;
    deRegEmpresa.CGC             := deTabela.FieldByname('CGC').AsString;
    deRegEmpresa.InscEstadual    := deTabela.FieldByname('INSCESTADUAL').AsString;
    deRegEmpresa.InscMunicipal   := deTabela.FieldByname('INSC_MUNICIPAL').AsString;
    deRegEmpresa.Endereco        := deTabela.FieldByname('ENDERECO').AsString;
    deRegEmpresa.Endereco_Num    := deTabela.FieldByname('ENDERECO_NUMERO').AsString;
    deRegEmpresa.Bairro          := deTabela.FieldByname('BAIRRO').AsString;
    deRegEmpresa.Cidade          := deTabela.FieldByname('CIDADE').AsString;
    deRegEmpresa.CD_Municipio    := deTabela.FieldByname('CD_MUNICIPIO').AsInteger;
    deRegEmpresa.Complemento     := deTabela.FieldByname('COMPLEMENTO').AsString;
    deRegEmpresa.Estado          := deTabela.FieldByname('ESTADO').AsString;
    deRegEmpresa.CD_Estado       := deTabela.FieldByname('CD_ESTADO').AsInteger;
    deRegEmpresa.Cep             := deTabela.FieldByname('CEP').AsString;
    deRegEmpresa.Telefone        := deTabela.FieldByname('TELEFONE').AsString;
    deRegEmpresa.Fax             := deTabela.FieldByname('FAX').AsString;
    deRegEmpresa.Email           := deTabela.FieldByname('EMAIL').AsString;
    deRegEmpresa.WebSite         := deTabela.FieldByname('WEBSITE').AsString;
    deRegEmpresa.TipoContrib     := StrToChar(deTabela.FieldByname('TIPO_CONTRIBUINTE').AsString, 'S');
    deRegEmpresa.Aliquota_ICMS   := deTabela.FieldByname('ALIQUOTA_ICMS').AsCurrency;
    deRegEmpresa.Aliquota_PIS    := deTabela.FieldByname('ALIQUOTA_PIS').AsCurrency;
    deRegEmpresa.Aliquota_COFINS := deTabela.FieldByname('ALIQUOTA_COFINS').AsCurrency;
    deRegEmpresa.CNAEFiscal      := deTabela.FieldByname('CNAEFISCAL').AsString;
    deRegEmpresa.CRT             := deTabela.FieldByname('CRT').AsInteger;

    jpgImg := TJPEGImage.Create;
    try
      deTabela.FieldByname('LOGO').AssignTo(jpgImg);
      deRegEmpresa.Logo.Assign(jpgImg);
    except
    end;
    try
      deTabela.FieldByname('LOGORELATORIO').AssignTo(jpgImg);
      deRegEmpresa.LogoRelatorio.Assign(jpgImg);
    except
    end;
    jpgImg.free;
  end;
  fDB.FechaTT(deTabela);
  fDB.FreeQueryTransacao(deTabela, deTransacao);
end; }

function TCM.PegaDadosDoRepresentante(drCodRepresentante:Integer; drTabela:TIBOQuery):Boolean;
var
  TabelaAberta : Boolean;
  TemTabela : Boolean;
begin
  RegRepresentante.Cd_Representante := CodigoVazio;
  TemTabela := drTabela <> nil;
  if not TemTabela then
  begin
    drTabela := TIBOQuery.Create(self);
    drTabela.IB_Connection := IdentificaConexao;
    drTabela.Active := false;
  end;

  TabelaAberta := drTabela.Active;

  if not TabelaAberta then
  begin
    drTabela.Active := false;
    drTabela.SQL.Clear;
    drTabela.SQL.Add('SELECT * FROM REPRESENTANTES');
    drTabela.SQL.Add('WHERE CD_REPRESENTANTE = :CD_REPRESENTANTE');
    if not drTabela.Prepared then drTabela.Prepare;
    drTabela.ParamByName('CD_REPRESENTANTE').AsInteger := drCodRepresentante;
    drTabela.Active := true;
  end;

  if drTabela.IsEmpty then
  begin
    result := false;
    LimpaDadosDoRepresentante;
  end
  else begin
    result := true;
    RegRepresentante.DadosPreenc   := true;
    RegRepresentante.Cd_Representante := drCodRepresentante;
    RegRepresentante.Nm_Representante := drTabela.FieldByname('NM_REPRESENTANTE').AsString;
    RegRepresentante.Endereco      := drTabela.FieldByname('ENDERECO').AsString;
    RegRepresentante.Bairro        := drTabela.FieldByname('BAIRRO').AsString;
    RegRepresentante.Cidade        := drTabela.FieldByname('CIDADE').AsString;
    RegRepresentante.Estado        := drTabela.FieldByname('ESTADO').AsString;
    RegRepresentante.Cep           := drTabela.FieldByname('CEP').AsString;
    RegRepresentante.Telefone      := drTabela.FieldByname('TELEFONE').AsString;
    RegRepresentante.Fax           := drTabela.FieldByname('FAX').AsString;
    RegRepresentante.Email         := drTabela.FieldByname('EMAIL').AsString;
    repeat until RegRepresentante.Cd_Representante <> CodigoVazio;
  end;
  if not TabelaAberta then fDB.FechaTT(drTabela);
  if not TemTabela then drTabela.Free;
end;

function TCM.PegaDadosDoFornecedor(dfCodFornecedor:Integer; dfTabela:TIBOQuery):Boolean;
var
  TabelaAberta : Boolean;
  TemTabela : Boolean;
begin
  RegFornecedor.Cd_Fornecedor := CodigoVazio;
  TemTabela := dfTabela <> nil;
  if not TemTabela then
  begin
    dfTabela := TIBOQuery.Create(self);
    dfTabela.IB_Connection := IdentificaConexao;
    dfTabela.Active := false;
  end;

  TabelaAberta := dfTabela.Active;

  if not TabelaAberta then
  begin
    dfTabela.Active := false;
    dfTabela.SQL.Clear;
    dfTabela.SQL.Add('SELECT F.*, UF.CD_ESTADO FROM FORNECEDORES F');
    dfTabela.SQL.Add('left outer join TAB_ESTADOS UF on UF.SIGLA = F.ESTADO');
    dfTabela.SQL.Add('WHERE CD_FORNECEDOR = :CD_FORNECEDOR');
    if not dfTabela.Prepared then dfTabela.Prepare;
    dfTabela.ParamByName('CD_FORNECEDOR').AsInteger := dfCodFornecedor;
    dfTabela.Active := true;
  end;

  if dfTabela.IsEmpty then
  begin
    result := false;
    LimpaDadosDoFornecedor;
  end
  else begin
    result := true;
    RegFornecedor.DadosPreenc   := true;
    RegFornecedor.Cd_Fornecedor := dfCodFornecedor;
    RegFornecedor.Nm_Fornecedor := dfTabela.FieldByname('NM_FORNECEDOR').AsString;
    RegFornecedor.NomeFantasia  := dfTabela.FieldByname('NOMEFANTASIA').AsString;
    RegFornecedor.CNPJ          := dfTabela.FieldByname('CGC').AsString;
    RegFornecedor.InscEstadual  := dfTabela.FieldByname('INSCESTADUAL').AsString;
    RegFornecedor.Contato       := dfTabela.FieldByname('CONTATO').AsString;
    RegFornecedor.Endereco      := dfTabela.FieldByname('ENDERECO').AsString;
    RegFornecedor.Bairro        := dfTabela.FieldByname('BAIRRO').AsString;
    RegFornecedor.Cidade        := dfTabela.FieldByname('CIDADE').AsString;
    RegFornecedor.Complemento   := dfTabela.FieldByname('COMPLEMENTO').AsString;
    RegFornecedor.CD_Municipio  := dfTabela.FieldByname('CD_MUNICIPIO').AsInteger;
    RegFornecedor.Estado        := dfTabela.FieldByname('ESTADO').AsString;
    RegFornecedor.CD_Estado     := dfTabela.FieldByname('CD_ESTADO').AsInteger;
    RegFornecedor.Cep           := dfTabela.FieldByname('CEP').AsString;
    RegFornecedor.Telefone      := dfTabela.FieldByname('TELEFONE').AsString;
    RegFornecedor.Fax           := dfTabela.FieldByname('FAX').AsString;
    RegFornecedor.Email         := dfTabela.FieldByname('EMAIL').AsString;
    RegFornecedor.WebSite       := dfTabela.FieldByname('WEBSITE').AsString;
    repeat until RegFornecedor.Cd_Fornecedor <> CodigoVazio;
  end;
  if not TabelaAberta then fDB.FechaTT(dfTabela);
  if not TemTabela then dfTabela.Free;
end;

procedure TCM.LimpaDadosDaEmpresa;
begin
  RegEmpresa.DadosPreenc   := false;
  RegEmpresa.Cd_Empresa    := CodigoVazio;
  RegEmpresa.Nm_Empresa    := '';
  RegEmpresa.NomeFantasia  := '';
  RegEmpresa.CGC           := '';
  RegEmpresa.InscEstadual  := '';
  RegEmpresa.InscMunicipal := '';
  RegEmpresa.Endereco      := '';
  RegEmpresa.Endereco_Num  := '';
  RegEmpresa.Bairro        := '';
  RegEmpresa.Cidade        := '';
  RegEmpresa.Estado        := '';
  RegEmpresa.Complemento   := '';
  RegEmpresa.CD_Estado     := 0;
  RegEmpresa.CD_Municipio  := 0;
  RegEmpresa.Cep           := '';
  RegEmpresa.Telefone      := '';
  RegEmpresa.Fax           := '';
  RegEmpresa.Email         := '';
  RegEmpresa.WebSite       := '';
  RegEmpresa.CNAEFiscal    := '';
  RegEmpresa.CRT           := 0;

  RegEmpresa.Logo.Assign(nil);
  RegEmpresa.LogoRelatorio.Assign(nil);
end;

procedure TCM.LimpaDadosDoFornecedor;
begin
  RegFornecedor.DadosPreenc   := false;
  RegFornecedor.Cd_Fornecedor := CodigoVazio;
  RegFornecedor.Nm_Fornecedor := '';
  RegFornecedor.NomeFantasia  := '';
  RegFornecedor.CNPJ          := '';
  RegFornecedor.InscEstadual  := '';
  RegFornecedor.Contato       := '';
  RegFornecedor.Endereco      := '';
  RegFornecedor.Bairro        := '';
  RegFornecedor.Cidade        := '';
  RegFornecedor.Estado        := '';
  RegFornecedor.Endereco_Num  := '';
  RegFornecedor.Complemento   := '';
  RegFornecedor.CD_Estado     := 0;
  RegFornecedor.CD_Municipio  := 0;
  RegFornecedor.Cep           := '';
  RegFornecedor.Telefone      := '';
  RegFornecedor.Fax           := '';
  RegFornecedor.Email         := '';
  RegFornecedor.WebSite       := '';
end;

procedure TCM.LimpaDadosDoRepresentante;
begin
  RegRepresentante.DadosPreenc   := false;
  RegRepresentante.Cd_Representante := CodigoVazio;
  RegRepresentante.Nm_Representante := '';
  RegRepresentante.Endereco      := '';
  RegRepresentante.Bairro        := '';
  RegRepresentante.Cidade        := '';
  RegRepresentante.Estado        := '';
  RegRepresentante.Cep           := '';
  RegRepresentante.Telefone      := '';
  RegRepresentante.Fax           := '';
  RegRepresentante.Email         := '';
end;

function TCM.PegaCodBarras(pcCodigoInterno:Integer):String;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(IdentificaConexao, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select COD_BARRAS from PRODUTOS where CD_PRODUTO = :CD_PRODUTO');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByname('CD_PRODUTO').AsInteger := pcCodigoInterno;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('COD_BARRAS').AsString;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.ChaveDesteForm(cfForm: TForm):String;
begin
  result := RegChaveForms+'\'+cfForm.Name;
end;

function TCM.IdentificaConexao: TIBODatabase;
begin
  Result := DtM.IBDatabaseServer;
end;

function TCM.VerificaVersaoDoFirebird(vvConexao:TIBODatabase):boolean;
const
  VersaoExigida = '2.5';
begin
  result := fDB.PegaVersaoDoFirebird(DtM.IBDatabaseServer) = VersaoExigida;

  if not result then
  begin
    MensagemDeAtencao('A T E N � � O !' + PL+PL+
                      '� necess�rio a instala��o do Firebird vers�o '+VersaoExigida+'.'+PL+PL+'Baixe o Firebird em '+PL+'http://www.firebirdsql.org');
  end;
end;

function TCM.PrimeiraData:TDateTime;
begin
  result := StrToDateTime('30/12/1899 00:00:00');
end;

function TCM.UltimaData:TDateTime;
begin
  result := StrToDateTime('30/12/9999 23:59:59');
end;

function TCM.MediaDeVendaDiariaDoProduto(mvCodProduto, mvPeriodo:Integer):Currency;
begin
  StoredProcServer.StoredProcName := 'SP_CALC_MEDIAVENDA';
  if not StoredProcServer.Prepared then StoredProcServer.Prepare;
  StoredProcServer.ParamByName('PCD_PRODUTO').AsInteger := mvCodProduto;
  StoredProcServer.ParamByName('PPERIODO').AsInteger  := mvPeriodo;
  StoredProcServer.ParamByName('PDATA').AsDateTime := CM.NowDoServidor;
  StoredProcServer.ParamByName('CHAVE_ENTRADA').AsInteger := 0;
  StoredProcServer.ExecProc;
  Result := StoredProcServer.ParamByName('MEDIADIARIA').AsCurrency;
end;

procedure TCM.BuscaTexto(btQuery: TIBOQuery; btTexto, btSelect:String; btCampos:Array of String; btTabela, btFiltro, btOrdenacao: String; btComposta:boolean);
var
  Lista    : TStringList;
  i, c     : word;
  Ewhere   : Boolean;
  _OR_     : String;
  Condicao : String;
begin
  try
    Lista := TStringList.Create;
    ListaDePesquisa(btTexto, Lista);

    btTexto := TiraZeros(btTexto);
    btQuery.DisableControls;
    btQuery.Active := false;
    btQuery.SQL.Clear;
    btQuery.SQL.Add(btSelect);
    for c := 0 to length(btCampos)-1 do
    begin
      if not ExistePalavra(btCampos[i], '.', false) then btCampos[c] := btTabela+'.'+btCampos[c]
                                                    else btCampos[c] := btCampos[c];
    end;

    // P�e o filtro...
    Ewhere := not ExistePalavra(btSelect, 'where', false);
    if not Vazio(btFiltro) then btQuery.SQL.Add(WhereToAnd(EWhere)+btFiltro);

    if (not vazio(btTexto)) and (not vazio(Lista.Strings[0])) then //Se n�o estiver vazio ...
    begin
      if btComposta then  //Se for busca composta, cria uma condi��o para cada palavra da lista
      begin
        for i := 0 to Lista.Count-1 do
        begin
          Condicao := '';
          _OR_ := '';
          for c := 0 to length(btCampos)-1 do
          begin
            if (fDB.GetTipoDoCampo(DtM.IBDatabaseServer,btTabela, btCampos[c]) in TiposNumericos) and (not ENumero(Lista.Strings[i])) then
              NaoFazNada  // >>> Se o Campo � do Tipo Num�rico, mas o texto n�o �, ent�o n�o faz nada...
            else begin
              Condicao := Condicao + _OR_+btCampos[c]+' like '+QuotedStr('%'+Lista.Strings[i]+'%');
              _OR_ := ' or ';
            end;
          end;
          if not Vazio(Condicao) then
          begin
            Condicao := '(' + Condicao + ')';
            btQuery.SQL.Add(WhereToAnd(EWhere)+Condicao);
          end;
        end;
      end
      else begin        // Sen�o p�e uma condi��o s�...
        Condicao := '';
        _OR_ := '';
        for c := 0 to length(btCampos)-1 do
        begin
          if (fDB.GetTipoDoCampo(DtM.IBDatabaseServer,btTabela, btCampos[c]) in TiposNumericos) and (not ENumero(btTexto)) then
            NaoFazNada    // >>> Se o Campo � do Tipo Num�rico, mas o texto n�o �, ent�o n�o faz nada...
          else begin
            Condicao := Condicao + _OR_+btCampos[c]+' like '+QuotedStr(SubstAcentos(btTexto)+'%');
            _OR_ := ' or ';
          end;
        end;
        if not Vazio(Condicao) then
        begin
          Condicao := '(' + Condicao + ')';
          btQuery.SQL.Add(WhereToAnd(EWhere)+Condicao);
        end;
      end;
    end;

    if (pos('.', btOrdenacao) = 0) and (not ENumero(btOrdenacao)) and (not ExistePalavra(btOrdenacao, ',', false)) then
      btOrdenacao := btTabela+'.'+btOrdenacao;

    if not Vazio(btOrdenacao) then btQuery.SQL.Add('Order by '+btOrdenacao);
    fDB.SalvaSQL(btQuery.SQL);
    if not btQuery.Prepared then btQuery.Prepare;

  finally
    btQuery.Active := true;
    btQuery.EnableControls;
    Lista.Free;
  end;
end;

procedure TCM.CarregaConfigCadastro;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  CV : word;
begin
  try
    fDB.CreateQueryTransacao(IdentificaConexao, EstaTabela, EstaTransacao);

    if (not DtM.IBDatabaseServer.Connected) then
    begin
      MensagemDeErro('N�o h� conex�o com o Banco de Dados!');
      Exit;
    end;

    try
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select first 1 *                  ');
      EstaTabela.SQL.Add('from CONFIG_CADASTRO where ID = 0 ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;

      with ConfigCadastro do
      begin
        Prod_Codigo02            := EstaTabela.FieldByname('PROD_CODIGO02').AsString = 'V';
        Prod_Codigo03            := EstaTabela.FieldByname('PROD_CODIGO03').AsString = 'V';
        Prod_Codigo04            := EstaTabela.FieldByname('PROD_CODIGO04').AsString = 'V';
        Prod_Desc_Cod02          := EstaTabela.FieldByname('PROD_DESC_COD02').AsString;
        Prod_Desc_Cod03          := EstaTabela.FieldByname('PROD_DESC_COD03').AsString;
        Prod_Desc_Cod04          := EstaTabela.FieldByname('PROD_DESC_COD04').AsString;
        Prod_Codigo_EAN          := StrToChar(EstaTabela.FieldByname('PROD_CODIGO_EAN').AsString, '1');
        GradeCampoCodigo         := EstaTabela.FieldByname('GRADECAMPOCODIGO').AsString;
        GradeCampoDescricao      := EstaTabela.FieldByname('GRADECAMPODESCRICAO').AsString;
        GradeExibirCodigo       := EstaTabela.FieldByname('GRADE_EXIBIRCODIGO').AsString = 'V';
        Prod_ExibirNumSerie      := EstaTabela.FieldByname('PROD_EXIBIRNUMSERIE').AsString = 'V';
        BuscaProd_CodBarras      := EstaTabela.FieldByname('BUSCAPROD_CODBARRAS').AsString = 'V';
        BuscaProd_CodBalanca     := EstaTabela.FieldByname('BUSCAPROD_CODBALANCA').AsString = 'V';
        BuscaProd_CodGrade       := EstaTabela.FieldByname('BUSCAPROD_CODGRADE').AsString = 'V';
        BuscaProd_CodCaixa       := EstaTabela.FieldByname('BUSCAPROD_CODCAIXA').AsString = 'V';
        BuscaProd_Codigo2        := EstaTabela.FieldByname('BUSCAPROD_CODIGO2').AsString = 'V';
        BuscaProd_Codigo3        := EstaTabela.FieldByname('BUSCAPROD_CODIGO3').AsString = 'V';
        BuscaProd_Codigo4        := EstaTabela.FieldByname('BUSCAPROD_CODIGO4').AsString = 'V';
        BuscaProd_NumSerie       := EstaTabela.FieldByname('BUSCAPROD_NUMSERIE').AsString = 'V';
        CodProdNumDigTotal       := EstaTabela.FieldByname('CODPRODNUMDIGTOTAL').AsInteger;
        CodProdDigInicial        := StrToChar(EstaTabela.FieldByname('CODPRODDIGINICIAL').AsString, ' ');
        CodProdDigFinal          := StrToChar(EstaTabela.FieldByname('CODPRODDIGFINAL').AsString, ' ');

        CLI_Prazo_Padrao         := EstaTabela.FieldByname('CLI_PRAZOPADRAO').AsInteger;
        CLI_TaxaJuros_Padrao     := EstaTabela.FieldByname('CLI_TAXAJUROSPADRAO').AsCurrency;
        CLI_LimCred_Padrao       := EstaTabela.FieldByname('CLI_BLOQCHEQUEPADRAO').AsCurrency;
        CLI_BloqCheque_Padrao    := EstaTabela.FieldByname('CLI_BLOQCHEQUEPADRAO').AsString = 'V';
        CLI_BloqCrediario_Padrao := EstaTabela.FieldByname('CLI_BLOQCREDIARIOPADRAO').AsString = 'V';
        CLI_BloqAuto_Padrao      := EstaTabela.FieldByname('CLI_BLOQAUTOPADRAO').AsString = 'V';
        CLI_ImpDivida_Padrao     := EstaTabela.FieldByname('CLI_IMPDIVIDAPADRAO').AsString = 'V';
        PROD_Unidade_Padrao      := EstaTabela.FieldByname('PROD_UNIDADEPADRAO').AsString;
        PROD_EstMinimo_Padrao    := EstaTabela.FieldByname('PROD_ESTMINIMOPADRAO').AsCurrency;
        PROD_Margem_Padrao       := EstaTabela.FieldByname('PROD_MARGEMPADRAO').AsCurrency;
        PROD_Margem2_Padrao      := EstaTabela.FieldByname('PROD_MARGEMPADRAO2').AsCurrency;
        PROD_Margem3_Padrao      := EstaTabela.FieldByname('PROD_MARGEMPADRAO3').AsCurrency;
        PROD_Margem4_Padrao      := EstaTabela.FieldByname('PROD_MARGEMPADRAO4').AsCurrency;
        PROD_Margem5_Padrao      := EstaTabela.FieldByname('PROD_MARGEMPADRAO5').AsCurrency;
        PROD_DescMax_Padrao      := EstaTabela.FieldByname('PROD_DESCMAX_PADRAO').AsCurrency;
        PROD_Comissao_Padrao     := EstaTabela.FieldByname('PROD_COMISSAO_PADRAO').AsCurrency;
        PROD_IPI_Padrao          := EstaTabela.FieldByname('PROD_IPI_PADRAO').AsCurrency;
        PROD_ICMS_Padrao         := EstaTabela.FieldByname('PROD_ICMS_PADRAO').AsCurrency;
        PROD_NCM_Padrao          := EstaTabela.FieldByname('PROD_NCM_PADRAO').AsString;
        PROD_ContNumSerie_Padrao := EstaTabela.FieldByname('PROD_CONTNUMSERIE_PADRAO').AsString = 'V';
        PROD_UNDFrac_Padrao      := EstaTabela.FieldByname('PROD_UNDFRAC_PADRAO').AsString = 'V';
        PROD_ECF_Sit_Padrao      := StrToChar(EstaTabela.FieldByname('PROD_ECF_SIT_PADRAO').AsString, 'N');
        PROD_ST_Padrao           := EstaTabela.FieldByname('PROD_ST_PADRAO').AsString = 'V';
      end;
    except
      MensagemDeErro('Falha ao carregar Configura��es de Cadastro');
      Exit;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.NowDoServidor: TDateTime;
var
  Cont : word;
begin
  try
    Cont := 0;
    repeat
      try
        result := 0;
        inc(Cont);
        StoredProcServer.Active := false;
        if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
        StoredProcServer.StoredProcName := 'SP_NOWDOSERVIDOR';
        if not StoredProcServer.Prepared then StoredProcServer.Prepare;
        StoredProcServer.ExecProc;
        result := StoredProcServer.ParamByName('NOW').AsDateTime;
        StoredProcServer.IB_Transaction.Commit;
      except end;
    until (result > 0) or (Cont > 10);
  finally
    if result = 0 then
    begin
      result := fDB.GetValorDoCampo(DtM.IBDatabaseServer,'CURRENT_TIMESTAMP', 'RDB$DATABASE', '', 0);
      if result = 0 then
      begin
//       MensagemDeErro('N�o foi poss�vel obter a Data e Hora do Servidor');
        result := now;
      end;
    end;
  end;
end;

function TCM.HoraDoServidor: TTime;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,EstaTabela, EstaTransacao);
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select CURRENT_TIME AS NOW from RDB$DATABASE');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;
    Result := EstaTabela.FieldByname('NOW').AsDateTime;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.AtivaTriggers;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer,EstaTabela, EstaTransacao);

    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('set generator TRIGGER_ATIVADO to 1');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ExecSQL;
    EstaTabela.IB_Transaction.Commit;
    EstaTabela.Active := false;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.DesativaTriggers;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('set generator TRIGGER_ATIVADO to 0');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ExecSQL;
    EstaTabela.IB_Transaction.Commit;
    EstaTabela.Active := false;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.MargemDeLucroOculta(Margem:Real; Exibicao:String):String;
const
  L = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  i : word;
  S : String;
  C : String;
  M : String;
  SubstCarac: boolean;
begin
  DecimalSeparator := ',';
  M := FloatToStr(Margem);
  M := DUtilit.CasasDecimais(M, ',', 2);

  SubstCarac := ExistePalavra(Exibicao, ';', false);
  C := '';
  if SubstCarac then
  begin
    C := PegaAPartirDoUltimo(Exibicao, ';');
    Exibicao := PegaAteOUltimo(Exibicao, ';');
  end;
  M := SubstituiPalavra(M, ',', C, false);

  s := '';
  Randomize;
  for i := 1 to length(Exibicao) do
  begin
    case Exibicao[i] of
      '@' : S := S + L[Random(25)+1];
      '#' : S := S + IntToStr(Random(9));
      '$' : S := S + M;
      else S := S + Exibicao[i];
    end;
  end;

  Result := S;
end;

procedure TCM.GravaErro(Mensagem: String);
begin
  LogDeErros(Mensagem);
  MensagemDeErro(Mensagem + PL+PL +
             'Entre em contato com o Suporte t�cnico:'+PL+
             '(24) 2224-1632'+PL+
             '(24) 9252-1250'+PL+
             '(24) 9226-0072'+PL+
             'e-mail/msn: pdvfocus@gmail.com'+PL+
             'Skype: focusrj');
end;

function Diretorio_LOG:String;
var
  Dir : String;
begin
  Dir := PathComBarra(DiretorioDoExecutavel)+'Log';
  if not DirectoryExists(Dir) then ForceDirectories(Dir);
  result := Dir;
end;

procedure TCM.IncluiEmExclusoes(ieEvento:Integer; ieDescricao:String);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    try
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('insert into EXCLUSOES');
      EstaTabela.SQL.Add('( QUANDO,  EVENTO,  LOGIN,  NUM_TERMINAL,  DESCRICAO)');
      EstaTabela.SQL.Add('values');
      EstaTabela.SQL.Add('(current_timestamp, :EVENTO, :LOGIN, :NUM_TERMINAL, :DESCRICAO)');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('EVENTO').AsInteger := ieEvento;
      EstaTabela.ParamByName('LOGIN').AsString := RegUsuario.Login;
      EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
      EstaTabela.ParamByName('DESCRICAO').AsString := ieDescricao;

      EstaTabela.ExecSQL;
      EstaTabela.IB_Transaction.Commit;
    except
      on E: exception do begin
        UltimoErro := E.Message;
        LogDeErros(E.Message);
        EstaTabela.IB_Transaction.RollBack;
      end;
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.BuscaRegistro(brCompCodigo:TObject; brCompDescricao:TObject; brTabela, brCampoCodigo, brCampoDescricao: String; brFiltro:String=''; brBuscaInativos:Boolean=false): String;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer , EstaTabela, EstaTransacao);

    try
      if Vazio(TCustomEdit(brCompCodigo as TControl).Text) then
      begin
        TCustomEdit(brCompDescricao as TControl).Clear;
        Exit;
      end;

      with EstaTabela do
      begin
        Active := false;
        SQL.Clear;
        SQL.Add('Select '+brCampoDescricao+' from '+brTabela);
        SQL.Add('where '+brCampoCodigo+' = :'+brCampoCodigo);
        if not brBuscaInativos then
          SQL.Add('and INATIVO <> ''V'' ');
        if not Vazio(brFiltro) then
        begin
          if not ExistePalavra(brFiltro, 'and', false) then brFiltro := ' and '+brFiltro;
          SQL.Add(brFiltro);
        end;
        if not Prepared then Prepare;
        ParamByName(brCampoCodigo).AsString := TCustomEdit(brCompCodigo as TControl).Text;
        Active := true;
        TCustomEdit(brCompDescricao as TControl).Text := FieldByName(brCampoDescricao).AsString;
        result := FieldByName(brCampoDescricao).AsString;
      end;
    except
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.MaiorCodigo(mcTabela, mcCampo:String; mcConexao:TIBODatabase):Integer;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  Chave: String;
begin
  try
    fDB.CreateQueryTransacao(mcConexao, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select coalesce(max('+mcCampo+'), 0) as M from '+mcTabela);
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;
    result := EstaTabela.ParamByName('M').AsInteger;
    fDB.FechaTT(EstaTabela);
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.LimpaRegistrosSelecionados;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    try
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('delete from SELECREGISTROS');
      EstaTabela.SQL.Add('where (NUM_TERMINAL = :NUM_TERMINAL)');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;

      EstaTabela.ExecSQL;
      EstaTabela.IB_Transaction.Commit;
    except
      on E: exception do begin
        UltimoErro := E.Message;
        LogDeErros(E.Message);
        EstaTabela.IB_Transaction.RollBack;
      end;
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.VerificaDependencia(vdTabela, vdCampo, vdDescricao:String; vdEsteRegistro:Integer; var vdTexto:String);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);
    try
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select count(*) as Q from '+vdTabela+' where '+vdCampo+' = :CHAVE');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('CHAVE').AsInteger := vdEsteRegistro;
      EstaTabela.Active := true;
      if EstaTabela.FieldByName('Q').AsInteger > 0 then
        vdTexto := vdTexto + vdDescricao +'       '+#9+' = '+EstaTabela.FieldByName('Q').AsString + #13+#10;
    except
      on E: exception do begin
        UltimoErro := E.Message;
        LogDeErros(E.Message);
        MensagemDeErro('Campo '+vdCampo+' n�o dispon�vel em '+vdTabela+'.');
        Screen.Cursor := crDefault;
        Exit;
      end;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.PegaNumNF(var pnNumNF:String);
begin
  try
    pnNumNF := '0';
    try
      StoredProcServer.Active := false;
      if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
      StoredProcServer.StoredProcName := 'SP_PEGA_NUM_NOTAFISCAL';
      if not StoredProcServer.Prepared then StoredProcServer.Prepare;
      StoredProcServer.ExecProc;
      pnNumNF := StoredProcServer.ParamByName('ATUAL').AsString;
      StoredProcServer.IB_Transaction.Commit;
    except
    end;
  finally
  end;
end;

function TCM.PegaNumDAV(var pnNumDAV:Longint):Boolean;
begin
  result := false;
  pnNumDAV := 0;
  if not TemConexaoServidorFOCUS(false) then Exit;
  pnNumDAV := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_NUM_DAV');
  if pnNumDAV > 9999999999 then
  begin
    fDB.GravaGenerator(DtM.IBDatabaseServer, 'GEN_NUM_DAV', 0);
    pnNumDAV := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'GEN_NUM_DAV');
  end;
  result := pnNumDAV > 0;
end;

function TCM.PegaCustoMedio(pcProduto:Integer):Currency;
begin
  result := -9999;
  StoredProcServer.StoredProcName := 'SP_CALC_CUSTOMEDIO';
  if not StoredProcServer.Prepared then StoredProcServer.Prepare;
  StoredProcServer.ParamByName('ESTEPRODUTO').AsInteger := pcProduto;
  StoredProcServer.ExecProc;
  repeat
    result := StoredProcServer.FieldByName('CUSTOMEDIO').AsCurrency;
  until result <> -9999;
end;

procedure TCM.InstalaFonte(ifFonteNome:String; ifFonteArquivo:String);
var
  vFonteOrigem : string;
  vExisteFonte : Boolean;
  i : word;
  Res : TResourceStream;
begin
  with Screen.Fonts do  //* Verifica se a fonte existe
    vExisteFonte := IndexOf(Trim(ifFonteNome)) > -1;

  if not vExisteFonte then //* Instala a fonte no Windows
  begin
    vFonteOrigem := GetCurrentDir + '\'+ ifFonteArquivo;
    if not FileExists(vFonteOrigem) then
    begin
      Res := TResourceStream.Create(Hinstance, 'FONTE', 'FONTFILE');
      try
        Res.SavetoFile(vFonteOrigem);
      finally
        Res.Free;
      end;
    end;

    if FileExists(vFonteOrigem) then
      AddFontResource(PChar(vFonteOrigem));
  end;
end;

procedure TCM.ConciliaRefClientes;
var
  Cont : Integer;
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    if (MessageBox(0, 'Deseja conciliar informa��es de Clientes?', 'Conciliar Clientes', MB_ICONQUESTION or MB_YESNO or MB_APPLMODAL or MB_DEFBUTTON2) = idYes) then
    begin
      EstaTabela.Active := False;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Select CD_CLIENTE from CLIENTES');
      EstaTabela.SQL.Add('where CLIENTES.CD_CLIENTE not in (Select V_REFCLIENTES.CD_CLIENTE from V_REFCLIENTES)');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;
      AbreAviso('Conciliando informa��es de clientes...', 0, 0, EstaTabela.RecordCount, 0);
      if EstaTabela.RecordCount > 0 then
      begin
        Cont := 0;
        EstaTabela.First;
        if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
        while not EstaTabela.eof do
        begin
          IncProgressoAviso(false);
          Application.ProcessMessages;
          IBAuxTabela.Active := False;
          IBAuxTabela.SQL.Clear;
          IBAuxTabela.SQL.Add('INSERT INTO V_REFCLIENTES');
          IBAuxTabela.SQL.Add('(CD_CLIENTE)');
          IBAuxTabela.SQL.Add('VALUES');
          IBAuxTabela.SQL.Add('('+EstaTabela.FieldByName('CD_CLIENTE').AsString+')');
          if not IBAuxTabela.Prepared then IBAuxTabela.Prepare;
          IBAuxTabela.ExecSQL;
          Inc(Cont);
          if Cont > 400 then
          begin
            Cont := 0;
            IBAuxTabela.IB_Transaction.Commit;
            if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
          end;
          EstaTabela.Next;
        end;
        if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
        IBAuxTabela.IB_Transaction.Commit;
      end
      else begin
        IncProgressoAviso(true);
      end;
      FechaAviso;
      MensagemDeInformacao('Concilia��o conclu�da...');
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.ConciliaRefProdutos;
var
  Cont : Integer;
begin
  if (MessageBox(0, 'Deseja conciliar informa��es e estoque de Produtos?', 'Conciliar Produtos', MB_ICONQUESTION or MB_YESNO or MB_APPLMODAL or MB_DEFBUTTON2) = idYes) then
  begin
    IBTabela.Active := False;
    IBTabela.SQL.Clear;
    IBTabela.SQL.Add('Select CD_PRODUTO from PRODUTOS');
    IBTabela.SQL.Add('where PRODUTOS.CD_PRODUTO not in (Select REFPRODUTOS.CD_PRODUTO from REFPRODUTOS)');
    if not IBTabela.Prepared then IBTabela.Prepare;
    IBTabela.Active := true;
    AbreAviso('Conciliando informa��es de Produtos...', 0, 0, IBTabela.RecordCount, 0);
    if IBTabela.RecordCount > 0 then
    begin
      Cont := 0;
      IBTabela.First;
      if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
      while not IBTabela.eof do
      begin
        IncProgressoAviso(false);
        Application.ProcessMessages;
        IBAuxTabela.Active := False;
        IBAuxTabela.SQL.Clear;
        IBAuxTabela.SQL.Add('INSERT INTO REFPRODUTOS');
        IBAuxTabela.SQL.Add('(CD_PRODUTO)');
        IBAuxTabela.SQL.Add('VALUES');
        IBAuxTabela.SQL.Add('('+IBTabela.FieldByName('CD_PRODUTO').AsString+')');
        if not IBAuxTabela.Prepared then IBAuxTabela.Prepare;
        IBAuxTabela.ExecSQL;
        Inc(Cont);
        if Cont > 400 then
        begin
          Cont := 0;
          IBAuxTabela.IB_Transaction.Commit;
          if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
        end;
        IBTabela.Next;
      end;
      if not IBAuxTabela.IB_Transaction.InTransaction then IBAuxTabela.IB_Transaction.StartTransaction;
      IBAuxTabela.IB_Transaction.Commit;
    end
    else begin
      IncProgressoAviso(true);
    end;
    fDB.FechaTT(IBTabela);
    FechaAviso;
    MensagemDeInformacao('Concilia��o conclu�da...');
  end;
end;

function TCM.QuantidadeDeTerminaisCadastrados:Integer;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    result := -1;
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    try
      EstaTabela.IB_Transaction.StartTransaction;
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('select count(distinct IP) QUANT from TERMINAIS');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.Active := true;
      repeat
        result := EstaTabela.FieldByName('QUANT').AsInteger;
      until result <> -1;
    except
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

{procedure TCM.CalculaMediaDeVenda;
var
  Periodo : Integer;
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select first 1 PERIODOMEDIAVENDA from CONFIG');
    EstaTabela.Active := true;
    Periodo := EstaTabela.FieldByName('PERIODOMEDIAVENDA').AsInteger;
    EstaTabela.Active := false;

    if not (MessageBox(0, PChar('Esta opera��o ir� calcular a m�dia de venda de cada produto ref. a '+IntToStr(Periodo)+' dias.'+#13+#10+'Deseja continuar?'), '', MB_ICONQUESTION or MB_YESNO or MB_APPLMODAL or MB_DEFBUTTON1) = idYes) then
      Exit;

    CM.AbreAviso('Calculando M�dia de Venda...');
    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    EstaTabela.Active := False;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('update REFPRODUTOS PP set PP.MEDIAVENDA =                                     ');
    EstaTabela.SQL.Add('  (select M.MEDIADIARIA from REFPRODUTOS P                                    ');
    EstaTabela.SQL.Add('    left outer join                                                           ');
    EstaTabela.SQL.Add('    SP_CALC_MEDIAVENDA(P.CD_PRODUTO, :PERIODO, current_date, P.CD_PRODUTO) M  ');
    EstaTabela.SQL.Add('    on P.CD_PRODUTO = M.CHAVE_SAIDA                                           ');
    EstaTabela.SQL.Add('    where P.CD_PRODUTO = PP.CD_PRODUTO)                                       ');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('PERIODO').AsInteger := Periodo;

    EstaTabela.ExecSQL;
    try
      EstaTabela.IB_Transaction.Commit;
    except
      on E: exception do begin
        UltimoErro := E.Message;
        CM.LogDeErros(E.Message);
        EstaTabela.IB_Transaction.RollBack;
      end;
    end;
    FechaAviso;
    Screen.Cursor := crDefault;
    CM.MensagemDeInformacao('Ok...');
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;  }

procedure TCM.DefineConstantes;
begin
  fDB.DefineValores(DtM.IBDatabaseServer,
                 'CONSTANTES',
                ['CH_ST_ADEPOSITAR',  stADepositar,
                 'CH_ST_DEPOSITADO',  stDepositado,
                 'CH_ST_LIQUIDADO',   stLiquidado,
                 'CH_ST_DEVOLVIDO',   stDevolvido,
                 'CH_ST_REPASSADO',   stRepassado,
                 'CH_ST_CUSTODIA',    stCustodia,
                 'CH_ST_OUTROS',      stOutros,
                 'TP_CHEQUE',         tcCheque,
                 'TP_CREDCLI',        tcCredCli,
                 'TP_BOLETO',         tcBoleto,
                 'TP_CREDIARIO',      tcCrediario,
                 'TP_OUTROS',         tcOutros,
                 'TP_DINHEIRO',       tcDinheiro,
                 'TP_TICKET',         tcTicket,
                 'TP_CARTAO',         tcCartao], '', true);
end;

procedure TCM.TiraSelecRegistros(tsrTABELA:Integer);
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);
    try
      EstaTabela.IB_Transaction.StartTransaction;
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('delete from SELECREGISTROS');
      EstaTabela.SQL.Add('where NUM_TERMINAL = :NUM_TERMINAL');
      if tsrTABELA <= 0 then
        EstaTabela.SQL.Add('and TABELA = :TABELA');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
      if tsrTABELA <= 0 then
        EstaTabela.ParamByName('TABELA').AsInteger := tsrTABELA;

      EstaTabela.ExecSQL;
      EstaTabela.IB_Transaction.Commit;
    except
      EstaTabela.IB_Transaction.Rollback;
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.MarcaSelecao(msTabela:Integer; Situacao:TSitmarca; Sequencial:array of Integer; SitAtual:TSitmarca=smDesmarcado);
var
  i : integer;
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);
    try
      EstaTabela.IB_Transaction.StartTransaction;
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;

      if Situacao = smAoContrario then
      begin
        case SitAtual of
          smDesmarcado    : Situacao := smMarcado;
          smMarcado       : Situacao := smDesmarcado;
        end;
      end;

      case Situacao of
        smMarcado:
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Insert into SELECREGISTROS');
          EstaTabela.SQL.Add('( SELEC,  NUM_TERMINAL,  CD_REGISTRO,  TABELA)');
          EstaTabela.SQL.Add('values');
          EstaTabela.SQL.Add('(:SELEC, :NUM_TERMINAL, :CD_REGISTRO, :TABELA)');

          for i := 0 to Length(Sequencial)-1 do
          begin
            try
              EstaTabela.Active := false;
              EstaTabela.ParamByName('SELEC').AsString := 'V';
              EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
              EstaTabela.ParamByName('CD_REGISTRO').AsInteger := Sequencial[i];
              EstaTabela.ParamByName('TABELA').AsInteger := msTabela;
              EstaTabela.ExecSQL;
            except
            end;
          end;
        end;
        smDesmarcado :
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Delete from SELECREGISTROS');
          EstaTabela.SQL.Add('where NUM_TERMINAL = :NUM_TERMINAL');
          EstaTabela.SQL.Add('and   TABELA       = :TABELA');
          EstaTabela.SQL.Add('and   CD_REGISTRO  in ('+IntToStr(Sequencial[0]));
          for i := 1 to Length(Sequencial)-1 do
            EstaTabela.SQL.Add(', '+IntToStr(Sequencial[i]));
          EstaTabela.SQL.Add(')');

          EstaTabela.Active := false;
          EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
          EstaTabela.ParamByName('TABELA').AsInteger := msTabela;
          EstaTabela.ExecSQL;
        end;
        smDesmarcaTudo :
        begin
          EstaTabela.Active := false;
          EstaTabela.SQL.Clear;
          EstaTabela.SQL.Add('Delete from SELECREGISTROS');
          EstaTabela.SQL.Add('where NUM_TERMINAL = :NUM_TERMINAL');
          EstaTabela.SQL.Add('and   TABELA       = :TABELA');
          EstaTabela.Active := false;
          EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
          EstaTabela.ParamByName('TABELA').AsInteger := msTabela;
          EstaTabela.ExecSQL;
        end;
      end;
      EstaTabela.IB_Transaction.Commit;
    except
      EstaTabela.IB_Transaction.Rollback;
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.SitMarca(SitStr:String):TSitMarca;
begin
  if SitStr = 'V' then result := smMarcado
                  else result := smDesmarcado;
end;

function TCM.F3OuAltDown(key:word; Shift: TShiftState): boolean;
begin
  result := ((key = vk_F3) and (Shift = [])) or ((key = vk_Down) and ((Shift = [ssCtrl]) or (Shift = [ssAlt])));
end;

procedure TCM.FechaAviso;
begin

end;

function TCM.LocalizaComboBox(lcComboBox: TComboBox; lcValor:Integer):Integer;
var
  i : integer;
begin
  result := 0;
  for i := 0 to lcComboBox.Items.Count do
  begin
    if StrToIntZ(PegaAPartirDoUltimo(lcComboBox.Items[i], '�'), -9) = lcValor then
    begin
      result := i;
      break;
    end;
  end;
end;

procedure TCM.VerificaVendaConfirmada(vvNumDocumento:Integer);
var
  Conferido : boolean;
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select count(*) as C from PEDIDO_ITEM');
    EstaTabela.SQL.Add('where NUM_DOCUMENTO = :NUM_DOCUMENTO');
    EstaTabela.SQL.Add('and CONFERIDO = ''F''');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('NUM_DOCUMENTO').AsInteger := vvNumDocumento;
    EstaTabela.Active := true;

    Conferido := EstaTabela.FieldByName('C').AsInteger = 0;

    if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
    try
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('Update PEDIDO set CONFERIDO = :CONFERIDO');
      EstaTabela.SQL.Add('where NUM_DOCUMENTO = :NUM_DOCUMENTO');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('NUM_DOCUMENTO').AsInteger := vvNumDocumento;
      EstaTabela.ParamByName('CONFERIDO').AsString := BooleanToChar(Conferido);
      EstaTabela.ExecSQL;
      EstaTabela.IB_Transaction.Commit;
    except
      EstaTabela.IB_Transaction.Rollback;
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.CPFComChequeDevolvido(CPF:String):boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  if Vazio(CPF) then
  begin
    result := false;
    Exit;
  end;

  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select count(*) as Q from V_CONTASARECEBER');
    EstaTabela.SQL.Add('where TIPO_PAGAMENTO = '+IntToStr(tcCheque));
    EstaTabela.SQL.Add('and   CH_STATUS = '+IntToStr(stDevolvido));
    EstaTabela.SQL.Add('and   TITULAR_CPF = :CPF');
    EstaTabela.ParamByName('CPF').AsString := CPF;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('Q').AsInteger > 0;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.CPFComContaBloqueada(CPF:String):boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  if Vazio(CPF) then
  begin
    result := false;
    Exit;
  end;

  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select BLOQUEADO, BLOQUEIOMANUAL from V_REFCLIENTES RC');
    EstaTabela.SQL.Add('inner join CLIENTES C on C.CD_CLIENTE = RC.CD_CLIENTE');
    EstaTabela.SQL.Add('where C.CPF = :CPF');
    EstaTabela.ParamByName('CPF').AsString := CPF;
    EstaTabela.Active := true;
    result := (EstaTabela.FieldByName('BLOQUEADO').AsString = 'V') or (EstaTabela.FieldByName('BLOQUEIOMANUAL').AsString = 'V');
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.ConfigPadraoSeVazio;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  TaVazio : Boolean;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select count (*) C from CONFIG');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;
    TaVazio := EstaTabela.FieldByName('C').AsInteger = 0;
    EstaTabela.IB_Transaction.Commit;
    EstaTabela.Active := false;

    if TaVazio then
    begin
      fDB.DefineValores(DtM.IBDatabaseServer,
                    'CONFIG',
                   ['ID',                          0,
                    'PROD_CODIGO02',              'F',
                    'PROD_CODIGO03',              'F',
                    'PROD_CODIGO04',              'F',
                    'CUPOM_EMPRESA',               fDB.GetValorDoCampo(DtM.IBDatabaseServer,'CD_EMPRESA', 'EMPRESAS', '', 1),
                    'BLOQ_AUTOMATICO',            'F',
                    'BLOQ_LIMITECRED',            'F',
                    'BLOQ_ATRASADOS',             'V',
                    'BLOQ_DIASATRASO',            '30',
                    'BLOQ_QUEM',                   0,
                    'MOSTRAMARGEMLUCRO',          'F',
                    'EXIBMARGEMLUCRO',            '#@@##@$;|',  // N�O PODE COME�AR COM ARROBA!!!!
                    'EMAIL_SERVIDORSMTP',         'smtp.provedor.com.br',
                    'EMAIL_ENDERECO',             'nome@provedor.com.br',
                    'EMAIL_NOME',                 'Email Focus',
                    'CODPRODNUMDIGTOTAL',          0,
                    'CODPRODDIGFINAL',             '',
                    'CODPRODDIGINICIAL',           '',
                    'ATRASO_MULTA',                0,
                    'ATRASO_JUROSAODIA',           0,
                    'CLI_TIPO_CONDICOES',          0,
                    'DIAS_MULTAJUROS',             0,
                    'ALTPRECOTRANSF',             'F',
                    'TIPOPRECOTRANSF',            'C',
                    'PERIODOMEDIAVENDA',           60,
                    'CARN_MENSAGEM_CARNE',         '*** Pague suas contas sempre em dia ***',
                    'RECIBO_MENSAGEM',             '*** Obrigado pelo seu compromisso ***',
                    'RECIBO_IMPRIMIR',             'I',
                    'RECIBO_IMPJUROS',             'F',
                    'RECIBO_IMPSALDODIVIDA',       'F',
                    'VD_INCLUIRFRETENASCONTAS',    'V',
                    'VD_NUMSERIEOBRIGATORIO',      'F',
                    'VD_PEDIRCODVENDA',            'F',
                    'VD_MOSTRADESCONTO',           'V',
                    'VD_ALTERAPRECO',              'V',
                    'VD_PEDIRDATAENTREGA',         'F',
                    'VD_MOSTRARBOTOESPESO',        'F',
                    'VD_PEDIRNUMPEDIDO',           'F',
                    'VD_PEDIRDESPESA',             'F',
                    'VD_PEDIRFRETE',               'F',
                    'VD_QUANTMAXITEMS',             0,
                    'VD_PEDIRORDEM',               'F',
                    'VD_PEDIRCATEGORIA',           'F',
                    'VD_PEDIRDATAABERTURA',        'F',
                    'VD_CATEGORIAPADRAO',           1,
                    'GRADECAMPOCODIGO',            'C�digo',
                    'GRADECAMPODESCRICAO',         'Descri��o',
                    'GRADE_EXIBIRCODIGO',          'F',
                    'PROD_EXIBIRNUMSERIE',         'V',
                    'CLI_PRAZOPADRAO',              30,
                    'CLI_TAXAJUROSPADRAO',          0,
                    'CLI_LIMCREDPADRAO',            0,
                    'CLI_BLOQCHEQUEPADRAO',        'F',
                    'CLI_BLOQCREDIARIOPADRAO',     'F',
                    'CLI_BLOQAUTOPADRAO',          'V',
                    'CLI_IMPDIVIDAPADRAO',         'V',
                    'TEMPOPING',                    30,
                    'TEMPOMORTO',                   60,
                    'BLOQ_CLI_SEMCATEGORIA',       'V',
                    'LANC_INVENTARIO',              2,
                    'PROD_DESC_COD02',             'C�digo 2',
                    'PROD_DESC_COD03',             'C�digo 3',
                    'PROD_DESC_COD04',             'C�digo 4'],   '', true);

      fDB.DefineValores(DtM.IBDatabaseServer,
                    'CONFIG',
                   ['ID',                           0,
                    'CH_ACAO_CPF_DEVOLV ',          1,
                    'CH_ACAO_CPF_BLOQ',             1,
                    'OCULTACLIENTESBLOQMAN',       'F',
                    'OCULTACLIENTESBLOQ',          'F',
                    'AUTOCAMPOPESQUISA',           'V',
                    'PASSAPELOSUBTOTAL',           'F',
                    'VD_ALTERARSUBTOTAL',           0,
                    'PAG_DINHEIRO',                'V',
                    'PAG_CARTAO',                  'V',
                    'PAG_CREDIARIO',               'V',
                    'PAG_CHEQUE',                  'V',
                    'PAG_TICKET',                  'V',
                    'DESCONTOMAXIMO',               0,
                    'DESCMAXITEM',                  0,
                    'TIPODESCMAXITEM',              1,
                    'ALIQUOTAPADRAO',               0,
                    'CST_PADRAO',                  '041',
                    'PERMQTDEFRAC',                'V',
                    'PERMITIRVALORZERADO',         'F',
                    'DEV_DEPOSITOPADRAO',           0,
                    'INDICARDIMENSOESITEMS',       'F',
                    'SITDEVDESATIVAR0',            'F',
                    'SITDEVDESATIVAR1',            'F',
                    'SITDEVDESATIVAR2',            'F',
                    'DIA_SEQDIARIO',               CM.NowDoServidor,
                    'BUSCAPROD_CODBARRAS',         'V',
                    'BUSCAPROD_CODBALANCA',        'V',
                    'BUSCAPROD_CODGRADE',          'V',
                    'BUSCAPROD_CODCAIXA',          'V',
                    'BUSCAPROD_CODIGO2',           'V',
                    'BUSCAPROD_CODIGO3',           'V',
                    'BUSCAPROD_CODIGO4',           'V',
                    'BUSCAPROD_NUMSERIE',          'V',
                    'JA_RECRIOU',                  'V',
                    'CARN_IMPRIMIRCARNE',          'P',
                    'CARN_MENSAGEM_CARNE',         'Pague suas contas sempre em dia',
                    'CRED_NUMVIAS_INDICE',          1,
                    'CRED_ESTILOVALE',             'V',
                    'CRED_MENSAGEM_INDICE',        'Pague suas contas sempre em dia',
                    'RECIBO_IMPRIMIR',             'P',
                    'RECIBO_IMPJUROS',             'V',
                    'RECIBO_IMPSALDODIVIDA',       'V',
                    'RECIBO_MENSAGEM',             'Obrigado pelo seu compromisso',
                    'SD_CREDIARIOS',               'V',
                    'SD_BOLETOS',                  'V',
                    'SD_OUTROS',                   'V',
                    'SD_CHEQUES',                  'V',
                    'SD_CHEQUES_TP',               'T',
                    'LC_CREDIARIOS',               'V',
                    'LC_BOLETOS',                  'V',
                    'LC_OUTROS',                   'V',
                    'LC_CHEQUES',                  'V',
                    'LC_CHEQUES_TP',               'T',
                    'MJ_CREDIARIOS',               'V',
                    'MJ_BOLETOS',                  'V',
                    'MJ_OUTROS',                   'V',
                    'MJ_CHEQUESDEVOLV',            'V',
                    'UPGPATH',                     'c:\Arquivos de Programas\Focus\Atualizador',
                    'PERMQTDEFRACSELEC',           'F'],   '', true);

      fDB.DefineValores(DtM.IBDatabaseServer,
                    'CONFIG',
                   ['ID',                           0,
                    'PROD_UNIDADEPADRAO ',         'UN',
                    'PROD_ESTMINIMOPADRAO',         1,
                    'PROD_MARGEM2PADRAO',           0,
                    'PROD_MARGEM3PADRAO',           0,
                    'PROD_MARGEM4PADRAO',           0,
                    'PROD_MARGEM5PADRAO',           0,
                    'PROD_MARGEMPADRAO',            0  ],   '', true);
    end;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.ConfigLocalPadraoSeVazio;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  TaVazio : Boolean;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select count(*) C from CONFIG_LOCAL');
    EstaTabela.SQL.Add('where NUM_TERMINAL = 0');
    EstaTabela.Active := true;
    TaVazio := EstaTabela.FieldByName('C').AsInteger < 1;
    fDB.FechaTT(EstaTabela);

    if TaVazio then
    begin
      fDB.DefineValores(DtM.IBDatabaseServer,
                    'CONFIG_LOCAL',
                   ['NUM_TERMINAL',              0,
                    'USARCONFPADRAO',            'F',
                    'PDV_SOARBEEP',              'V',
                    'PDV_ESCONDERMOUSE',         'F',
                    'PDV_CADASTRARCLIENTES',     'V',
                    'PDV_GRID',                  '1',
                    'PDV_TIPOSDOCUMENTO',        'P',
                    'PDV_PEDIRVENDEDOR',         'N',
                    'PDV_RECEBERCONTAS',         'F',
                    'PDV_ABRECUPOMCODBARRAS',    'F',
                    'PDV_LOGINAUTOMATICO',       'F',
                    'PDV_LOGINAUTOUSUARIO',      '',
                    'PDV_LOGINAUTOSENHA',        '',
                    'LOGINAUTOMATICO',           'F',
                    'LOGINAUTOUSUARIO',          '',
                    'LOGINAUTOSENHA',            '',
                    'DEFVENDEDOR',               'V',
                    'TIPOPRECO',                 0,
                    'NF_IMPRESSORA',             'E',
                    'NF_PORTA',                  'LPT1',
                    'NF_FONTE',                  'P',
                    'NF_ACEITAACENTOS',          'F',
                    'NF_ACENTFORC',              'F',
                    'NF_MARGEMTOPO',             0,
                    'NF_MARGEMESQUERDA',         0,
                    'NF_USAGERENCIMP',           'F',
                    'NF_ORDENADOPOR',            'N',
                    'MODELOIMP_CARNECRED',       'PADRAO',
                    'MODELOIMP_RECIBO',          'PADRAO',
                    'MODELOIMP_PEDIDO',          'PADRAO',
                    'MODELOIMP_ORCAMENTO',       'PADRAO',
                    'MODELOIMP_ECF',             'PADRAO',
                    'MODELOIMP_TRANSF',          'PADRAO',
                    'MODELOIMP_DEVOLUCAO',       'PADRAO',
                    'MODELOIMP_CAIXA',           'PADRAO',
                    'ECF_MODELO',                'Daruma',
                    'ECF_PORTA',                 'COM1',
                    'ECF_TIMEOUT',               '0',
                    'ECF_BLOQTECLADO',           'F',
                    'ECF_EXIBEMENSAGEM',         'F',
                    'ECF_TENTARNOVAMENTE',       'F',
                    'ECF_ARREDONDAMENTO',        'F',
                    'ECF_GAVETAINVERTIDO',       'F',
                    'ECF_DESCRICAOGRANDE',       'V',
                    'ECF_IND_DINHEIRO',          '01',
                    'ECF_IND_CHEQUE',            '01',
                    'ECF_IND_CREDIARIO',         '01',
                    'ECF_IND_TICKET',            '01',
                    'ECF_IND_CARTAO',            '01',
                    'BAL_MARCA',                 0,
                    'BAL_PORTA',                 0,
                    'BAL_BAUDRATE',              5,
                    'BAL_DATABITS',              3,
                    'BAL_PARITY',                0,
                    'BAL_STOPBITS',              0,
                    'BAL_HANDSHAKING',           0,
                    'BAL_TIMEOUT',               2000,
                    'BAL_MONITORAR',             'F',
                    'GAV_MODELO',                'N',
                    'GAV_PORTA',                 'LPT1',
                    'GAV_STRINGLPT',             '#254 | Daruma',
                    'CAIXA_AUTOIMP_ABERTURA',    'F',
                    'CAIXA_AUTOIMP_FECHAMENTO',  'V',
                    'CAIXA_AUTOIMP_SANGRIA',     'F',
                    'LEIT_ATIVADO',              'F',
                    'LEIT_PORTASERIAL',          'COM1',
                    'LEIT_BAUDRATE',             '9600',
                    'LEIT_DATABITS',             '8',
                    'LEIT_PARITY',               0,
                    'LEIT_STOPBITS',             0,
                    'LEIT_HANDSHAKE',            0,
                    'LEIT_SUFIXO',               '#13',
                    'LEIT_INTERVALO',            200,
                    'LEIT_EXCLUIR_SUF',          'F',
                    'LEIT_SOFTFLOW',             'F',
                    'LEIT_HARDFLOW',             'F',
                    'RELAT_LARGURAPAGINA',       210,
                    'RELAT_ALTURAPAGINA',        29.7,
                    'RELAT_MARGEMESQUERDA',      0.5,
                    'RELAT_MARGEMDIREITA',       0.5,
                    'RELAT_MARGEMCIMA',          0.5,
                    'RELAT_MARGEMBAIXO',         0.5,
                    'RELAT_COR',                 0,
                    'RELAT_ALTERACOR',           'F',
                    'ICB_MODELO',                'N',
                    'ICB_PORTA',                 'LPT1',
                    'ICB_AVANCO',                20,
                    'ICB_TEMPERATURA',           10,
                    'ICB_TIPO_ETIQUETA',         0,
                    'ICB_TITULO',                'NOME DA EMPRESA',
                    'ICB_OBS1',                  'Trocas at� 08 dias com',
                    'ICB_OBS2',                  'a etiqueta da mercadoria.',
                    'ICB_MARGEMTOPO',            0,
                    'ICB_MARGEMESQ',             0 ], '', true);
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.PegaNomeDoCPFCNPJ(pnCPFCNPJ:String):String;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  Achei : boolean;
begin
  result := '';
  Achei := false;
  try
    pnCPFCNPJ := SoNumeros(pnCPFCNPJ);

    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    Achei := Vazio(pnCPFCNPJ);

    if Achei then Exit;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select NM_CLIENTE from CLIENTES where CPF = :CPF');
    EstaTabela.ParamByName('CPF').AsString := pnCPFCNPJ;
    EstaTabela.Active := true;
    Achei := not EstaTabela.IsEmpty;
    if Achei then result := EstaTabela.FieldByName('NM_CLIENTE').AsString;
    EstaTabela.Active := false;

    if Achei then Exit;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select NM_FORNECEDOR from FORNECEDORES where CGC = :CGC');
    EstaTabela.ParamByName('CGC').AsString := pnCPFCNPJ;
    EstaTabela.Active := true;
    Achei := not EstaTabela.IsEmpty;
    if Achei then result := EstaTabela.FieldByName('NM_FORNECEDOR').AsString;
    EstaTabela.Active := false;

    if Achei then Exit;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select NM_TITULAR from CONTAS_CLIENTES where CPF_CNPJ = :CPF_CNPJ');
    EstaTabela.ParamByName('CPF_CNPJ').AsString := pnCPFCNPJ;
    EstaTabela.Active := true;
    Achei := not EstaTabela.IsEmpty;
    if Achei then result := EstaTabela.FieldByName('NM_TITULAR').AsString;
    EstaTabela.Active := false;

    if Achei then Exit;
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select TITULAR from CONTASBANCARIAS where CPF_CNPJ = :CPF_CNPJ');
    EstaTabela.ParamByName('CPF_CNPJ').AsString := pnCPFCNPJ;
    EstaTabela.Active := true;
    Achei := not EstaTabela.IsEmpty;
    if Achei then result := EstaTabela.FieldByName('TITULAR').AsString;

  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.SalvaValorDoComponente(svForm:TForm; svComponente:TObject; svValor:Variant):boolean;
begin
  try
    case TVarData(svValor).vType of
      varDate     : SalvaDateTimeNoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svValor);
      varInt64,
      varLongWord,
      varWord,
      varByte,
      varShortInt,
      varSmallInt,
      varInteger  : SalvaIntegerNoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svValor);
      varDouble,
      varCurrency : SalvaFloatNoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svValor);
      varBoolean  : SalvaBooleanNoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svValor);
      varEmpty,
      varStrArg,
      varOleStr,
      varString   : SalvaStringNoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svValor);
    end;
    result := true;
  except
    result := false;
  end;
end;

function TCM.BuscaValorDoComponente(svForm:TForm; svComponente:TObject; svDefault:Variant):variant;
begin
  try
    result := svDefault;
    case TVarData(svDefault).vType of
      varDate     : result := LeDateTimeDoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svDefault);
      varInt64,
      varLongWord,
      varWord,
      varByte,
      varShortInt,
      varSmallInt,
      varInteger  : result := LeIntegerDoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svDefault);
      varDouble,
      varCurrency : result := LeFloatDoRegistro(RegChaveForms+'\'+svForm.Name,   TControl(svComponente).Name, svDefault);
      varBoolean  : result := LeBooleanDoRegistro(RegChaveForms+'\'+svForm.Name, TControl(svComponente).Name, svDefault);
      varEmpty,
      varStrArg,
      varOleStr,
      varString   : result := LeStringDoRegistro(RegChaveForms+'\'+svForm.Name,  TControl(svComponente).Name, svDefault);
    end;
  except
  end;
end;

function TCM.ModeloEtiquetaTaInativo(viCodEtiqueta:String):boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select INATIVO from ETIQUETAS_CONF');
    EstaTabela.SQL.Add('where CD_ETIQUETA = :CD_ETIQUETA');
    EstaTabela.ParamByName('CD_ETIQUETA').AsString := viCodEtiqueta;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('INATIVO').AsString = 'V';
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.PegaEstoque(peCdProduto:Integer; peCdGrade:Integer=0; peCdDeposito:Integer=0):Currency;
begin
  StoredProcLocal.Active := false;
  StoredProcLocal.StoredProcName := 'SP_PEGAESTOQUE';
  if not StoredProcLocal.Prepared then StoredProcLocal.Prepare;
  StoredProcLocal.ParamByName('ICD_PRODUTO').AsInteger := peCdProduto;
  StoredProcLocal.ParamByName('ICD_GRADE').AsInteger := peCdGrade;
  if Modulo = moGER then StoredProcLocal.ParamByName('ICD_DEPOSITO').AsInteger := peCdDeposito;
  StoredProcLocal.ExecProc;
  result := StoredProcLocal.ParamByName('ESTOQUEATUAL').AsCurrency;
end;

procedure TCM.AcertaEstoque;
begin
  try
    if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
    StoredProcServer.Active := false;
    StoredProcServer.StoredProcName := 'SP_ACERTA_ESTOQUE';
    if not StoredProcServer.Prepared then StoredProcServer.Prepare;
    StoredProcServer.ExecProc;
    StoredProcServer.IB_Transaction.Commit;
  except
    StoredProcServer.IB_Transaction.Rollback;
    MensagemDeErro('Falha ao Acertar o Estoque');
  end;
end;

function TCM.GeraCodigo:String;
var
  QuantDigTotal : word;
  DigInicial, DigFinal : String[2];
  CodGerado : String;
  CodSeq : integer;
  SCodSeq : String;
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  JaExiste : Boolean;
begin
  result := '';
  JaExiste := False;
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select first 1 CODPRODNUMDIGTOTAL, CODPRODDIGINICIAL, CODPRODDIGFINAL from CONFIG_CADASTRO');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;
    QuantDigTotal := EstaTabela.FieldByName('CODPRODNUMDIGTOTAL').AsInteger;
    DigInicial    := TiraEspacos(EstaTabela.FieldByName('CODPRODDIGINICIAL').AsString);
    DigFinal      := TiraEspacos(EstaTabela.FieldByName('CODPRODDIGFINAL').AsString);
    EstaTabela.Active := false;

    repeat
      CodSeq := fDB.GetValorDoGenerator(DtM.IBDatabaseServer,'GEN_COD_PROD_SEQUENCIAL', true);
      SCodSeq := PoeZeros(CodSeq, QuantDigTotal - length(DigInicial)-length(DigFinal));

      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('select(                                                                                                                                               ');
      EstaTabela.SQL.Add('(Select count(*) from PRODUTOS where (COD_BARRAS = :COD_BARRAS) or (CODIGO02 = :COD_BARRAS) or (CODIGO03 = :COD_BARRAS) or (CODIGO04 = :COD_BARRAS))  ');
      EstaTabela.SQL.Add(' +                                                                                                                                                    ');
      EstaTabela.SQL.Add('(Select count(*) from GRADES where COD_BARRAS = :COD_BARRAS)                                                                                          ');
      EstaTabela.SQL.Add(') C from RDB$Database                                                                                                                                 ');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('COD_BARRAS').AsString := SCodSeq;
      EstaTabela.Active := true;
      JaExiste := EstaTabela.FieldByName('C').AsInteger > 0;
      if JaExiste then AbreAviso('Gerando C�digo ('+SCodSeq+')');
    until not JaExiste;
    FechaAviso;

    EstaTabela.Active := false;
    CodGerado := DigInicial+SCodSeq+DigFinal;
    result := CodGerado;

    if (QuantDigTotal > 0) and (Length(CodGerado) > QuantDigTotal) then
      MensagemDeAtencao('A quantidade de d�gitos do c�digo gerado � superior � quantidade de d�gitos definida nas configura��es.');
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.JaTemCodBalanca(jtCodigo:String; jtModo:TModos; jtCdProduto:Integer): boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select BAL_COD_BALANCA from PRODUTOS');
    EstaTabela.SQL.Add('where BAL_COD_BALANCA = '+jtCodigo);

    if jtModo = mdAlteracao then
      EstaTabela.SQL.Add('and CD_PRODUTO <> '+IntToStr(jtCdProduto));

    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;

    Result := EstaTabela.RecordCount > 0;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.PegaCodBalanca(pcModo:TModos; pcCdProduto:Integer): Integer;
begin
  repeat
    StoredProcServer.Active := false;
    StoredProcServer.StoredProcName := 'SP_PEGA_CODBALANCA';

    if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
    if not StoredProcServer.Prepared then StoredProcServer.Prepare;
    StoredProcServer.ExecProc;
    result := StoredProcServer.ParamByName('ATUAL').AsInteger;
    StoredProcServer.IB_Transaction.Commit;
  until not JaTemCodBalanca(IntToStr(result), pcModo, pcCdProduto);
end;

procedure TCM.ZeraPagamento(var zpRegPed:TRegPedido);
begin
  zpRegPed.Pagamento.Pag_DinheiroComTroco := 0;
  zpRegPed.Pagamento.Pag_Dinheiro  := 0;
  zpRegPed.Pagamento.Pag_Cheque    := 0;
  zpRegPed.Pagamento.Pag_ChequePre := 0;
  zpRegPed.Pagamento.Pag_ChequeAto := 0;
  zpRegPed.Pagamento.Pag_CredCli   := 0;
  zpRegPed.Pagamento.Pag_Crediario := 0;
  zpRegPed.Pagamento.Pag_Ticket    := 0;
  zpRegPed.Pagamento.Pag_Cartao    := 0;
  zpRegPed.Pagamento.Troco        := 0;
  zpRegPed.Pagamento.TotalPago    := 0;
  zpRegPed.Pagamento.QtdeParcCred := 0;
  zpRegPed.Pagamento.QtdeCheques  := 0;
  zpRegPed.Pagamento.QtdeCartoes  := 0;
  SetLength(zpRegPed.Pagamento.vetCrediario, 1);
  zpRegPed.Pagamento.vetCrediario[0].Obs := '';
  SetLength(zpRegPed.Pagamento.vetCheques, 0);
  SetLength(zpRegPed.Pagamento.vetCrediario, 0);
  SetLength(zpRegPed.Pagamento.VetCartoes, 0);
end;

procedure TCM.PegaResolucao;
begin
       if (screen.Width = 800)  and (screen.Height = 600) then ResolucaoAtual := res800x600
  else if (screen.Width = 1024) and (screen.Height = 768) then ResolucaoAtual := res1024x768
  else ResolucaoAtual := resOutro;
end;

procedure TCM.ExportaConfLocal;
const
  NomeSys = 'FOCUS';
var
  i, j : integer;
  Dir, S, Arq, NArq : String;
  ListaArq : TStrings;
  sr: TSearchRec;
  Agora : TDateTime;
begin
  //S := ecNome; //'CONFIGPDV';
  Dir := TiraBarraDoPath(DiretorioDoExecutavel);
  Agora := NowDoServidor;

  DecodeDate(Agora, Ano, Mes, Dia);
  ListaArq := TStringList.Create;
  if FindFirst(Dir+'\*.REG', faAnyFile, sr) = 0 then
  begin
    repeat
      if (uppercase(sr.Name) <> uppercase(NomeSys+'.REG')) and (copy(uppercase(sr.Name), 1, length(NomeSys)) = uppercase(NomeSys)) then
        ListaArq.Add(PathComBarra(Dir)+sr.Name);
    until FindNext(sr) <> 0;
    sysutils.FindClose(sr);
  end;

  if ListaArq.Count > 10 then
  begin
    // Ordenar
    for i := 0 to ListaArq.Count-1 do
    begin
      for j := 0 to ListaArq.Count-2 do
      begin
        if ListaArq[j] > ListaArq[j+1] then
        begin
          S             := ListaArq[j];
          ListaArq[j]   := ListaArq[j+1];
          ListaArq[j+1] := S;
        end;
      end
    end;

    for i := 10 to ListaArq.Count-1 do
      sysutils.DeleteFile(ListaArq[i]);
  end;

  ExportRegistryBranch(HKEY_LOCAL_MACHINE, RegChaveRaiz, Dir+'\'+NomeSys+'.reg');
  ExportRegistryBranch(HKEY_LOCAL_MACHINE, RegChaveRaiz, Dir+'\'+NomeSys+'_'+FormatDateTime('yyyymmdd', Agora)+'.reg');
end;

function TCM.PegaChaveDoRegistro: boolean;
var
  ArqChave : Textfile;
  ChaveAlternativa : string;
begin
  try
    result := false;
    AssignFile(ArqChave, DiretorioDoExecutavel+'RegChave.dat');
    Reset(ArqChave);
    Readln(ArqChave, ChaveAlternativa);
    ChaveAlternativa := TiraEspacos(ChaveAlternativa);
    if (not Vazio(ChaveAlternativa)) and ((ChaveAlternativa[1] = '\') or (ChaveAlternativa[1] = '/')) then
      delete(ChaveAlternativa, 1, 1);
    CloseFile(ArqChave);
  except
    //Rewrite(ArqChave);
  end;

  if Vazio(ChaveAlternativa) then RegChave := RegChavePadrao
                             else RegChave := TiraBarraDoPath(RegChavePadrao)+'\Alternativo\'+TiraBarraDoPath(ChaveAlternativa);

  RegChaveRaiz            := RegChave;
  RegChavePDV             := RegChave + '\PDV';
  RegChaveForms           := RegChave + '\Forms';
  RegChaveConfLocais      := RegChave + '\ConfLocais';
  RegChaveConfBalanca     := RegChave + '\ConfLocais\Balanca';
  RegChaveConfLeitor      := RegChave + '\ConfLocais\Leitor';
  RegChaveConfGaveta      := RegChave + '\ConfLocais\Gaveta';
  RegChaveConfImpCodBarras:= RegChave + '\ConfLocais\ImpCodBarras';
  RegChavePesquisas       := RegChave + '\ConfLocais\Pesquisas';
  RegChaveRelatorios      := RegChave + '\ConfLocais\Relatorios';
  RegChaveConfBoleto      := RegChave + '\ConfLocais\Boleto';
  RegChaveConfCarne       := RegChave + '\ConfLocais\Carne';
  RegChaveConfRecibo      := RegChave + '\ConfLocais\Recibo';
  RegChaveConfCupom       := RegChave + '\ConfLocais\Cupom';
  RegChaveConfCaixa       := RegChave + '\ConfLocais\Caixa';
  RegChaveConfWeb         := RegChave + '\ConfLocais\Web';
  RegChaveConfECF         := RegChave + '\ConfLocais\ECF';
  RegChaveConfECFIndPag   := RegChave + '\ConfLocais\ECF\IndPag';
  RegChaveConfNotaFiscal  := RegChave + '\ConfLocais\NotaFiscal';
  RegChaveConfOutros      := RegChave + '\ConfLocais\Outros';
  RegChaveTransf          := RegChave + '\ConfLocais\Transf';
  result := true;

  UpgradeChaveRegistro;
end;

procedure TCM.UpgradeChaveRegistro; // 17/02/2008
var
  Reg : TRegistry;
  B : Boolean;
  S : String;
  I : Integer;
  R : Real;

  procedure CopiaValores(chaveDe, ChavePara, NomeDoValor:String; TipoValor:Char; NovoNomeDoValor:String='');
  begin
    if NovoNomeDoValor = '' then NovoNomeDoValor := NomeDoValor;

    if ExisteValorNoRegistro(chaveDe, NomeDoValor) then
    begin
      TipoValor := upcase(TipoValor);
      case TipoValor of
        'S' : begin
                S := LeStringDoRegistro(ChaveDe, NomeDoValor, '');
                SalvaStringNoRegistro(ChavePara, NovoNomeDoValor, S);
              end;
        'I' : begin
                I := LeIntegerDoRegistro(ChaveDe, NomeDoValor, 0);
                SalvaIntegerNoRegistro(ChavePara, NovoNomeDoValor, I);
              end;
        'B' : begin
                B := LeBooleanDoRegistro(ChaveDe, NomeDoValor, false);
                SalvaBooleanNoRegistro(ChavePara, NovoNomeDoValor, B);
              end;
        'R' : begin
                R := LeFloatDoRegistro(ChaveDe, NomeDoValor, 0);
                SalvaFloatNoRegistro(ChavePara, NovoNomeDoValor, R);
              end;
      end;
    end;
  end;

begin
  if (ExisteChaveNoRegistro(RegChaveConfLocais)) or
     (not ExisteChaveNoRegistro(RegChaveRaiz)) or
     (not ExisteChaveNoRegistro(RegChaveRaiz+'\Config\Config')) then exit;

  Reg := TRegistry.Create;
  try
    with Reg do
    begin
      RootKey := HKEY_LOCAL_MACHINE;
      // Renomeia a chave Focus para FocusTEMP...
      MoveKey('SOFTWARE\Focus', 'SOFTWARE\FocusTEMP', true);
      CloseKey;
    end;

    // Copia os valores do raiz...
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'BancoDeDados',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'Pasta',           'S', 'PastaGerenciador');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'IDNumTerminal',   'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'UltimaAlteracao', 'S', 'UltimaAlteracaoGer');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'UltimoLogin',     'S', 'UltimoLoginGer');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'VersaoAnterior',  'S', 'VersaoAnteriorGer');
    CopiaValores('SOFTWARE\FocusTEMP\Config',   RegChaveRaiz, 'VersaoAtual',     'S', 'VersaoAtualGer');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'BancoDeDados',   'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'Pasta',           'S', 'PastaPDV');
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'IDNumTerminal',   'I'); // override
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'UltimaAlteracao', 'S', 'UltimaAlteracaoPDV');
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'UltimoLogin',     'S', 'UltimoLoginPDV');
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'VersaoAnterior',  'S', 'VersaoAnteriorPDV');
    CopiaValores('SOFTWARE\Focus - PDV\Config', RegChaveRaiz, 'VersaoAtual',     'S', 'VersaoAtualPDV');

    // Copia os valores das Configura��es Locais (RAIZ)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'MultiplasInstancias',   'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'PaginaGerenciador',     'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'Senha',                 'S', 'LogAutoSenha');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'Usuario',               'S', 'LogAutoUsuario');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'LoginAutomatico',       'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'TipoDescontoUnitario',  'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfLocais, 'TipoDescontoUnitario',  'S');

    // Copia os valores das Configura��es Locais (pesquisas)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChavePesquisas, 'AbrirUltimoAcesso',   'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChavePesquisas, 'PesquisaComposta',    'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChavePesquisas, 'PesquisaIncremental', 'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChavePesquisas, 'UltimoPesquisado',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChavePesquisas, 'UltimoSelecionado',   'S');

    // Copia os valores das Configura��es Locais (RELATORIOS)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'AlteraCorRelatorio', 'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'AlturaDaPagina',     'R');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'CorRelatorio',       'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'LarguraDaPagina',    'R');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'MargemDireita',      'R');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'MargemEmBaixo',      'R');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'MargemEmCima',       'R');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveRelatorios, 'MargemEsquerda',     'R');

    // Copia os valores das Configura��es Locais (CAIXA)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'AutoImpAberturaCaixa',    'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'AutoImpFechamentoCaixa',  'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'AutoImpSangriaSuprimento','B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'MovCaixaRecbContas',      'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'ResumoCaixaECF',          'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'CaixaCompartilhado',      'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config', RegChaveConfCaixa, 'TerminalCaixaCompart',    'I');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'AutoImpAberturaCaixa',    'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'AutoImpFechamentoCaixa',  'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'AutoImpSangriaSuprimento','B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'MovCaixaRecbContas',      'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'ResumoCaixaECF',          'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'CaixaCompartilhado',      'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChaveConfCaixa, 'TerminalCaixaCompart',    'I');

    // Copia os valores das Configura��es Locais (BALAN�A)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'BaudRate',      'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'DataBits',      'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'HandShaking',   'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'MarcaBalanca',  'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'Parity',        'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'PortaSerial',   'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'StopBits',      'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'TimeOut',       'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Balanca', RegChaveConfBalanca, 'Monitorar',     'B');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'BaudRate',      'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'DataBits',      'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'HandShaking',   'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'MarcaBalanca',  'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'Parity',        'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'PortaSerial',   'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'StopBits',      'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'TimeOut',       'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Balanca', RegChaveConfBalanca, 'Monitorar',     'B');

    // Copia os valores das Configura��es Locais (BOLETO)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'AcentForc',     'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'CaracAcent',    'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'Fonte',         'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'Impressora',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'MargemEsquerda','I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'MargemTopo',    'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'Porta',         'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Boleto', RegChaveConfBoleto, 'UsaGerImp',     'B');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'AcentForc',     'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'CaracAcent',    'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'Fonte',         'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'Impressora',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'MargemEsquerda','I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'MargemTopo',    'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'Porta',         'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Boleto', RegChaveConfBoleto, 'UsaGerImp',     'B');

    // Copia os valores das Configura��es Locais (CARN�)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'AceitaAcentos',    'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'AcentuacaoForcada','B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'Fonte',            'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'Formato',          'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'Impressora',       'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'ImprimirCarne',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'MargemEsquerda',   'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'NumViasIndice',    'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'Porta',            'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'SaltoDePagina',    'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Carne', RegChaveConfCarne, 'UsaGerImp',        'B');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'AceitaAcentos',    'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'AcentuacaoForcada','B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'Fonte',            'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'Formato',          'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'Impressora',       'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'ImprimirCarne',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'MargemEsquerda',   'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'NumViasIndice',    'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'Porta',            'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'SaltoDePagina',    'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Carne', RegChaveConfCarne, 'UsaGerImp',        'B');

    // Copia os valores das Configura��es Locais (INDPAG)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Cartao',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Cheque',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Crediario', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Dinheiro',  'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Ticket',    'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Vale',      'S');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Cartao',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Cheque',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Crediario', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Dinheiro',  'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Ticket',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CodFormaPagamento', RegChaveConfECFIndPag, 'Vale',      'S');

    // Copia os valores das Configura��es Locais (RECIBO)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'AceitaAcentos',       'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'AcentuacaoForcada',   'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'Fonte',               'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'Formato',             'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'Impressora',          'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'ImprimirComprovante', 'S', 'ImprimirRecibo');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'MargemEsquerda',      'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'Porta',               'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'SaltoDePagina',       'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Comprovante', RegChaveConfRecibo, 'UsaGerImp',           'B');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'AceitaAcentos',       'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'AcentuacaoForcada',   'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'Fonte',               'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'Formato',             'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'Impressora',          'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'ImprimirComprovante', 'S', 'ImprimirRecibo');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'MargemEsquerda',      'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'Porta',               'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'SaltoDePagina',       'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Comprovante', RegChaveConfRecibo, 'UsaGerImp',           'B');

    // Copia os valores das Configura��es Locais (CUPOM)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloCupomFiscal',   'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloDevolucao',     'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloImpCarne',      'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloImpComprovante','S', 'ModeloImpRecibo');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloOrcamento',     'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloPedido',        'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloResumoCaixa',   'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransfEntrada', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransferencia', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransfSaida',   'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTrocaDevolucao','S');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloCupomFiscal',   'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloDevolucao',     'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloImpCarne',      'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloImpComprovante','S', 'ModeloImpRecibo');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloOrcamento',     'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloPedido',        'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloResumoCaixa',   'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransfEntrada', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransferencia', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTransfSaida',   'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\Cupom', RegChaveConfCupom, 'ModeloTrocaDevolucao','S');

    // Copia os valores das Configura��es Locais (ECF)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'BLOQUEIATECLADO',  'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'EXIBEMENSAGEM',    'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'IMPRESSORAFISCAL', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'NOMEECF',          'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'PORTACUPOMFISCAL', 'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'PORTAECF',         'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'TIMEOUTECF',       'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\CupomFiscal', RegChaveConfECF, 'TipoComunicECF',   'S');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'BLOQUEIATECLADO',  'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'EXIBEMENSAGEM',    'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'IMPRESSORAFISCAL', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'NOMEECF',          'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'PORTACUPOMFISCAL', 'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'PORTAECF',         'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'TIMEOUTECF',       'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\CupomFiscal', RegChaveConfECF, 'TipoComunicECF',   'S');

    // Copia os valores das Configura��es Locais (NOTA FISCAL)...
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'AcentForc',  'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'CaracAcent', 'B');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Fonte',      'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Impressora', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'MargemEsquerda', 'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'MargemTopo',     'I');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'NUM_NF',         'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'ORDEMIMPRESSAO', 'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Porta',          'S');
    CopiaValores('SOFTWARE\FocusTEMP\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'UsaGerImp',      'B');
    //PDV
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'AcentForc',  'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'CaracAcent', 'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Fonte',      'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Impressora', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'MargemEsquerda', 'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'MargemTopo',     'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'NUM_NF',         'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'ORDEMIMPRESSAO', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'Porta',          'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config\NotaFiscal', RegChaveConfNotaFiscal, 'UsaGerImp',      'B');

    // Copia os valores das Configura��es Locais (PDV)...
    CopiaValores('SOFTWARE\Focus - PDV\Config',        RegChavePDV, 'ULT_NUM_ORCAMENTO', 'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config',        RegChavePDV, 'ULT_NUM_PEDIDO',    'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'AbrirCupomCodBarras', 'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'CxLivre_AnimServidor','B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'CxLivre_AnimTipo',    'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'CxLivre_AnimVeloc',   'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'DefVendedor',         'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'EscondeCursor',       'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'LoginAutomatico',     'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'Senha',               'S', 'LogAutoSenha');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'Usuario',             'S', 'LogAutoUsuario');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'MovCaixaLivre',       'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'OBS_Orcamento',       'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'PedirVendedor',       'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'PodeCadastrarClientes','B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'PodeReceberContas',   'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'SoaBeep',             'B');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'TipoDocumento',       'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'TipoPDV',             'S');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'TipoPreco',           'I');
    CopiaValores('SOFTWARE\Focus - PDV\Config\Config', RegChavePDV, 'UsarConfPadrao',      'I');

    ApagaChaveDoRegistro('SOFTWARE\Focus - PDV', HKEY_LOCAL_MACHINE);
    ApagaChaveDoRegistro('SOFTWARE\FocusTEMP', HKEY_LOCAL_MACHINE);
  finally
    Reg.Free;
  end;
end;

function TCM.TemGrades(tgCdProduto:Integer):Boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  result := false;
  try
    fDB.CreateQueryTransacao(IdentificaConexao, EstaTabela, EstaTransacao);
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select count(*) as Q from GRADES where CD_PRODUTO = :CD_PRODUTO');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('CD_PRODUTO').AsInteger := tgCdProduto;
    EstaTabela.Active := true;
    result := EstaTabela.fieldByName('Q').AsInteger > 0;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.UmSeZero(Valor:Real):Real;
begin
  if Valor = 0 then result := 1
               else result := Valor;
end;

function TCM.PegaDepositoEntradaOuSaida(pdEntradaOuSaida:Char):Integer;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    case pdEntradaOuSaida of
      'E' : EstaTabela.SQL.Add('select first 1 CD_DEPOSITO from DEPOSITOS where ENTRADAS = ''V'' ');
      'S' : EstaTabela.SQL.Add('select first 1 CD_DEPOSITO from DEPOSITOS where SAIDAS = ''V'' ');
    end;
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.Active := true;
    if EstaTabela.IsEmpty then result := 0
                          else result := EstaTabela.FieldByName('CD_DEPOSITO').AsInteger;
  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.VinculaProdFornec(vpfCodVinculo:String; vpfCDProduto:integer; vpfCDFornecedor:integer; vpfUltimaCompra:TDate=0; vpfUltimaNota:Integer=0):boolean;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  S : String;
begin
  try
    fDB.CreateQueryTransacao(DtM.IBDatabaseServer, EstaTabela, EstaTransacao);
    try
      result := false;
      if not EstaTabela.IB_Transaction.InTransaction then EstaTabela.IB_Transaction.StartTransaction;
      EstaTabela.Active := false;
      EstaTabela.SQL.Clear;
      EstaTabela.SQL.Add('update or insert into PRODFORNEC');
      S := '( COD_PROD_FORNEC,  CD_FORNECEDOR,  CD_PRODUTO';
      if vpfUltimaCompra > 0 then S := S +',  DT_ULTIMACOMPRA';
      if vpfUltimaNota > 0 then S := S +',  CD_ULTIMANOTA';
      S := S + ')';
      EstaTabela.SQL.Add(S);
      EstaTabela.SQL.Add('values');
      S := '(:COD_PROD_FORNEC, :CD_FORNECEDOR, :CD_PRODUTO';
      if vpfUltimaCompra > 0 then S := S +', :DT_ULTIMACOMPRA';
      if vpfUltimaNota > 0 then S := S +', :CD_ULTIMANOTA';
      S := S + ')';
      EstaTabela.SQL.Add(S);
      EstaTabela.SQL.Add('matching (CD_FORNECEDOR, CD_PRODUTO)');
      if not EstaTabela.Prepared then EstaTabela.Prepare;
      EstaTabela.ParamByName('COD_PROD_FORNEC').AsString := vpfCodVinculo;
      EstaTabela.ParamByName('CD_PRODUTO').AsInteger     := vpfCDProduto;
      EstaTabela.ParamByName('CD_FORNECEDOR').AsInteger  := vpfCDFornecedor;
      if vpfUltimaCompra > 0 then EstaTabela.ParamByName('DT_ULTIMACOMPRA').AsDate := vpfUltimaCompra;
      if vpfUltimaNota > 0 then EstaTabela.ParamByName('CD_ULTIMANOTA').AsInteger := vpfUltimaNota;
      EstaTabela.ExecSQL;
      EstaTabela.IB_Transaction.Commit;
      result := true;
    except
      result := false;
      EstaTabela.IB_Transaction.Rollback;
    end;
  finally
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

function TCM.StringGrupo(sgCdGrupo:Integer):String;
var
  SP : TIB_StoredProc;
begin
  case Modulo of
    moGER : SP := StoredProcServer;
    moPDV : SP := StoredProcLocal;
  end;
  try
    SP.Active := false;
    SP.StoredProcName := 'SP_STRING_GRUPO';
    if not SP.Prepared then SP.Prepare;
    SP.ParamByName('CD_GRUPO').AsInteger := sgCdGrupo;
    SP.ExecProc;
    result := SP.FieldByName('STRING').AsString;
  except
    result := SP.FieldByName('STRING').AsString;
  end;
end;

procedure TCM.LigaModoExclusivo;
var
  IPS : TStrings;
  EsteIP : Word;
begin
  EsteIP := 0;
  try
    IPS := TStringList.Create;
    PegaIPLocal(IPS);
    if (IPs.Count = 1) and (IPs[0] = '127.0.0.1') then
      EsteIP := 0
    else
      EsteIP := StrToIntZ(PegaAPartirDoUltimo(IPs[0], '.'), 0);
    IPS.Free;
  finally
    fDB.GravaGenerator(DtM.IBDatabaseServer, 'MODOEXCLUSIVO', EsteIP);
  end;
end;

procedure TCM.DesligaModoExclusivo;
begin
  fDB.GravaGenerator(DtM.IBDatabaseServer, 'MODOEXCLUSIVO', 0);
end;

procedure TCM.VerificaModoExclusivo;
var
  IPExclusivo : word;
  IPS : TStrings;
  TemQueEsperar : boolean;
  i : word;
begin
  IPExclusivo := fDB.GetValorDoGenerator(DtM.IBDatabaseServer, 'MODOEXCLUSIVO', false);

  if IPExclusivo <= 0 then Exit;

  IPS := TStringList.Create;
  PegaIPLocal(IPS);
  TemQueEsperar := true;
  if (IPs.Count = 1) and (IPs[0] = '127.0.0.1') then
    TemQueEsperar := false
  else begin
    for i := 0 to IPs.Count-1 do
    begin
      if StrToIntZ(PegaAPartirDoUltimo(IPs[i], '.'), 0) = IPExclusivo then
      begin
        TemQueEsperar := false;
        break;
      end;
    end;
  end;
  IPS.Free;

  Application.CreateForm(TfFormModoExclusivo, fFormModoExclusivo);
  fFormModoExclusivo.IPExclusivo := IPExclusivo;
  if TemQueEsperar then fFormModoExclusivo.ModoModoExclusivo := mmEsperar
                   else fFormModoExclusivo.ModoModoExclusivo := mmDesbloquear;
  fFormModoExclusivo.ShowModal;
  FreeAndNil(fFormModoExclusivo);
end;

function TCM.TemConexaoServidorFOCUS(tcExibeMensagens:boolean=true):boolean;
begin
  try
    result := true;
    if not DtM.IBDatabaseServer.Connected then
    begin
      if tcExibeMensagens then AbreAviso('Estabelecendo conex�o com o SERVIDOR FOCUS');
      Screen.Cursor := crHourGlass;
      DtM.IBDatabaseServer.DataBaseName := cfgBancoServidor;
      DtM.IBDatabaseServer.Username  := 'sysdba';
      DtM.IBDatabaseServer.Password  := 'masterkey';
      DtM.IBDatabaseServer.Connect;
      result := true;
      Screen.Cursor := crDefault;
      if tcExibeMensagens then FechaAviso;
    end;
  except
    result := false;
    Screen.Cursor := crDefault;
    FechaAviso;
    if tcExibeMensagens then MensagemDeAtencao('N�o h� conex�o com o SERVIDOR FOCUS');
  end;
end;

procedure TCM.InicializaGrid(rgRestaurar:boolean; rgForm:TForm; var rgDBGrid:TwwDBGrid; rgNomeAdicional:String='');
var
  EsteSection : String;
begin
  EsteSection := rgForm.Name+rgDBGrid.Name+rgNomeAdicional;
  if ((rgRestaurar) and (MessageBox(0, 'Deseja restaurar as configura��es de colunas do Grid?', 'Restaurar Grid?', MB_ICONQUESTION or MB_YESNO or MB_TOPMOST or MB_APPLMODAL or MB_DEFBUTTON1) = idYes)) then
  begin
    ApagaChaveINI(INIGrids, EsteSection);
  end;
  rgDBGrid.IniAttributes.SaveToRegistry := false;
  rgDBGrid.IniAttributes.FileName    := IniGrids;
  rgDBGrid.IniAttributes.SectionName := EsteSection;
  rgDBGrid.IniAttributes.Enabled     := true;
  rgDBGrid.LoadFromIniFile;
end;

procedure TCM.CalculaPorcValor(var acPorcValor:TRegValorPorc; acValorBruto:Currency);
begin
  case acPorcValor.Tipo of
    '%' : begin
            if acPorcValor.Porc <> 0 then acPorcValor.Valor := (acValorBruto * acPorcValor.Porc)/100
                                     else acPorcValor.Valor := 0;
          end;
    '$' : begin
            if acPorcValor.Valor <> 0 then acPorcValor.Porc := (acPorcValor.Valor * 100)/acValorBruto
                                      else acPorcValor.Porc := 0;
          end;
  end;
end;

function TCM.CalcSubTotalLiquido(csValorUnit:Currency; csQuantidade:Real; csComprimento:Real=0; csLargura:Real=0; csEspessura:Real=0; csPesoLiquido:Real=0):Currency;
var
  AreaDimensoes : Real;
begin
  if csComprimento = 0 then csComprimento := 1;
  if csLargura     = 0 then csLargura     := 1;
  if csEspessura   = 0 then csEspessura   := 1;
  AreaDimensoes := csComprimento * csLargura * csEspessura;

  if RegProduto.TipoBusca = buCaixaFechada then csQuantidade := csQuantidade * RegProduto.CX_Quantidade;

  if RegProduto.PrecoProPeso then csQuantidade := (csPesoLiquido * AreaDimensoes)
                             else csQuantidade := (csQuantidade * AreaDimensoes);

  result := RoundTo(csValorUnit * csQuantidade, -3);
end;

function TCM.PegaFiltroPesqMunicipio(pfEstadoSigla:String):String;
var
  CdEstado : Integer;
begin
  CdEstado := fDB.GetValorDoCampo(DtM.IBDatabaseServer, 'CD_ESTADO', 'TAB_ESTADOS', 'SIGLA = '+QuotedStr(pfEstadoSigla), 0);
  if CdEstado <= 0 then
    result := ''
  else begin
    result := 'CD_ESTADO = '+QuotedStr(IntToStr(CdEstado));
  end;
end;

procedure TCM.CarregaValoresIniciais;
begin
  PegaInformacoesDoTerminal;
  LimpaRegistrosSelecionados;
end;

procedure TCM.PegaInformacoesDoTerminal;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
  Modelo : char;
begin
  try
    RegTerm.IDNumTerminal := LeIni(EIni.ConfigLocais.NumTerminal, 1);
    fDB.CreateQueryTransacao(IdentificaConexao, EstaTabela, EstaTransacao);
    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('Select NUM_TERMINAL, DESCRICAO, OBS, IP, coalesce(NUM_TERMINAL, 0) as NUM_TERMINAL from TERMINAIS');
    EstaTabela.SQL.Add('where NUM_TERMINAL = :NUM_TERMINAL');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('NUM_TERMINAL').AsInteger := RegTerm.IDNumTerminal;
    EstaTabela.Active := true;
    RegTerm.IDNomeTerminal := EstaTabela.FieldByName('DESCRICAO').AsString;
    RegTerm.IP             := EstaTabela.FieldByName('IP').AsString;
    RegTerm.TerminalCaixa  := RegTerm.IDNumTerminal;

//    RegTerm.TerminalCaixa  := EstaTabela.FieldByName('NUM_TERMINAL').AsInteger;
//    if RegTerm.TerminalCaixa = 0 then RegTerm.TerminalCaixa := RegTerm.IDNumTerminal;
    EstaTabela.Active := false;

  finally
    fDB.FechaTT(EstaTabela);
    fDB.FreeQueryTransacao(EstaTabela, EstaTransacao);
  end;
end;

procedure TCM.IniciaModuloComum(imcBaseServer, imcBaseLocal:TIBODatabase);
begin
  IBTabela.IB_Connection                        := imcBaseServer;
  IBTabela.IB_Transaction.IB_Connection         := imcBaseServer;
  IBAuxTabela.IB_Connection                     := imcBaseServer;
  IBAuxTabela.IB_Transaction.IB_Connection      := imcBaseServer;
  IBTabela3.IB_Connection                       := imcBaseServer;
  IBTabela3.IB_Transaction.IB_Connection        := imcBaseServer;
  IBTabelaLocal.IB_Connection                   := imcBaseServer;
  IBTabelaLocal.IB_Transaction.IB_Connection    := imcBaseServer;
  IBAReceber.IB_Connection                      := imcBaseServer;
  IBAReceber.IB_Transaction.IB_Connection       := imcBaseServer;

  StoredProcServer.IB_Connection                := imcBaseServer;
  StoredProcServer.IB_Transaction.IB_Connection := imcBaseServer;
  SP_Ping.IB_Connection                         := imcBaseServer;
  SP_Ping.IB_Transaction.IB_Connection          := imcBaseServer;
  IBPing.IB_Connection                          := imcBaseServer;
  IBPing.IB_Transaction.IB_Connection           := imcBaseServer;

  StoredProcLocal.IB_Connection                 := imcBaseLocal;
  StoredProcLocal.IB_Transaction.IB_Connection  := imcBaseLocal;
  IBTabelaLocal.IB_Connection                   := imcBaseLocal;
  IBTabelaLocal.IB_Transaction.IB_Connection    := imcBaseLocal;
  StoredProcLocal.IB_Connection                 := imcBaseLocal;
  StoredProcLocal.IB_Transaction.IB_Connection  := imcBaseLocal;
end;

function TCM.DescricaodaCST(CST: String): String;
begin
  try
    result := '';
    if length(CST) < 3 then Exit;

    case CST[1] of
      '0': result := 'Origem Nacional';
      '1': result := 'Origem Estrangeira (Importa��o Direta)';
      '2': result := 'Origem Estrangeira (Adquirida no Mercado Interno)';
    else exit;
    end;

    case StrToIntZ(CST[2]+CST[3], 0) of
      00 : result := result +PL+ 'Tributada integralmente';
      10 : result := result +PL+ 'Tributada e com cobran�a do ICMS por substitui��o tribut�ria';
      20 : result := result +PL+ 'Com redu��o de base de c�lculo';
      30 : result := result +PL+ 'Isenta ou n�o tributada e com cobran�a do ICMS por substitui��o tribut�ria';
      40 : result := result +PL+ 'Isenta';
      41 : result := result +PL+ 'N�o Tributada';
      50 : result := result +PL+ 'Suspens�o';
      51 : result := result +PL+ 'Diferimento';
      60 : result := result +PL+ 'ICMS cobrado anteriormente por substitui��o tribut�ria';
      70 : result := result +PL+ 'Com redu��o de base de c�lculo e cobran�a do ICMS por substitui��o tribut�ria';
      90 : result := result +PL+ 'Outras';
      else exit;
    end;
  finally
  end;
end;

procedure TCM.MostraTodasAsCSTs;
begin
  MensagemDeInformacao('C�DIGO DE SITUA��O TRIBUT�RIA'+PL+
                          '--------------------------------------------------------------'+PL+
                          '0 = Origem Nacional'+PL+
                          '1 = Origem Estrangeira - Importa��o direta'+PL+
                          '2 = Origem Estrangeira - Adquirida no mercado interno'+PL+
                          '--------------------------------------------------------------'+PL+
                          '00 = Tributada integralmente'+PL+
                          '10 = Tributada e com cobran�a do ICMS por substitui��o tribut�ria'+PL+
                          '20 = Com redu��o de base de c�lculo'+PL+
                          '30 = Isenta ou n�o tributada e com cobran�a do ICMS por substitui��o tribut�ria'+PL+
                          '40 = Isenta'+PL+
                          '41 = N�o Tributada'+PL+
                          '50 = Suspens�o'+PL+
                          '51 = Diferimento'+PL+
                          '60 = ICMS cobrado anteriormente por substitui��o tribut�ria'+PL+
                          '70 = Com redu��o de base de c�lculo e cobran�a do ICMS por substitui��o tribut�ria'+PL+
                          '90 = Outras' );
end;

function TCM.TemST(tsCST:String):Boolean;
var
  Sit : word;
begin
  result := false;
  if length(tsCST) < 3 then exit;

  Sit := StrToIntZ(tsCST[2]+tsCST[3], 0);
  result := Sit in [30, 60, 70];
end;

function TCM.E_Tributado(tsCST:String):Boolean;
var
  Sit : word;
begin
  result := false;
  if length(tsCST) < 3 then exit;

  Sit := StrToIntZ(tsCST[2]+tsCST[3], 0);
  result := Sit in [00];
end;

function TCM.FormataEndereco(MultiLinhas:Boolean;  Endereco:string=''; Numero:string='';
  Bairro:string=''; Cidade:string=''; Estado:string=''; Cep:string='';
  Complemento:string=''):string;
var
  L1, L2, L3 : string;
  Separador : string;
begin
  L1 := '';
  L2 := '';
  L3 := '';
  if not Vazio(Endereco) then
  begin
    if not Vazio(Numero) then Endereco := Endereco +', '+ Numero;
    if not Vazio(L1) then
      L1 := L1 + Endereco
    else
      L1 := Endereco;
  end;
  if not Vazio(Bairro) then
  begin
    if not Vazio(L1) then
      L1 := L1 + ' - '+Bairro
    else
      L1 := Bairro;
  end;
  if not Vazio(Cidade) then
  begin
    if not Vazio(Estado) then Cidade := Cidade +' - '+ Estado;
    if not Vazio(L2) then L2 := L2 + ' - '+Cidade
                     else L2 := Cidade;
  end;
  if not Vazio(cep) then
  begin
    if not Vazio(L3) then L3 := L3 + ' - CEP:'+Cep
                     else L3 := 'CEP:'+Cep;
  end;
  if not Vazio(Complemento) then
  begin
    if not Vazio(L3) then
      L3 := L3 + ' - '+Complemento
    else
      L3 := Complemento;
  end;

  if Multilinhas then Separador := PL
                 else Separador := ' - ';

  result := '';
  if not Vazio(L1) then result := L1;

  if not Vazio(L2) then
  begin
    if not Vazio(result) then
      result := result + Separador + L2
    else
      result := L2;
  end;

  if not Vazio(L3) then
  begin
    if not Vazio(result) then
      result := result + Separador + L3
    else
      result := L3;
  end;
end;

function TCM.FormStr(fAlinhamento:Char; fTexto:String; fTamanho:Integer; fAcentuacao:char='A'):String;
var
  i : integer;
begin
  case fAcentuacao of
    'N' : fTexto := TiraAcentos(fTexto);
    'F' : fTexto := AcentuaImpressao(fTexto);
  end;

  result := '';
  fAlinhamento := upcase(fAlinhamento);
  case fAlinhamento of
    'C' : begin
            for i := 1 to ((fTamanho - Length(fTexto))div 2) do
              result := result + ' ';
            result := result + fTexto;
          end;
    'E' : begin
            result := result + fTexto;
            for i := 1 to (fTamanho - Length(fTexto) )do
              result := result + ' ';
          end;
    'D' : begin
            for i := 1 to (fTamanho - Length(fTexto)) do
              result := result + ' ';
            result := result + fTexto;
          end;
  end;
end;

end.

