unit UConstVar;

interface

uses ExtCtrls, Classes, RDprint, ComCtrls, Graphics;

Const
  CriptoLogin = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 abcdefghijklmnopqrstuvwxyz!/.';
  CarLogin = '!';
  RegChavePadrao = 'Software\Focus';
  ArqBancoServer = 'FOCUS.FOC';
  ArqBancoLocal  = 'FOCUSLOCAL.FOC';

// Unidades Fracionáveis
  UNDFrac = 'KG;MT;LT;M2;M3';

// Estilo do preenchimento dos panels do PDV
  stImagem  = 0;
  stSolido  = 1;
  stDegrade = 2;

// TipoBeep
  bpPadrao  = 0;
  bpErro    = 1;

// Valores Principais
  DigCodCliente     = 5;
  DigCodVendedor    = 5;
  DigNumDocumento   = 8;

// Valores para os Créditos
  credDiasParaBloqueio = 07;
  credQuantAltDataPermitidas = 10;

  credKey = 8;
  credC1  = 1;
  credC2  = 1;

// Status dos Cheques
  stADepositar      = 1;
  stDepositado      = 2;
  stLiquidado       = 3;
  stDevolvido       = 4;
  stRepassado       = 5;
  stCustodia        = 6;
  stOutros          = 7;

//Formas de Pagamento
  fpDinheiro       = 'Dinheiro';
  fpCheque         = 'Cheque';
  fpCartao         = 'Cartao';
  fpCredCli        = 'Dinheiro';
  fpCrediario      = 'Crediario';
  fpTicket         = 'Ticket';
  fpBoleto         = 'Crediario';

//Tipo de Conta  - obs: VALORES NÃO PODEM SER MUDADOS !!!!!!!!!!
  tcCheque       = 0;
  tcCredCli      = 1;
  tcBoleto       = 2;
  tcCrediario    = 3;
  tcOutros       = 4;
  tcCartao       = 7;
  // Não são conta...
  tcDinheiro     = 5;
  tcTicket       = 6;

//Cartão de Crédito  //Não pode mudar por causa do radiogroup
  ccCredito   = 0;
  ccDebito    = 1;
  ccParcelado = 2;
  ccCDC       = 3;

// FormaPgtoXCodVenda //Não pode mudar por causa do radiogroup
  fpxcvDINHEIRO      = 0;
  fpxcvCHEQUE        = 1;
  fpxcvCHEQUEPRE     = 2;
  fpxcvCARTAOCREDITO = 3;
  fpxcvCARTAODEBITO  = 4;
  fpxcvCARTAOCDC     = 5;
  fpxcvCREDIARIO     = 6;
  fpxcvTICKET        = 7;

//Pessoa
  pFisica          = 'F';
  pJuridica        = 'J';

//Situação
  stOK             = 0;
  stAtrasado       = 1;
  stBloqueado      = 2;

// Situação Tributária
  stIsento             = 0;
  stNaoTributado       = 1;
  stSubstTributaria    = 2;
  stTributadoPeloICMS  = 3;
  stTributadoPeloISSQN = 4;

//Status
  stCaixaLivre       = 1;
  stVendaAberta      = 2;

//Disposição do Carnê
  dcSoTitulo       = 0;
  dcSoCarnes       = 1;
  dcTituloECarnes  = 2;

//Formato do Carnê e Comprovante
  ccFormatoCarne       = '7P';     // 70mm, Página
  ccFormatoComprovante = '7P';     // 70mm, Página
  ccImprimirCarne      = 'INP';    // Imprimir, Nao Imprimir, Perguntar

// Impressão
  ccFonte            = 'PDRS';     // Padrão, Draft, Roman, San Serif
  ccImpressora       = 'EHRGBDS';  // Epson, HP, Rima, Gráfica, Bematech, Daruma, Star
  ccOrdemImpressao   = 'NCA';      // Número item, Código, Alfabética


//CupomConfig
  ccImpSaldoDivida   = 'NTS';    // Nenhum, Todos, Selecionados
  ccTamanhoFita      = '123';      // 70mm, 100mm, 40colunas
  ccVia              = 'WC';       // Windows/ECF, Caracter
  ccDestino          = 'PN';       // Porta de Comunicação, Nome da Impressora
  ccTipoDocumento    = 'FPO';      // Fiscal, Pedidos, Orçamentos
  ccTipoPDV          = '123';      // Grid1, Grid2, Grid3
  ccPedirVendedor    = 'IFN';      // Início, Final, Não Pedir
  ccApresentacao     = 'VF';       // Vendedor, Frentista
  ccStatus           = 'LAP';      // Livre, Aberto, Pagamento
  ccTipoPrecoTransf  = 'CV';       // Custo, Venda
  ccModeloGaveta       = 'NMGEC';  // Nenhuma, SerialMenno, SerialGerbo, ImpressoraECF, ImpressoraComum

// Inventário
  ivLancamento       = 'RSA';   // Replace, Sum, Ask

// Cadastros
  cadAtivos          = 'AIT';   // Ativos, Inativos, Todos

