object fEntradaNotaConsulta: TfEntradaNotaConsulta
  Left = 15
  Top = 25
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Consulta de Notas'
  ClientHeight = 483
  ClientWidth = 753
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
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 231
    Align = alTop
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GroupBox5: TGroupBox
      Left = 8
      Top = 0
      Width = 737
      Height = 225
      Caption = 'Dados da Nota'
      TabOrder = 0
      object DBRadioGroup1: TDBRadioGroup
        Left = 8
        Top = 11
        Width = 65
        Height = 83
        Caption = 'Nota'
        Color = clMoneyGreen
        DataField = 'TIPO_NOTA'
        DataSource = DataSource1
        Items.Strings = (
          'Fiscal'
          'Pedido')
        ParentBackground = True
        ParentColor = False
        ReadOnly = True
        TabOrder = 0
        Values.Strings = (
          'F'
          'P')
      end
      object GroupBox1: TGroupBox
        Left = 76
        Top = 11
        Width = 321
        Height = 83
        Caption = 'Fornecedor'
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 33
          Height = 14
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 170
          Top = 12
          Width = 25
          Height = 14
          Caption = 'CNPJ'
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 53
          Width = 305
          Height = 21
          TabStop = False
          AutoSize = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'NM_FORNECEDOR'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 26
          Width = 65
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'CD_FORNECEDOR'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 168
          Top = 26
          Width = 145
          Height = 21
          TabStop = False
          AutoSize = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'CNPJ'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 616
        Top = 11
        Width = 113
        Height = 83
        TabOrder = 3
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 80
          Height = 14
          Caption = 'Data de Emiss'#227'o'
        end
        object Label5: TLabel
          Left = 7
          Top = 43
          Width = 77
          Height = 14
          Caption = 'Data de Entrada'
        end
        object DBDateEdit1: TJvDBDateEdit
          Left = 6
          Top = 20
          Width = 100
          Height = 22
          DataField = 'DT_EMISSAO'
          DataSource = DataSource1
          ReadOnly = True
          Color = clBtnFace
          DialogTitle = 'Selecione uma data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentFont = False
          PopupColor = clBtnFace
          YearDigits = dyFour
          TabOrder = 0
        end
        object DBDateEdit2: TJvDBDateEdit
          Left = 6
          Top = 55
          Width = 100
          Height = 22
          DataField = 'DT_ENTRADA'
          DataSource = DataSource1
          ReadOnly = True
          Color = clBtnFace
          DialogTitle = 'Selecione uma data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
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
          ParentFont = False
          PopupColor = clBtnFace
          YearDigits = dyFour
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 95
        Width = 601
        Height = 93
        Caption = 'C'#225'lculo do Imposto'
        TabOrder = 4
        object Label17: TLabel
          Left = 17
          Top = 15
          Width = 90
          Height = 14
          Caption = 'Base C'#225'lculo ICMS'
        end
        object Label6: TLabel
          Left = 135
          Top = 15
          Width = 52
          Height = 14
          Caption = 'Valor ICMS'
        end
        object Label7: TLabel
          Left = 253
          Top = 15
          Width = 91
          Height = 14
          Caption = 'Base ICMS (Subst)'
        end
        object Label8: TLabel
          Left = 371
          Top = 15
          Width = 91
          Height = 14
          Caption = 'Valor ICMS (Subst)'
        end
        object Label9: TLabel
          Left = 489
          Top = 15
          Width = 96
          Height = 14
          Caption = 'Valor Total Produtos'
        end
        object Label10: TLabel
          Left = 17
          Top = 51
          Width = 68
          Height = 14
          Caption = 'Valor do Frete'
        end
        object Label11: TLabel
          Left = 135
          Top = 51
          Width = 78
          Height = 14
          Caption = 'Valor do Seguro'
        end
        object Label12: TLabel
          Left = 253
          Top = 51
          Width = 85
          Height = 14
          Caption = 'Outras Despesas'
        end
        object Label13: TLabel
          Left = 371
          Top = 51
          Width = 61
          Height = 14
          Caption = 'Valor total IPI'
        end
        object Label14: TLabel
          Left = 489
          Top = 51
          Width = 90
          Height = 14
          Caption = 'Valor Total da Nota'
        end
        object DBEditPrecoVenda: TJvDBCalcEdit
          Left = 15
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          DataField = 'ICMS_BASE'
          DataSource = DataSource1
        end
        object RxDBCalcEdit1: TJvDBCalcEdit
          Left = 133
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          DataField = 'ICMS_VALOR'
          DataSource = DataSource1
        end
        object RxDBCalcEdit2: TJvDBCalcEdit
          Left = 251
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          DataField = 'ICMS_BASESUBST'
          DataSource = DataSource1
        end
        object RxDBCalcEdit3: TJvDBCalcEdit
          Left = 369
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
          DataField = 'ICMS_VALORSUBST'
          DataSource = DataSource1
        end
        object RxDBCalcEdit4: TJvDBCalcEdit
          Left = 487
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
          DataField = 'VR_TOTAL_PROD'
          DataSource = DataSource1
        end
        object RxDBCalcEdit5: TJvDBCalcEdit
          Left = 15
          Top = 63
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 5
          DecimalPlacesAlwaysShown = False
          DataField = 'VALOR_FRETE'
          DataSource = DataSource1
        end
        object RxDBCalcEdit6: TJvDBCalcEdit
          Left = 133
          Top = 63
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 6
          DecimalPlacesAlwaysShown = False
          DataField = 'VALOR_SEGURO'
          DataSource = DataSource1
        end
        object RxDBCalcEdit7: TJvDBCalcEdit
          Left = 251
          Top = 63
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 7
          DecimalPlacesAlwaysShown = False
          DataField = 'OUTRAS_DESPESAS'
          DataSource = DataSource1
        end
        object RxDBCalcEdit8: TJvDBCalcEdit
          Left = 369
          Top = 63
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 8
          DecimalPlacesAlwaysShown = False
          DataField = 'VALOR_IPI'
          DataSource = DataSource1
        end
        object RxDBCalcEdit9: TJvDBCalcEdit
          Left = 487
          Top = 63
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 9
          DecimalPlacesAlwaysShown = False
          DataField = 'VALOR_TOTAL_NOTA'
          DataSource = DataSource1
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 194
        Width = 116
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 7
      end
      object Bt_Pesquisar: TBitBtn
        Left = 632
        Top = 194
        Width = 97
        Height = 25
        Caption = 'Pesquisar - F3'
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
        TabOrder = 8
        TabStop = False
        OnClick = Bt_PesquisarClick
      end
      object GroupBox6: TGroupBox
        Left = 400
        Top = 11
        Width = 209
        Height = 83
        TabOrder = 2
        object Label3: TLabel
          Left = 9
          Top = 24
          Width = 52
          Height = 14
          Caption = 'N'#186' da Nota'
        end
        object Label15: TLabel
          Left = 144
          Top = 24
          Width = 27
          Height = 14
          Caption = 'CFOP'
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 36
          Width = 121
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'NUM_DOCUMENTO'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 144
          Top = 36
          Width = 57
          Height = 21
          AutoSize = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'CFOP'
          DataSource = DataSource1
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 616
        Top = 95
        Width = 113
        Height = 93
        TabOrder = 5
        object Label18: TLabel
          Left = 8
          Top = 15
          Width = 75
          Height = 14
          Caption = 'Desconto Geral'
        end
        object RxDBCalcEdit10: TJvDBCalcEdit
          Left = 6
          Top = 27
          Width = 100
          Height = 22
          Color = clBtnFace
          DisplayFormat = ',0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          DataField = 'DESCONTO_TOTAL'
          DataSource = DataSource1
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 136
        Top = 188
        Width = 473
        Height = 31
        Caption = 'Ordenado por:'
        Columns = 4
        Items.Strings = (
          'Cod. Fornecedor'
          'Nome Fornecedor'
          'Data Entrada'
          'Valor da Nota')
        TabOrder = 6
        OnClick = RadioGroup1Click
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 231
    Width = 753
    Height = 211
    Align = alClient
    TabOrder = 1
    object GroupBox4: TGroupBox
      Left = 8
      Top = 1
      Width = 737
      Height = 208
      Caption = 'Dados do Produto'
      TabOrder = 0
      object Label16: TLabel
        Left = 492
        Top = 183
        Width = 72
        Height = 13
        Caption = 'Total Produtos:'
      end
      object GroupBox9: TGroupBox
        Left = 9
        Top = 172
        Width = 473
        Height = 33
        Caption = 'Filtro'
        TabOrder = 1
        object Label57: TLabel
          Left = 28
          Top = 13
          Width = 57
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = ComboBoxFornecedor
        end
        object ComboBoxFornecedor: TComboBox
          Left = 89
          Top = 9
          Width = 376
          Height = 21
          Style = csDropDownList
          Color = clMoneyGreen
          TabOrder = 0
          TabStop = False
          OnChange = ComboBoxFornecedorChange
        end
      end
      object EditTotal: TJvCalcEdit
        Left = 568
        Top = 175
        Width = 161
        Height = 30
        TabStop = False
        AutoSize = False
        Color = clYellow
        DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = False
        TabOrder = 0
        DecimalPlacesAlwaysShown = False
      end
      object wwDBGrid1: TwwDBGrid
        Left = 2
        Top = 15
        Width = 733
        Height = 191
        Selected.Strings = (
          'SEQUENCIAL'#9'4'#9'Seq.'#9'F'
          'COD_PROD_FORNEC'#9'15'#9'Cod. Prod. Fornec.'#9'F'
          'COD_BARRAS'#9'14'#9'C'#243'digo'#9'F'
          'NM_PRODUTO'#9'35'#9'Descri'#231#227'o'#9'F'
          'CST'#9'4'#9'CST'
          'QUANTIDADE'#9'10'#9'Quantidade'#9'F'
          'VALORUNITARIO'#9'10'#9'Vr Unit'#225'rio'#9'F'
          'DESCONTO'#9'10'#9'Desconto'#9'F'
          'VALORTOTAL'#9'10'#9'Valor Total'#9'F'
          'ICMS'#9'6'#9'ICMS'
          'IPI'#9'5'#9'IPI %'#9'F'
          'IPI_VALOR'#9'8'#9'Valor IPI'#9'F'
          'OUTRASDESPESAS'#9'10'#9'Outras Desp.'#9'F'
          'UNDCONVERSAO'#9'9'#9'Und Conv.'#9'F'
          'MARGEMLUCRO'#9'7'#9'Margem'#9'F'
          'PRECOVENDA'#9'10'#9'Pre'#231'o Venda'#9'F'
          'LOTE_VENCIMENTO'#9'10'#9'Vencimento'#9'F'
          'LOTE_NUM'#9'8'#9'Lote'#9'F'
          'OBS'#9'10'#9'Obs'#9'F')
        IniAttributes.Enabled = True
        IniAttributes.SaveToRegistry = True
        IniAttributes.Delimiter = ';;'
        IniAttributes.CheckNewFields = True
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clMoneyGreen
        DataSource = DataSource2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnTitleButtonClick = wwDBGrid1TitleButtonClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 442
    Width = 753
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Bt_Sair: TBitBtn
      Left = 646
      Top = 8
      Width = 97
      Height = 25
      Caption = '&Sair'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000030F0000030F00000001000000010000B55A0000BD5A
        0000C65A0000CE630000CE6B0000D66B0000D6730000DE730000DE7B0000E77B
        0000EF7B0000F77B000000840000F7840000FF840000009C0000DE7B0800F784
        0800AD5A100094521800E77B1800DE84180008A5180008AD180010AD1800DE73
        290021AD310018BD310021BD31008C4A390029BD39004242420029C64A0031C6
        4A008C63630042D66B0084848400FFE7C600FFEFD600FFF7D600FFF7DE00FF00
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00292929292929
        29292929292929292929292929291F1F1F1F292929292929292929221F1F1D13
        001F2222222222222929292200001200021F160C0C0C16222929292202020202
        031F211818180F222929292202030303031F211C1C2023222929292203040404
        061F0C1A1E2123222929292204041528061F0C0C0C0F0F222929292206061006
        061F2525252525222929292206060808081F2626262626222929292208090909
        0A1F272828282822292929220E0D0A0A0A1F272727272722292929220E0E110D
        0E1F27272727272229292929222219140E1F2424242424242929292929292222
        221F292929292929292929292929292929292929292929292929}
      ParentDoubleBuffered = False
      TabOrder = 0
      TabStop = False
      OnClick = Bt_SairClick
    end
    object btGrade: TBitBtn
      Left = 288
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Grd (F6)'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000130B0000130B00000001000000010000EF9C2100F7A5
        5A00FFB56B00FFE7C600FFF7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00050505050505
        0505050505050505050505050505050505050505050505050505020202020202
        0202020202020202020202060602030304020303040203030402020606020303
        0402030304020303040202060602020202020202020202020202020606020303
        0402030304020303040201010101030304010303040103030401010606010101
        0101010101010101010101060601030304010303040103030401000606000303
        0400030304000303040000000000000000000000000000000000000606000606
        0606060006060606060000060600060606060600060606060600000000000000
        0000000000000000000005050505050505050505050505050505}
      ParentDoubleBuffered = False
      TabOrder = 1
      TabStop = False
      OnClick = btGradeClick
    end
    object btNumSerie: TBitBtn
      Left = 384
      Top = 9
      Width = 73
      Height = 25
      Caption = 'S'#233'rie (F7)'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000230B0000230B0000000100000001000000000000CECE
        CE00D6D6D600E7E7E700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
        0404040404040404040404040303030303030301010101010404040305050500
        0303000300010101010404030505050005000503000301010104040305000505
        0505050505030300010404030500050505050505050503000104040305000500
        0005000005000300010404030500050000050000050005000304040305000500
        0005000005000500030404030500050000050000050005000304040403030303
        0303030303030303040404040404040404040404040404040404040404040404
        0404040404040404040404040404040404040404040404040404}
      ParentDoubleBuffered = False
      TabOrder = 2
      TabStop = False
      OnClick = btNumSerieClick
    end
  end
  object DataSource1: TDataSource
    DataSet = IBNotasFechadas
    OnDataChange = DataSource1DataChange
    Left = 440
    Top = 72
  end
  object DataSource2: TDataSource
    AutoEdit = False
    Left = 24
    Top = 336
  end
  object IBNotasFechadas: TIBOQuery
    Params = <>
    DatabaseName = 'F:\Fontes\Focus\FOCUS.FOC'
    IB_Transaction = TrNotasFechadas
    KeyLinks.Strings = (
      'ENTRADA.CD_NOTA')
    RecordCountAccurate = True
    SQL.Strings = (
      'Select * from ENTRADA')
    FieldOptions = []
    Left = 480
    Top = 75
  end
  object TrNotasFechadas: TIBOTransaction
    Isolation = tiCommitted
    Left = 512
    Top = 75
  end
end
