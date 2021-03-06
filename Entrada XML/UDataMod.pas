//ok
unit UDataMod;

interface

uses
  SysUtils, Classes, DB, Dialogs, Controls, Forms, DUtilit, variants,
  IB_Access, IB_Components, IB_Session, UComum, UVersao, IBODataset,
  IB_Process, IB_Script, Graphics, DBFunctions, UConstVar, MessageFunctions;

const
  adDadosClientes      = 1;
  adSincronizaPrecos   = 2;
  adCalculaMediaVenda  = 3;

type
  TDtM = class(TDataModule)
    IBNF: TIBOQuery;
    IBNFItems: TIBOQuery;
    TrNF: TIBOTransaction;
    IBNFItemsCD_NOTA: TIntegerField;
    IBNFItemsCD_ITEM: TIntegerField;
    IBNFItemsCOD_PROD_FORNEC: TStringField;
    IBNFItemsCD_PRODUTO: TIntegerField;
    IBNFItemsQUANTIDADE: TIBOFloatField;
    IBNFItemsVALORUNITARIO: TBCDField;
    IBNFItemsIPI: TIBOFloatField;
    IBNFItemsUNDCONVERSAO: TIBOFloatField;
    IBNFItemsMARGEMLUCRO: TIBOFloatField;
    IBNFItemsPRECOVENDA: TBCDField;
    IBNFItemsATUALIZASIMILARES: TStringField;
    IBNFCD_NOTA: TIntegerField;
    IBNFTIPO_NOTA: TStringField;
    IBNFCD_Fornecedor: TIntegerField;
    IBNFCNPJ: TStringField;
    IBNFNM_FORNECEDOR: TStringField;
    IBNFNUM_DOCUMENTO: TIntegerField;
    IBNFDT_EMISSAO: TDateField;
    IBNFDT_ENTRADA: TDateField;
    IBNFOBS: TStringField;
    IBNFICMS_BASE: TBCDField;
    IBNFICMS_VALOR: TBCDField;
    IBNFICMS_BASESUBST: TBCDField;
    IBNFICMS_VALORSUBST: TBCDField;
    IBNFVR_TOTAL_PROD: TBCDField;
    IBNFVALOR_FRETE: TBCDField;
    IBNFVALOR_SEGURO: TBCDField;
    IBNFOUTRAS_DESPESAS: TBCDField;
    IBNFVALOR_IPI: TBCDField;
    IBNFVALOR_TOTAL_NOTA: TBCDField;
    IBNFDESCONTO_TOTAL: TBCDField;
    IBNFNOTA_FECHADA: TStringField;
    IBNFCFOP: TStringField;
    IBNFItemsNM_PRODUTO: TStringField;
    IBNFItemsVALORTOTAL: TIBOFloatField;
    IBNFItemsCUSTO_UNITARIO: TBCDField;
    IBNFItemsCX_COD_BARRA_CAIXA: TStringField;
    IBNFItemsCX_UNDCONVERSAO: TIBOFloatField;
    IBNFItemsCOD_BARRAS: TStringField;
    IBNFItemsSEQUENCIAL: TIntegerField;
    IBNFItemsCD_Grupo: TIntegerField;
    IBLocaliza: TIBOQuery;
    IBNFDT_CADASTRO: TDateTimeField;
    IBNFULTIMAALTERACAO: TDateTimeField;
    IBNFItemsDT_CADASTRO: TDateTimeField;
    IBNFItemsULTIMAALTERACAO: TDateTimeField;
    IBTabela: TIB_Query;
    IBTransacao: TIB_Transaction;
    IBTabela2: TIB_Query;
    IBTransacao2: TIB_Transaction;
    IBTabelaExibicao: TIBOQuery;
    TrTabelaExibicao: TIBOTransaction;
    IBPedidoCompra: TIBOQuery;
    IBPCItems: TIBOQuery;
    TrPedidoCompra: TIBOTransaction;
    IBPedidoCompraNUM_PEDIDO: TIntegerField;
    IBPedidoCompraCD_FORNECEDOR: TIntegerField;
    IBPedidoCompraOBS: TMemoField;
    IBPedidoCompraDT_CADASTRO: TDateTimeField;
    IBPedidoCompraULTIMAALTERACAO: TDateTimeField;
    IBPedidoCompraCNPJ: TStringField;
    IBPedidoCompraNM_FORNECEDOR: TStringField;
    IBPedidoCompraLOGIN: TStringField;
    IBPedidoCompraBAIXADA: TStringField;
    IBPedidoCompraFECHADA: TStringField;
    IBPedidoCompraDT_BAIXA: TDateTimeField;
    IBPedidoCompraDT_FECHAMENTO: TDateTimeField;
    IBPCItemsNUM_PEDIDO: TIntegerField;
    IBPCItemsCD_ITEM: TIntegerField;
    IBPCItemsCD_PRODUTO: TIntegerField;
    IBPCItemsQUANTIDADE: TBCDField;
    IBPCItemsVALOR: TBCDField;
    IBPCItemsUNDCONVERSAO: TBCDField;
    IBPCItemsVALORTOTAL: TIBOFloatField;
    IBPCItemsSEQUENCIAL: TIntegerField;
    IBPCItemsCD_Grupo: TIntegerField;
    IBPCItemsDT_CADASTRO: TDateTimeField;
    IBPCItemsULTIMAALTERACAO: TDateTimeField;
    IBPCItemsVALOR_UNITARIO: TBCDField;
    TrLocaliza: TIB_Transaction;
    IBPCItemsNM_PRODUTO: TStringField;
    IBPCItemsCOD_BARRAS: TStringField;
    IBPCItemsBAIXADO: TStringField;
    IBPedidoCompraNUM_TERMINAL: TSmallintField;
    IBScript: TIB_Script;
    IBNFItemsLOGIN: TStringField;
    IBTransacaoSuperCombo: TIBOTransaction;
    IBNFItemsOBS: TMemoField;
    SPTransacao: TIB_Transaction;
    StoredProcServer: TIBOStoredProc;
    IBTabela3: TIB_Query;
    IBTransacao3: TIB_Transaction;
    IBNFItemsLOCK_PRECOVENDA: TStringField;
    IBNFItemsCUSTOMEDIO: TBCDField;
    IBNFItemsPRECOCUSTO: TBCDField;
    IBNFItemsTIPOCUSTO: TStringField;
    IBPedidoCompraCD_USUARIO: TIntegerField;
    IBNFItemsMARGEM2: TBCDField;
    IBNFItemsMARGEM3: TBCDField;
    IBNFItemsMARGEM4: TBCDField;
    IBNFItemsMARGEM5: TBCDField;
    IBNFItemsPRECO2: TBCDField;
    IBNFItemsPRECO3: TBCDField;
    IBNFItemsPRECO4: TBCDField;
    IBNFItemsPRECO5: TBCDField;
    IBNFItemsICMS: TBCDField;
    IBNFItemsCX_VALORCAIXA: TBCDField;
    IBNFItemsFRETECHEGADA: TBCDField;
    IBNFItemsFRETESAIDA: TBCDField;
    IBDatabaseServer: TIBODatabase;
    IBNFNAT_OPERACAO: TStringField;
    IBNFSERIE: TStringField;
    IBNFMODELO: TStringField;
    IBNFCHAVE_NFE: TStringField;
    IBNFVALOR_II: TBCDField;
    IBNFVALOR_PIS: TBCDField;
    IBNFVALOR_COFINS: TBCDField;
    IBTabela4: TIB_Query;
    IBTransacao4: TIB_Transaction;
    IBNFItemsCLASSFISCAL: TStringField;
    IBNFItemsEXTIPI: TStringField;
    IBNFItemsCFOP: TStringField;
    IBNFItemsUNID_COM: TStringField;
    IBNFItemsCD_EAN_TRIB: TStringField;
    IBNFItemsUN_TRIB: TStringField;
    IBNFItemsQT_TRIB: TBCDField;
    IBNFItemsVAL_UN_TRIB: TBCDField;
    IBNFItemsFRETE_VAL: TBCDField;
    IBNFItemsSEGURO_VAL: TBCDField;
    IBNFItemsDESCONTO_VAL: TBCDField;
    IBNFItemsOUTROS_VAL: TBCDField;
    IBNFItemsINDTOT: TStringField;
    IBNFItemsXPEDIDO: TStringField;
    IBNFItemsNITEMPEDIDO: TIntegerField;
    IBNFItemsINFOADPROD: TMemoField;
    IBNFItemsORIGEM: TStringField;
    IBNFItemsICMS_MODBC: TStringField;
    IBNFItemsPREDBCST: TBCDField;
    IBNFItemsICMS_BC_VAL: TBCDField;
    IBNFItemsICMS_VAL: TBCDField;
    IBNFItemsICMSST_MODBC: TStringField;
    IBNFItemsICMSST_PMVA: TBCDField;
    IBNFItemsICMSST_PRED: TBCDField;
    IBNFItemsICMSST_BC_VAL: TBCDField;
    IBNFItemsICMSST_PORC: TBCDField;
    IBNFItemsICMSSTRET_BC_VAL: TBCDField;
    IBNFItemsICMSSTRET_VAL: TBCDField;
    IBNFItemsICMS_CRED_SN_PORC: TBCDField;
    IBNFItemsICMS_CRED_SN_VAL: TBCDField;
    IBNFItemsIPI_CST: TStringField;
    IBNFItemsIPI_CLENQ: TStringField;
    IBNFItemsIPI_CNPJPROD: TStringField;
    IBNFItemsIPI_CSELO: TStringField;
    IBNFItemsIPI_QSELO: TIntegerField;
    IBNFItemsIPI_CENQ: TStringField;
    IBNFItemsIPI_BC_VAL: TBCDField;
    IBNFItemsIPI_QUNID: TBCDField;
    IBNFItemsIPI_VALUNID: TBCDField;
    IBNFItemsIPI_VAL: TBCDField;
    IBNFItemsII_BC_VAL: TBCDField;
    IBNFItemsII_DESPADU_VAL: TBCDField;
    IBNFItemsII_VAL: TBCDField;
    IBNFItemsII_IOF_VAL: TBCDField;
    IBNFItemsPIS_CST: TStringField;
    IBNFItemsPIS_BC_VAL: TBCDField;
    IBNFItemsPIS_PORC: TBCDField;
    IBNFItemsPIS_VAL: TBCDField;
    IBNFItemsPIS_QUANT_BCPROD: TBCDField;
    IBNFItemsPIS_ALIQPROD_VAL: TBCDField;
    IBNFItemsPISST_BC_VAL: TBCDField;
    IBNFItemsPISST_PORC: TBCDField;
    IBNFItemsPISST_QUANT_BCPROD: TBCDField;
    IBNFItemsPISST_ALIQPROD_VAL: TBCDField;
    IBNFItemsPISST_VAL: TBCDField;
    IBNFItemsCOFINS_CST: TStringField;
    IBNFItemsCOFINS_BC_VAL: TBCDField;
    IBNFItemsCOFINS_PORC: TBCDField;
    IBNFItemsCOFINS_VAL: TBCDField;
    IBNFItemsCOFINS_QUANT_BCPROD: TBCDField;
    IBNFItemsCOFINS_ALIQPROD_VAL: TBCDField;
    IBNFItemsCOFINSST_BC_VAL: TBCDField;
    IBNFItemsCOFINSST_PORC: TBCDField;
    IBNFItemsCOFINSST_QUANT_BCPROD: TBCDField;
    IBNFItemsCOFINSST_ALIQPROD_VAL: TBCDField;
    IBNFItemsCOFINSST_VAL: TBCDField;
    IBNFItemsISSQN_BC_VAL: TBCDField;
    IBNFItemsISSQN_ALIQ_VAL: TBCDField;
    IBNFItemsISSQN_VAL: TBCDField;
    IBNFItemsISSQN_CODMUN: TIntegerField;
    IBNFItemsISSQN_CLISTSERV: TIntegerField;
    IBNFItemsICMS_CST: TStringField;
    IBNFItemsEAN: TStringField;
    IBNFItemsFLAG: TStringField;
    IBNFItemsCONFERIDO: TStringField;
    IBNFItemsNOME_XML: TStringField;
    IBNFItemsNOME_CADASTRADO: TStringField;
    IBNFItemsICMSST_VAL: TBCDField;
    IBNFACRES_DESC_ESPECIAL: TStringField;
    IBNFLotesItems: TIBOQuery;
    IBNFLotesItemsCD_NOTA: TIntegerField;
    IBNFLotesItemsNLOTE: TStringField;
    IBNFLotesItemsQLOTE: TBCDField;
    IBNFLotesItemsDFAB: TDateField;
    IBNFLotesItemsDVAL: TDateField;
    IBNFLotesItemsVPMC: TBCDField;
    IBNFLotesItemsCD_ITEM: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure IBScriptError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure IBDatabaseServerError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
  private
    procedure ConectaBDServer;
    procedure CriaRegApagados;
    procedure LeIni;
  public
    ScriptPodeTerErros : Boolean;
    TaExecutandoAtualizacaoDiaria : Boolean;
    function  QuantidadeNFNumSerie(CDProduto, CDNota: Integer): Integer;
    function  QuantidadeNFGrade(CDProduto, CDNota: Integer): Currency;
    function  AbreForm(afTipoDoForm:TComponentClass; afNomeDoForm:TForm; afEntraNaInclusao:Boolean=false; afEntraNaAlteracao:Integer=CodigoVazio): boolean;
  end;