// Cheques
  chAcaoCPFDevolv    = 'BAN';   // Boqueia, Avisa, Nada
  chAcaoCPFBloq      = 'BAN';   // Boqueia, Avisa, Nada
  chSDChequesTP      = 'TD';    // Todos, Devolvidos
  chLCChequesTP      = 'TD';    // Todos, Devolvidos

//Imprime Saldo da Dívida
  sdNenhum       = 0;
  sdTodos        = 1;
  sdSelecionados = 2;

  ConsumidorFinal = 'CONSUMIDOR FINAL';
  Todas           = 'TODAS';
  PorcentCodigo   = 30;

// Tabelas (Usadas em Seleções de Registros) e na Sincronização com o PDV
  tabProdutos             = 01;   // NÃO PODEM SER ALTERADOS !!!!!!!!!!!!!!!!!!
  tabGrupos               = 02;
  tabGrades               = 03;
  tabEstoque              = 04;
  tabClientes             = 05;
  tabFornecedores         = 06;
  tabRepresentantes       = 07;
  tabPracas               = 08;
  tabSaidas               = 09;
  tabContasAReceber       = 10;
  tabContasAPagar         = 11;
  tabCaixa                = 12;
  tabTerminal             = 14;
  tabUsuario              = 15;
  tabCategoria_Cliente    = 16;
  tabCategoria_Usuario    = 17;
  tabPrecosPromocionais   = 19;
  tabPermissoesPagamento  = 20;
  tabUsuarios_Classif     = 21;
  tabPermissoesUsuario    = 22;
  tabConfig               = 23;
  tabConfigLocal          = 24;
  tabConfigCupom          = 25;
  tabConfigTelaPDV        = 26;
  tabSecSystem            = 27;
  tabCreditos             = 28;
  tabCodVenda             = 29;
  tabEmpresas             = 30;
  tabCaixaEventos         = 31;
  tabPedidos              = 32;
  tabFormasDePgto         = 33;
  tabCartoes              = 34;
  tabRefClientes          = 35;

//Exclusões
  exProduto        = 0;
  exCliente        = 1;
  exGrupo          = 2;
  exFornecedor     = 4;
  exTerminal       = 6;
  exEmpresa        = 7;
  exCodVenda       = 8;
  exSimilar        = 9;
  exDeposito       = 10;
  exUsuario        = 11;
  exFormaPagamento = 12;
  exContaAReceber  = 13;
  exPedido         = 14;
  exOrcamento      = 15;
  exVenda          = 16;
  exConfBoleto     = 17;
  exConfNF         = 18;
  exCadEtiqueta    = 19;
  exPedidoCompra   = 20;
  exTransferencia  = 21;
  exBanco          = 23;
  exContaBancaria  = 24;
  exContaAPagar    = 25;
  exEntradaDeNotas = 26;
  exTrocaDev       = 27;
  exRMA            = 28;

//  Tipos de Documento
  tdECF           = 'V';
  tdDAV           = 'O';
  tdPreVenda      = 'P';
  tdTransferencia = 'T';
  tdEscolher      = 'E';
  tdDevolucao     = 'D';


// Códigos considerados Vazios
  CodigoVazio  = 0;
  DataVazia    = '30/12/1899';

// Modo De Impressão de Cupom
  CorModoECF    = clWhite;
  CorModoPedido = clYellow;

//Flag do Item do XML na entrada
  ixVinculado      = 'V';
  ixNaoCadastrado  = 'N';
  ixCadastrado     = 'C';


