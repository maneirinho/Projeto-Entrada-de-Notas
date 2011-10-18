object fPrecosDoProduto: TfPrecosDoProduto
  Left = 240
  Top = 115
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Pre'#231'os do Produto'
  ClientHeight = 373
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 228
      Top = 36
      Width = 80
      Height = 13
      Caption = 'Pre'#231'o de Venda:'
    end
    object LabelNomeDoProduto: TLabel
      Left = 8
      Top = 8
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
    object EditPrecoVenda: TJvCalcEdit
      Left = 312
      Top = 32
      Width = 121
      Height = 21
      AutoSize = False
      Color = clYellow
      DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ShowButton = False
      TabOrder = 0
      DecimalPlacesAlwaysShown = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 439
    Height = 275
    Align = alClient
    TabOrder = 1
    object wwDBGrid1: TwwDBGrid
      Left = 8
      Top = 8
      Width = 425
      Height = 249
      Selected.Strings = (
        'CD_VENDA'#9'9'#9'C'#243'd.'
        'NM_VENDA'#9'40'#9'Descri'#231#227'o'
        'PRECO'#9'13'#9'Pre'#231'o')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DataSource1
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFixedResizable]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 332
    Width = 439
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btOk: TBitBtn
      Left = 344
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Ok'
      Default = True
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
  object IBPrecos: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'CD_VENDA=REQUIRED')
    DatabaseName = 'C:\Delphi\Bases Clientes\Rene\FOCUS.FOC'
    IB_Transaction = IBOTransaction1
    KeyLinks.Strings = (
      'CODIGOVENDA.CD_VENDA')
    RecordCountAccurate = True
    SQL.Strings = (
      'select CD_VENDA, NM_VENDA, (15 +(15 * VALOR)/100) as PRECO'
      'from CODIGOVENDA')
    FieldOptions = []
    Left = 264
    Top = 81
    object IBPrecosCD_VENDA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd.'
      DisplayWidth = 9
      FieldName = 'CD_VENDA'
      Origin = 'CODIGOVENDA.CD_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBPrecosNM_VENDA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'NM_VENDA'
      Origin = 'CODIGOVENDA.NM_VENDA'
      Size = 50
    end
    object IBPrecosPRECO: TBCDField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 13
      FieldName = 'PRECO'
      ReadOnly = True
      DisplayFormat = ',0.00;-,0.00'
      Precision = 18
      Size = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = IBPrecos
    Left = 232
    Top = 81
  end
  object IBOTransaction1: TIBOTransaction
    Isolation = tiCommitted
    Left = 264
    Top = 113
  end
end