var
  DtM: TDtM;
  CaminhoBDFocus: string;

implementation

uses Windows, UModUsuarios, IniFiles;

{$R *.dfm}

procedure TDtM.LeIni;
var
  ArqIni: TIniFile;
begin
  if FileExists(DiretorioDoExecutavel + 'Focus.ini') then begin
    ArqIni := TIniFile.Create(DiretorioDoExecutavel + 'Focus.ini');
    try
      with ArqIni do
        CaminhoBDFocus := ReadString('CONFIGURACOES','BancoDeDados','');
    finally
      ArqIni.Free;
    end;
  end
  else
    CaminhoBDFocus := DiretorioDoExecutavel + 'FOCUS.FOC';
end;

procedure TDtM.ConectaBDServer;
begin
  try
    LeIni;
    IBDatabaseServer.Connected := false;
    IBDatabaseServer.DatabaseName := CaminhoBDFocus;

    try
      IBDatabaseServer.Connect;
    except
      on E: exception do begin
        LogDeErros(E.Message);
        Screen.Cursor := crDefault;
        Exit;
      end;
    end;
  finally
  end;
end;

function TDtM.AbreForm(afTipoDoForm:TComponentClass; afNomeDoForm:TForm; afEntraNaInclusao:Boolean=false; afEntraNaAlteracao:Integer=CodigoVazio): boolean;
begin
  if RegCreditos.Bloqueado then Exit;

  AbreCad.EntraNaAlteracao := afEntraNaAlteracao;
  AbreCad.EntraNaInclusao  := afEntraNaInclusao;
  result := false;
  if not DtM.IBDatabaseServer.Connected then
  begin
    MensagemDeErro('N�o h� conex�o com o Banco de Dados!');
    Exit;
  end;

  try
    AbreAviso('Carregando informa��es');
    Screen.Cursor := crHourGlass;
    Application.CreateForm(afTipoDoForm, afNomeDoForm);
    afNomeDoForm.ShowModal;
    afNomeDoForm.Release;
    afNomeDoForm := nil;
    Application.ProcessMessages;
    result := false;
  finally
    Screen.Cursor := crDefault;
    FechaAviso;
  end;