type
  TModos = (mdAlteracao, mdInclusao, mdInclusaoXML, mdNavegacao);
  TTipoNota = (tpnCheia, tpnMeia);
  TBotaoPressionado = (bpOk, bpCancelado, bpImprimir, bpFechar, bp1, bp2, bp3, bp4, bp5, nbp6, bp7, bp8, bp9);
  TModulo = (moPDV, moGER);
  TBuscaProduto = (buNenhum, buCodBarras, buCaixaFechada, buCodBalanca, buCodigo2, buCodigo3, buCodigo4, buGrade, buNumSerie);
  TPesquisarOQue = (pqProdutos, pqClientes, pqVendedores, pqUsuarios, pqFornecedores, pqOrcamentos, pqPedidosEVendas, pqPedidos, pqVendas, pqEntradaNotas, pqCodVenda, pqPracas, pqSimilares, pqRepresentantes, pqClientesCategorias, pqUsuariosClassif, pqConfBoletos, pqMunicipios, pqCFOP, pqEmpresas, pqCertificados);
  TSitMarca = (smMarcado, smDesmarcado, smAoContrario, smDesmarcaTudo);
  TEstadoDaVenda = (evNovoPedOrcVenda, evReabreOrcPedido, evBaixaOrcPedido);
  TComoFechaVenda = (cmBaixa, cmGuarda);
  TResolucoes = (res800x600, res1024x768, resOutro);
  TSetModos = Set of TModos;
  TAcentuacao = (acNaoAcentuado, acAcentuado, acForcado, acCupomDefault);



  TItemEscolhido = record
    CodInt : Integer;
    CodExt : String[13];
    SubCod : Integer;
    Descricao : String;
  end;

  TRegCreditos = record
    ID          : Integer;
    RazaoSocial : String;
    CNPJ        : String;
    Validade       : TDate;
    UltimaCarga    : TDateTime;
    UltimaDataHora : TDateTime;
    UltimaAbertura : TDateTime;
    Bloqueado      : boolean;
    Expirado       : boolean;
    QtdeAlteracoes : word;
    QtdeMaquinas   : word;
    Sistema        : String[2];
    Atraso         : Integer;
  end;

  TRegWeb = record
    Sinc_Web                  : Boolean;
    CD_Empresa                : Integer;
    NM_Empresa                : String;
    Caminho_BD                : String;
    Login                     : String;
    Senha                     : String;
    Sinc_Produtos             : Boolean;
    Sinc_Clientes             : Boolean;
    Sinc_Saidas               : Boolean;
    Sinc_Entradas             : Boolean;
    Sinc_Caixa                : Boolean;
    Sinc_ContasAReceber       : Boolean;
    Sinc_ContasAPagar         : Boolean;
    Sinc_Fornecedores         : Boolean;
    Timer_Sinc_Produtos       : Integer;
    Timer_Sinc_Clientes       : Integer;
    Timer_Sinc_Saidas         : Integer;
    Timer_Sinc_Entradas       : Integer;
    Timer_Sinc_Caixa          : Integer;
    Timer_Sinc_ContasAReceber : Integer;
    Timer_Sinc_ContasAPagar   : Integer;
    Timer_Sinc_Fornecedores   : Integer;
    Imp_Precos                : Boolean;
    TipoImportPrecos          : word; // 0=Qualquer Alteração; 1=Da Empresa
    EmpImportPrecos           : word;
  end;

  TRegGrade = record
    CD_Grade  : Integer;
    CodBarras : String;
    Descricao : String;
  end;

  TRegProduto = record
    CD_Produto    : Integer;
    Cod_Barras    : String[13];
    Codigo2       : String;
    Codigo3       : String;
    Codigo4       : String;
    Nm_Produto    : String;
    DescricaoAbrev: String;
    MargemLucro   : Real;
    CasasDecimais : word;
    Preco         : Currency;
    PrecoCusto    : Currency;
    ICMS          : Currency;
    IPI           : Currency;
    FreteChegada  : Currency;
    FreteSaida    : Currency;
    NCM           : String[8];
    Origem        : Word;
    SubstTribut   : boolean;
    ECF_Sit_Tribut  : char;
    Unidade            : String[2];
    DescontoMax        : Real;
    Estoque            : Real;
    CX_Quantidade    : Real;
    QuantDesejada    : Real;
    PrecoProPeso     : boolean;
    PesoLiquido      : Real;
    PesoBruto        : Real;
    UNDFracionada    : boolean;
    ControlaNumSerie : boolean;
    NumSerie         : String;
    TipoBusca        : TBuscaProduto;
    Grade            : TRegGrade;
    Foto             : TBitMap;
  end;

  TRegVendedor = record
    Nm_Vendedor        : String;
    Cd_Vendedor        : Integer;
    NomeVendedorTEMP   : String;
    CodigoVendedorTEMP : Integer;
    E_Vendedor         : boolean;
  end;

  TRegCodigoDaVenda = record
    CodigoDaVenda : Integer;
    Descricao     : String;
  end;

  TRegCategoria = record
    Cd_Categoria : Integer;
    Descricao : String;
    Cor : Integer;
  end;

  TRegValorPorc = record
    Valor     : Currency;   // Valor em $ Real
    Porc      : Currency;   // Valor em % Porcentagem
    Tipo      : char;       // Tipo (% ou $)
  end;

  TRegCliente = Record
    DadosPreenc    : boolean;
    Cd_Cliente     : Integer;
    Nm_Cliente     : String;
    Apelido        : String;
    Endereco       : String;
    Endereco_Num   : String;
    Bairro         : String;
    Cidade         : String;
    Complemento    : String;
    CD_Municipio   : Integer;
    Estado         : String;
    CD_Estado      : Integer;
    Referencia     : String;
    Cep            : String;
    CPF            : String;
    RG             : String;
    Telefone       : String;
    CondPagamento  : String;
    Suframa        : string;
    Pessoa         : Char;
    Categoria      : TRegCategoria;
    TipoCliente    : Char; // (R)evenda;  (C)onsumidor Final

    OpcoesPersonalizadas : boolean;
    AtrasoJuros    : Real;
    AtrasoMulta    : Real;
    PrazoPagamento : Integer;
    LimiteCredito  : Currency;
    BloqPagCheque    : boolean;
    BloqPagCrediario : boolean;

    CreditoDisp    : Currency;
    SaldoDaDivida  : Currency;
    DividaVencida  : Currency;
    DividaAVencer  : Currency;
    CreditoAberto  : Currency;
    Atraso         : Integer;
    ImpSaldoDivida : boolean;
    Bloqueado      : boolean;
    BloqueioManual : boolean;
    Dt_UltCompra   : TDateTime;

    Lembrete       : String[150];
    Sexo           : char;
    DtNascimento   : TDate;
    Contato        : String[80];
    Fax            : String[30];
    EstadoCivil    : char;
    Conjuge        : String[40];
    DataCasamento  : TDate;
    NomePai        : String[40];
    NomeMae        : String[40];
    Ref1           : String[80];
    Ref2           : String[80];
    email          : String[40];
    WebSite        : String[50];
    TaNoSPC        : boolean;
    DataSPC        : TDate;
    NumSPC         : Integer;
    PontuacaoAtual : Integer;
    PontuacaoTotal : Integer;
    Vendedor       : Integer;
    Praca          : Integer;
  end;

  TRegEmpresa = Record
    DadosPreenc     : boolean;
    Cd_Empresa      : Integer;
    Nm_Empresa      : String;
    NomeFantasia    : String;
    CGC             : String;
    InscEstadual    : String;
    InscMunicipal   : string;
    Endereco        : String;
    Endereco_Num    : String;
    Complemento     : String;
    Bairro          : String;
    Cidade          : String;
    CD_Municipio    : Integer;
    Estado          : String;
    CD_Estado       : Integer;
    Cep             : String;
    Telefone        : String;
    Fax             : String;
    Email           : String;
    WebSite         : String;
    Logo            : TBitMap;
    LogoRelatorio   : TBitMap;
    TipoContrib     : char;
    Aliquota_ICMS   : Currency;
    Aliquota_PIS    : Currency;
    Aliquota_COFINS : Currency;
    CNAEFiscal      : string;
    CRT             : Word;
  end;

  TRegFornecedor = Record
    DadosPreenc   : boolean;
    Cd_Fornecedor : Integer;
    Nm_Fornecedor : String;
    NomeFantasia  : String;
    CNPJ          : String;
    InscEstadual  : String;
    Contato       : String;
    Endereco      : String;
    Endereco_Num  : String;
    Bairro        : String;
    Cidade        : String;
    CD_Municipio  : Integer;
    Estado        : String;
    Complemento   : String;
    CD_Estado     : Integer;
    Cep           : String;
    Telefone      : String;
    Fax           : String;
    Email         : String;
    WebSite       : String;
  end;

  TRegRepresentante = Record
    DadosPreenc   : boolean;
    Cd_Representante : Integer;
    Nm_Representante : String;
    Endereco      : String;
    Bairro        : String;
    Cidade        : String;
    Estado        : String;
    Cep           : String;
    Telefone      : String;
    Fax           : String;
    Email         : String;
  end;

  TRegCheque = record
    NumCheque     : String;
    NumBanco      : String[3];
    Agencia       : String;
    NumConta      : String;
    CD_CONTA      : Integer;
    CPFCNPJ       : String;
    NomeTitular   : String;
  end;

  TRegPagCartao = record
    CodCartao        : Integer;
    Cd_Cliente       : Integer;
    Valor            : Currency;
    ValorParcela     : Currency;
    Num_Parcelas     : Integer;
    Taxa             : Currency;
    ValorDescTaxa    : Currency;
    ParcelaDescTaxa  : Currency;
    TipoCartao       : word;
    ValorAcrescimo   : Currency;
    DiasRepasse      : String;
  end;

  TRegBaixa = record
    Data     : TDateTime;
    Obs      : String;
    Login    : String;
    Terminal : Integer;
    Juros          : Currency;
    Atraso         : Integer;
    AcresDesc      : TRegValorPorc;
    CobrouJuros    : Boolean;
    Baixou         : Boolean;
  end;

  TRegConta = record
    Sequencial     : Integer;
    CdCliente      : Integer;
    Num_Doc_Conta  : Integer;
    Num_Doc_Venda  : Integer;
    Parcela        : String;
    ValorAtual     : Currency;
    ValorOriginal  : Currency;
    ValorDestaConta: Currency;  // Com Juros
    VencimAtual    : TDate;
    VencimOriginal : TDate;
    Emissao        : TDateTime;
    Obs            : String;
    TipoDocumento  : word;
    Vendedor       : Integer;
    Juros          : Currency;
    Atraso         : Integer;
    Cheque         : TRegCheque;
    Baixa          : TRegBaixa;
  end;

  TVetContas = Array of TRegConta;
  TVetPagCartao = Array of TRegPagCartao;

  TRegPagamento = record
    Pag_Dinheiro   : Currency;
    Pag_Cheque     : Currency;
    Pag_ChequePre  : Currency;
    Pag_ChequeAto  : Currency;
    Pag_Crediario  : Currency;
    Pag_Ticket     : Currency;
    Pag_Cartao     : Currency;
    Pag_CredCli    : Currency;
    Pag_DinheiroComTroco : Currency;
    QtdeParcCred   : Integer;
    QtdeCheques    : Integer;
    QtdeCartoes    : Integer;
    VetCartoes     : TVetPagCartao;
    VetCheques     : TVetContas;
    VetCrediario   : TVetContas;
    Troco          : Currency;
    TotalPago      : Currency;
    Resta          : Currency;
    ProxVencimento : TDate;
  end;

  TRegTransferencia = record
    Num_Documento   : Integer;
    Data            : TDateTime;
    Login           : String;
    Num_Terminal    : word;
    Obs             : String;
    ValorTotalCusto : Currency;
    ValorTotalVenda : Currency;
    ValorTotal      : Currency;
    QuantItems      : Integer;
    Aberto          : Boolean;
    Transf_De       : Integer;
    Transf_Para     : Integer;
    CD_Cliente      : Integer;
    CD_Fornecedor   : Integer;
    Operacao        : char;
  end;

  TDadosECF = record
    NumSerie  : String;
    COO       : String;
    CCF       : String;
    NumCaixa  : String;
    CRO       : String;
    CRZ       : String;
    GT        : Currency;
    Modelo    : string;
    Data      : TDateTime;
    Arredond  : boolean;
  end;

  TRegPedido = record
    Num_Documento : LongInt;
    Num_DAV       : LongInt;
    Num_PV        : LongInt;
    NF_Numero     : String;
    ECF           : TDadosECF;
    Num_Pedido    : String;
    SeqDiario     : Integer;
    ID_Local      : Integer;
    Despesa       : Currency;
    DescDespesa   : String;
    Frete         : Currency;
    DescFrete     : String;
    Cancelado     : Boolean;

    CD_Caixa        : Integer;    // Identificação do Caixa
    TotalCusto      : Currency;   // Total Preco de Custo
    TotalBruto      : Currency;   // Total SEM Desconto e Acrescimo
    TotalLiquido    : Currency;   // Total COM Desconto e Acrescimo
    DataDocumento   : TDateTime;
    DataAbertura    : TDateTime;
    DataEntrega     : TDate;
    DataCancelamento: TDateTime;
    UltimaAlteracao : TDateTime;
    AcresDesc       : TRegValorPorc; // Desconto ou Acréscimo (negativo=desconto, positivo=acrescimo)
    AcresDescUnit   : TRegValorPorc; // Desconto ou Acréscimo Unitário (sobre os itens) (negativo=desconto, positivo=acrescimo)
    Obs             : String;
    Ordem           : Word;
    QuantItems      : Word;
    QuantProdutos   : Integer;
    PesoBruto       : Currency;
    PesoLiquido     : Currency;
    Cliente         : TRegCliente;
    Login           : String;
    Vendedor        : Integer;
    CodVenda        : word;
    Pagamento       : TRegPagamento;
    Ped_Orc_Venda   : Char;
    Num_Terminal    : Word;
    Categoria       : Word;
  end;

  TFormasPagamento = record
    Pag_Dinheiro  : Boolean;
    Pag_Cartao    : Boolean;
    Pag_Cheque    : Boolean;
    Pag_Crediario : Boolean;
    Pag_Ticket    : Boolean;
  end;

  TBuscaProdutoPor = record
    CodBarras  : Boolean;
    CodBalanca : Boolean;
    CodGrade   : Boolean;
    CodCaixa   : Boolean;
    Codigo2    : Boolean;
    Codigo3    : Boolean;
    Codigo4    : Boolean;
    NumSerie   : Boolean;
  end;

  TRegParcelaBoleto = record
    Numero : String[20];
    Valor  : Currency;
    Data   : TDate;
  end;

  TRegNFBoletos = record
    Parc1 : TRegParcelaBoleto;
    Parc2 : TRegParcelaBoleto;
    Parc3 : TRegParcelaBoleto;
    Parc4 : TRegParcelaBoleto;
    Parc5 : TRegParcelaBoleto;
    Parc6 : TRegParcelaBoleto;
  end;

  TRegConfCarne = record
    Modelo          : String;
    ImprimirCarne   : Char;
    MensagemCarne   : TStrings;

    NumViasIndice      : word;
    MensagemIndice     : TStrings;
    EstiloVale         : Boolean;
    ImpCabecalhoIndice : Boolean;
  end;

  TRegConfRecibo = record
    Modelo         : String;
    Mensagem       : TStrings;
    ImprimirRecibo : Char;
    ImprimirJuros       : boolean;
    ImprimirSaldoDivida : boolean;
  end;

  TRegAutoImpCaixa = Record
    Abertura   : boolean;
    Fechamento : boolean;
    SangriaSuprimento : boolean;
  end;

  TRegTerminal = Record
    IDNumTerminal  : Integer;
    IDNomeTerminal : String;
    IP             : String;
    TerminalCaixa  : Integer;
    AutoImpCaixa   : TRegAutoImpCaixa;
  end;

  TRegAbreCadastro = record
    EntraNaInclusao  : boolean;
    EntraNaAlteracao : integer;
  end;

  TRegFiltroVendas = record
    TipoPeriodo : word;
    DataDe      : TDate;
    DataAte     : TDate;
    HojeDe      : boolean;
    HojeAte     : boolean;
    QuantDias   : Integer;
    Vendedor    : Integer;
    Terminal    : Integer;
  end;

  TRegModeloCupom = record
    Pedido        : String;
    Orcamento     : String;
    CupomFiscal   : String;
    Transferencia : String;
    Devolucao     : String;
    ResumoCaixa   : String;
    CarneCrediario: String;
    Recibo        : String;
  end;

  TRegRelatorio = record
    LarguraDaPagina : Real;
    AlturaDaPagina  : Real;
    LarguraReal     : Real;
    MargemEsquerda  : Real;
    MargemDireita   : Real;
    MargemTopo      : Real;
    MargemBaixo     : Real;
    Cor             : Integer;
    AlteraCor       : Boolean;
  end;

  TRegTelaPDV = record
    EstiloBase          : char;
    EstiloFundo         : char;
    CorSolidaBase       : integer;
    CorSolidaFundo      : integer;
    CorDegradeBaseDe    : integer;
    CorDegradeFundoDe   : integer;
    CorDegradeBasePara  : integer;
    CorDegradeFundoPara : integer;
    ImagemBase          : TImage;
    ImagemFundo         : TImage;
    CantosArredondados  : boolean;
  end;

  TRegPromocao = record
    NomePromocao : String;
    AcumulaPontos: Boolean;
    MostraValor  : Boolean;
    Pontos       : Integer;
    Unidade      : char;
    Impressora   : String;
    ValorTotalPromocao : Currency;
    ImprimirCupom : boolean;
    PergAntesImp  : boolean;
    ImpPropPontos : boolean;
    Cupom         : TStrings;
    SoParaClientes: boolean;
    TeveAlgumaPromocao : boolean;
  end;

  TDescontoUnitario = record
    ValorEscolhido : Currency;
    EmReais : Currency;
    EmPorcentagem : Currency;
    TipoDesconto : char;
  end;

  TPosicaoCodBalanca = record
    Posicao : word;
    Tamanho : word;
  end;

  TFormatoCodBalanca = Record
    Formato : String;
    Codigo  : TPosicaoCodBalanca;
    Peso    : TPosicaoCodBalanca;
    Valor   : TPosicaoCodBalanca;
  end;

  TConfigCadastro = record
    Prod_Codigo02            : Boolean;
    Prod_Codigo03            : Boolean;
    Prod_Codigo04            : Boolean;
    Prod_Desc_Cod02          : String;
    Prod_Desc_Cod03          : String;
    Prod_Desc_Cod04          : String;
    Prod_Codigo_EAN          : Char;
    GradeCampoCodigo         : String;
    GradeCampoDescricao      : String;
    GradeExibirCodigo        : Boolean;
    Prod_ExibirNumSerie      : Boolean;
    BuscaProd_CodBarras      : Boolean;
    BuscaProd_CodBalanca     : Boolean;
    BuscaProd_CodGrade       : Boolean;
    BuscaProd_CodCaixa       : Boolean;
    BuscaProd_Codigo2        : Boolean;
    BuscaProd_Codigo3        : Boolean;
    BuscaProd_Codigo4        : Boolean;
    BuscaProd_NumSerie       : Boolean;
    CodProdNumDigTotal       : word;
    CodProdDigInicial        : Char;
    CodProdDigFinal          : Char;

    CLI_Prazo_Padrao         : Word;
    CLI_TaxaJuros_Padrao     : Currency;
    CLI_LimCred_Padrao       : Currency;
    CLI_BloqCheque_Padrao    : Boolean;
    CLI_BloqCrediario_Padrao : Boolean;
    CLI_BloqAuto_Padrao      : Boolean;
    CLI_ImpDivida_Padrao     : Boolean;
    PROD_Unidade_Padrao      : String;
    PROD_EstMinimo_Padrao    : Currency;
    PROD_Margem_Padrao       : Currency;
    PROD_Margem2_Padrao      : Currency;
    PROD_Margem3_Padrao      : Currency;
    PROD_Margem4_Padrao      : Currency;
    PROD_Margem5_Padrao      : Currency;
    PROD_DescMax_Padrao      : Currency;
    PROD_Comissao_Padrao     : Currency;
    PROD_IPI_Padrao          : Currency;
    PROD_ICMS_Padrao         : Currency;
    PROD_NCM_Padrao          : String;
    PROD_ContNumSerie_Padrao : Boolean;
    PROD_UNDFrac_Padrao      : Boolean;
    PROD_ECF_Sit_Padrao      : Char;
    PROD_ST_Padrao           : Boolean;
  end;

  TConfigPedido = record
    TipoPrecoPadrao        : Word;
    OcultaClientesBloq     : Boolean;
    OcultaClientesBloqMan  : Boolean;
    PermQtdeFrac           : Boolean;
    PermQtdeFracSelec      : Boolean;
    MostraMargemLucro      : Boolean;
    ExibMargemLucro        : String;
    PedirCodVenda          : Boolean;
    MostraDesconto         : Boolean;
    AlteraPreco            : Boolean;
    PedirDataEntrega       : Boolean;
    MostrarBotoesPeso      : Boolean;
    PedirNumPedido         : Boolean;
    PedirDespesa           : Boolean;
    QuantMaxItems          : Word;
    PedirOrdem             : Boolean;
    PedirDataAbertura      : Boolean;
    AlterarSubtotal        : Word;     // 0=Define Quantidade; 1=Define Desconto
    PedirCategoria         : Boolean;
    CategoriaPadrao        : Word;
    PedirFrete             : Boolean;
    IncluirFreteNasContas  : Boolean;
    NumSerieObrigatorio    : Boolean;
    PassaPeloSubtotal      : Boolean;
    PermitirValorZerado    : Boolean;
    IndicarDimensoesItems  : Boolean;
    DescontoMaximo         : Currency;
    DescMaxItem            : Currency;
    TipoDescMaxItem        : Word;        // 0= Def. para Cada Produto; 1= Para todos os produtos
    Imp_SaldoDivida        : Char;
    AliquotaPadrao         : Currency;
    CSTPadrao              : String;
  end;

  TConfigContaCliente = record
    SD_Crediarios           : Boolean;
    SD_Boletos              : Boolean;
    SD_Outros               : Boolean;
    SD_Cheques              : Boolean;
    SD_Cheques_TP           : Char;
    LC_Crediarios           : Boolean;
    LC_Boletos              : Boolean;
    LC_Outros               : Boolean;
    LC_Cheques              : Boolean;
    LC_Cheques_TP           : Char;
    MJ_Crediarios           : Boolean;
    MJ_Boletos              : Boolean;
    MJ_Outros               : Boolean;
    MJ_ChequesDevolv        : Boolean;
    Bloq_Automatico         : Boolean;
    Bloq_LimiteCred         : Boolean;
    Bloq_Atrasados          : Boolean;
    Bloq_DiasAtraso         : Word;
    Bloq_Quem               : Char;
    CH_Acao_CPF_Devolv      : Char;
    CH_Acao_CPF_Bloq        : Char;
    Dias_MultaJuros         : Word;
    Atraso_Multa            : Currency;
    Atraso_JurosAoDia       : Currency;
    CLI_PrazoPagamento      : Currency;
    CLI_LimiteCredito       : Word;
    CLI_Bloq_Automatico     : Boolean;
    CLI_Bloq_Pag_Cheque     : Boolean;
    CLI_Bloq_Pag_Crediario  : Boolean;
    CLI_Tipo_Condicoes      : Word;    // 0 = Individual;  1 = Igual para Todos
  end;

  TConfigDevolucao = record
    DEV_Imprimir           : Char;
    DEV_ReqUsuario         : Boolean;
    DEV_ReqCodCliente      : Boolean;
    DEV_ReqNomeCliente     : Boolean;
    DEV_ReqMotivo          : Boolean;
    DEV_ReqNumFiscal       : Boolean;
    DEV_ReqNumDocumento    : Boolean;
    DEV_SituacaoDevolucao  : Char;
    DEV_DepositoPadrao     : Integer;
    SitDevDesativar0       : Boolean;
    SitDevDesativar1       : Boolean;
    SitDevDesativar2       : Boolean;
  end;

  TConfigPDV = record
    ImpAuto_PED_Crediario  : Boolean;
    ImpAuto_PED_Cheque     : Boolean;
    ImpAuto_PED_Cartao     : Boolean;
    ImpAuto_PED_Ticket     : Boolean;
    ImpAuto_PED_Dinheiro   : Boolean;
    ImpAuto_ECF_Crediario  : Boolean;
    ImpAuto_ECF_Cheque     : Boolean;
    ImpAuto_ECF_Cartao     : Boolean;
    ImpAuto_ECF_Ticket     : Boolean;
    ImpAuto_ECF_Dinheiro   : Boolean;
  end;

  TConfigGeral = record
    AutoDetectaCampoPesquisa : boolean;
    FormatoCodBalanca  : TFormatoCodBalanca;
    PAF : Boolean;
    FormasDePagamento  : TFormasPagamento;
    EmpresaPadrao : Integer;
    PeriodoMediaVenda  : word;
    CaminhoAtualizador : string;
    InventarioLancItem : char;
    TipoPrecoTransferencia : Char;
    AlterarPrecoTransf : boolean;
    TextoConsignacao   : String;
  end;

  TRegPDV = record
    SoaBeep            : Boolean;
    EscondeCursor      : Boolean;
    PodeCadastClientes : Boolean;
    PodeReceberContas  : Boolean;
    AbreCupomCodBarras : Boolean;
    PedirVendedor      : Char;      // I = No Inicio, F = No Final, N = Não Pede
    DefVendedor        : Char;      // V = Vendedor,  F = Frentista
    Grid               : Char;      // 1 = Grid1, 2 = Grid2, 3 = Grid3
    TiposDocumento     : String;    // E = ECF, D = Dav, P = Pre Venda
    BaixarDAVPV        : Boolean;
  end;

  TRegTotalLiquidoXCodvenda = record
    CodVenda : Integer;
    Total : Currency;
  end;

  TRegNFe = Record
    DeuErroGerar    : boolean;
    DeuErroEnviar   : boolean;
    DeuErroImprimir : boolean;
    CDCertificado : Integer;
    DanfeAcao : char;
    DanfeOrdenacao : char;
    AlertaTransporte : boolean;
    indice : word;
    nfeRegEmpresa : TRegEmpresa;
    Ambiente : char;
    FormaEmissao : char;
    WebService : string[2];  // Servidor de qual Estado
  end;

