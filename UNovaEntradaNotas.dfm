object fNovaEntradaNota: TfNovaEntradaNota
  Left = 26
  Top = 106
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Entrada de Notas'
  ClientHeight = 342
  ClientWidth = 858
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
  object LabelObs: TLabel
    Left = 5
    Top = 282
    Width = 22
    Height = 13
    Caption = '&Obs:'
    FocusControl = EditObs
    OnMouseDown = EditBaseCalcICMSMouseDown
  end
  object GroupBox5: TGroupBox
    Left = 5
    Top = 0
    Width = 848
    Height = 273
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 76
      Top = 12
      Width = 431
      Height = 83
      Caption = 'Fornecedor'
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 170
        Top = 12
        Width = 27
        Height = 13
        Caption = 'CNPJ'
      end
      object Bt_LocFornecedor: TBitBtn
        Left = 75
        Top = 26
        Width = 22
        Height = 21
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000320B0000320B000000010000000100005A6B7300AD7B
          73004A637B00EFBD8400B58C8C00A5948C00C6948C00B59C8C00BD9C8C00F7BD
          8C00BD949400C6949400CE949400C69C9400CEAD9400F7CE9400C6A59C00CEA5
          9C00D6A59C00C6AD9C00CEAD9C00D6AD9C00F7CE9C00F7D69C004A7BA500CEAD
          A500D6B5A500DEBDA500F7D6A500DEBDAD00DEC6AD00E7C6AD00FFDEAD00FFE7
          AD00CEB5B500F7DEB500F7E7B500FFE7B500FFEFB500D6BDBD00DED6BD00E7DE
          BD00FFE7BD006B9CC600EFDEC600FFEFC600FFF7C600F7E7CE00FFF7CE00F7EF
          D600F7F7D600FFF7D600FFFFD6002184DE00F7F7DE00FFFFDE001884E700188C
          E700FFFFE700188CEF00218CEF00B5D6EF00F7F7EF00FFF7EF00FFFFEF00FFFF
          F700FF00FF004AB5FF0052B5FF0052BDFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042020A424242
          424242424242424242422B39180B42424242424242424242424243443C180B42
          4242424242424242424242444438180B42424242424242424242424244433918
          0A424242424242424242424242444335004201101A114242424242424242453D
          05072F343434291942424242424242221A2D34343437403E0442424242424206
          231C303437404146284242424242421B210F30373A414140310D42424242421F
          20032434373A3A37321342424242421D25030F2D37373737311042424242420D
          2D2D1C162430333429424242424242421E463F0F0316252E0842424242424242
          4227312D21252314424242424242424242420E141B1B42424242}
        ParentDoubleBuffered = False
        TabOrder = 1
        TabStop = False
        OnClick = Bt_LocFornecedorClick
      end
      object EditCodFornecedor: TEdit
        Left = 8
        Top = 26
        Width = 65
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = EditCodFornecedorChange
        OnKeyDown = EditCodFornecedorKeyDown
        OnKeyPress = EditCodFornecedorKeyPress
      end
      object EditCNPJFornecedor: TEdit
        Left = 168
        Top = 26
        Width = 145
        Height = 21
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Color = clYellow
        ReadOnly = True
        TabOrder = 2
      end
      object EditNomeFornecedor: TEdit
        Left = 8
        Top = 53
        Width = 409
        Height = 21
        TabStop = False
        AutoSize = False
        CharCase = ecUpperCase
        Color = clYellow
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 728
      Top = 12
      Width = 113
      Height = 83
      TabOrder = 3
      object LabelDataEmissao: TLabel
        Left = 7
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Data de Emiss'#227'o'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object Label5: TLabel
        Left = 7
        Top = 43
        Width = 78
        Height = 13
        Caption = 'Data de Entrada'
      end
      object EditDataEmissao: TJvDateEdit
        Left = 6
        Top = 20
        Width = 100
        Height = 21
        DialogTitle = 'Selecione uma data'
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        YearDigits = dyFour
        TabOrder = 0
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditDataEntrada: TJvDateEdit
        Left = 6
        Top = 55
        Width = 100
        Height = 21
        DialogTitle = 'Selecione uma data'
        Glyph.Data = {
          76050000424D760500000000000036000000280000001C0000000C0000000100
          2000000000004005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
          0000800000008000000000000000800000000000000000000000800000008080
          8000FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
          0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
          80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
          C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
          8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
          000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
          FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
          FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
          8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
          FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
          C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF008080800080808000808080008080800080808000808080008080
          80008080800080808000808080008080800080808000FF00FF00}
        ImageKind = ikCustom
        NumGlyphs = 2
        PopupColor = clBtnFace
        YearDigits = dyFour
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 166
      Width = 833
      Height = 99
      Caption = 'C'#225'lculo do Imposto'
      TabOrder = 5
      object LabelBaseCalcICMS: TLabel
        Left = 15
        Top = 14
        Width = 43
        Height = 13
        Caption = 'BC ICMS'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorICMS: TLabel
        Left = 133
        Top = 14
        Width = 68
        Height = 13
        Caption = 'Total do ICMS'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelBaseICMSSubst: TLabel
        Left = 251
        Top = 14
        Width = 60
        Height = 13
        Caption = 'BC ICMS ST'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorICMSSubst: TLabel
        Left = 369
        Top = 14
        Width = 85
        Height = 13
        Caption = 'Total do ICMS ST'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorTotalProd: TLabel
        Left = 722
        Top = 14
        Width = 89
        Height = 13
        Caption = 'Total dos Produtos'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorFrete: TLabel
        Left = 15
        Top = 51
        Width = 66
        Height = 13
        Caption = 'Total do Frete'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorSeguro: TLabel
        Left = 133
        Top = 51
        Width = 76
        Height = 13
        Caption = 'Total do Seguro'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelOutrasDespesas: TLabel
        Left = 489
        Top = 14
        Width = 81
        Height = 13
        Caption = 'Outras Despesas'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorTotalIPI: TLabel
        Left = 369
        Top = 51
        Width = 55
        Height = 13
        Caption = 'Total do IPI'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorTotalNota: TLabel
        Left = 722
        Top = 51
        Width = 92
        Height = 13
        Caption = 'Valor Total da Nota'
      end
      object LabelDescontoGeral: TLabel
        Left = 608
        Top = 15
        Width = 74
        Height = 13
        Caption = 'Desconto Geral'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelValorII: TLabel
        Left = 251
        Top = 51
        Width = 48
        Height = 13
        Caption = 'Total do II'
      end
      object LabelPIS: TLabel
        Left = 489
        Top = 51
        Width = 17
        Height = 13
        Caption = 'PIS'
      end
      object LabelCOFINS: TLabel
        Left = 608
        Top = 51
        Width = 39
        Height = 13
        Caption = 'COFINS'
      end
      object EditBaseCalcICMS: TJvCalcEdit
        Left = 15
        Top = 27
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 0
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorICMSExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorICMS: TJvCalcEdit
        Left = 133
        Top = 27
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 1
        DecimalPlacesAlwaysShown = False
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditBaseICMSSubst: TJvCalcEdit
        Left = 251
        Top = 27
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 2
        DecimalPlacesAlwaysShown = False
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorICMSSubst: TJvCalcEdit
        Left = 369
        Top = 27
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorTotalProd: TJvCalcEdit
        Left = 722
        Top = 26
        Width = 100
        Height = 23
        AutoSize = False
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = False
        TabOrder = 7
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
      end
      object EditValorFrete: TJvCalcEdit
        Left = 15
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 8
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorSeguro: TJvCalcEdit
        Left = 133
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 9
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditOutrasDespesas: TJvCalcEdit
        Left = 489
        Top = 27
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 4
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorTotalIPI: TJvCalcEdit
        Left = 369
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 11
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorTotalNota: TJvCalcEdit
        Left = 722
        Top = 62
        Width = 100
        Height = 23
        AutoSize = False
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = False
        TabOrder = 14
        DecimalPlacesAlwaysShown = False
        OnKeyPress = EditBaseCalcICMSKeyPress
      end
      object EditDescontoGeral: TJvCalcEdit
        Left = 608
        Top = 27
        Width = 100
        Height = 21
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 6
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object CheckBoxDescGeral: TCheckBox
        Left = 688
        Top = 10
        Width = 28
        Height = 17
        Caption = '%'
        TabOrder = 5
        OnExit = EditValorTotalProdExit
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorII: TJvCalcEdit
        Left = 251
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 10
        DecimalPlacesAlwaysShown = False
        OnExit = EditValorTotalProdExit
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorPIS: TJvCalcEdit
        Left = 489
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 12
        DecimalPlacesAlwaysShown = False
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditValorCofins: TJvCalcEdit
        Left = 608
        Top = 63
        Width = 100
        Height = 22
        AutoSize = False
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 13
        DecimalPlacesAlwaysShown = False
        OnKeyPress = EditBaseCalcICMSKeyPress
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
    end
    object GroupBox6: TGroupBox
      Left = 513
      Top = 12
      Width = 209
      Height = 83
      TabOrder = 2
      object Label3: TLabel
        Left = 17
        Top = 8
        Width = 53
        Height = 13
        Caption = 'N'#186' da Nota'
      end
      object LabelSerie: TLabel
        Left = 143
        Top = 8
        Width = 24
        Height = 13
        Caption = 'S'#233'rie'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelModelo: TLabel
        Left = 16
        Top = 43
        Width = 35
        Height = 13
        Caption = 'Modelo'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditNumNota: TEdit
        Left = 16
        Top = 20
        Width = 121
        Height = 21
        AutoSize = False
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        OnKeyPress = EditNumNotaKeyPress
      end
      object EditSerie: TEdit
        Left = 143
        Top = 20
        Width = 49
        Height = 21
        MaxLength = 3
        TabOrder = 1
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditModelo: TEdit
        Left = 16
        Top = 55
        Width = 121
        Height = 21
        TabOrder = 2
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
    end
    object RadioGroupTipoNota: TRadioGroup
      Left = 8
      Top = 12
      Width = 65
      Height = 83
      Caption = 'Nota'
      ItemIndex = 0
      Items.Strings = (
        'Fiscal'
        'Pedido')
      TabOrder = 0
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 101
      Width = 833
      Height = 60
      TabOrder = 4
      object LabelNatOperacao: TLabel
        Left = 7
        Top = 11
        Width = 108
        Height = 13
        Caption = 'Natureza da Opera'#231#227'o'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object LabelChaveNFe: TLabel
        Left = 472
        Top = 11
        Width = 57
        Height = 13
        Caption = 'Chave NF-e'
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditNatOperacao: TEdit
        Left = 7
        Top = 26
        Width = 459
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
      object EditChaveNFe: TEdit
        Left = 472
        Top = 26
        Width = 350
        Height = 21
        TabOrder = 1
        OnMouseDown = EditBaseCalcICMSMouseDown
      end
    end
  end
  object bt_Ok: TBitBtn
    Left = 657
    Top = 306
    Width = 95
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
    TabOrder = 2
    OnClick = bt_OkClick
  end
  object bt_Cancelar: TBitBtn
    Left = 758
    Top = 306
    Width = 95
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
    TabOrder = 3
    OnClick = bt_CancelarClick
  end
  object EditObs: TEdit
    Left = 33
    Top = 279
    Width = 820
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    OnMouseDown = EditBaseCalcICMSMouseDown
  end
  object PopupMenu: TPopupMenu
    AutoPopup = False
    OnPopup = PopupMenuPopup
    Left = 144
    Top = 288
    object MenuLiga: TMenuItem
      Caption = '&Liga'
      OnClick = MenuLigaClick
    end
    object MenuDesliga: TMenuItem
      Caption = '&Desliga'
      OnClick = MenuDesligaClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 320
    Top = 296
  end
end