end;

procedure TDtM.DataModuleCreate(Sender: TObject);
begin
  TaExecutandoAtualizacaoDiaria := false;
  Application.CreateForm(TfDB, fDB);
  Application.CreateForm(TCM, CM);
  ConectaBDServer;
end;

procedure TDtM.CriaRegApagados;
begin
  with CM do
  begin
    try
      StoredProcServer.StoredProcName := 'SP_REG_APAGADOS';
      if not StoredProcServer.IB_Transaction.InTransaction then StoredProcServer.IB_Transaction.StartTransaction;
      if not StoredProcServer.Prepared then StoredProcServer.Prepare;
      StoredProcServer.ExecProc;
      StoredProcServer.IB_Transaction.Commit;
    except
    end;
  end;
end;

procedure TDtM.IBScriptError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  RaiseException := not ScriptPodeTerErros;
end;

procedure TDtM.IBDatabaseServerError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  if (ERRCODE = 335544741) or (ERRCODE = 335544375) or (ERRCODE = 335544721) then
  begin
    MessageDlg('A conex�o com o Banco de Dados foi perdida.'+PL+
               'Pressione OK para tentar reestabelecer a conex�o.', mtError, [mbOK], 0);
    IBDatabaseServer.Disconnect;
    IBDatabaseServer.Connect;
  end;