var
  RegCreditos        : TRegCreditos;
  RegProduto         : TRegProduto;
  RegVendedor        : TRegVendedor;
  RegEmpresa         : TRegEmpresa;
  RegFornecedor      : TRegFornecedor;
  RegRepresentante   : TRegRepresentante;
  RegTransf          : TRegTransferencia;
  RegPedAtual        : TRegPedido;
  CodVenda           : TRegCodigoDaVenda;
  ConfigGeral        : TConfigGeral;
  ConfigCadastro     : TConfigCadastro;
  ConfigPedido       : TConfigPedido;
  ConfigContaCliente : TConfigContaCliente;
  ConfigDevolucao    : TConfigDevolucao;
  ConfigPDV          : TConfigPDV;
  RegWeb             : TRegWeb;
  RegConfCarne       : TRegConfCarne;
  RegConfRecibo      : TRegConfRecibo;
  RegTerm            : TRegTerminal;
  AbreCad            : TRegAbreCadastro;
  RegModeloCupom     : TRegModeloCupom;
  RegPromocao        : TRegPromocao;
  RegRelatorio       : TRegRelatorio;
  RegTelaPDV         : TRegTelaPDV;
  InfoPDV            : TRegPDV;
  PodeIncluir        : Boolean;
  ResolucaoAtual     : TResolucoes;
  AtualizouExecutavel: boolean;
  ConfirmaSaida      : Boolean;
  TaIniciandoSistema : Boolean;
  UltimoErro         : String;
  AbortaAplicacao    : boolean;  // Se True, evita executar outra coisa depois do Application.Terminate
  ColEsquerda        : boolean;  // Determina se a impressão de Etiquetas de Código de Barras Começará pela coluna da Esquerda
  VetTotalLiquidoXCodVenda : Array of TRegTotalLiquidoXCodvenda;
  PedidosSelec       : array of integer;
  RegNFe             : TRegNFe;
  Descr_OrcDAV       : string;
  Descr_PedPV        : string;
  Descr_VendaECF     : string;
  VersaoDoFirebird   : String;

