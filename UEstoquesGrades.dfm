object fEstoqueGrades: TfEstoqueGrades
  Left = 241
  Top = 73
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Estoque do Produto (GRADES)'
  ClientHeight = 426
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 80
    Align = alTop
    Color = 10930928
    TabOrder = 0
    object lbNomeProduto: TLabel
      Left = 8
      Top = 32
      Width = 124
      Height = 18
      Caption = 'Nome do Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbCodProduto: TLabel
      Left = 8
      Top = 8
      Width = 104
      Height = 18
      Caption = '7896543215653'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbDeposito: TLabel
      Left = 8
      Top = 56
      Width = 131
      Height = 18
      Caption = 'Nome do Deposito'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 544
    Height = 300
    Align = alClient
    TabOrder = 1
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 1
      Width = 542
      Height = 298
      Selected.Strings = (
        'COD_BARRAS'#9'24'#9'C'#243'digo'#9#9
        'NM_GRADE'#9'44'#9'Descri'#231#227'o'#9#9
        'ESTOQUEATUAL'#9'14'#9'Estoque'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10930928
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DataSource1
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFixedResizable]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      OnDrawDataCell = wwDBGrid1DrawDataCell
      OnDblClick = wwDBGrid1DblClick
      OnKeyPress = wwDBGrid1KeyPress
    end
    object Edit1: TJvCalcEdit
      Left = 318
      Top = 56
      Width = 65
      Height = 21
      AutoSize = False
      ClickKey = 0
      Color = clLime
      DisplayFormat = ',0.###;-,0.###'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = False
      TabOrder = 1
      Value = 1.000000000000000000
      Visible = False
      ZeroEmpty = False
      DecimalPlacesAlwaysShown = False
      OnChange = Edit1Change
      OnExit = Edit1Exit
      OnKeyPress = Edit1KeyPress
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 380
    Width = 544
    Height = 46
    Align = alBottom
    Color = 10930928
    TabOrder = 2
    object Label1: TLabel
      Left = 464
      Top = 6
      Width = 69
      Height = 13
      Caption = 'Estoque Atual:'
    end
    object lbEstoqueAtual: TLabel
      Left = 505
      Top = 22
      Width = 29
      Height = 13
      Caption = '9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btOk: TBitBtn
      Left = 236
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000008C00000094
        0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
        210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
        420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
        94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
        04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
        0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
        170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
        13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
        1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
        1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
        1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btOkClick
    end
  end
  object IBEstoque: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CD_DEPOSITO'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'CD_VENDA=REQUIRED'
      'CD_DEPOSITO=REQUIRED'
      'G.CD_GRADE=REQUIRED')
    DatabaseName = 'F:\Fontes\Focus\FOCUS.FOC'
    IB_Transaction = IBOTransaction1
    RecordCountAccurate = True
    SQL.Strings = (
      
        'select G.CD_GRADE, G.COD_BARRAS, G.NM_GRADE, coalesce(E.ESTOQUEA' +
        'TUAL, 0) as ESTOQUEATUAL'
      'from GRADES G'
      
        'left outer join SP_PEGAESTOQUE(:CD_PRODUTO, G.CD_GRADE, :CD_DEPO' +
        'SITO) E on (1=1)'
      'where G.CD_PRODUTO = :CD_PRODUTO')
    FieldOptions = []
    Left = 264
    Top = 82
    object IBEstoqueCOD_BARRAS: TStringField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 24
      FieldName = 'COD_BARRAS'
      Origin = 'GRADES.COD_BARRAS'
      Size = 13
    end
    object IBEstoqueNM_GRADE: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 44
      FieldName = 'NM_GRADE'
      Origin = 'GRADES.NM_GRADE'
    end
    object IBEstoqueESTOQUEATUAL: TBCDField
      DisplayLabel = 'Estoque'
      DisplayWidth = 14
      FieldName = 'ESTOQUEATUAL'
      Origin = 'ESTOQUE.ESTOQUEATUAL'
      DisplayFormat = ',00.###'
      Precision = 18
      Size = 3
    end
    object IBEstoqueCD_GRADE: TIntegerField
      DisplayWidth = 10
      FieldName = 'CD_GRADE'
      Origin = 'GRADES.CD_GRADE'
      Required = True
      Visible = False
    end
  end
  object DataSource1: TDataSource
    DataSet = IBEstoque
    Left = 232
    Top = 81
  end
  object IBOTransaction1: TIBOTransaction
    Isolation = tiCommitted
    Left = 264
    Top = 113
  end
end