end;

function TDtM.QuantidadeNFGrade(CDProduto, CDNota:Integer):Currency;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTransacao.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTabela.IB_Transaction := EstaTransacao;

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select sum(coalesce(NG.QUANTIDADE, 0)) as TOTAL    ');
    EstaTabela.SQL.Add('from GRADES G                                      ');
    EstaTabela.SQL.Add('  left outer join ENTRADA_GRADE NG on ((NG.CD_GRADE = G.CD_GRADE) and (NG.CD_NOTA = :CD_NOTA)) ');
    EstaTabela.SQL.Add('  where G.CD_PRODUTO = :CD_PRODUTO                 ');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CdProduto;
    EstaTabela.ParamByName('CD_NOTA').AsInteger    := CdNota;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('TOTAL').AsCurrency;
  finally
    fDB.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;
end;

function TDtM.QuantidadeNFNumSerie(CDProduto, CDNota:Integer):Integer;
var
  EstaTabela : TIB_Query;
  EstaTransacao : TIB_Transaction;
begin
  try
    result := 0;
    EstaTabela := TIB_Query.Create(self);
    EstaTransacao := TIB_Transaction.Create(self);
    EstaTabela.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTransacao.IB_Connection := CM.IBTabela.IB_Connection;
    EstaTabela.IB_Transaction := EstaTransacao;

    EstaTabela.Active := false;
    EstaTabela.SQL.Clear;
    EstaTabela.SQL.Add('select count(*) as TOTAL                      ');
    EstaTabela.SQL.Add('from ENTRADA_NUMSERIE                              ');
    EstaTabela.SQL.Add('  where ENTRADA_NUMSERIE.CD_PRODUTO = :CD_PRODUTO  ');
    EstaTabela.SQL.Add('  and   ENTRADA_NUMSERIE.CD_NOTA = :CD_NOTA        ');
    if not EstaTabela.Prepared then EstaTabela.Prepare;
    EstaTabela.ParamByName('CD_PRODUTO').AsInteger := CdProduto;
    EstaTabela.ParamByName('CD_NOTA').AsInteger    := CdNota;
    EstaTabela.Active := true;
    result := EstaTabela.FieldByName('TOTAL').AsInteger;
  finally
    fDB.FechaTT(EstaTabela);
    EstaTabela.Free;
    EstaTransacao.Free;
  end;
end;

end.