// Chaves de Registro
  RegChaveRaiz            : String;
  RegChavePDV             : String;
  RegChaveForms           : String;
  RegChaveConfLocais      : String;
  RegChavePesquisas       : String;
  RegChaveRelatorios      : String;
  RegChaveConfBalanca     : String;
  RegChaveConfLeitor      : String;
  RegChaveConfGaveta      : String;
  RegChaveConfImpCodBarras: String;
  RegChaveConfBoleto      : String;
  RegChaveConfCarne       : String;
  RegChaveConfRecibo      : String;
  RegChaveConfCupom       : String;
  RegChaveConfCaixa       : String;
  RegChaveConfWeb         : String;
  RegChaveConfECF         : String;
  RegChaveConfECFIndPag   : String;
  RegChaveConfNotaFiscal  : String;
  RegChaveConfOutros      : String;
  RegChaveTransf          : String;

// Variáveis de Inicialização
  Modulo     : TModulo;
  INIGrids   : String;
  MainProgressBar : TProgressBar;

  RegChave         : String;
  cfgBancoServidor : String[130];
  cfgBancoLocal    : String[130];

// Registros Selecionados
  rsProdutos     : Array of Integer;
  rsClientes     : Array of Integer;
  rsFornecedores : Array of Integer;
  rsPracas       : Array of Integer;
  rsGrupos       : Array of Integer;
  rsUsuarios     : Array of Integer;
  rsFormasPgto   : Array of Integer;

