object DtM: TDtM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 537
  Width = 537
  object IBNF: TIBOQuery
    Params = <>
    CommitAction = caRefresh
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    DeleteSQL.Strings = (
      'DELETE FROM ENTRADA'
      'WHERE'
      '   CD_NOTA = :OLD_CD_NOTA')
    EditSQL.Strings = (
      'UPDATE ENTRADA ENTRADA SET'
      '   ENTRADA.CD_NOTA = :CD_NOTA, /*PK*/'
      '   ENTRADA.TIPO_NOTA = :TIPO_NOTA,'
      '   ENTRADA.CD_FORNECEDOR = :CD_FORNECEDOR,'
      '   ENTRADA.CNPJ = :CNPJ,'
      '   ENTRADA.NM_FORNECEDOR = :NM_FORNECEDOR,'
      '   ENTRADA.NUM_DOCUMENTO = :NUM_DOCUMENTO,'
      '   ENTRADA.CFOP = :CFOP,'
      '   ENTRADA.DT_EMISSAO = :DT_EMISSAO,'
      '   ENTRADA.DT_ENTRADA = :DT_ENTRADA,'
      '   ENTRADA.OBS = :OBS,'
      '   ENTRADA.ICMS_BASE = :ICMS_BASE,'
      '   ENTRADA.ICMS_VALOR = :ICMS_VALOR,'
      '   ENTRADA.ICMS_BASESUBST = :ICMS_BASESUBST,'
      '   ENTRADA.ICMS_VALORSUBST = :ICMS_VALORSUBST,'
      '   ENTRADA.VR_TOTAL_PROD = :VR_TOTAL_PROD,'
      '   ENTRADA.VALOR_FRETE = :VALOR_FRETE,'
      '   ENTRADA.VALOR_SEGURO = :VALOR_SEGURO,'
      '   ENTRADA.OUTRAS_DESPESAS = :OUTRAS_DESPESAS,'
      '   ENTRADA.VALOR_IPI = :VALOR_IPI,'
      '   ENTRADA.VALOR_TOTAL_NOTA = :VALOR_TOTAL_NOTA,'
      '   ENTRADA.DESCONTO_TOTAL = :DESCONTO_TOTAL,'
      '   ENTRADA.NOTA_FECHADA = :NOTA_FECHADA,'
      '   ENTRADA.DT_CADASTRO = :DT_CADASTRO,'
      '   ENTRADA.ULTIMAALTERACAO = :ULTIMAALTERACAO,'
      '   ENTRADA.DT_SINC_WEB = :DT_SINC_WEB,'
      '   ENTRADA.DT_EXP_WEB = :DT_EXP_WEB,'
      '   ENTRADA.FRETECHEGADA = :FRETECHEGADA,'
      '   ENTRADA.DELETADO = :DELETADO,'
      '   ENTRADA.NAT_OPERACAO = :NAT_OPERACAO,'
      '   ENTRADA.SERIE = :SERIE,'
      '   ENTRADA.MODELO = :MODELO,'
      '   ENTRADA.CHAVE_NFE = :CHAVE_NFE,'
      '   ENTRADA.VALOR_II = :VALOR_II,'
      '   ENTRADA.VALOR_PIS = :VALOR_PIS,'
      '   ENTRADA.VALOR_COFINS = :VALOR_COFINS'
      'WHERE'
      '   CD_NOTA = :OLD_CD_NOTA')
    GeneratorLinks.Strings = (
      'ENTRADA.CD_NOTA = GEN_ENTRADA')
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrNF
    InsertSQL.Strings = (
      'INSERT INTO ENTRADA('
      '   CD_NOTA, /*PK*/'
      '   TIPO_NOTA,'
      '   CD_FORNECEDOR,'
      '   CNPJ,'
      '   NM_FORNECEDOR,'
      '   NUM_DOCUMENTO,'
      '   CFOP,'
      '   DT_EMISSAO,'
      '   DT_ENTRADA,'
      '   OBS,'
      '   ICMS_BASE,'
      '   ICMS_VALOR,'
      '   ICMS_BASESUBST,'
      '   ICMS_VALORSUBST,'
      '   VR_TOTAL_PROD,'
      '   VALOR_FRETE,'
      '   VALOR_SEGURO,'
      '   OUTRAS_DESPESAS,'
      '   VALOR_IPI,'
      '   VALOR_TOTAL_NOTA,'
      '   DESCONTO_TOTAL,'
      '   NOTA_FECHADA,'
      '   DT_CADASTRO,'
      '   ULTIMAALTERACAO,'
      '   DT_SINC_WEB,'
      '   DT_EXP_WEB,'
      '   FRETECHEGADA,'
      '   DELETADO,'
      '   NAT_OPERACAO,'
      '   SERIE,'
      '   MODELO,'
      '   CHAVE_NFE,'
      '   VALOR_II,'
      '   VALOR_PIS,'
      '   VALOR_COFINS)'
      'VALUES ('
      '   :CD_NOTA,'
      '   :TIPO_NOTA,'
      '   :CD_FORNECEDOR,'
      '   :CNPJ,'
      '   :NM_FORNECEDOR,'
      '   :NUM_DOCUMENTO,'
      '   :CFOP,'
      '   :DT_EMISSAO,'
      '   :DT_ENTRADA,'
      '   :OBS,'
      '   :ICMS_BASE,'
      '   :ICMS_VALOR,'
      '   :ICMS_BASESUBST,'
      '   :ICMS_VALORSUBST,'
      '   :VR_TOTAL_PROD,'
      '   :VALOR_FRETE,'
      '   :VALOR_SEGURO,'
      '   :OUTRAS_DESPESAS,'
      '   :VALOR_IPI,'
      '   :VALOR_TOTAL_NOTA,'
      '   :DESCONTO_TOTAL,'
      '   :NOTA_FECHADA,'
      '   :DT_CADASTRO,'
      '   :ULTIMAALTERACAO,'
      '   :DT_SINC_WEB,'
      '   :DT_EXP_WEB,'
      '   :FRETECHEGADA,'
      '   :DELETADO,'
      '   :NAT_OPERACAO,'
      '   :SERIE,'
      '   :MODELO,'
      '   :CHAVE_NFE,'
      '   :VALOR_II,'
      '   :VALOR_PIS,'
      '   :VALOR_COFINS)')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM ENTRADA'
      'Order By CD_NOTA')
    FieldOptions = []
    Left = 32
    Top = 225
    object IBNFCD_NOTA: TIntegerField
      FieldName = 'CD_NOTA'
    end
    object IBNFTIPO_NOTA: TStringField
      FieldName = 'TIPO_NOTA'
      Size = 1
    end
    object IBNFCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
    end
    object IBNFCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object IBNFNM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Size = 30
    end
    object IBNFNUM_DOCUMENTO: TIntegerField
      Alignment = taCenter
      FieldName = 'NUM_DOCUMENTO'
    end
    object IBNFDT_EMISSAO: TDateField
      FieldName = 'DT_EMISSAO'
    end
    object IBNFDT_ENTRADA: TDateField
      FieldName = 'DT_ENTRADA'
    end
    object IBNFOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
    object IBNFICMS_BASE: TBCDField
      FieldName = 'ICMS_BASE'
      Size = 2
    end
    object IBNFICMS_VALOR: TBCDField
      FieldName = 'ICMS_VALOR'
      Size = 2
    end
    object IBNFICMS_BASESUBST: TBCDField
      FieldName = 'ICMS_BASESUBST'
      Size = 2
    end
    object IBNFICMS_VALORSUBST: TBCDField
      FieldName = 'ICMS_VALORSUBST'
      Size = 2
    end
    object IBNFVR_TOTAL_PROD: TBCDField
      FieldName = 'VR_TOTAL_PROD'
      Size = 2
    end
    object IBNFVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Size = 2
    end
    object IBNFVALOR_SEGURO: TBCDField
      FieldName = 'VALOR_SEGURO'
      Size = 2
    end
    object IBNFOUTRAS_DESPESAS: TBCDField
      FieldName = 'OUTRAS_DESPESAS'
      Size = 2
    end
    object IBNFVALOR_IPI: TBCDField
      FieldName = 'VALOR_IPI'
      Size = 2
    end
    object IBNFVALOR_TOTAL_NOTA: TBCDField
      FieldName = 'VALOR_TOTAL_NOTA'
      Size = 2
    end
    object IBNFDESCONTO_TOTAL: TBCDField
      FieldName = 'DESCONTO_TOTAL'
      Size = 2
    end
    object IBNFNOTA_FECHADA: TStringField
      FieldName = 'NOTA_FECHADA'
      Size = 1
    end
    object IBNFCFOP: TStringField
      FieldName = 'CFOP'
      Size = 5
    end
    object IBNFDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IBNFULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IBNFNAT_OPERACAO: TStringField
      FieldName = 'NAT_OPERACAO'
      Size = 100
    end
    object IBNFSERIE: TStringField
      Alignment = taCenter
      FieldName = 'SERIE'
      Size = 3
    end
    object IBNFMODELO: TStringField
      Alignment = taCenter
      FieldName = 'MODELO'
      Size = 5
    end
    object IBNFCHAVE_NFE: TStringField
      Alignment = taCenter
      FieldName = 'CHAVE_NFE'
      Size = 50
    end
    object IBNFVALOR_II: TBCDField
      FieldName = 'VALOR_II'
      Size = 2
    end
    object IBNFVALOR_PIS: TBCDField
      FieldName = 'VALOR_PIS'
      Size = 2
    end
    object IBNFVALOR_COFINS: TBCDField
      FieldName = 'VALOR_COFINS'
      Size = 2
    end
    object IBNFACRES_DESC_ESPECIAL: TStringField
      FieldName = 'ACRES_DESC_ESPECIAL'
      Size = 1
    end
  end
  object IBNFItems: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'CD_NOTA=REQUIRED'
      'CD_ITEM=REQUIRED')
    CommitAction = caRefresh
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    EditSQL.Strings = (
      'UPDATE ENTRADA_ITEM N SET'
      '   N.CD_NOTA = :CD_NOTA, /*PK*/'
      '   N.CD_ITEM = :CD_ITEM, /*PK*/'
      '   N.COD_PROD_FORNEC = :COD_PROD_FORNEC,'
      '   N.CD_PRODUTO = :CD_PRODUTO,'
      '   N.ICMS_CST = :ICMS_CST,'
      '   N.QUANTIDADE = :QUANTIDADE,'
      '   N.VALORUNITARIO = :VALORUNITARIO,'
      '   N.ICMS_PORC = :ICMS_PORC,'
      '   N.IPI_PORC = :IPI_PORC,'
      '   N.UNDCONVERSAO = :UNDCONVERSAO,'
      '   N.MARGEMLUCRO = :MARGEMLUCRO,'
      '   N.ATUALIZASIMILARES = :ATUALIZASIMILARES,'
      '   N.CUSTO_UNITARIO = :CUSTO_UNITARIO,'
      '   N.PRECOVENDA = :PRECOVENDA,'
      '   N.CX_COD_BARRA_CAIXA = :CX_COD_BARRA_CAIXA,'
      '   N.CX_VALORCAIXA = :CX_VALORCAIXA,'
      '   N.CX_UNDCONVERSAO = :CX_UNDCONVERSAO,'
      '   N.SEQUENCIAL = :SEQUENCIAL,'
      '   N.CD_GRUPO = :CD_GRUPO,'
      '   N.DT_CADASTRO = :DT_CADASTRO,'
      '   N.ULTIMAALTERACAO = :ULTIMAALTERACAO,'
      '   N.LOGIN = :LOGIN,'
      '   N.OBS = :OBS,'
      '   N.LOCK_PRECOVENDA = :LOCK_PRECOVENDA,'
      '   N.CUSTOMEDIO = :CUSTOMEDIO,'
      '   N.PRECOCUSTO = :PRECOCUSTO,'
      '   N.TIPOCUSTO = :TIPOCUSTO,'
      '   N.MARGEM2 = :MARGEM2,'
      '   N.MARGEM3 = :MARGEM3,'
      '   N.MARGEM4 = :MARGEM4,'
      '   N.MARGEM5 = :MARGEM5,'
      '   N.PRECO2 = :PRECO2,'
      '   N.PRECO3 = :PRECO3,'
      '   N.PRECO4 = :PRECO4,'
      '   N.PRECO5 = :PRECO5,'
      '   N.VALORTOTAL = :VALORTOTAL,'
      '   N.FRETECHEGADA = :FRETECHEGADA,'
      '   N.FRETESAIDA = :FRETESAIDA,'
      '   N.DELETADO = :DELETADO,'
      '   N.EAN = :EAN,'
      '   N.NOME_XML = :NOME_XML,'
      '   N.NOME_CADASTRADO = :NOME_CADASTRADO,'
      '   N.CLASSFISCAL = :CLASSFISCAL,'
      '   N.EXTIPI = :EXTIPI,'
      '   N.CFOP = :CFOP,'
      '   N.UNID_COM = :UNID_COM,'
      '   N.CD_EAN_TRIB = :CD_EAN_TRIB,'
      '   N.UN_TRIB = :UN_TRIB,'
      '   N.QT_TRIB = :QT_TRIB,'
      '   N.VAL_UN_TRIB = :VAL_UN_TRIB,'
      '   N.FRETE_VAL = :FRETE_VAL,'
      '   N.SEGURO_VAL = :SEGURO_VAL,'
      '   N.DESCONTO_VAL = :DESCONTO_VAL,'
      '   N.OUTROS_VAL = :OUTROS_VAL,'
      '   N.INDTOT = :INDTOT,'
      '   N.XPEDIDO = :XPEDIDO,'
      '   N.NITEMPEDIDO = :NITEMPEDIDO,'
      '   N.INFOADPROD = :INFOADPROD,'
      '   N.ORIGEM = :ORIGEM,'
      '   N.ICMS_MODBC = :ICMS_MODBC,'
      '   N.PREDBCST = :PREDBCST,'
      '   N.ICMS_BC_VAL = :ICMS_BC_VAL,'
      '   N.ICMS_VAL = :ICMS_VAL,'
      '   N.ICMSST_MODBC = :ICMSST_MODBC,'
      '   N.ICMSST_PMVA = :ICMSST_PMVA,'
      '   N.ICMSST_PRED = :ICMSST_PRED,'
      '   N.ICMSST_BC_VAL = :ICMSST_BC_VAL,'
      '   N.ICMSST_PORC = :ICMSST_PORC,'
      '   N.ICMSSTRET_BC_VAL = :ICMSSTRET_BC_VAL,'
      '   N.ICMSSTRET_VAL = :ICMSSTRET_VAL,'
      '   N.ICMS_CRED_SN_PORC = :ICMS_CRED_SN_PORC,'
      '   N.ICMS_CRED_SN_VAL = :ICMS_CRED_SN_VAL,'
      '   N.IPI_CST = :IPI_CST,'
      '   N.IPI_CLENQ = :IPI_CLENQ,'
      '   N.IPI_CNPJPROD = :IPI_CNPJPROD,'
      '   N.IPI_CSELO = :IPI_CSELO,'
      '   N.IPI_QSELO = :IPI_QSELO,'
      '   N.IPI_CENQ = :IPI_CENQ,'
      '   N.IPI_BC_VAL = :IPI_BC_VAL,'
      '   N.IPI_QUNID = :IPI_QUNID,'
      '   N.IPI_VALUNID = :IPI_VALUNID,'
      '   N.IPI_VAL = :IPI_VAL,'
      '   N.II_BC_VAL = :II_BC_VAL,'
      '   N.II_DESPADU_VAL = :II_DESPADU_VAL,'
      '   N.II_VAL = :II_VAL,'
      '   N.II_IOF_VAL = :II_IOF_VAL,'
      '   N.PIS_CST = :PIS_CST,'
      '   N.PIS_BC_VAL = :PIS_BC_VAL,'
      '   N.PIS_PORC = :PIS_PORC,'
      '   N.PIS_VAL = :PIS_VAL,'
      '   N.PIS_QUANT_BCPROD = :PIS_QUANT_BCPROD,'
      '   N.PIS_ALIQPROD_VAL = :PIS_ALIQPROD_VAL,'
      '   N.PISST_BC_VAL = :PISST_BC_VAL,'
      '   N.PISST_PORC = :PISST_PORC,'
      '   N.PISST_QUANT_BCPROD = :PISST_QUANT_BCPROD,'
      '   N.PISST_ALIQPROD_VAL = :PISST_ALIQPROD_VAL,'
      '   N.PISST_VAL = :PISST_VAL,'
      '   N.COFINS_CST = :COFINS_CST,'
      '   N.COFINS_BC_VAL = :COFINS_BC_VAL,'
      '   N.COFINS_PORC = :COFINS_PORC,'
      '   N.COFINS_VAL = :COFINS_VAL,'
      '   N.COFINS_QUANT_BCPROD = :COFINS_QUANT_BCPROD,'
      '   N.COFINS_ALIQPROD_VAL = :COFINS_ALIQPROD_VAL,'
      '   N.COFINSST_BC_VAL = :COFINSST_BC_VAL,'
      '   N.COFINSST_PORC = :COFINSST_PORC,'
      '   N.COFINSST_QUANT_BCPROD = :COFINSST_QUANT_BCPROD,'
      '   N.COFINSST_ALIQPROD_VAL = :COFINSST_ALIQPROD_VAL,'
      '   N.COFINSST_VAL = :COFINSST_VAL,'
      '   N.ISSQN_BC_VAL = :ISSQN_BC_VAL,'
      '   N.ISSQN_ALIQ_VAL = :ISSQN_ALIQ_VAL,'
      '   N.ISSQN_VAL = :ISSQN_VAL,'
      '   N.ISSQN_CODMUN = :ISSQN_CODMUN,'
      '   N.ISSQN_CLISTSERV = :ISSQN_CLISTSERV,'
      '   N.FLAG = :FLAG,'
      '   N.CONFERIDO = :CONFERIDO,'
      '   N.ICMSST_VAL = :ICMSST_VAL'
      'WHERE'
      '   CD_NOTA = :OLD_CD_NOTA AND'
      '   CD_ITEM = :OLD_CD_ITEM')
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrNF
    InsertSQL.Strings = (
      'INSERT INTO ENTRADA_ITEM('
      '   CD_NOTA, /*PK*/'
      '   CD_ITEM, /*PK*/'
      '   COD_PROD_FORNEC,'
      '   CD_PRODUTO,'
      '   ICMS_CST,'
      '   QUANTIDADE,'
      '   VALORUNITARIO,'
      '   ICMS_PORC,'
      '   IPI_PORC,'
      '   UNDCONVERSAO,'
      '   MARGEMLUCRO,'
      '   ATUALIZASIMILARES,'
      '   CUSTO_UNITARIO,'
      '   PRECOVENDA,'
      '   CX_COD_BARRA_CAIXA,'
      '   CX_VALORCAIXA,'
      '   CX_UNDCONVERSAO,'
      '   SEQUENCIAL,'
      '   CD_GRUPO,'
      '   DT_CADASTRO,'
      '   ULTIMAALTERACAO,'
      '   LOGIN,'
      '   OBS,'
      '   LOCK_PRECOVENDA,'
      '   CUSTOMEDIO,'
      '   PRECOCUSTO,'
      '   TIPOCUSTO,'
      '   MARGEM2,'
      '   MARGEM3,'
      '   MARGEM4,'
      '   MARGEM5,'
      '   PRECO2,'
      '   PRECO3,'
      '   PRECO4,'
      '   PRECO5,'
      '   VALORTOTAL,'
      '   FRETECHEGADA,'
      '   FRETESAIDA,'
      '   DELETADO,'
      '   EAN,'
      '   NOME_XML,'
      '   NOME_CADASTRADO,'
      '   CLASSFISCAL,'
      '   EXTIPI,'
      '   CFOP,'
      '   UNID_COM,'
      '   CD_EAN_TRIB,'
      '   UN_TRIB,'
      '   QT_TRIB,'
      '   VAL_UN_TRIB,'
      '   FRETE_VAL,'
      '   SEGURO_VAL,'
      '   DESCONTO_VAL,'
      '   OUTROS_VAL,'
      '   INDTOT,'
      '   XPEDIDO,'
      '   NITEMPEDIDO,'
      '   INFOADPROD,'
      '   ORIGEM,'
      '   ICMS_MODBC,'
      '   PREDBCST,'
      '   ICMS_BC_VAL,'
      '   ICMS_VAL,'
      '   ICMSST_MODBC,'
      '   ICMSST_PMVA,'
      '   ICMSST_PRED,'
      '   ICMSST_BC_VAL,'
      '   ICMSST_PORC,'
      '   ICMSSTRET_BC_VAL,'
      '   ICMSSTRET_VAL,'
      '   ICMS_CRED_SN_PORC,'
      '   ICMS_CRED_SN_VAL,'
      '   IPI_CST,'
      '   IPI_CLENQ,'
      '   IPI_CNPJPROD,'
      '   IPI_CSELO,'
      '   IPI_QSELO,'
      '   IPI_CENQ,'
      '   IPI_BC_VAL,'
      '   IPI_QUNID,'
      '   IPI_VALUNID,'
      '   IPI_VAL,'
      '   II_BC_VAL,'
      '   II_DESPADU_VAL,'
      '   II_VAL,'
      '   II_IOF_VAL,'
      '   PIS_CST,'
      '   PIS_BC_VAL,'
      '   PIS_PORC,'
      '   PIS_VAL,'
      '   PIS_QUANT_BCPROD,'
      '   PIS_ALIQPROD_VAL,'
      '   PISST_BC_VAL,'
      '   PISST_PORC,'
      '   PISST_QUANT_BCPROD,'
      '   PISST_ALIQPROD_VAL,'
      '   PISST_VAL,'
      '   COFINS_CST,'
      '   COFINS_BC_VAL,'
      '   COFINS_PORC,'
      '   COFINS_VAL,'
      '   COFINS_QUANT_BCPROD,'
      '   COFINS_ALIQPROD_VAL,'
      '   COFINSST_BC_VAL,'
      '   COFINSST_PORC,'
      '   COFINSST_QUANT_BCPROD,'
      '   COFINSST_ALIQPROD_VAL,'
      '   COFINSST_VAL,'
      '   ISSQN_BC_VAL,'
      '   ISSQN_ALIQ_VAL,'
      '   ISSQN_VAL,'
      '   ISSQN_CODMUN,'
      '   ISSQN_CLISTSERV,'
      '   FLAG,'
      '   CONFERIDO,'
      '   ICMSST_VAL)'
      'VALUES ('
      '   :CD_NOTA,'
      '   :CD_ITEM,'
      '   :COD_PROD_FORNEC,'
      '   :CD_PRODUTO,'
      '   :ICMS_CST,'
      '   :QUANTIDADE,'
      '   :VALORUNITARIO,'
      '   :ICMS_PORC,'
      '   :IPI_PORC,'
      '   :UNDCONVERSAO,'
      '   :MARGEMLUCRO,'
      '   :ATUALIZASIMILARES,'
      '   :CUSTO_UNITARIO,'
      '   :PRECOVENDA,'
      '   :CX_COD_BARRA_CAIXA,'
      '   :CX_VALORCAIXA,'
      '   :CX_UNDCONVERSAO,'
      '   :SEQUENCIAL,'
      '   :CD_GRUPO,'
      '   :DT_CADASTRO,'
      '   :ULTIMAALTERACAO,'
      '   :LOGIN,'
      '   :OBS,'
      '   :LOCK_PRECOVENDA,'
      '   :CUSTOMEDIO,'
      '   :PRECOCUSTO,'
      '   :TIPOCUSTO,'
      '   :MARGEM2,'
      '   :MARGEM3,'
      '   :MARGEM4,'
      '   :MARGEM5,'
      '   :PRECO2,'
      '   :PRECO3,'
      '   :PRECO4,'
      '   :PRECO5,'
      '   :VALORTOTAL,'
      '   :FRETECHEGADA,'
      '   :FRETESAIDA,'
      '   :DELETADO,'
      '   :EAN,'
      '   :NOME_XML,'
      '   :NOME_CADASTRADO,'
      '   :CLASSFISCAL,'
      '   :EXTIPI,'
      '   :CFOP,'
      '   :UNID_COM,'
      '   :CD_EAN_TRIB,'
      '   :UN_TRIB,'
      '   :QT_TRIB,'
      '   :VAL_UN_TRIB,'
      '   :FRETE_VAL,'
      '   :SEGURO_VAL,'
      '   :DESCONTO_VAL,'
      '   :OUTROS_VAL,'
      '   :INDTOT,'
      '   :XPEDIDO,'
      '   :NITEMPEDIDO,'
      '   :INFOADPROD,'
      '   :ORIGEM,'
      '   :ICMS_MODBC,'
      '   :PREDBCST,'
      '   :ICMS_BC_VAL,'
      '   :ICMS_VAL,'
      '   :ICMSST_MODBC,'
      '   :ICMSST_PMVA,'
      '   :ICMSST_PRED,'
      '   :ICMSST_BC_VAL,'
      '   :ICMSST_PORC,'
      '   :ICMSSTRET_BC_VAL,'
      '   :ICMSSTRET_VAL,'
      '   :ICMS_CRED_SN_PORC,'
      '   :ICMS_CRED_SN_VAL,'
      '   :IPI_CST,'
      '   :IPI_CLENQ,'
      '   :IPI_CNPJPROD,'
      '   :IPI_CSELO,'
      '   :IPI_QSELO,'
      '   :IPI_CENQ,'
      '   :IPI_BC_VAL,'
      '   :IPI_QUNID,'
      '   :IPI_VALUNID,'
      '   :IPI_VAL,'
      '   :II_BC_VAL,'
      '   :II_DESPADU_VAL,'
      '   :II_VAL,'
      '   :II_IOF_VAL,'
      '   :PIS_CST,'
      '   :PIS_BC_VAL,'
      '   :PIS_PORC,'
      '   :PIS_VAL,'
      '   :PIS_QUANT_BCPROD,'
      '   :PIS_ALIQPROD_VAL,'
      '   :PISST_BC_VAL,'
      '   :PISST_PORC,'
      '   :PISST_QUANT_BCPROD,'
      '   :PISST_ALIQPROD_VAL,'
      '   :PISST_VAL,'
      '   :COFINS_CST,'
      '   :COFINS_BC_VAL,'
      '   :COFINS_PORC,'
      '   :COFINS_VAL,'
      '   :COFINS_QUANT_BCPROD,'
      '   :COFINS_ALIQPROD_VAL,'
      '   :COFINSST_BC_VAL,'
      '   :COFINSST_PORC,'
      '   :COFINSST_QUANT_BCPROD,'
      '   :COFINSST_ALIQPROD_VAL,'
      '   :COFINSST_VAL,'
      '   :ISSQN_BC_VAL,'
      '   :ISSQN_ALIQ_VAL,'
      '   :ISSQN_VAL,'
      '   :ISSQN_CODMUN,'
      '   :ISSQN_CLISTSERV,'
      '   :FLAG,'
      '   :CONFERIDO,'
      '   :ICMSST_VAL)')
    KeyLinks.Strings = (
      'ENTRADA_ITEM.CD_NOTA'
      'ENTRADA_ITEM.CD_ITEM')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT N.*, P.NM_PRODUTO, P.COD_BARRAS from ENTRADA_ITEM N'
      'left outer join PRODUTOS P'
      'on N.cd_produto = P.CD_PRODUTO')
    FieldOptions = []
    Left = 32
    Top = 272
    object IBNFItemsCD_NOTA: TIntegerField
      DisplayWidth = 10
      FieldName = 'CD_NOTA'
      Origin = 'NF_ITEMS.CD_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBNFItemsCD_ITEM: TIntegerField
      DisplayWidth = 10
      FieldName = 'CD_ITEM'
      Origin = 'NF_ITEMS.CD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBNFItemsCOD_PROD_FORNEC: TStringField
      DisplayWidth = 13
      FieldName = 'COD_PROD_FORNEC'
      Origin = 'NF_ITEMS.COD_PROD_FORNEC'
      Size = 13
    end
    object IBNFItemsCD_PRODUTO: TIntegerField
      DisplayWidth = 10
      FieldName = 'CD_PRODUTO'
      Origin = 'NF_ITEMS.CD_PRODUTO'
    end
    object IBNFItemsQUANTIDADE: TIBOFloatField
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      Origin = 'NF_ITEMS.QUANTIDADE'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
    end
    object IBNFItemsVALORUNITARIO: TBCDField
      DisplayWidth = 10
      FieldName = 'VALORUNITARIO'
      Origin = 'NF_ITEMS.VALORUNITARIO'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsIPI: TIBOFloatField
      DisplayWidth = 10
      FieldName = 'IPI_PORC'
      Origin = 'NF_ITEMS.IPI'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBNFItemsUNDCONVERSAO: TIBOFloatField
      DisplayWidth = 10
      FieldName = 'UNDCONVERSAO'
      Origin = 'NF_ITEMS.UNDCONVERSAO'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
    end
    object IBNFItemsMARGEMLUCRO: TIBOFloatField
      DisplayWidth = 10
      FieldName = 'MARGEMLUCRO'
      Origin = 'NF_ITEMS.MARGEMLUCRO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object IBNFItemsPRECOVENDA: TBCDField
      DisplayWidth = 10
      FieldName = 'PRECOVENDA'
      Origin = 'NF_ITEMS.PRECOVENDA'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsATUALIZASIMILARES: TStringField
      DisplayWidth = 1
      FieldName = 'ATUALIZASIMILARES'
      Origin = 'NF_ITEMS.ATUALIZASIMILARES'
      Size = 1
    end
    object IBNFItemsNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'PRODUTOS.NM_PRODUTO'
      Size = 45
    end
    object IBNFItemsVALORTOTAL: TIBOFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'NF_ITEMS.VALORTOTAL'
      ReadOnly = True
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
    end
    object IBNFItemsCUSTO_UNITARIO: TBCDField
      FieldName = 'CUSTO_UNITARIO'
      Origin = 'NF_ITEMS.CUSTO_UNITARIO'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCX_COD_BARRA_CAIXA: TStringField
      FieldName = 'CX_COD_BARRA_CAIXA'
      Origin = 'NF_ITEMS.CX_COD_BARRA_CAIXA'
      Size = 13
    end
    object IBNFItemsCX_UNDCONVERSAO: TIBOFloatField
      FieldName = 'CX_UNDCONVERSAO'
      Origin = 'NF_ITEMS.CX_UNDCONVERSAO'
    end
    object IBNFItemsCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Origin = 'PRODUTOS.COD_BARRAS'
      Size = 13
    end
    object IBNFItemsSEQUENCIAL: TIntegerField
      Alignment = taCenter
      FieldName = 'SEQUENCIAL'
      Origin = 'NF_ITEMS.SEQUENCIAL'
    end
    object IBNFItemsCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'NF_ITEMS.CD_GRUPO'
    end
    object IBNFItemsDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'NF_ITEMS.DT_CADASTRO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IBNFItemsULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
      Origin = 'NF_ITEMS.ULTIMAALTERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IBNFItemsLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'NF_ITEMS.LOGIN'
      Size = 10
    end
    object IBNFItemsOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'NF_ITEMS.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object IBNFItemsLOCK_PRECOVENDA: TStringField
      FieldName = 'LOCK_PRECOVENDA'
      Origin = 'NF_ITEMS.LOCK_PRECOVENDA'
      Size = 1
    end
    object IBNFItemsCUSTOMEDIO: TBCDField
      FieldName = 'CUSTOMEDIO'
      Origin = 'NF_ITEMS.CUSTOMEDIO'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPRECOCUSTO: TBCDField
      FieldName = 'PRECOCUSTO'
      Origin = 'NF_ITEMS.PRECOCUSTO'
      Precision = 18
      Size = 3
    end
    object IBNFItemsTIPOCUSTO: TStringField
      FieldName = 'TIPOCUSTO'
      Origin = 'NF_ITEMS.TIPOCUSTO'
      Size = 1
    end
    object IBNFItemsMARGEM2: TBCDField
      FieldName = 'MARGEM2'
      Origin = 'NF_ITEMS.MARGEM2'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsMARGEM3: TBCDField
      FieldName = 'MARGEM3'
      Origin = 'NF_ITEMS.MARGEM3'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsMARGEM4: TBCDField
      FieldName = 'MARGEM4'
      Origin = 'NF_ITEMS.MARGEM4'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsMARGEM5: TBCDField
      FieldName = 'MARGEM5'
      Origin = 'NF_ITEMS.MARGEM5'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPRECO2: TBCDField
      FieldName = 'PRECO2'
      Origin = 'NF_ITEMS.PRECO2'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPRECO3: TBCDField
      FieldName = 'PRECO3'
      Origin = 'NF_ITEMS.PRECO3'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPRECO4: TBCDField
      FieldName = 'PRECO4'
      Origin = 'NF_ITEMS.PRECO4'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPRECO5: TBCDField
      FieldName = 'PRECO5'
      Origin = 'NF_ITEMS.PRECO5'
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMS: TBCDField
      FieldName = 'ICMS_PORC'
      Origin = 'ENTRADA_ITEM.ICMS_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCX_VALORCAIXA: TBCDField
      FieldName = 'CX_VALORCAIXA'
      Origin = 'ENTRADA_ITEM.CX_VALORCAIXA'
      Precision = 18
      Size = 3
    end
    object IBNFItemsFRETECHEGADA: TBCDField
      FieldName = 'FRETECHEGADA'
      Origin = 'ENTRADA_ITEM.FRETECHEGADA'
      Precision = 18
      Size = 2
    end
    object IBNFItemsFRETESAIDA: TBCDField
      FieldName = 'FRETESAIDA'
      Origin = 'ENTRADA_ITEM.FRETESAIDA'
      Precision = 18
      Size = 2
    end
    object IBNFItemsCLASSFISCAL: TStringField
      FieldName = 'CLASSFISCAL'
      Origin = 'ENTRADA_ITEM.CLASSFISCAL'
      Size = 12
    end
    object IBNFItemsEXTIPI: TStringField
      FieldName = 'EXTIPI'
      Origin = 'ENTRADA_ITEM.EXTIPI'
      Size = 12
    end
    object IBNFItemsCFOP: TStringField
      FieldName = 'CFOP'
      Origin = 'ENTRADA_ITEM.CFOP'
      Size = 6
    end
    object IBNFItemsUNID_COM: TStringField
      FieldName = 'UNID_COM'
      Origin = 'ENTRADA_ITEM.UNID_COM'
      Size = 2
    end
    object IBNFItemsCD_EAN_TRIB: TStringField
      FieldName = 'CD_EAN_TRIB'
      Origin = 'ENTRADA_ITEM.CD_EAN_TRIB'
      Size = 13
    end
    object IBNFItemsUN_TRIB: TStringField
      FieldName = 'UN_TRIB'
      Origin = 'ENTRADA_ITEM.UN_TRIB'
      Size = 2
    end
    object IBNFItemsQT_TRIB: TBCDField
      FieldName = 'QT_TRIB'
      Origin = 'ENTRADA_ITEM.QT_TRIB'
      Precision = 18
      Size = 3
    end
    object IBNFItemsVAL_UN_TRIB: TBCDField
      FieldName = 'VAL_UN_TRIB'
      Origin = 'ENTRADA_ITEM.VAL_UN_TRIB'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsFRETE_VAL: TBCDField
      FieldName = 'FRETE_VAL'
      Origin = 'ENTRADA_ITEM.FRETE_VAL'
      DisplayFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsSEGURO_VAL: TBCDField
      FieldName = 'SEGURO_VAL'
      Origin = 'ENTRADA_ITEM.SEGURO_VAL'
      DisplayFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsDESCONTO_VAL: TBCDField
      FieldName = 'DESCONTO_VAL'
      Origin = 'ENTRADA_ITEM.DESCONTO_VAL'
      DisplayFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsOUTROS_VAL: TBCDField
      FieldName = 'OUTROS_VAL'
      Origin = 'ENTRADA_ITEM.OUTROS_VAL'
      DisplayFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsINDTOT: TStringField
      FieldName = 'INDTOT'
      Origin = 'ENTRADA_ITEM.INDTOT'
      Size = 1
    end
    object IBNFItemsXPEDIDO: TStringField
      FieldName = 'XPEDIDO'
      Origin = 'ENTRADA_ITEM.XPEDIDO'
      Size = 50
    end
    object IBNFItemsNITEMPEDIDO: TIntegerField
      FieldName = 'NITEMPEDIDO'
      Origin = 'ENTRADA_ITEM.NITEMPEDIDO'
    end
    object IBNFItemsINFOADPROD: TMemoField
      FieldName = 'INFOADPROD'
      Origin = 'ENTRADA_ITEM.INFOADPROD'
      BlobType = ftMemo
      Size = 400
    end
    object IBNFItemsORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ENTRADA_ITEM.ORIGEM'
      Size = 1
    end
    object IBNFItemsICMS_MODBC: TStringField
      FieldName = 'ICMS_MODBC'
      Origin = 'ENTRADA_ITEM.ICMS_MODBC'
      Size = 1
    end
    object IBNFItemsPREDBCST: TBCDField
      FieldName = 'PREDBCST'
      Origin = 'ENTRADA_ITEM.PREDBCST'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMS_BC_VAL: TBCDField
      FieldName = 'ICMS_BC_VAL'
      Origin = 'ENTRADA_ITEM.ICMS_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMS_VAL: TBCDField
      FieldName = 'ICMS_VAL'
      Origin = 'ENTRADA_ITEM.ICMS_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSST_MODBC: TStringField
      FieldName = 'ICMSST_MODBC'
      Origin = 'ENTRADA_ITEM.ICMSST_MODBC'
      Size = 1
    end
    object IBNFItemsICMSST_PMVA: TBCDField
      FieldName = 'ICMSST_PMVA'
      Origin = 'ENTRADA_ITEM.ICMSST_PMVA'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSST_PRED: TBCDField
      FieldName = 'ICMSST_PRED'
      Origin = 'ENTRADA_ITEM.ICMSST_PRED'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSST_BC_VAL: TBCDField
      FieldName = 'ICMSST_BC_VAL'
      Origin = 'ENTRADA_ITEM.ICMSST_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSST_PORC: TBCDField
      FieldName = 'ICMSST_PORC'
      Origin = 'ENTRADA_ITEM.ICMSST_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSSTRET_BC_VAL: TBCDField
      FieldName = 'ICMSSTRET_BC_VAL'
      Origin = 'ENTRADA_ITEM.ICMSSTRET_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMSSTRET_VAL: TBCDField
      FieldName = 'ICMSSTRET_VAL'
      Origin = 'ENTRADA_ITEM.ICMSSTRET_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMS_CRED_SN_PORC: TBCDField
      FieldName = 'ICMS_CRED_SN_PORC'
      Origin = 'ENTRADA_ITEM.ICMS_CRED_SN_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsICMS_CRED_SN_VAL: TBCDField
      FieldName = 'ICMS_CRED_SN_VAL'
      Origin = 'ENTRADA_ITEM.ICMS_CRED_SN_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsIPI_CST: TStringField
      FieldName = 'IPI_CST'
      Origin = 'ENTRADA_ITEM.IPI_CST'
      Size = 3
    end
    object IBNFItemsIPI_CLENQ: TStringField
      FieldName = 'IPI_CLENQ'
      Origin = 'ENTRADA_ITEM.IPI_CLENQ'
      Size = 5
    end
    object IBNFItemsIPI_CNPJPROD: TStringField
      FieldName = 'IPI_CNPJPROD'
      Origin = 'ENTRADA_ITEM.IPI_CNPJPROD'
      Size = 15
    end
    object IBNFItemsIPI_CSELO: TStringField
      FieldName = 'IPI_CSELO'
      Origin = 'ENTRADA_ITEM.IPI_CSELO'
      Size = 60
    end
    object IBNFItemsIPI_QSELO: TIntegerField
      FieldName = 'IPI_QSELO'
      Origin = 'ENTRADA_ITEM.IPI_QSELO'
      EditFormat = ',0.000'
    end
    object IBNFItemsIPI_CENQ: TStringField
      FieldName = 'IPI_CENQ'
      Origin = 'ENTRADA_ITEM.IPI_CENQ'
      Size = 3
    end
    object IBNFItemsIPI_BC_VAL: TBCDField
      FieldName = 'IPI_BC_VAL'
      Origin = 'ENTRADA_ITEM.IPI_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsIPI_QUNID: TBCDField
      FieldName = 'IPI_QUNID'
      Origin = 'ENTRADA_ITEM.IPI_QUNID'
      Precision = 18
      Size = 3
    end
    object IBNFItemsIPI_VALUNID: TBCDField
      FieldName = 'IPI_VALUNID'
      Origin = 'ENTRADA_ITEM.IPI_VALUNID'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsIPI_VAL: TBCDField
      FieldName = 'IPI_VAL'
      Origin = 'ENTRADA_ITEM.IPI_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsII_BC_VAL: TBCDField
      FieldName = 'II_BC_VAL'
      Origin = 'ENTRADA_ITEM.II_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsII_DESPADU_VAL: TBCDField
      FieldName = 'II_DESPADU_VAL'
      Origin = 'ENTRADA_ITEM.II_DESPADU_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsII_VAL: TBCDField
      FieldName = 'II_VAL'
      Origin = 'ENTRADA_ITEM.II_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsII_IOF_VAL: TBCDField
      FieldName = 'II_IOF_VAL'
      Origin = 'ENTRADA_ITEM.II_IOF_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPIS_CST: TStringField
      FieldName = 'PIS_CST'
      Origin = 'ENTRADA_ITEM.PIS_CST'
      Size = 3
    end
    object IBNFItemsPIS_BC_VAL: TBCDField
      FieldName = 'PIS_BC_VAL'
      Origin = 'ENTRADA_ITEM.PIS_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPIS_PORC: TBCDField
      FieldName = 'PIS_PORC'
      Origin = 'ENTRADA_ITEM.PIS_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPIS_VAL: TBCDField
      FieldName = 'PIS_VAL'
      Origin = 'ENTRADA_ITEM.PIS_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPIS_QUANT_BCPROD: TBCDField
      FieldName = 'PIS_QUANT_BCPROD'
      Origin = 'ENTRADA_ITEM.PIS_QUANT_BCPROD'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPIS_ALIQPROD_VAL: TBCDField
      FieldName = 'PIS_ALIQPROD_VAL'
      Origin = 'ENTRADA_ITEM.PIS_ALIQPROD_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPISST_BC_VAL: TBCDField
      FieldName = 'PISST_BC_VAL'
      Origin = 'ENTRADA_ITEM.PISST_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPISST_PORC: TBCDField
      FieldName = 'PISST_PORC'
      Origin = 'ENTRADA_ITEM.PISST_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPISST_QUANT_BCPROD: TBCDField
      FieldName = 'PISST_QUANT_BCPROD'
      Origin = 'ENTRADA_ITEM.PISST_QUANT_BCPROD'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPISST_ALIQPROD_VAL: TBCDField
      FieldName = 'PISST_ALIQPROD_VAL'
      Origin = 'ENTRADA_ITEM.PISST_ALIQPROD_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsPISST_VAL: TBCDField
      FieldName = 'PISST_VAL'
      Origin = 'ENTRADA_ITEM.PISST_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINS_CST: TStringField
      FieldName = 'COFINS_CST'
      Origin = 'ENTRADA_ITEM.COFINS_CST'
      Size = 3
    end
    object IBNFItemsCOFINS_BC_VAL: TBCDField
      FieldName = 'COFINS_BC_VAL'
      Origin = 'ENTRADA_ITEM.COFINS_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINS_PORC: TBCDField
      FieldName = 'COFINS_PORC'
      Origin = 'ENTRADA_ITEM.COFINS_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINS_VAL: TBCDField
      FieldName = 'COFINS_VAL'
      Origin = 'ENTRADA_ITEM.COFINS_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINS_QUANT_BCPROD: TBCDField
      FieldName = 'COFINS_QUANT_BCPROD'
      Origin = 'ENTRADA_ITEM.COFINS_QUANT_BCPROD'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINS_ALIQPROD_VAL: TBCDField
      FieldName = 'COFINS_ALIQPROD_VAL'
      Origin = 'ENTRADA_ITEM.COFINS_ALIQPROD_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINSST_BC_VAL: TBCDField
      FieldName = 'COFINSST_BC_VAL'
      Origin = 'ENTRADA_ITEM.COFINSST_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINSST_PORC: TBCDField
      FieldName = 'COFINSST_PORC'
      Origin = 'ENTRADA_ITEM.COFINSST_PORC'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINSST_QUANT_BCPROD: TBCDField
      FieldName = 'COFINSST_QUANT_BCPROD'
      Origin = 'ENTRADA_ITEM.COFINSST_QUANT_BCPROD'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINSST_ALIQPROD_VAL: TBCDField
      FieldName = 'COFINSST_ALIQPROD_VAL'
      Origin = 'ENTRADA_ITEM.COFINSST_ALIQPROD_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsCOFINSST_VAL: TBCDField
      FieldName = 'COFINSST_VAL'
      Origin = 'ENTRADA_ITEM.COFINSST_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsISSQN_BC_VAL: TBCDField
      FieldName = 'ISSQN_BC_VAL'
      Origin = 'ENTRADA_ITEM.ISSQN_BC_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsISSQN_ALIQ_VAL: TBCDField
      FieldName = 'ISSQN_ALIQ_VAL'
      Origin = 'ENTRADA_ITEM.ISSQN_ALIQ_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsISSQN_VAL: TBCDField
      FieldName = 'ISSQN_VAL'
      Origin = 'ENTRADA_ITEM.ISSQN_VAL'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
    object IBNFItemsISSQN_CODMUN: TIntegerField
      FieldName = 'ISSQN_CODMUN'
      Origin = 'ENTRADA_ITEM.ISSQN_CODMUN'
    end
    object IBNFItemsISSQN_CLISTSERV: TIntegerField
      FieldName = 'ISSQN_CLISTSERV'
      Origin = 'ENTRADA_ITEM.ISSQN_CLISTSERV'
    end
    object IBNFItemsICMS_CST: TStringField
      FieldName = 'ICMS_CST'
      Size = 3
    end
    object IBNFItemsEAN: TStringField
      FieldName = 'EAN'
      Size = 13
    end
    object IBNFItemsFLAG: TStringField
      FieldName = 'FLAG'
      Size = 1
    end
    object IBNFItemsCONFERIDO: TStringField
      FieldName = 'CONFERIDO'
      Size = 1
    end
    object IBNFItemsNOME_XML: TStringField
      FieldName = 'NOME_XML'
      Size = 200
    end
    object IBNFItemsNOME_CADASTRADO: TStringField
      FieldName = 'NOME_CADASTRADO'
      Size = 200
    end
    object IBNFItemsICMSST_VAL: TBCDField
      FieldName = 'ICMSST_VAL'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
      Precision = 18
      Size = 3
    end
  end
  object TrNF: TIBOTransaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 72
    Top = 248
  end
  object IBLocaliza: TIBOQuery
    Params = <>
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrLocaliza
    RecordCountAccurate = True
    FieldOptions = []
    Left = 368
    Top = 312
  end
  object IBTabela: TIB_Query
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = IBTransacao
    CallbackInc = -1
    CallbackInitInt = 0
    CallbackRefreshInt = 0
    PreparedInserts = False
    CommitAction = caInvalidateCursor
    Left = 376
    Top = 64
  end
  object IBTransacao: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 440
    Top = 64
  end
  object IBTabela2: TIB_Query
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = IBTransacao2
    CallbackInc = -1
    CallbackInitInt = 0
    CallbackRefreshInt = 0
    PreparedInserts = False
    CommitAction = caInvalidateCursor
    Left = 376
    Top = 120
  end
  object IBTransacao2: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 440
    Top = 120
  end
  object IBTabelaExibicao: TIBOQuery
    Params = <>
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrTabelaExibicao
    RecordCountAccurate = True
    SQL.Strings = (
      'Select C.CD_CLIENTE "C'#243'digo",'
      '       C.NM_CLIENTE "Cliente",'
      '       R.DT_ULTIMACOMPRA "'#218'ltima Compra"'
      
        'from CLIENTES C left outer join REFCLIENTES R on (C.CD_CLIENTE =' +
        ' R.CD_CLIENTE)')
    FieldOptions = []
    Left = 368
    Top = 364
  end
  object TrTabelaExibicao: TIBOTransaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 432
    Top = 364
  end
  object IBPedidoCompra: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'NUM_PEDIDO=REQUIRED')
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    DeleteSQL.Strings = (
      'DELETE FROM PEDIDOSDECOMPRA'
      'WHERE'
      '   NUM_PEDIDO = :OLD_NUM_PEDIDO')
    EditSQL.Strings = (
      'UPDATE PEDIDOSDECOMPRA SET'
      '   NUM_PEDIDO = :NUM_PEDIDO, /*PK*/'
      '   CD_FORNECEDOR = :CD_FORNECEDOR,'
      '   OBS = :OBS,'
      '   CNPJ = :CNPJ,'
      '   NM_FORNECEDOR = :NM_FORNECEDOR,'
      '   CD_USUARIO = :CD_USUARIO,'
      '   LOGIN = :LOGIN,'
      '   BAIXADA = :BAIXADA,'
      '   FECHADA = :FECHADA,'
      '   DT_BAIXA = :DT_BAIXA,'
      '   DT_FECHAMENTO = :DT_FECHAMENTO,'
      '   DT_CADASTRO = :DT_CADASTRO,'
      '   ULTIMAALTERACAO = :ULTIMAALTERACAO,'
      '   NUM_TERMINAL = :NUM_TERMINAL'
      'WHERE'
      '   NUM_PEDIDO = :OLD_NUM_PEDIDO')
    GeneratorLinks.Strings = (
      'PEDIDOSDECOMPRA.NUM_PEDIDO=GEN_PEDIDOSDECOMPRA')
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrPedidoCompra
    InsertSQL.Strings = (
      'INSERT INTO PEDIDOSDECOMPRA('
      '   NUM_PEDIDO, /*PK*/'
      '   CD_FORNECEDOR,'
      '   OBS,'
      '   CNPJ,'
      '   NM_FORNECEDOR,'
      '   CD_USUARIO,'
      '   LOGIN,'
      '   BAIXADA,'
      '   FECHADA,'
      '   DT_BAIXA,'
      '   DT_FECHAMENTO,'
      '   DT_CADASTRO,'
      '   ULTIMAALTERACAO,'
      '   NUM_TERMINAL)'
      'VALUES ('
      '   :NUM_PEDIDO,'
      '   :CD_FORNECEDOR,'
      '   :OBS,'
      '   :CNPJ,'
      '   :NM_FORNECEDOR,'
      '   :CD_USUARIO,'
      '   :LOGIN,'
      '   :BAIXADA,'
      '   :FECHADA,'
      '   :DT_BAIXA,'
      '   :DT_FECHAMENTO,'
      '   :DT_CADASTRO,'
      '   :ULTIMAALTERACAO,'
      '   :NUM_TERMINAL)')
    KeyLinks.Strings = (
      'PEDIDOSDECOMPRA.NUM_PEDIDO')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'FROM PEDIDOSDECOMPRA'
      'where BAIXADA = '#39'F'#39
      'Order By NUM_PEDIDO'
      '')
    FieldOptions = []
    Left = 32
    Top = 105
    object IBPedidoCompraNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Origin = 'PEDIDOSDECOMPRA.NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000000'
    end
    object IBPedidoCompraCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'PEDIDOSDECOMPRA.CD_FORNECEDOR'
    end
    object IBPedidoCompraOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'PEDIDOSDECOMPRA.OBS'
      BlobType = ftMemo
      Size = 8
    end
    object IBPedidoCompraDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'PEDIDOSDECOMPRA.DT_CADASTRO'
    end
    object IBPedidoCompraULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
      Origin = 'PEDIDOSDECOMPRA.ULTIMAALTERACAO'
    end
    object IBPedidoCompraCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'PEDIDOSDECOMPRA.CNPJ'
      Size = 18
    end
    object IBPedidoCompraNM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Origin = 'PEDIDOSDECOMPRA.NM_FORNECEDOR'
      Size = 30
    end
    object IBPedidoCompraLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'PEDIDOSDECOMPRA.LOGIN'
      Size = 10
    end
    object IBPedidoCompraBAIXADA: TStringField
      FieldName = 'BAIXADA'
      Origin = 'PEDIDOSDECOMPRA.BAIXADA'
      Size = 1
    end
    object IBPedidoCompraFECHADA: TStringField
      FieldName = 'FECHADA'
      Origin = 'PEDIDOSDECOMPRA.FECHADA'
      Size = 1
    end
    object IBPedidoCompraDT_BAIXA: TDateTimeField
      FieldName = 'DT_BAIXA'
      Origin = 'PEDIDOSDECOMPRA.DT_BAIXA'
    end
    object IBPedidoCompraDT_FECHAMENTO: TDateTimeField
      FieldName = 'DT_FECHAMENTO'
      Origin = 'PEDIDOSDECOMPRA.DT_FECHAMENTO'
    end
    object IBPedidoCompraNUM_TERMINAL: TSmallintField
      FieldName = 'NUM_TERMINAL'
      Origin = 'PEDIDOSDECOMPRA.NUM_TERMINAL'
    end
    object IBPedidoCompraCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      Origin = 'PEDIDOSDECOMPRA.CD_USUARIO'
    end
  end
  object IBPCItems: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'NUM_PEDIDO=REQUIRED'
      'CD_ITEM=REQUIRED')
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    DeleteSQL.Strings = (
      'DELETE FROM PEDIDOSDECOMPRA_ITEMS'
      'WHERE'
      '   CD_ITEM = :OLD_CD_ITEM AND'
      '   NUM_PEDIDO = :OLD_NUM_PEDIDO')
    EditSQL.Strings = (
      'UPDATE PEDIDOSDECOMPRA_ITEMS SET'
      '   CD_ITEM = :CD_ITEM, /*PK*/'
      '   NUM_PEDIDO = :NUM_PEDIDO, /*PK*/'
      '   CD_PRODUTO = :CD_PRODUTO,'
      '   NM_PRODUTO = :NM_PRODUTO,'
      '   COD_BARRAS = :COD_BARRAS,'
      '   QUANTIDADE = :QUANTIDADE,'
      '   VALOR = :VALOR,'
      '   UNDCONVERSAO = :UNDCONVERSAO,'
      '   VALOR_UNITARIO = :VALOR_UNITARIO,'
      '   SEQUENCIAL = :SEQUENCIAL,'
      '   CD_GRUPO = :CD_GRUPO,'
      '   CD_SUBGRUPO = :CD_SUBGRUPO,'
      '   BAIXADO = :BAIXADO,'
      '   DT_CADASTRO = :DT_CADASTRO,'
      '   ULTIMAALTERACAO = :ULTIMAALTERACAO'
      'WHERE'
      '   CD_ITEM = :OLD_CD_ITEM AND'
      '   NUM_PEDIDO = :OLD_NUM_PEDIDO')
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrPedidoCompra
    InsertSQL.Strings = (
      'INSERT INTO PEDIDOSDECOMPRA_ITEMS('
      '   CD_ITEM, /*PK*/'
      '   NUM_PEDIDO, /*PK*/'
      '   CD_PRODUTO,'
      '   NM_PRODUTO,'
      '   COD_BARRAS,'
      '   QUANTIDADE,'
      '   VALOR,'
      '   UNDCONVERSAO,'
      '   VALOR_UNITARIO,'
      '   SEQUENCIAL,'
      '   CD_GRUPO,'
      '   CD_SUBGRUPO,'
      '   BAIXADO,'
      '   DT_CADASTRO,'
      '   ULTIMAALTERACAO)'
      'VALUES ('
      '   :CD_ITEM,'
      '   :NUM_PEDIDO,'
      '   :CD_PRODUTO,'
      '   :NM_PRODUTO,'
      '   :COD_BARRAS,'
      '   :QUANTIDADE,'
      '   :VALOR,'
      '   :UNDCONVERSAO,'
      '   :VALOR_UNITARIO,'
      '   :SEQUENCIAL,'
      '   :CD_GRUPO,'
      '   :CD_SUBGRUPO,'
      '   :BAIXADO,'
      '   :DT_CADASTRO,'
      '   :ULTIMAALTERACAO)')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT * from PEDIDOSDECOMPRA_ITEMS ')
    FieldOptions = []
    Left = 32
    Top = 150
    object IBPCItemsNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.NUM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBPCItemsCD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.CD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBPCItemsCD_PRODUTO: TIntegerField
      FieldName = 'CD_PRODUTO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.CD_PRODUTO'
    end
    object IBPCItemsQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object IBPCItemsVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IBPCItemsUNDCONVERSAO: TBCDField
      FieldName = 'UNDCONVERSAO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.UNDCONVERSAO'
      Precision = 18
      Size = 3
    end
    object IBPCItemsVALORTOTAL: TIBOFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.VALORTOTAL'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object IBPCItemsSEQUENCIAL: TIntegerField
      FieldName = 'SEQUENCIAL'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.SEQUENCIAL'
    end
    object IBPCItemsCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.CD_GRUPO'
    end
    object IBPCItemsDT_CADASTRO: TDateTimeField
      FieldName = 'DT_CADASTRO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.DT_CADASTRO'
    end
    object IBPCItemsULTIMAALTERACAO: TDateTimeField
      FieldName = 'ULTIMAALTERACAO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.ULTIMAALTERACAO'
    end
    object IBPCItemsVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.VALOR_UNITARIO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IBPCItemsNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.NM_PRODUTO'
      Size = 45
    end
    object IBPCItemsCOD_BARRAS: TStringField
      FieldName = 'COD_BARRAS'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.COD_BARRAS'
      Size = 13
    end
    object IBPCItemsBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Origin = 'PEDIDOSDECOMPRA_ITEMS.BAIXADO'
      Size = 1
    end
  end
  object TrPedidoCompra: TIBOTransaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 88
    Top = 128
  end
  object TrLocaliza: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 424
    Top = 312
  end
  object IBScript: TIB_Script
    OnError = IBScriptError
    IB_Connection = IBDatabaseServer
    IB_Transaction = IBTransacao
    Left = 416
    Top = 424
  end
  object IBTransacaoSuperCombo: TIBOTransaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 416
    Top = 476
  end
  object SPTransacao: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 97
    Top = 387
  end
  object StoredProcServer: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'SP_REG_APAGADOS'
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = SPTransacao
    Left = 32
    Top = 387
  end
  object IBTabela3: TIB_Query
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = IBTransacao3
    CallbackInc = -1
    CallbackInitInt = 0
    CallbackRefreshInt = 0
    PreparedInserts = False
    CommitAction = caInvalidateCursor
    Left = 376
    Top = 176
  end
  object IBTransacao3: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 440
    Top = 176
  end
  object IBDatabaseServer: TIBODatabase
    SQLDialect = 3
    Params.Strings = (
      'PATH=F:\Bases de clientes\Base NOVA\FOCUS.FOC'
      'CHARACTER SET=WIN1252'
      'USER NAME=SYSDBA'
      'SQL DIALECT=3')
    Isolation = tiCommitted
    Left = 232
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object IBTabela4: TIB_Query
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    IB_Connection = IBDatabaseServer
    IB_Transaction = IBTransacao4
    CallbackInc = -1
    CallbackInitInt = 0
    CallbackRefreshInt = 0
    PreparedInserts = False
    CommitAction = caInvalidateCursor
    Left = 376
    Top = 232
  end
  object IBTransacao4: TIB_Transaction
    IB_Connection = IBDatabaseServer
    Isolation = tiCommitted
    Left = 440
    Top = 232
  end
  object IBNFLotesItems: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_NOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
    Active = True
    ColumnAttributes.Strings = (
      'ENTRADA_ITEM_MEDICAMENTO.CD_NOTA=REQUIRED'
      'ENTRADA_ITEM_MEDICAMENTO.CD_PRODUTO=REQUIRED'
      'ENTRADA_ITEM_MEDICAMENTO.NLOTE=REQUIRED'
      'ENTRADA_ITEM_MEDICAMENTO.CD_ITEM=REQUIRED')
    CommitAction = caRefresh
    DatabaseName = 'F:\Bases de clientes\Base NOVA\FOCUS.FOC'
    EditSQL.Strings = (
      'UPDATE ENTRADA_ITEM_MEDICAMENTO ENTRADA_ITEM_MEDICAMENTO SET'
      '   ENTRADA_ITEM_MEDICAMENTO.CD_NOTA = :CD_NOTA, /*PK*/'
      '   ENTRADA_ITEM_MEDICAMENTO.CD_ITEM = :CD_ITEM, /*PK*/'
      '   ENTRADA_ITEM_MEDICAMENTO.NLOTE = :NLOTE, /*PK*/'
      '   ENTRADA_ITEM_MEDICAMENTO.QLOTE = :QLOTE,'
      '   ENTRADA_ITEM_MEDICAMENTO.DFAB = :DFAB,'
      '   ENTRADA_ITEM_MEDICAMENTO.DVAL = :DVAL,'
      '   ENTRADA_ITEM_MEDICAMENTO.VPMC = :VPMC'
      'WHERE'
      '   CD_NOTA = :OLD_CD_NOTA AND'
      '   CD_ITEM = :OLD_CD_ITEM AND'
      '   NLOTE = :OLD_NLOTE')
    IB_Connection = IBDatabaseServer
    IB_Transaction = TrNF
    InsertSQL.Strings = (
      'INSERT INTO ENTRADA_ITEM_MEDICAMENTO('
      '   CD_NOTA, /*PK*/'
      '   CD_ITEM, /*PK*/'
      '   NLOTE, /*PK*/'
      '   QLOTE,'
      '   DFAB,'
      '   DVAL,'
      '   VPMC)'
      'VALUES ('
      '   :CD_NOTA,'
      '   :CD_ITEM,'
      '   :NLOTE,'
      '   :QLOTE,'
      '   :DFAB,'
      '   :DVAL,'
      '   :VPMC)')
    KeyLinks.Strings = (
      'ENTRADA_ITEM_MEDICAMENTO.CD_NOTA'
      'ENTRADA_ITEM_MEDICAMENTO.CD_ITEM'
      'ENTRADA_ITEM_MEDICAMENTO.NLOTE')
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT *'
      'from ENTRADA_ITEM_MEDICAMENTO'
      'WHERE CD_NOTA = :CD_NOTA'
      '  AND CD_ITEM = :CD_ITEM')
    FieldOptions = []
    Left = 32
    Top = 320
    object IBNFLotesItemsCD_NOTA: TIntegerField
      FieldName = 'CD_NOTA'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.CD_NOTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBNFLotesItemsCD_ITEM: TIntegerField
      FieldName = 'CD_ITEM'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.CD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBNFLotesItemsNLOTE: TStringField
      Alignment = taCenter
      FieldName = 'NLOTE'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.NLOTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBNFLotesItemsQLOTE: TBCDField
      Alignment = taCenter
      FieldName = 'QLOTE'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.QLOTE'
      Precision = 18
      Size = 3
    end
    object IBNFLotesItemsDFAB: TDateField
      Alignment = taCenter
      FieldName = 'DFAB'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.DFAB'
    end
    object IBNFLotesItemsDVAL: TDateField
      Alignment = taCenter
      FieldName = 'DVAL'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.DVAL'
    end
    object IBNFLotesItemsVPMC: TBCDField
      FieldName = 'VPMC'
      Origin = 'ENTRADA_ITEM_MEDICAMENTO.VPMC'
      currency = True
      Precision = 18
      Size = 3
    end
  end
end
