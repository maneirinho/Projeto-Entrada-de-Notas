object fDadosDoProduto: TfDadosDoProduto
  Left = 69
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Dados do Produto'
  ClientHeight = 626
  ClientWidth = 1018
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelCadastro: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 163
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object PanelInforme2: TPanel
      Left = 745
      Top = 54
      Width = 272
      Height = 59
      BevelOuter = bvNone
      Color = clRed
      TabOrder = 2
    end
    object PanelInforme: TPanel
      Left = 676
      Top = 101
      Width = 393
      Height = 91
      BevelOuter = bvNone
      Color = clRed
      TabOrder = 1
      object lbInforme: TLabel
        Left = 16
        Top = 32
        Width = 358
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 'Informe o Produto...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clPurple
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBoxProduto: TGroupBox
      Left = 0
      Top = 0
      Width = 686
      Height = 163
      Align = alLeft
      TabOrder = 0
      object Label17: TLabel
        Left = 17
        Top = 8
        Width = 89
        Height = 13
        Caption = 'C'#243'd. Prod. Fornec.'
      end
      object lbCapCodigo: TLabel
        Left = 16
        Top = 47
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label4: TLabel
        Left = 16
        Top = 84
        Width = 103
        Height = 13
        Caption = 'Descri'#231#227'o do Produto'
      end
      object Bevel1: TBevel
        Left = 335
        Top = 15
        Width = 9
        Height = 74
        Shape = bsLeftLine
      end
      object Label5: TLabel
        Left = 530
        Top = 126
        Width = 23
        Height = 13
        Caption = 'Und.'
      end
      object Label38: TLabel
        Left = 346
        Top = 59
        Width = 50
        Height = 13
        Caption = 'Fabricante'
      end
      object btCadastrarProduto: TSpeedButton
        Left = 120
        Top = 10
        Width = 216
        Height = 22
        Caption = 'F2 - Cadastrar Novo Produto        '
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000031319C003131
          A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
          E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
          FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
          FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
          1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
          0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
          0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
          0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
          1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
          0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
          111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
          0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
        OnClick = btCadastrarProdutoClick
      end
      object Bt_Pesquisar: TSpeedButton
        Left = 122
        Top = 32
        Width = 211
        Height = 22
        Caption = ' F3 - Localizar Produto Cadastrado'
        Flat = True
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
        OnClick = Bt_PesquisarClick
      end
      object btAlterarProduto: TSpeedButton
        Left = 120
        Top = 54
        Width = 216
        Height = 22
        Caption = 'F5 - Alterar Dados do Produto      '
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000E30E0000E30E0000000100000001000031319C003131
          A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
          E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
          FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
          FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
          1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
          0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
          0E0E0E0E0E0E0B08031B1B0A0E1818181818181818181809041B1B0E0E181B1B
          1B1B1B1B1B1B180A051B1B0E0E0E181B1B1B1B1B1B180B0A061B1B0E0E0E0E18
          1B1B1B1B180B0A0A061B1B0E10100E0E181B1B180E0B0A0A061B1B0E1313100E
          0E18180E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
          11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
          0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
        Visible = False
        OnClick = btAlterarProdutoClick
      end
      object lbCaptionPesoLiquido: TLabel
        Left = 561
        Top = 126
        Width = 61
        Height = 13
        Caption = 'Peso Liquido'
      end
      object lbCaptionPesoBruto: TLabel
        Left = 630
        Top = 126
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object lbCodigo: TLabel
        Left = 16
        Top = 61
        Width = 104
        Height = 18
        Caption = '1234567890123'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbFabricante: TLabel
        Left = 346
        Top = 71
        Width = 146
        Height = 16
        Caption = 'NOME DO FABRICANTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbUnidade: TLabel
        Left = 532
        Top = 138
        Width = 18
        Height = 16
        Caption = 'UN'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPesoLiquido: TLabel
        Left = 590
        Top = 138
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Caption = '0,000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbPesoBruto: TLabel
        Left = 650
        Top = 138
        Width = 32
        Height = 16
        Alignment = taRightJustify
        Caption = '0,000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 346
        Top = 13
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object lbNMProduto: TLabel
        Left = 17
        Top = 97
        Width = 334
        Height = 22
        Caption = 'Nome do Produto Nome do Produto '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNMProduto: TEdit
        Left = 16
        Top = 96
        Width = 25
        Height = 24
        TabStop = False
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Visible = False
        OnChange = edNMProdutoChange
      end
      object EditCodProdFornec: TEdit
        Left = 16
        Top = 20
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = EditCodProdFornecExit
      end
      object MemoObsProduto: TMemo
        Left = 16
        Top = 124
        Width = 508
        Height = 34
        Hint = 'Observa'#231#227'o do cadastro do produto'
        TabStop = False
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
      end
      object BitBtn1: TBitBtn
        Left = 661
        Top = 27
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
        TabStop = False
        OnClick = BitBtn1Click
      end
      object edGrupo: TEdit
        Left = 346
        Top = 28
        Width = 314
        Height = 21
        TabStop = False
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
    end
    object PanelValoresAtuais: TPanel
      Left = 686
      Top = 0
      Width = 332
      Height = 163
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object GroupBoxValoresAtuais: TGroupBox
        Left = 1
        Top = 0
        Width = 331
        Height = 163
        Align = alRight
        Color = 10930928
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object Label1: TLabel
          Left = 37
          Top = 106
          Width = 85
          Height = 13
          Caption = 'Pre'#231'o Custo Atual'
        end
        object Label2: TLabel
          Left = 213
          Top = 106
          Width = 89
          Height = 13
          Caption = 'Pre'#231'o Venda Atual'
        end
        object Label25: TLabel
          Left = 134
          Top = 106
          Width = 65
          Height = 13
          Caption = 'Margem Atual'
        end
        object bt_UltimasVendas: TSpeedButton
          Left = 161
          Top = 27
          Width = 72
          Height = 21
          Cursor = crHandPoint
          Caption = #218'lt. Vendas'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = bt_UltimasVendasClick
        end
        object bt_VendaMensal: TSpeedButton
          Left = 242
          Top = 27
          Width = 72
          Height = 21
          Cursor = crHandPoint
          Caption = 'Venda Mens.'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = bt_VendaMensalClick
        end
        object Bt_UltimasCompras: TSpeedButton
          Left = 15
          Top = 27
          Width = 72
          Height = 21
          Cursor = crHandPoint
          Caption = '&'#218'lt. Compras'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = Bt_UltimasComprasClick
        end
        object bt_AuditEstoque: TSpeedButton
          Left = 87
          Top = 27
          Width = 72
          Height = 21
          Cursor = crHandPoint
          Caption = 'Aud. Etoq.'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = bt_AuditEstoqueClick
        end
        object Label44: TLabel
          Left = 231
          Top = 64
          Width = 69
          Height = 13
          Caption = #218'ltimo reajuste'
        end
        object lbUltimoReajuste: TLabel
          Left = 233
          Top = 80
          Width = 64
          Height = 16
          Caption = '14/06/2008'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCapInformacoes: TLabel
          Left = 131
          Top = 8
          Width = 70
          Height = 13
          Caption = 'Informa'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel3: TBevel
          Left = 5
          Top = 17
          Width = 318
          Height = 8
          Shape = bsBottomLine
        end
        object Bevel4: TBevel
          Left = 7
          Top = 45
          Width = 318
          Height = 8
          Shape = bsBottomLine
        end
        object Label27: TLabel
          Left = 33
          Top = 64
          Width = 68
          Height = 13
          Caption = #218'ltima Compra'
        end
        object lbUltimaCompra: TLabel
          Left = 35
          Top = 80
          Width = 64
          Height = 16
          Caption = '14/06/2008'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 131
          Top = 64
          Width = 63
          Height = 13
          Caption = #218'ltima Venda'
        end
        object lbUltimaVenda: TLabel
          Left = 131
          Top = 80
          Width = 64
          Height = 16
          Caption = '14/06/2008'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edCustoAtual: TJvCalcEdit
          Left = 36
          Top = 119
          Width = 91
          Height = 24
          Cursor = crHelp
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DecimalPlaces = 0
          DisplayFormat = 'R$ ,0.00#;-R$ ,0.00#'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowButton = False
          ShowHint = True
          TabOrder = 0
          Value = 999999.000000000000000000
          DecimalPlacesAlwaysShown = False
        end
        object edMargemAtual: TJvCalcEdit
          Left = 131
          Top = 119
          Width = 73
          Height = 24
          Cursor = crNo
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DisplayFormat = ',0.00%;-,0.00%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          OnExit = edMargemLucroExit
          OnKeyPress = edQuantidadeKeyPress
        end
        object edPrecoVendaAtual: TJvCalcEdit
          Left = 208
          Top = 119
          Width = 98
          Height = 24
          Cursor = crNo
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DecimalPlaces = 0
          DisplayFormat = 'R$ ,0.00#;-R$ ,0.00#'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          Value = 999999.000000000000000000
          DecimalPlacesAlwaysShown = False
        end
      end
    end
  end
  object PanelQuantidade: TPanel
    Left = 0
    Top = 163
    Width = 1018
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBoxValorEQuantidade: TGroupBox
      Left = 145
      Top = 0
      Width = 871
      Height = 62
      Align = alLeft
      TabOrder = 0
      object Label22: TLabel
        Left = 779
        Top = 11
        Width = 66
        Height = 13
        Caption = 'Estoque Atual'
      end
      object btAlteraEstoque: TSpeedButton
        Left = 844
        Top = 23
        Width = 22
        Height = 27
        Hint = 'Altera o Estoque deste Produto'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000320B0000320B0000000100000001000000000000CE63
          00000010180039082100A56B2900DE8C3900E7396300526B7B0000089C007B9C
          A500D6CEAD00F7D6AD00FFD6AD00ADB5BD00B5C6C600BDC6C600C6C6C600FFE7
          C600ADC6CE00FFEFD6002163DE00FFEFDE00FFF7E700FFFFF700FF00FF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00181818181818
          1818181818181818181818010101010101010101010101010101180119191716
          1311070A0B0C0C0C0C011801190F0F0F0F0F0700120F0F0F0C01180119191919
          17160700000C0B0C0C011801190F0F0F0F0F071505000E0F0C01180119191919
          1919091505000C0C0C011801190F0F0F0F0F0F071505000D0C01180119191919
          191919091505000C0C011801190F0F0F0F0F0F0F071505000C01180119191919
          19191919091505020C0118011919191919191919190700140001180101010101
          0101010101041414030118180101010101010101010108080618181818181818
          1818181818181818181818181818181818181818181818181818}
        ParentShowHint = False
        ShowHint = True
        OnClick = btAlteraEstoqueClick
      end
      object lbCaptionEstoqueMinimo: TLabel
        Left = 728
        Top = 12
        Width = 40
        Height = 13
        Caption = 'Est.M'#237'n.'
      end
      object Panel2: TPanel
        Left = 6
        Top = 6
        Width = 563
        Height = 46
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          563
          46)
        object Label7: TLabel
          Left = 3
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Quantidade'
        end
        object LabelUndConversao: TLabel
          Tag = 111
          Left = 92
          Top = 8
          Width = 54
          Height = 13
          Caption = 'Und. Conv.'
          OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
        end
        object Label6: TLabel
          Left = 161
          Top = 6
          Width = 82
          Height = 13
          Caption = 'Quantidade Total'
        end
        object Label32: TLabel
          Left = 79
          Top = 24
          Width = 9
          Height = 16
          Alignment = taRightJustify
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 149
          Top = 21
          Width = 8
          Height = 16
          Alignment = taRightJustify
          Caption = '='
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edQuantidade: TJvCalcEdit
          Left = 3
          Top = 20
          Width = 73
          Height = 21
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ShowButton = False
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
          OnChange = edQuantidadeChange
          OnExit = edQuantidadeExit
          OnKeyDown = edQuantidadeKeyDown
          OnKeyPress = edQuantidadeKeyPress
        end
        object edUndConversao: TJvCalcEdit
          Tag = 111
          Left = 91
          Top = 20
          Width = 55
          Height = 21
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          ShowButton = False
          TabOrder = 1
          Value = 9999.000000000000000000
          DecimalPlacesAlwaysShown = False
          OnExit = edQuantidadeExit
          OnKeyPress = edQuantidadeKeyPress
          OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
        end
        object btGrade: TBitBtn
          Left = 258
          Top = 17
          Width = 95
          Height = 25
          Caption = 'Grade (F6)'
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
          TabOrder = 3
          TabStop = False
          OnClick = btGradeClick
        end
        object btNumSerie: TBitBtn
          Left = 359
          Top = 17
          Width = 95
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
          TabOrder = 4
          TabStop = False
          OnClick = btNumSerieClick
        end
        object edQuantTotal: TJvCalcEdit
          Left = 167
          Top = 18
          Width = 80
          Height = 24
          TabStop = False
          BevelInner = bvNone
          DragCursor = crNo
          AutoSize = False
          ClickKey = 0
          Color = clBtnFace
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Anchors = []
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
        end
        object btMedicamento: TBitBtn
          Left = 460
          Top = 17
          Width = 95
          Height = 25
          Caption = 'Lotes (F8)'
          DoubleBuffered = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000FFFFFF000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000FFFF00FFFFFF800000FF0000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000FFFF00FFFFFFFF0000FF8000
            00FF000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000FFFF800000FF800000FF0000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF0000FF800000FF800000FF008080FF0000
            80FF000000000000000000000000000000000000000000000000000000000000
            00000000000000000000FF0000FFFF0000FF800000FF00FFFFFF008080FF0000
            FFFF000080FF0000000000000000000000000000000000000000000000000000
            00000000000000000000FF0000FF800000FF0000000000FFFFFF008080FF0000
            FFFF000080FF0000000000000000000000000000000000000000000000000000
            00000000000000000000FF0000FFFF0000FF800000FF00FFFFFF008080FF0000
            80FF0000FFFF0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF0000FF000080FF000080FF0000FFFF0000
            FFFF000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000FFFF000080FF0000FFFF0000FFFF008080FFFF00
            00FF800000FF0000000000000000000000000000000000000000000000000000
            000000000000000000000000FFFF000080FF0000000000FFFFFF008080FF0000
            0000FF0000FF800000FF00000000000000000000000000000000008080FF0080
            80FF008080FF008080FF0000FFFF000080FF000080FF00FFFFFF008080FFFF00
            00FF800000FF800000FF00FFFFFF008080FF00FFFFFF008080FF008080FF00FF
            FFFF008080FF00FFFFFF0000FFFF0000FFFF000080FF00FFFFFF800000FF8000
            00FF800000FF008080FF00FFFFFF008080FF00FFFFFF008080FF000000000080
            80FF00FFFFFF008080FF00FFFFFF0000FFFF0000FFFF00FFFFFFFF0000FFFF00
            00FF008080FF00FFFFFF008080FF00FFFFFF008080FF00000000000000000000
            0000008080FF00FFFFFF008080FF008080FF00000000008080FF000000000000
            0000008080FF008080FF00FFFFFF008080FF0000000000000000000000000000
            000000000000008080FF008080FF0000000000FFFFFF00FFFFFF008080FF0000
            000000000000008080FF008080FF000000000000000000000000}
          ParentDoubleBuffered = False
          TabOrder = 5
          TabStop = False
          OnClick = btMedicamentoClick
        end
      end
      object edEstoqueAtual: TJvCalcEdit
        Left = 777
        Top = 26
        Width = 65
        Height = 24
        Cursor = crNo
        TabStop = False
        AutoSize = False
        ClickKey = 0
        Color = clInfoBk
        DecimalPlaces = 3
        DisplayFormat = '0.###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = False
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
      end
      object GroupBoxCaixaFechada: TGroupBox
        Left = 575
        Top = 6
        Width = 148
        Height = 48
        TabOrder = 1
        object Label31: TLabel
          Left = 7
          Top = 14
          Width = 72
          Height = 12
          Caption = 'C'#243'd. Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 96
          Top = 14
          Width = 48
          Height = 12
          Caption = 'Und. Conv.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object edCodCaixa: TEdit
          Left = 4
          Top = 24
          Width = 89
          Height = 22
          CharCase = ecUpperCase
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          MaxLength = 13
          ParentFont = False
          TabOrder = 1
        end
        object edUndConvCaixa: TJvCalcEdit
          Left = 96
          Top = 24
          Width = 47
          Height = 22
          AutoSize = False
          DecimalPlaces = 3
          DisplayFormat = ',0.000;-,0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ShowButton = False
          TabOrder = 2
          Value = 999.000000000000000000
          DecimalPlacesAlwaysShown = False
          OnKeyPress = edQuantidadeKeyPress
        end
        object CBCaixaFechada: TCheckBox
          Left = 7
          Top = 4
          Width = 121
          Height = 12
          TabStop = False
          Caption = 'Embalagem Fechada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = CBCaixaFechadaClick
        end
      end
      object edEstoqueMinimo: TJvCalcEdit
        Left = 726
        Top = 26
        Width = 48
        Height = 24
        Cursor = crNo
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        ShowButton = False
        TabOrder = 2
        DecimalPlacesAlwaysShown = False
      end
    end
    object PanelInfoFiscal: TPanel
      Left = 0
      Top = 0
      Width = 145
      Height = 62
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBoxFiscal: TGroupBox
        Left = 0
        Top = 0
        Width = 145
        Height = 62
        Align = alClient
        Caption = 'Fiscal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object LabelExIPI: TLabel
          Tag = 111
          Left = 7
          Top = 16
          Width = 26
          Height = 12
          Caption = 'EX IPI'
          OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
        end
        object LabelClassFiscal: TLabel
          Tag = 111
          Left = 42
          Top = 16
          Width = 21
          Height = 12
          Caption = 'NCM'
          OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
        end
        object LabelCFOP: TLabel
          Tag = 111
          Left = 105
          Top = 16
          Width = 26
          Height = 12
          Caption = 'CFOP'
          OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
        end
        object edEXIPI: TJvCalcEdit
          Left = 6
          Top = 29
          Width = 30
          Height = 19
          Cursor = crNo
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DecimalPlaces = 0
          DisplayFormat = '000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 0
          Value = 123.000000000000000000
          DecimalPlacesAlwaysShown = False
        end
        object edClassFiscal: TJvCalcEdit
          Left = 42
          Top = 29
          Width = 57
          Height = 19
          Cursor = crNo
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxLength = 8
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 1
          Value = 12345678.000000000000000000
          DecimalPlacesAlwaysShown = False
        end
        object edCFOP: TJvCalcEdit
          Left = 105
          Top = 29
          Width = 34
          Height = 19
          Cursor = crNo
          TabStop = False
          AutoSize = False
          ClickKey = 0
          Color = clInfoBk
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxLength = 4
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          Value = 1234.000000000000000000
          DecimalPlacesAlwaysShown = False
        end
      end
    end
  end
  object PanelFinanceiro: TPanel
    Left = 0
    Top = 225
    Width = 1018
    Height = 336
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 1018
      Height = 336
      Align = alClient
      Caption = 'Financeiro'
      TabOrder = 0
      object PanelCusto: TPanel
        Left = 2
        Top = 269
        Width = 1014
        Height = 84
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          1014
          84)
        object Bevel2: TBevel
          Left = 124
          Top = 6
          Width = 196
          Height = 40
        end
        object Label36: TLabel
          Left = 225
          Top = 7
          Width = 51
          Height = 13
          Caption = 'Valor Total'
        end
        object Label37: TLabel
          Left = 129
          Top = 23
          Width = 9
          Height = 16
          Alignment = taRightJustify
          Caption = 'X'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 215
          Top = 24
          Width = 8
          Height = 16
          Alignment = taRightJustify
          Caption = '='
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 139
          Top = 6
          Width = 55
          Height = 13
          Caption = 'Quantidade'
        end
        object GroupBoxPrecoVenda: TGroupBox
          Left = 441
          Top = 0
          Width = 253
          Height = 65
          TabOrder = 4
          object Label16: TLabel
            Left = 110
            Top = 7
            Width = 49
            Height = 13
            Caption = 'Margem %'
          end
          object Label19: TLabel
            Left = 166
            Top = 5
            Width = 62
            Height = 13
            Caption = 'Pre'#231'o Venda'
          end
          object Label14: TLabel
            Left = 13
            Top = 3
            Width = 73
            Height = 13
            Caption = 'Pre'#231'o de Custo'
          end
          object edMargemLucro: TJvCalcEdit
            Left = 110
            Top = 21
            Width = 41
            Height = 21
            AutoSize = False
            DisplayFormat = ',0.00;-,0.00'
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnEnter = edMargemLucroEnter
            OnExit = edMargemLucroExit
            OnKeyPress = edQuantidadeKeyPress
          end
          object edPrecoVenda: TJvCalcEdit
            Left = 161
            Top = 21
            Width = 81
            Height = 24
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = 'R$ ,0.00#;-R$ ,0.00#'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ShowButton = False
            TabOrder = 1
            DecimalPlacesAlwaysShown = False
            OnEnter = edPrecoVendaEnter
            OnExit = edPrecoVendaExit
            OnKeyPress = edQuantidadeKeyPress
          end
          object CBAtualizaSimilares: TCheckBox
            Left = 161
            Top = 44
            Width = 84
            Height = 17
            TabStop = False
            Caption = 'Atualiza Simil.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            PopupMenu = PopupMenu
            TabOrder = 2
          end
          object edPrecoCusto: TJvCalcEdit
            Left = 13
            Top = 17
            Width = 91
            Height = 27
            Cursor = crNo
            TabStop = False
            BevelKind = bkSoft
            AutoSize = False
            BorderStyle = bsNone
            ClickKey = 0
            Color = clYellow
            DecimalPlaces = 0
            DisplayFormat = ',0.00#;-,0.00#'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ShowButton = False
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
          end
          object cbUtilizaCustoMedio: TCheckBox
            Left = 6
            Top = 44
            Width = 108
            Height = 17
            Cursor = crHelp
            TabStop = False
            Caption = 'Utiliza Custo M'#233'd.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            PopupMenu = PopupMenu
            ShowHint = True
            TabOrder = 4
            OnClick = cbUtilizaCustoMedioClick
          end
        end
        object GroupBoxCustoUnitario: TGroupBox
          Left = 326
          Top = 0
          Width = 109
          Height = 46
          Caption = 'Custo Unit'#225'rio Real'
          TabOrder = 3
          object edCustoUnitario: TJvCalcEdit
            Left = 3
            Top = 17
            Width = 101
            Height = 26
            TabStop = False
            AutoSize = False
            ClickKey = 0
            Color = clBtnFace
            DecimalPlaces = 0
            DisplayFormat = 'R$ ,0.00#;-R$ ,0.00#'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnChange = edCustoUnitarioChange
          end
        end
        object edValorTotal: TJvCalcEdit
          Left = 225
          Top = 19
          Width = 89
          Height = 23
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DecimalPlaces = 3
          DisplayFormat = 'R$ ,0.000;-R$ ,0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
          OnExit = EditCSTExit
          OnKeyPress = edQuantidadeKeyPress
        end
        object edQuantidade2: TJvCalcEdit
          Left = 139
          Top = 18
          Width = 73
          Height = 23
          TabStop = False
          BevelInner = bvNone
          AutoSize = False
          ClickKey = 0
          Color = clBtnFace
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Anchors = []
          ParentFont = False
          ReadOnly = True
          ShowButton = False
          TabOrder = 1
          Value = 99999.999000000000000000
          DecimalPlacesAlwaysShown = False
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 120
          Height = 43
          Caption = 'Valor Unit'#225'rio'
          TabOrder = 0
          object edValorUnitario: TJvCalcEdit
            Left = 5
            Top = 14
            Width = 111
            Height = 25
            AutoSize = False
            DecimalPlaces = 3
            DisplayFormat = 'R$ ,0.00#;-R$ ,0.00#'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ShowButton = False
            TabOrder = 0
            DecimalPlacesAlwaysShown = False
            OnExit = edQuantidadeExit
            OnKeyPress = edQuantidadeKeyPress
          end
        end
        object gbFrete: TGroupBox
          Left = 700
          Top = 0
          Width = 154
          Height = 47
          Caption = 'Frete'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          object Label3: TLabel
            Left = 9
            Top = 11
            Width = 43
            Height = 14
            Caption = 'Chegada'
          end
          object Label9: TLabel
            Left = 82
            Top = 11
            Width = 27
            Height = 14
            Caption = 'Sa'#237'da'
          end
          object edFreteChegada: TJvCalcEdit
            Left = 6
            Top = 22
            Width = 68
            Height = 22
            TabStop = False
            DisplayFormat = ',0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 0
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            OnKeyPress = edFreteChegadaKeyPress
          end
          object edFreteSaida: TJvCalcEdit
            Left = 79
            Top = 22
            Width = 68
            Height = 22
            TabStop = False
            DisplayFormat = ',0.00'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ShowButton = False
            TabOrder = 1
            ZeroEmpty = False
            DecimalPlacesAlwaysShown = False
            OnKeyPress = edFreteSaidaKeyPress
          end
        end
      end
      object PanelImpDesp: TPanel
        Left = 2
        Top = 29
        Width = 1014
        Height = 240
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object GroupBoxImpostoseDepesas: TGroupBox
          Left = 0
          Top = 0
          Width = 1014
          Height = 240
          Align = alClient
          Color = clMoneyGreen
          ParentColor = False
          TabOrder = 0
          object GroupBox3: TGroupBox
            Left = 2
            Top = 15
            Width = 1010
            Height = 53
            Align = alTop
            TabOrder = 0
            object Label47: TLabel
              Left = 424
              Top = 23
              Width = 8
              Height = 16
              Alignment = taRightJustify
              Caption = '='
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label48: TLabel
              Left = 435
              Top = 7
              Width = 24
              Height = 13
              Caption = 'Total'
            end
            object Bevel5: TBevel
              Left = 535
              Top = 2
              Width = 9
              Height = 48
              Shape = bsLeftLine
            end
            object edTotalAcrescimos: TJvCalcEdit
              Left = 434
              Top = 19
              Width = 90
              Height = 27
              Cursor = crNo
              TabStop = False
              AutoSize = False
              ClickKey = 0
              Color = clInfoBk
              DecimalPlaces = 0
              DisplayFormat = 'R$ ,0.00;R$ -,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -15
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              ShowButton = False
              TabOrder = 1
              DecimalPlacesAlwaysShown = False
              OnMouseDown = LabelCOFINSSTValorAliquotaMouseDown
            end
            object GroupBox9: TGroupBox
              Left = 3
              Top = 2
              Width = 420
              Height = 47
              Color = clMoneyGreen
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              object Label11: TLabel
                Left = 182
                Top = 3
                Width = 36
                Height = 12
                Alignment = taRightJustify
                Caption = '+ Outros'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label12: TLabel
                Left = 4
                Top = 3
                Width = 30
                Height = 12
                Alignment = taRightJustify
                Caption = '+ Frete'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label13: TLabel
                Left = 64
                Top = 3
                Width = 37
                Height = 12
                Alignment = taRightJustify
                Caption = '+ Seguro'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label35: TLabel
                Left = 123
                Top = 3
                Width = 46
                Height = 12
                Alignment = taRightJustify
                Caption = '- Desconto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Left = 241
                Top = 3
                Width = 45
                Height = 12
                Alignment = taRightJustify
                Caption = '+ ICMS ST'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label10: TLabel
                Left = 303
                Top = 3
                Width = 57
                Height = 12
                Alignment = taRightJustify
                Caption = '+ Imp.Import.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object Label20: TLabel
                Left = 359
                Top = 3
                Width = 20
                Height = 12
                Alignment = taRightJustify
                Caption = '+ IPI'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
              object edOutrosVal: TJvCalcEdit
                Left = 182
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
              end
              object edFreteVal: TJvCalcEdit
                Left = 4
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = False
              end
              object edSeguroVal: TJvCalcEdit
                Left = 64
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
              end
              object edDescontoVal: TJvCalcEdit
                Left = 123
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '- ,0.00;- -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
              end
              object edICMSSTVal: TJvCalcEdit
                Left = 241
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
              end
              object edIIVal: TJvCalcEdit
                Left = 300
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 5
                DecimalPlacesAlwaysShown = False
              end
              object edIPIVal: TJvCalcEdit
                Left = 359
                Top = 18
                Width = 57
                Height = 23
                TabStop = False
                AutoSize = False
                ClickKey = 0
                Color = clInfoBk
                DecimalPlaces = 0
                DisplayFormat = '+ ,0.00;+ -,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMaroon
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 6
                DecimalPlacesAlwaysShown = False
              end
            end
            object GroupBox4: TGroupBox
              Left = 548
              Top = 0
              Width = 463
              Height = 50
              Caption = 'IPI'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object LabelIPIPorc: TLabel
                Tag = 111
                Left = 294
                Top = 31
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelIPIValorUnit: TLabel
                Tag = 111
                Left = 371
                Top = 14
                Width = 28
                Height = 12
                Caption = '$ Unit.'
              end
              object LabelIPIValorTotal: TLabel
                Tag = 111
                Left = 370
                Top = 31
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelIPICST: TLabel
                Tag = 111
                Left = 27
                Top = 14
                Width = 18
                Height = 12
                Caption = 'CST'
              end
              object LabelIPIClEnq: TLabel
                Tag = 111
                Left = 3
                Top = 31
                Width = 41
                Height = 12
                Caption = 'Clas.Enq.'
              end
              object LabelIPICodEnq: TLabel
                Tag = 111
                Left = 89
                Top = 14
                Width = 39
                Height = 12
                Caption = 'C'#243'd.Enq.'
              end
              object LabelIPIQuantSelo: TLabel
                Tag = 111
                Left = 173
                Top = 14
                Width = 36
                Height = 12
                Caption = 'Qtd.Selo'
              end
              object LabelIPIBC: TLabel
                Tag = 111
                Left = 291
                Top = 14
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelIPICodSelo: TLabel
                Tag = 111
                Left = 90
                Top = 31
                Width = 38
                Height = 12
                Caption = 'C'#243'd.Selo'
              end
              object edIPIValorUnit: TJvCalcEdit
                Tag = 111
                Left = 405
                Top = 8
                Width = 56
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 6
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIPIValorTotal: TJvCalcEdit
                Tag = 111
                Left = 405
                Top = 27
                Width = 56
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 7
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIPIBC: TJvCalcEdit
                Tag = 111
                Left = 307
                Top = 8
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 5
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIPICST: TEdit
                Left = 49
                Top = 8
                Width = 38
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 3
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '123'
              end
              object edIPIClassEnq: TEdit
                Left = 49
                Top = 27
                Width = 38
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 3
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                Text = '123'
              end
              object edIPICodEnq: TEdit
                Left = 133
                Top = 8
                Width = 38
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 3
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                Text = '123'
              end
              object edIPICodSelo: TEdit
                Left = 133
                Top = 27
                Width = 154
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 50
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                Text = '12345678901234567890123456789012345678901234567890'
              end
              object edIPIQtdSelo: TEdit
                Left = 218
                Top = 8
                Width = 69
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 9
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                Text = '123456789'
              end
              object edIPIPorc: TJvCalcEdit
                Tag = 111
                Left = 307
                Top = 27
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 8
                DecimalPlacesAlwaysShown = False
                OnExit = edIPIPorcExit
                OnKeyPress = edQuantidadeKeyPress
              end
            end
          end
          object GroupBox5: TGroupBox
            Left = 2
            Top = 68
            Width = 1010
            Height = 56
            Align = alTop
            TabOrder = 1
            object GroupBox6: TGroupBox
              Left = 2
              Top = 1
              Width = 202
              Height = 52
              Caption = 'ICMS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object LabelICMSValorTotal: TLabel
                Tag = 111
                Left = 99
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelICMSCST: TLabel
                Tag = 111
                Left = 10
                Top = 16
                Width = 18
                Height = 12
                Caption = 'CST'
              end
              object LabelICMSBC: TLabel
                Tag = 111
                Left = 17
                Top = 32
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelICMSPorc: TLabel
                Tag = 111
                Left = 124
                Top = 16
                Width = 8
                Height = 12
                Caption = '%'
              end
              object edICMSValorTotal: TJvCalcEdit
                Tag = 111
                Left = 137
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSPorc: TJvCalcEdit
                Tag = 111
                Left = 137
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSBC: TJvCalcEdit
                Tag = 111
                Left = 34
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSCST: TEdit
                Left = 34
                Top = 10
                Width = 41
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 4
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '1234'
              end
            end
            object GroupBox7: TGroupBox
              Left = 210
              Top = 1
              Width = 553
              Height = 52
              Caption = 'ICMS ST'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object LabelICMSSTBC: TLabel
                Tag = 111
                Left = 125
                Top = 16
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelICMSSTPorcMVA: TLabel
                Tag = 111
                Left = 25
                Top = 16
                Width = 29
                Height = 12
                Caption = '% MVA'
              end
              object LabelICMSSTPorcRedBC: TLabel
                Tag = 111
                Left = 5
                Top = 32
                Width = 50
                Height = 12
                Caption = '% RED. BC'
              end
              object LabelICMSSTPorc: TLabel
                Tag = 111
                Left = 131
                Top = 32
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelICMSSTValorTotal: TLabel
                Tag = 111
                Left = 209
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelICMSSTBCRetido: TLabel
                Tag = 111
                Left = 307
                Top = 32
                Width = 43
                Height = 12
                Caption = 'BC Retido'
              end
              object LabelICMSSTValorTotalRetido: TLabel
                Tag = 111
                Left = 421
                Top = 32
                Width = 57
                Height = 12
                Caption = '$ Total Retido'
              end
              object edICMSSTBC: TJvCalcEdit
                Tag = 111
                Left = 145
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTPorc: TJvCalcEdit
                Tag = 111
                Left = 145
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTPorcRedBC: TJvCalcEdit
                Tag = 111
                Left = 61
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTPorcMVA: TJvCalcEdit
                Tag = 111
                Left = 61
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTValorTotal: TJvCalcEdit
                Tag = 111
                Left = 244
                Top = 29
                Width = 56
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTBCRetido: TJvCalcEdit
                Tag = 111
                Left = 361
                Top = 29
                Width = 56
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 5
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edICMSSTValorTotalRetido: TJvCalcEdit
                Tag = 111
                Left = 492
                Top = 29
                Width = 56
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 6
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
            object GroupBox8: TGroupBox
              Left = 768
              Top = 1
              Width = 240
              Height = 52
              Caption = 'Imp.Import.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              object LabelIIValorTotal: TLabel
                Tag = 111
                Left = 144
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelIIValDespAduaneira: TLabel
                Tag = 111
                Left = 5
                Top = 32
                Width = 62
                Height = 12
                Caption = '$ Desp.Aduan.'
              end
              object LabelIIBC: TLabel
                Tag = 111
                Left = 59
                Top = 16
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelIIValIOF: TLabel
                Tag = 111
                Left = 147
                Top = 16
                Width = 24
                Height = 12
                Caption = '$ IOF'
              end
              object edIIValorTotal: TJvCalcEdit
                Tag = 111
                Left = 178
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIIValDespAduaneira: TJvCalcEdit
                Tag = 111
                Left = 78
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIIBC: TJvCalcEdit
                Tag = 111
                Left = 78
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edIIValIOF: TJvCalcEdit
                Tag = 111
                Left = 178
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
          end
          object GroupBox10: TGroupBox
            Left = 2
            Top = 124
            Width = 1010
            Height = 56
            Align = alTop
            TabOrder = 2
            object GroupBox11: TGroupBox
              Left = 175
              Top = 1
              Width = 334
              Height = 52
              Caption = 'PIS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object LabelPISValorTotal: TLabel
                Tag = 111
                Left = 230
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelPISCST: TLabel
                Tag = 111
                Left = 10
                Top = 16
                Width = 18
                Height = 12
                Caption = 'CST'
              end
              object LabelPISBC: TLabel
                Tag = 111
                Left = 17
                Top = 32
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelPISPorc: TLabel
                Tag = 111
                Left = 121
                Top = 16
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelPISValorAliquota: TLabel
                Tag = 111
                Left = 100
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Al'#237'q.'
              end
              object LabelPISQtdVendida: TLabel
                Tag = 111
                Left = 201
                Top = 16
                Width = 54
                Height = 12
                Caption = 'Qtd. Vendida'
              end
              object edPISValorTotal: TJvCalcEdit
                Tag = 111
                Left = 267
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 5
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISPorc: TJvCalcEdit
                Tag = 111
                Left = 136
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISBC: TJvCalcEdit
                Tag = 111
                Left = 34
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISCST: TEdit
                Left = 34
                Top = 10
                Width = 41
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 3
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '123'
              end
              object edPISValorAliquota: TJvCalcEdit
                Tag = 111
                Left = 136
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISQtdVendida: TJvCalcEdit
                Tag = 111
                Left = 267
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
            object GroupBox12: TGroupBox
              Left = 515
              Top = 1
              Width = 307
              Height = 52
              Caption = 'PIS ST'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object LabelPISSTValorTotal: TLabel
                Tag = 111
                Left = 211
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelPISSTBC: TLabel
                Tag = 111
                Left = 8
                Top = 16
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelPISSTPorc: TLabel
                Tag = 111
                Left = 12
                Top = 32
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelPISSTValorAliquota: TLabel
                Tag = 111
                Left = 101
                Top = 16
                Width = 42
                Height = 12
                Caption = '$ Al'#237'quota'
              end
              object LabelPISSTQtdVendida: TLabel
                Tag = 111
                Left = 88
                Top = 32
                Width = 54
                Height = 12
                Caption = 'Qtd. Vendida'
              end
              object edPISSTValorTotal: TJvCalcEdit
                Tag = 111
                Left = 242
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISSTPorc: TJvCalcEdit
                Tag = 111
                Left = 26
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISSTBC: TJvCalcEdit
                Tag = 111
                Left = 26
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISSTValorAliquota: TJvCalcEdit
                Tag = 111
                Left = 148
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edPISSTQtdVendida: TJvCalcEdit
                Tag = 111
                Left = 148
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
          end
          object GroupBox13: TGroupBox
            Left = 2
            Top = 180
            Width = 1010
            Height = 56
            Align = alTop
            TabOrder = 3
            object GroupBox14: TGroupBox
              Left = 175
              Top = 1
              Width = 334
              Height = 52
              Caption = 'COFINS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object LabelCOFINSValorTotal: TLabel
                Tag = 111
                Left = 231
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelCOFINSCST: TLabel
                Tag = 111
                Left = 10
                Top = 16
                Width = 18
                Height = 12
                Caption = 'CST'
              end
              object LabelCOFINSBC: TLabel
                Tag = 111
                Left = 17
                Top = 32
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelCOFINSPorc: TLabel
                Tag = 111
                Left = 121
                Top = 16
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelCOFINSValorAliquota: TLabel
                Tag = 111
                Left = 100
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Al'#237'q.'
              end
              object LabelCOFINSQtdVendida: TLabel
                Tag = 111
                Left = 202
                Top = 16
                Width = 54
                Height = 12
                Caption = 'Qtd. Vendida'
              end
              object edCOFINSValorTotal: TJvCalcEdit
                Tag = 111
                Left = 268
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 5
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSPorc: TJvCalcEdit
                Tag = 111
                Left = 136
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSBC: TJvCalcEdit
                Tag = 111
                Left = 34
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSCST: TEdit
                Left = 34
                Top = 10
                Width = 41
                Height = 19
                Cursor = crNo
                TabStop = False
                Alignment = taRightJustify
                AutoSize = False
                Color = clInfoBk
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                MaxLength = 3
                NumbersOnly = True
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                Text = '123'
              end
              object edCOFINSAliquotaValor: TJvCalcEdit
                Tag = 111
                Left = 136
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSQtdVendida: TJvCalcEdit
                Tag = 111
                Left = 268
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
            object GroupBox15: TGroupBox
              Left = 515
              Top = 1
              Width = 307
              Height = 52
              Caption = 'COFINS ST'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              object LabelCOFINSSTValorTotal: TLabel
                Tag = 111
                Left = 211
                Top = 32
                Width = 27
                Height = 12
                Caption = '$ Total'
              end
              object LabelCOFINSSTBC: TLabel
                Tag = 111
                Left = 8
                Top = 16
                Width = 13
                Height = 12
                Caption = 'BC'
              end
              object LabelCOFINSSTPorc: TLabel
                Tag = 111
                Left = 12
                Top = 32
                Width = 8
                Height = 12
                Caption = '%'
              end
              object LabelCOFINSSTValorAliquota: TLabel
                Tag = 111
                Left = 101
                Top = 16
                Width = 42
                Height = 12
                Caption = '$ Al'#237'quota'
              end
              object LabelCOFINSSTQtdVendida: TLabel
                Tag = 111
                Left = 87
                Top = 32
                Width = 54
                Height = 12
                Caption = 'Qtd. Vendida'
              end
              object edCOFINSSTValorTotal: TJvCalcEdit
                Tag = 111
                Left = 242
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 4
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSSTPorc: TJvCalcEdit
                Tag = 111
                Left = 26
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00%;-,0.00%'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 1
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSSTBC: TJvCalcEdit
                Tag = 111
                Left = 26
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 0
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSSTValorAliquota: TJvCalcEdit
                Tag = 111
                Left = 148
                Top = 10
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = 'R$ ,0.00;R$ -,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 2
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
              object edCOFINSSTQtdVendida: TJvCalcEdit
                Tag = 111
                Left = 148
                Top = 29
                Width = 59
                Height = 19
                Cursor = crNo
                TabStop = False
                AutoSize = False
                Color = clInfoBk
                DisplayFormat = ',0.00;-,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clMaroon
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                ShowButton = False
                TabOrder = 3
                DecimalPlacesAlwaysShown = False
                OnKeyPress = edQuantidadeKeyPress
              end
            end
          end
        end
      end
      object PanelLigaImpDesp: TPanel
        Left = 2
        Top = 15
        Width = 1014
        Height = 14
        Align = alTop
        BevelOuter = bvNone
        Color = clMoneyGreen
        TabOrder = 0
        object btLigaImpDesp: TSpeedButton
          Left = 0
          Top = 0
          Width = 1061
          Height = 17
          Caption = #183#183#183#183' Impostos e Despesas '#183#183#183#183
          Flat = True
          OnClick = btLigaImpDespClick
        end
      end
    end
  end
  object PanelObs: TPanel
    Left = 0
    Top = 561
    Width = 1018
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label24: TLabel
      Left = 10
      Top = 6
      Width = 22
      Height = 13
      Caption = '&Obs:'
    end
    object MemoObs: TMemo
      Left = 40
      Top = 2
      Width = 969
      Height = 23
      Hint = 'Informa'#231#245'es adicionais do Item na NFe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object PanelBaixo: TPanel
    Left = 0
    Top = 589
    Width = 1018
    Height = 37
    Align = alBottom
    TabOrder = 4
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1016
      Height = 34
      Align = alTop
      TabOrder = 0
      object Bt_Cancelar: TBitBtn
        Left = 933
        Top = 5
        Width = 75
        Height = 25
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
        OnClick = Bt_CancelarClick
      end
      object Bt_Ok: TBitBtn
        Left = 828
        Top = 4
        Width = 99
        Height = 28
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
        TabOrder = 0
        OnClick = Bt_OkClick
      end
      object Bt_Incluir: TBitBtn
        Left = 788
        Top = 4
        Width = 139
        Height = 25
        Caption = 'Incluir Item (F10)'
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130B0000130B000000010000000100002184290039B5
          520063A563006BAD840094DE8C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          0505050505050505050505050505050503000003050505050505050505050505
          0204010005050505050505050505050502040100050505050505050505050505
          0204010005050505050505050505050502040100050505050505050300000000
          0004010000000000030505020101010101010101010101010005050204040404
          0404010404040404000505030202020202040100000000000305050505050505
          0204010005050505050505050505050502040100050505050505050505050505
          0204010005050505050505050505050502040100050505050505050505050505
          0302020305050505050505050505050505050505050505050505}
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = Bt_IncluirClick
      end
      object PanelItem: TPanel
        Left = 1
        Top = 1
        Width = 335
        Height = 32
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 1
        object Label23: TLabel
          Left = 236
          Top = 9
          Width = 38
          Height = 13
          Caption = 'Item N'#186':'
        end
        object Bt_Anterior: TBitBtn
          Left = 8
          Top = 3
          Width = 105
          Height = 25
          Caption = 'Item &Anterior'
          DoubleBuffered = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000E30E0000E30E0000000100000001000010630000006B
            0000086B00000073000008730000007B0000107B000000840000088400001084
            0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
            000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
            000008630800087B0800107B080010840800008C0800088C0800009408001094
            0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
            1000187B10001084100018841000088C1000188C1000109410001894100010D6
            100018D61000107B1800187B18001884180029841800108C1800188C1800218C
            18001094180018941800189C1800219C180010C6180018C6180018D61800187B
            210018842100189421002194210029A521001873290029AD290031DE290029E7
            290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
            420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
            63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
            7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
            C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
            DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
            774F2F777777777777777777777777774F39127777777777777777777777774F
            353D0E77777777777777777777774F2D080B0E777777777777777777774F2957
            440A1F13253F52555C1277774F345739071E0A10131416405822774F34574105
            071E0E121314151758214F41574B0507071E0C12131416175D104F46574C0305
            071E2012131416175E0F774F4157361B070C0C1013141617580E77774F335737
            070A0D241314164059207777774F2957430C0C12253F52566212777777774F2D
            080A0E7777777777777777777777774F383B2177777777777777777777777777
            4F3B0E77777777777777777777777777774F4477777777777777}
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = Bt_AnteriorClick
        end
        object Bt_Proximo: TBitBtn
          Left = 120
          Top = 3
          Width = 105
          Height = 25
          Caption = '&Pr'#243'ximo Item'
          DoubleBuffered = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000E30E0000E30E0000000100000001000010630000006B
            0000086B00000073000008730000007B0000107B000000840000088400001084
            0000008C0000088C00000094000008940000009C0000089C000000A5000008A5
            000000AD000000B5000000BD000000C6000008C6000000CE000000D6000008D6
            000008630800087B0800107B080010840800008C0800088C0800009408001094
            0800009C080000A5080000AD080000B5080010BD080010C60800087B1000107B
            1000187B10001084100018841000088C1000188C1000109410001894100010D6
            100018D61000107B1800187B18001884180029841800108C1800188C1800218C
            18001094180018941800189C1800219C180010C6180018C6180018D61800187B
            210018842100189421002194210029A521001873290029AD290031DE290029E7
            290029843100298C3100398C310029D6310031D6310039AD390042A5420039DE
            420042DE42004AAD520052AD520052E752005AE75A0063AD630063E763006BEF
            63006B946B0073B56B006BDE6B0063E76B006BE76B0063EF6B007BB5730073B5
            7B007BDE7B007BB5840084BD84008CC69400A5E7A500CEEFBD00BDEFC600C6EF
            C600C6EFCE00CEEFCE00D6F7CE00D6E7D600DEE7D600D6EFD600DEEFD600CEE7
            DE00D6EFDE00DEEFDE00DEEFE700EFF7EF00F7F7F700FF00FF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00777777777777
            772F4F777777777777777777777777777712394F777777777777777777777777
            770E3D354F7777777777777777777777770E0B082D4F77777777125C55523F25
            131F0A4457294F777777225840161413100A1E073957344F7777215817151413
            120E1E07054157344F77105D17161413120C1E0707054B57414F0F5E17161413
            12201E0705034C57464F0E5817161413100C0C071B3657414F77205940161413
            240D0A073757334F7777126256523F25120C0C4357294F777777777777777777
            770E0A082D4F7777777777777777777777213B384F7777777777777777777777
            770E3B4F77777777777777777777777777444F77777777777777}
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = Bt_ProximoClick
        end
        object EditSequencial: TJvSpinEdit
          Left = 277
          Top = 5
          Width = 50
          Height = 21
          TabStop = False
          Value = 999.000000000000000000
          TabOrder = 2
        end
      end
    end
  end
  object PopupMenu: TPopupMenu
    AutoPopup = False
    OnPopup = PopupMenuPopup
    Left = 912
    Top = 481
    object MenuLiga: TMenuItem
      Caption = '&Liga'
      OnClick = MenuLigaClick
    end
    object MenuDesliga: TMenuItem
      Caption = '&Desliga'
      OnClick = MenuDesligaClick
    end
  end
end