// Variáveis Gerais
  TentativasEntraCreditos : word;
  EstouNoServidor      : boolean;
  Desbloqueado         : Boolean;
  Confirmado           : Boolean;
  Ano, Mes, Dia, Hora,
  Min, Seg, MSec       : Word;
  LogUsuario           : String;
  TimeOutBalanca       : Integer;
  BancoReestruturado   : Boolean;

  TipoDocumento        : Char;
  CadEstado            : word;
  Chamada              : word;
  ClicouNoBotao        : boolean;
  FezCrediario         : boolean;
  PagamentoEmBoleto    : boolean;
  ItemEsc              : TItemEscolhido;
  SetSoNumeros         : Set of char;
  SetLetras            : Set of char;
  EstouNaTelaDeVendas  : boolean;
  ArqLog               : String;
  TemAlgumaPromocao    : boolean;
  VetPromocoes         : Array of TRegPromocao;
  EstadoDaVenda        : TEstadoDaVenda;
  ComoFechaVenda       : TComoFechaVenda;
  VarSeqDiario         : integer;
  vai                  : boolean;
  UsarConfigPadrao     : boolean;
  TerminalTaRegistrado : Boolean;
  TaSincronizandoAgora : boolean;
  NomeDocumento        : String;  // Nome do Documento Atual (DAV, Orçamento, PreVenda, Pedido, ECF, Venda)

implementation

end.
