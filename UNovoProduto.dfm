object fNovoProduto: TfNovoProduto
  Left = 200
  Top = 10
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produto'
  ClientHeight = 534
  ClientWidth = 443
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbUnidade: TLabel
    Left = 391
    Top = 9
    Width = 40
    Height = 13
    Caption = 'Unidade'
    OnMouseDown = edFabricanteMouseDown
  end
  object edDescricao: TEdit
    Left = 8
    Top = 16
    Width = 372
    Height = 27
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 45
    ParentFont = False
    TabOrder = 0
    OnEnter = edDescricaoEnter
    OnExit = edDescricaoExit
  end
  object btOk: TBitBtn
    Left = 231
    Top = 500
    Width = 115
    Height = 25
    Caption = 'Ok - F10'
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
    TabOrder = 4
    OnClick = btOkClick
  end
  object btCancelar: TBitBtn
    Left = 359
    Top = 500
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    DoubleBuffered = True
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      08000000000000010000220B0000220B000000010000000100000031DE000031
      E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
      0404040404040404000004000004040404040404040404000004040000000404
      0404040404040000040404000000000404040404040000040404040402000000
      0404040400000404040404040404000000040000000404040404040404040400
      0101010004040404040404040404040401010204040404040404040404040400
      0201020304040404040404040404030201040403030404040404040404050203
      0404040405030404040404040303050404040404040303040404040303030404
      0404040404040403040403030304040404040404040404040404030304040404
      0404040404040404040404040404040404040404040404040404}
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btCancelarClick
  end
  object btPesquisar: TBitBtn
    Left = 8
    Top = 500
    Width = 113
    Height = 25
    Caption = 'Pesquisar - F3'
    DoubleBuffered = True
    Glyph.Data = {
      46050000424D460500000000000036040000280000000F000000110000000100
      08000000000010010000D30E0000D30E00000001000000010000DE7B1000E784
      1000BD6B18006331210084522100BD7321007B4A2900C6842900B56B4200B573
      4A0094735200635A5A0094735A007363630094736300AD8C63007B736B008473
      6B008C736B00947B6B00A5846B00946B73009C6B73009C737300847B73008C7B
      7300D6947300A5847B00BD948400BD9C8400E7BD84008C8C8C00948C8C00A58C
      8C00B59C9400BDAD9400EFC694009C9C9C00D6BD9C00EFCE9C00F7D69C00A5A5
      A500ADADA500D6BDA500D6C6A500E7C6A500DECEA500EFCEA500EFD6A500B5AD
      AD00D6BDAD00DEC6AD00DECEAD00DED6AD00E7D6AD00EFDEAD006394B500A5AD
      B500B5B5B500BDB5B500F7EFB500BDB5BD00C6B5BD00BDBDBD00CEBDBD00C6C6
      BD00D6C6BD00DEDEBD00E7DEBD00E7E7BD00EFE7BD00FFEFBD009CB5C600DECE
      C600DEE7C600F7F7C6006B84CE00C6C6CE00DEE7CE00F7F7CE00FFFFCE007384
      D6008CBDD600ADC6D600C6C6D600C6CED600CECED600EFF7D6006B8CDE007B94
      DE00BDD6DE00C6D6DE00C6DEDE00CEDEDE00DEE7DE00EFF7DE00C6D6E700CED6
      E700CEDEE700CEE7E700E7E7E700CEE7EF00FFFFEF00D6EFF700DEF7F700EFF7
      F700FF00FF0029B5FF0042B5FF0039BDFF00A5E7FF00CEEFFF00D6EFFF00D6F7
      FF00DEF7FF00E7F7FF00DEFFFF00E7FFFF00F7FFFF00FFFFFF00FFFFFF00FFFF
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
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006A6A6A6A6A6A
      6A6A6A6A6A6A6A6A6A003A102A6A6A6A6A6A6A6A6A6A6A6A6A00535916256A6A
      6A6A6A6A6A6A6A6A6A006E6C5117296A6A6A6A6A6A6A6A6A6A006A6E6D58153F
      6A6A6A6A6A6A6A6A6A005656386B4C0B2011190D1F3F3A3A6A0009090852481C
      476677771B031A066A0027757568402F4B4F5F76771871136A001E6F5B552B36
      2E4A5E64662339126A001E6F5B55322E2C434A4E5726390E6A001E6F5B5B3245
      34354344501D5B0E6A001E705D5D41496944303C2721760C6A001E6F5B5B5B3B
      4236302D225B770C6A001E70616262654D313D4D6772770C6A00247165656767
      677271706768770C6A0002050505050505050507070714046A00000101010101
      010101010101010F6A00}
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btPesquisarClick
  end
  object edUnidade: TComboBox
    Left = 390
    Top = 22
    Width = 47
    Height = 21
    Style = csDropDownList
    CharCase = ecUpperCase
    TabOrder = 1
    Items.Strings = (
      'UN'
      'CX'
      'KG'
      'LT'
      'MT'
      'PC'
      'SC'
      'DZ'
      'RL'
      'PR'
      'JG'
      'CT')
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 48
    Width = 427
    Height = 441
    ActivePage = TabCadastro
    TabOrder = 2
    object TabCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 10
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 136
        Top = 5
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object bt_GeraCodigo: TSpeedButton
        Left = 114
        Top = 19
        Width = 15
        Height = 23
        Hint = 'Sugerir C'#243'digo'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = bt_GeraCodigoClick
      end
      object lbFabricante: TLabel
        Left = 142
        Top = 105
        Width = 50
        Height = 13
        Caption = 'Fabricante'
      end
      object lbDescrAbrev: TLabel
        Left = 8
        Top = 104
        Width = 101
        Height = 13
        Caption = 'Descri'#231#227'o abreviada:'
      end
      object lbLocalizacao: TLabel
        Left = 8
        Top = 175
        Width = 57
        Height = 13
        Caption = 'Localiza'#231#227'o'
      end
      object lbAplicacao: TLabel
        Left = 8
        Top = 139
        Width = 47
        Height = 13
        Caption = 'Aplica'#231#227'o'
      end
      object lbPesoLiquido: TLabel
        Left = 8
        Top = 245
        Width = 61
        Height = 13
        Caption = 'Peso Liquido'
      end
      object lbPesoBruto: TLabel
        Left = 92
        Top = 245
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object lbEstoqueMinimo: TLabel
        Left = 176
        Top = 245
        Width = 63
        Height = 13
        Caption = 'Estoque m'#237'n.'
      end
      object lbDesconto: TLabel
        Left = 299
        Top = 245
        Width = 54
        Height = 13
        Caption = 'Desc. M'#225'x:'
      end
      object lbDesconto2: TLabel
        Left = 342
        Top = 263
        Width = 10
        Height = 14
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbComissao: TLabel
        Left = 366
        Top = 245
        Width = 45
        Height = 13
        Caption = 'Comiss'#227'o'
      end
      object Label45: TLabel
        Left = 8
        Top = 211
        Width = 52
        Height = 13
        Caption = 'Dimens'#245'es'
      end
      object lbQuantDigitos: TLabel
        Left = 65
        Top = 6
        Width = 48
        Height = 14
        Caption = '05 d'#237'gitos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Visible = False
      end
      object btGrupos: TBitBtn
        Left = 389
        Top = 20
        Width = 21
        Height = 22
        DoubleBuffered = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDDDDDDDDDDDD80DDDDDDDDDDDDD8777DDDDDDDDDDD87787DDDDDDDDDD877
          87DDDDDDDDDD87787DDDDDD7777D7077DDDDDD877778078DDDDDD77FFFF778DD
          DDDD84FF88FF78DDDDDD88F8888F77DDDDDD78F8888F77DDDDDD8888FF8877DD
          DDDD878FFFF878DDDDDDD888FF888DDDDDDDDD888888DDDDDDDD}
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = btGruposClick
      end
      object GroupBoxCodigos: TGroupBox
        Left = 8
        Top = 42
        Width = 401
        Height = 59
        Caption = 'C'#243'digos'
        TabOrder = 3
        object lbCodigo2: TLabel
          Left = 5
          Top = 16
          Width = 42
          Height = 13
          Caption = 'C'#243'digo 2'
        end
        object lbCodigo3: TLabel
          Left = 115
          Top = 16
          Width = 42
          Height = 13
          Caption = 'C'#243'digo 3'
        end
        object lbCodigo4: TLabel
          Left = 225
          Top = 16
          Width = 42
          Height = 13
          Caption = 'C'#243'digo 4'
        end
        object edCodigo2: TEdit
          Left = 5
          Top = 29
          Width = 90
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = edDescricaoEnter
          OnMouseDown = edFabricanteMouseDown
        end
        object edCodigo3: TEdit
          Left = 115
          Top = 29
          Width = 90
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnEnter = edDescricaoEnter
          OnMouseDown = edFabricanteMouseDown
        end
        object edCodigo4: TEdit
          Left = 225
          Top = 29
          Width = 90
          Height = 23
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnEnter = edDescricaoEnter
          OnMouseDown = edFabricanteMouseDown
        end
        object edCodBalanca: TEdit
          Left = 333
          Top = 29
          Width = 48
          Height = 22
          AutoSize = False
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnKeyPress = edCodBalancaKeyPress
          OnMouseDown = edFabricanteMouseDown
        end
        object chCodBalanca: TCheckBox
          Left = 333
          Top = 12
          Width = 63
          Height = 17
          Caption = 'C'#243'd. Bal.'
          TabOrder = 3
          OnMouseDown = edFabricanteMouseDown
        end
      end
      object GroupBoxCaixaFechada: TGroupBox
        Left = 263
        Top = 300
        Width = 145
        Height = 112
        Caption = 'Caixa Fechada'
        TabOrder = 18
        object lbUndConvEmbalagem: TLabel
          Left = 8
          Top = 60
          Width = 108
          Height = 13
          Caption = 'Unidade de convers'#227'o'
        end
        object lbUndConvEmbalagem2: TLabel
          Left = 83
          Top = 78
          Width = 45
          Height = 14
          Caption = 'por caixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lbCodEmbalagem: TLabel
          Left = 8
          Top = 26
          Width = 77
          Height = 13
          Caption = 'C'#243'digo da Caixa'
          OnMouseDown = edFabricanteMouseDown
        end
        object edCodEmbalagem: TEdit
          Left = 8
          Top = 39
          Width = 113
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnChange = edCodEmbalagemChange
          OnMouseDown = edFabricanteMouseDown
        end
        object edUndConvEmbalagem: TJvCalcEdit
          Left = 8
          Top = 74
          Width = 70
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = ',0.000'
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnMouseDown = edFabricanteMouseDown
        end
      end
      object edCodigo: TEdit
        Left = 8
        Top = 19
        Width = 105
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edCodigoChange
        OnEnter = edCodigoEnter
        OnExit = edCodigoExit
        OnKeyPress = edCodigoKeyPress
      end
      object edFabricante: TEdit
        Left = 142
        Top = 117
        Width = 153
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
        OnMouseDown = edFabricanteMouseDown
      end
      object edDescrAbrev: TEdit
        Left = 8
        Top = 117
        Width = 128
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 4
        OnMouseDown = edFabricanteMouseDown
      end
      object edLocalizacao: TEdit
        Left = 7
        Top = 189
        Width = 401
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 9
        OnMouseDown = edFabricanteMouseDown
      end
      object edAplicacao: TEdit
        Left = 8
        Top = 153
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 8
        OnMouseDown = edFabricanteMouseDown
      end
      object edPesoLiquido: TJvCalcEdit
        Left = 8
        Top = 258
        Width = 78
        Height = 22
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = False
        TabOrder = 11
        DecimalPlacesAlwaysShown = False
        OnMouseDown = edFabricanteMouseDown
      end
      object edPesoBruto: TJvCalcEdit
        Left = 92
        Top = 258
        Width = 78
        Height = 21
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 12
        DecimalPlacesAlwaysShown = False
        OnMouseDown = edFabricanteMouseDown
      end
      object edEstoqueMinimo: TJvCalcEdit
        Left = 176
        Top = 258
        Width = 71
        Height = 21
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 13
        ZeroEmpty = False
        DecimalPlacesAlwaysShown = False
        OnMouseDown = edFabricanteMouseDown
      end
      object chUnidadeFracionada: TCheckBox
        Left = 299
        Top = 109
        Width = 117
        Height = 17
        Caption = 'Unidade Fracionada'
        TabOrder = 6
      end
      object edDimensoes: TEdit
        Left = 8
        Top = 224
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 10
        OnMouseDown = edFabricanteMouseDown
      end
      object edDesconto: TJvCalcEdit
        Left = 299
        Top = 258
        Width = 41
        Height = 21
        ClickKey = 0
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 14
        DecimalPlacesAlwaysShown = False
        OnMouseDown = edFabricanteMouseDown
      end
      object edComissao: TJvCalcEdit
        Left = 366
        Top = 258
        Width = 41
        Height = 21
        ClickKey = 0
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 15
        DecimalPlacesAlwaysShown = False
        OnMouseDown = edFabricanteMouseDown
      end
      object chControlaNumSerie: TCheckBox
        Left = 300
        Top = 128
        Width = 109
        Height = 17
        Caption = 'Controla &N'#186' S'#233'rie'
        TabOrder = 7
        OnMouseDown = edFabricanteMouseDown
      end
      object edGrupo: TEdit
        Left = 136
        Top = 19
        Width = 249
        Height = 21
        AutoSelect = False
        CharCase = ecUpperCase
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnKeyDown = edGrupoKeyDown
      end
      object chTresCasas: TCheckBox
        Left = 8
        Top = 282
        Width = 121
        Height = 17
        Caption = 'Tr'#234's casas decimais'
        TabOrder = 16
      end
      object grpFisco: TGroupBox
        Left = 8
        Top = 300
        Width = 162
        Height = 112
        Caption = 'Fisco'
        TabOrder = 17
        object lbClassFiscal: TLabel
          Left = 6
          Top = 14
          Width = 127
          Height = 13
          Caption = 'Class. Fiscal (C'#243'digo NCM)'
          OnMouseDown = edFabricanteMouseDown
        end
        object edClassFiscal: TEdit
          Left = 6
          Top = 28
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 0
          Text = '99999999'
          OnMouseDown = edFabricanteMouseDown
        end
        object GroupBoxFisco: TGroupBox
          Left = 3
          Top = 50
          Width = 147
          Height = 59
          Caption = 'Al'#237'quotas'
          TabOrder = 1
          object Label8: TLabel
            Left = 398
            Top = 32
            Width = 10
            Height = 14
            Caption = '%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            OnMouseDown = edFabricanteMouseDown
          end
          object lbAliquota: TLabel
            Left = 18
            Top = 16
            Width = 26
            Height = 13
            Caption = 'ICMS'
            OnMouseDown = edFabricanteMouseDown
          end
          object lbAliquota2: TLabel
            Left = 69
            Top = 31
            Width = 10
            Height = 14
            Caption = '%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            OnMouseDown = edFabricanteMouseDown
          end
          object lbIPI: TLabel
            Left = 91
            Top = 16
            Width = 13
            Height = 13
            Caption = 'IPI'
            OnMouseDown = edFabricanteMouseDown
          end
          object lbIPI2: TLabel
            Left = 124
            Top = 31
            Width = 10
            Height = 14
            Caption = '%'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object edAliquota: TJvCalcEdit
            Left = 16
            Top = 28
            Width = 52
            Height = 21
            DisplayFormat = ',0.00'
            ShowButton = False
            TabOrder = 0
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            OnMouseDown = edFabricanteMouseDown
          end
          object edIPI: TJvCalcEdit
            Left = 91
            Top = 28
            Width = 33
            Height = 21
            ClickKey = 0
            DisplayFormat = ',0.00;-,0.00'
            ShowButton = False
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            OnMouseDown = edFabricanteMouseDown
          end
        end
      end
    end
    object TabObs: TTabSheet
      Caption = 'Obs'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 16
        Top = 16
        Width = 385
        Height = 409
        TabOrder = 0
      end
    end
    object TabFoto: TTabSheet
      Caption = 'Foto'
      ImageIndex = 2
      object Image1: TImage
        Left = 8
        Top = 16
        Width = 401
        Height = 321
      end
      object Bt_Foto: TBitBtn
        Left = 160
        Top = 352
        Width = 113
        Height = 25
        Caption = 'Escolher Imagem'
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C30E0000C30E00000001000000010000003100000039
          000000420000B5420000004A0000AD4A0000BD4A000000520000C6520000005A
          0000085A0000C65A0000006300007B630000CE630000C66B0000DE6B0000E76B
          0000DE730000F78C0000084208009C4208000052080008520800085A0800086B
          0800D68C0800106B1000186B100008731000E78C1000106B1800BD6B1800CE7B
          1800218C1800DE7B2100AD9C2100C6732900318C2900B5AD2900FFAD2900BD73
          3100318C310029B53100398C3900DE8C3900429C3900529C3900B5A5390031AD
          39009CAD3900AD6B4200319442003994420094944200DE9C420029A5420094B5
          4200FFB5420084BD42004AA54A004AAD4A0094B54A008CBD4A00FFBD4A00429C
          5200FFC65200A5BD5A00FFBD5A00FFC65A00FFCE5A005ABD630063C66300FFCE
          63006B6B6B004AC66B0073737300CE9C730052A5730052B57B00F7CE7B0073D6
          7B00FFD67B00848484008C84840063B58400E7D68400F7D68400FFD684008484
          8C008C848C0094848C008C8C8C007BCE8C008CCE8C00F7CE8C00FFD68C00FFE7
          8C008C8C9400948C94008C94940094949400DEBD9400EFC694008CCE9400F7CE
          9400848C9C008C949C009C9C9C00E7C69C00EFC69C00EFCE9C008CD69C00F7D6
          9C00FFD69C00FFEF9C00A5A5A50073CEA500EFCEA500F7D6A50094DEA500FFDE
          A500A5A5AD00ADADAD00F7D6AD0094DEAD00F7DEAD0073E7AD00ADADB500ADB5
          B500B5B5B5007BD6B50094DEB50084E7B500B5B5BD00BDBDBD009CD6BD008CDE
          BD00F7DEBD00FFFFBD00BDBDC600BDC6C600C6C6C60094E7C600F7EFC600FFEF
          C60094E7CE00FFFFCE0094E7DE0094EFE70094FFE700FF00FF009CFFFF00A5FF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00976C4C4A4C4C
          4C4C4C4C4C4C4C4A4C6565635C5C5C5C5C5C5C5C5C5C5C5C5C4C655E5E5E7078
          787D848989899288544A6C2C2A2C353535414E5583969694544A6C1704161616
          161714174F999895544A7404020101010004041C5D857F755A4A741C19040100
          001F384B513E2730624A7B3C3C18010409263E32241A131E6A4A8047481D070C
          0A0D0F0E101012216A4A82312B222F2E362D230B030608206B4A873F3B435656
          73735037252905156B4A875852494245454249618B8A4D33624A8E5F603A2840
          443A447990909390534A8E7677695F777C7C7C716F6F716D594C8E766F76766D
          6D6D6D6D6D6D676662748D8D8C8786868281807B7A7A746C6C97}
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = Bt_FotoClick
      end
      object Bt_ApagaFoto: TBitBtn
        Left = 304
        Top = 352
        Width = 105
        Height = 25
        Caption = 'Apagar Imagem'
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
          8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
          0404040404040404040404040404040404040404040404040404040404040404
          0404040404040404040404010000000000000104040404040404040002020202
          0202000004040404040404000202020202020001000404040404040100020202
          0202000101000404040404040003030303030300010100040404040404000303
          0303030300010100040404040404000303030303030001010004040404040400
          0303030303030001000404040404040400030303030303000004040404040404
          0400030303030303000404040404040404040100000000010104040404040404
          0404040404040404040404040404040404040404040404040404}
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = Bt_ApagaFotoClick
      end
    end
  end
  object PopupMenu: TPopupMenu
    AutoPopup = False
    OnPopup = PopupMenuPopup
    Left = 176
    Top = 500
    object MenuLiga: TMenuItem
      Caption = '&Liga'
      OnClick = MenuLigaClick
    end
    object MenuDesliga: TMenuItem
      Caption = '&Desliga'
      OnClick = MenuDesligaClick
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    FileName = 'E:\nova civilizacao.jpg'
    Filter = 'JPeg (*.jpg)|*.jpg'
    Left = 137
    Top = 502
  end
end
