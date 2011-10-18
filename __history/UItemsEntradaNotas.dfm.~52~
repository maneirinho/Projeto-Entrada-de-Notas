object fEntradaNotasItems: TfEntradaNotasItems
  Left = 164
  Top = 38
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Itens da Nota'
  ClientHeight = 663
  ClientWidth = 817
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
  object TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 202
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 8
      Top = 118
      Width = 803
      Height = 78
      Caption = 'C'#225'lculo do Imposto'
      TabOrder = 3
      object Label17: TLabel
        Left = 16
        Top = 11
        Width = 90
        Height = 14
        Caption = 'Base C'#225'lculo ICMS'
      end
      object Label6: TLabel
        Left = 128
        Top = 11
        Width = 52
        Height = 14
        Caption = 'Valor ICMS'
      end
      object Label7: TLabel
        Left = 240
        Top = 11
        Width = 91
        Height = 14
        Caption = 'Base ICMS (Subst)'
      end
      object Label8: TLabel
        Left = 352
        Top = 11
        Width = 91
        Height = 14
        Caption = 'Valor ICMS (Subst)'
      end
      object Label9: TLabel
        Left = 688
        Top = 11
        Width = 96
        Height = 14
        Caption = 'Valor Total Produtos'
      end
      object Label11: TLabel
        Left = 576
        Top = 11
        Width = 78
        Height = 14
        Caption = 'Valor do Seguro'
      end
      object Label12: TLabel
        Left = 16
        Top = 42
        Width = 85
        Height = 14
        Caption = 'Outras Despesas'
      end
      object Label13: TLabel
        Left = 352
        Top = 42
        Width = 61
        Height = 14
        Caption = 'Valor total IPI'
      end
      object Label14: TLabel
        Left = 688
        Top = 42
        Width = 90
        Height = 14
        Caption = 'Valor Total da Nota'
      end
      object Label10: TLabel
        Left = 464
        Top = 11
        Width = 68
        Height = 14
        Caption = 'Valor do Frete'
      end
      object Label15: TLabel
        Left = 128
        Top = 42
        Width = 55
        Height = 14
        Caption = 'Valor total II'
      end
      object Label19: TLabel
        Left = 240
        Top = 42
        Width = 66
        Height = 14
        Caption = 'Valor total PIS'
      end
      object Label20: TLabel
        Left = 464
        Top = 42
        Width = 88
        Height = 14
        Caption = 'Valor total COFINS'
      end
      object Label18: TLabel
        Left = 576
        Top = 42
        Width = 75
        Height = 14
        Caption = 'Desconto Geral'
      end
      object RxDBCalcEdit5: TRxDBCalcEdit
        Left = 464
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_FRETE'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 5
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object DBEditPrecoVenda: TRxDBCalcEdit
        Left = 16
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'ICMS_BASE'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit1: TRxDBCalcEdit
        Left = 128
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'ICMS_VALOR'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit2: TRxDBCalcEdit
        Left = 240
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'ICMS_BASESUBST'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit3: TRxDBCalcEdit
        Left = 352
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'ICMS_VALORSUBST'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit6: TRxDBCalcEdit
        Left = 576
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_SEGURO'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit7: TRxDBCalcEdit
        Left = 16
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'OUTRAS_DESPESAS'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit8: TRxDBCalcEdit
        Left = 352
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_IPI'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 8
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit4: TRxDBCalcEdit
        Left = 688
        Top = 25
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VR_TOTAL_PROD'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit9: TRxDBCalcEdit
        Left = 688
        Top = 54
        Width = 100
        Height = 21
        Margins.Left = 4
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_TOTAL_NOTA'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 9
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit11: TRxDBCalcEdit
        Left = 128
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_II'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 10
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit12: TRxDBCalcEdit
        Left = 240
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_PIS'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 11
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit13: TRxDBCalcEdit
        Left = 464
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'VALOR_COFINS'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 12
        OnExit = RxDBCalcEdit5Exit
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
      object RxDBCalcEdit10: TRxDBCalcEdit
        Left = 576
        Top = 56
        Width = 100
        Height = 19
        Margins.Top = 0
        TabStop = False
        DataField = 'DESCONTO_TOTAL'
        DataSource = DataSource1
        AutoSelect = False
        BeepOnError = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DisplayFormat = ',0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 13
        OnKeyPress = DBEditPrecoVendaKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 698
      Top = 1
      Width = 113
      Height = 80
      TabOrder = 2
      object Label4: TLabel
        Left = 7
        Top = 8
        Width = 80
        Height = 14
        Caption = 'Data de Emiss'#227'o'
      end
      object Label5: TLabel
        Left = 7
        Top = 42
        Width = 77
        Height = 14
        Caption = 'Data de Entrada'
      end
      object DBDateEdit1: TDBDateEdit
        Left = 6
        Top = 19
        Width = 100
        Height = 20
        Margins.Top = 0
        TabStop = False
        DataField = 'DT_EMISSAO'
        DataSource = DataSource1
        AutoSelect = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DialogTitle = 'Selecione uma data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        GlyphKind = gkCustom
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
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        YearDigits = dyFour
      end
      object DBDateEdit2: TDBDateEdit
        Left = 6
        Top = 53
        Width = 100
        Height = 20
        Margins.Top = 0
        TabStop = False
        DataField = 'DT_ENTRADA'
        DataSource = DataSource1
        AutoSelect = False
        BorderStyle = bsNone
        ClickKey = 0
        Color = clBtnFace
        DialogTitle = 'Selecione uma data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        GlyphKind = gkCustom
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
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        YearDigits = dyFour
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 1
      Width = 533
      Height = 37
      Caption = 'Fornecedor'
      TabOrder = 0
      object DBEdit1: TDBEdit
        Left = 78
        Top = 14
        Width = 379
        Height = 15
        TabStop = False
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'NM_FORNECEDOR'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 14
        Width = 65
        Height = 17
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'CD_FORNECEDOR'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox6: TGroupBox
      Left = 547
      Top = 1
      Width = 145
      Height = 37
      TabOrder = 1
      object Label3: TLabel
        Left = 45
        Top = 3
        Width = 52
        Height = 14
        Caption = 'N'#186' da Nota'
      end
      object DBEdit4: TDBEdit
        Left = 15
        Top = 15
        Width = 119
        Height = 14
        AutoSelect = False
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'NUM_DOCUMENTO'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 44
      Width = 533
      Height = 37
      Caption = 'Natureza da opera'#231#227'o'
      TabOrder = 4
      object DBEdit6: TDBEdit
        Left = 8
        Top = 14
        Width = 449
        Height = 17
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'NAT_OPERACAO'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox8: TGroupBox
      Left = 547
      Top = 44
      Width = 145
      Height = 37
      TabOrder = 5
      object Label1: TLabel
        Left = 11
        Top = 3
        Width = 25
        Height = 14
        Caption = 'S'#233'rie'
      end
      object Label2: TLabel
        Left = 73
        Top = 3
        Width = 34
        Height = 14
        Caption = 'Modelo'
      end
      object DBEdit5: TDBEdit
        Left = 3
        Top = 16
        Width = 46
        Height = 11
        AutoSelect = False
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'SERIE'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 63
        Top = 16
        Width = 54
        Height = 11
        AutoSelect = False
        AutoSize = False
        BevelInner = bvNone
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'MODELO'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 81
      Width = 802
      Height = 37
      Caption = 'Chave NF-e'
      TabOrder = 6
      object DBEdit8: TDBEdit
        Left = 8
        Top = 16
        Width = 780
        Height = 17
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'CHAVE_NFE'
        DataSource = DataSource1
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 227
    Width = 817
    Height = 379
    Align = alClient
    Color = clMoneyGreen
    TabOrder = 2
    object GroupBox4: TGroupBox
      Left = 1
      Top = 1
      Width = 815
      Height = 326
      Align = alClient
      Caption = 'Dados do Produto'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 2
        Top = 15
        Width = 811
        Height = 309
        ActivePage = TabFinanceiro
        Align = alClient
        TabOrder = 0
        object TabFinanceiro: TTabSheet
          Caption = 'Financeiro'
          ImageIndex = 1
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 803
            Height = 281
            Selected.Strings = (
              'SEQUENCIAL'#9'4'#9'Seq.'#9'F'
              'COD_PROD_FORNEC'#9'15'#9'Cod. Prod. Fornec.'#9'F'
              'COD_BARRAS'#9'14'#9'C'#243'digo'#9'F'
              'NM_PRODUTO'#9'35'#9'Descri'#231#227'o'#9'F'
              'CLASSFISCAL'#9'9'#9'NCM'#9'F'
              'QUANTIDADE'#9'10'#9'Quantidade'#9'F'
              'VALORUNITARIO'#9'10'#9'Vr Unit'#225'rio'#9'F'
              'MARGEMLUCRO'#9'7'#9'Margem'#9'F'
              'PRECOVENDA'#9'10'#9'Pre'#231'o Venda'#9'F'
              'VALORTOTAL'#9'10'#9'Valor Total'#9'F'
              'UNDCONVERSAO'#9'9'#9'Und Conv.'#9'F'
              'DESCONTO_VAL'#9'10'#9'Valor Desc.'#9'F'
              'FRETE_VAL'#9'10'#9'Valor Frete'#9'F'
              'ICMSST_VAL'#9'10'#9'Valor ICMS ST'#9'F')
            IniAttributes.Enabled = True
            IniAttributes.Delimiter = ';;'
            IniAttributes.CheckNewFields = True
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DataSource2
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = wwDBGrid1CalcCellColors
            OnDblClick = wwDBGrid1DblClick
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 342
      Width = 815
      Height = 36
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object Label16: TLabel
        Left = 532
        Top = 13
        Width = 72
        Height = 13
        Caption = 'Total Produtos:'
      end
      object Bt_IncluirItem: TBitBtn
        Left = 5
        Top = 6
        Width = 110
        Height = 25
        Caption = 'Incluir Item - F2'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 1
        TabStop = False
        OnClick = Bt_IncluirItemClick
      end
      object Bt_ExcluirItem: TBitBtn
        Left = 121
        Top = 6
        Width = 110
        Height = 25
        Caption = 'Excluir Item - F4'
        DoubleBuffered = True
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
          0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
          0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
          1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
          0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
          11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
          0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
        ParentDoubleBuffered = False
        TabOrder = 2
        TabStop = False
        OnClick = Bt_ExcluirItemClick
      end
      object Bt_AlterarItem: TBitBtn
        Left = 237
        Top = 6
        Width = 110
        Height = 25
        Caption = 'Alterar Item - F5'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 3
        TabStop = False
        OnClick = Bt_AlterarItemClick
      end
      object BitBtn1: TBitBtn
        Left = 392
        Top = 6
        Width = 94
        Height = 25
        Caption = 'Alterar Nota'
        DoubleBuffered = True
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
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = BitBtn1Click
      end
      object EditTotal: TJvCalcEdit
        Left = 608
        Top = 5
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
    end
    object Panel8: TPanel
      Left = 1
      Top = 327
      Width = 815
      Height = 15
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object Panel4: TPanel
        Left = 49
        Top = 0
        Width = 176
        Height = 13
        Caption = 'N'#195'O CADASTRADO'
        Color = 11448063
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel5: TPanel
        Left = 231
        Top = 0
        Width = 176
        Height = 13
        Caption = 'CADASTRADO N'#195'O VINCULADO'
        Color = 14002344
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object Panel6: TPanel
        Left = 413
        Top = 0
        Width = 176
        Height = 13
        Caption = 'VINCULADO N'#195'O CONFERIDO'
        Color = 16777145
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object Panel7: TPanel
        Left = 595
        Top = 0
        Width = 176
        Height = 13
        Caption = 'CONFERIDO'
        Color = 13427660
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 625
    Width = 817
    Height = 38
    Align = alBottom
    TabOrder = 4
    object Label40: TLabel
      Left = 533
      Top = 2
      Width = 76
      Height = 13
      Caption = #218'ltima altera'#231#227'o'
    end
    object Label39: TLabel
      Left = 417
      Top = 2
      Width = 68
      Height = 13
      Caption = 'Data Cadastro'
    end
    object Bt_Sair: TBitBtn
      Left = 670
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
      TabOrder = 2
      TabStop = False
      OnClick = Bt_SairClick
    end
    object Bt_ConcluirNota: TBitBtn
      Left = 9
      Top = 8
      Width = 130
      Height = 25
      Caption = 'Concluir Nota - F11'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000D30E0000D30E00000001000000010000182142001021
        4A0018294A00182952002939520010295A0018295A0021315A0031395A004A52
        5A001831630021396300314263004A52630018316B00394A6B00424A6B001839
        73002139730018397B0021397B0021427B0029427B00314A7B00214284003952
        840021428C00294A8C0052638C005A6B8C00214A9400294A940029529400395A
        94004A639400214A9C00294A9C0029529C0031529C00526B9C002952A5004263
        A5002952AD00315AAD003963AD004A6BAD002952B500295AB500295ABD00315A
        BD003163BD003963BD00315AC6003163C6003963C600396BC6004273C6003163
        CE003963CE00426BCE0094ADCE003163D600316BD600396BD6004273D600396B
        DE003973DE004A7BDE004A84DE007BA5DE00A5B5DE003973E700427BE7004A84
        E7005284E700528CE7005A8CE7003973EF004273EF00427BEF005A94EF006BA5
        EF007BA5EF00427BF7004A84F7005A94F7006394F70063A5F7006BA5F700FF00
        FF00427BFF004284FF004A84FF004A8CFF00528CFF005294FF005A94FF00529C
        FF005A9CFF00639CFF0063A5FF006BA5FF0063ADFF006BADFF0073ADFF006BB5
        FF0073B5FF007BB5FF0084B5FF007BBDFF0084BDFF0084C6FF008CC6FF0084CE
        FF0094CEFF0094D6FF009CD6FF009CDEFF00A5E7FF00ADEFFF00B5F7FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00595959595959
        595959595959595959595959595959591C170859591D3208595959596763481E
        604F1F1831323F3508595959374A372576653131281A1A282759595964604F2B
        54544747352A0A02105959596F6854315C54534F392F110259595959374A372A
        5E5D65603F2F0E0259595959736B5E315F6272653F2F0A0459595959374A3724
        626674643528085959595959756D5E315E5C4348311F59595959595959595959
        67682F1219595959595959595959592775651F0F595959595959595959595945
        75540B5959595959595959595959594572540B09595959595959595959595975
        645F3A2459595959595959595959595945543627595959595959}
      ParentDoubleBuffered = False
      TabOrder = 0
      TabStop = False
      OnClick = Bt_ConcluirNotaClick
    end
    object DBEdit16: TDBEdit
      Left = 532
      Top = 15
      Width = 100
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DataField = 'ULTIMAALTERACAO'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit15: TDBEdit
      Left = 417
      Top = 15
      Width = 100
      Height = 19
      TabStop = False
      AutoSize = False
      Color = clBtnFace
      DataField = 'DT_CADASTRO'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object bt_ImportarPedido: TBitBtn
      Left = 146
      Top = 8
      Width = 130
      Height = 25
      Caption = 'Importar Pedido - F9'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
        000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
        FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FFFF00FF000000FF
        00FF000000FF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00FF000000
        FF00FF000000FF00FFFF00FF000000FF00FF000000FF00FF000000FF00FFFF00
        FF000000FF00FFFF00FFFF00FF000000FF00FF000000FF00FF000000000000FF
        00FF000000FF00FF000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FF
        000000FF00FFFF00FFFF00FF000000FF00FFFF00FF000000FF00FFFF00FFFF00
        FF000000FF00FFFF00FFFF00FF8080808D5E5D8D5E5D8D5E5D8D5E5D8D5E5D8D
        5E5D8D5E5D8D5E5D8D5E5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
        FFFAEBF9F1E2F9F0DFF7EEDCF7EEDBF7EDDAF8EFDBF2E5D18E5F5EFF00FFFF00
        FFC00000FF00FFFF00FFFF00FF808080F9F1E4F5E2CDF5E0CAF4DFC9F3DEC5F2
        DDC3F2E2CDEBDBC98E5F5EFF00FFFF0000FF0000C00000FF00FFFF00FF808080
        FCF5EAFCD8B5FCD8B4FCD8B3FBD7B3FBD7B2FADAB8EBDECE926462FF0000FF00
        00FF0000FF0000C00000FF00FF808080FEFBF5FDD2A7FDD2A7FDD2A7FDD2A7FD
        D2A7FDD2A7F0E5DAA57A75FF00FFFF0000FF0000C00000FF00FFFF00FF808080
        FFFDFBFDEAD8FCE7D4FBE6D3FAE6D1FDE9D3FDF4E6E8E0D9C00000C00000FF00
        00FF0000C00000FF00FFFF00FF808080FFFFFFFDD2A7FDD2A7FDD2A7FDD2A7EB
        DFDBFF0000FF0000FF0000FF0000FF0000FF0000C00000FF00FFFF00FF808080
        FFFFFFFCE7D4FCE7D4FCE7D4FCE7D4B48E88B48E88B48E88B48E88FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
        8E88EBB56FC68C78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF808080
        808080808080808080808080808080808080808080FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentDoubleBuffered = False
      TabOrder = 1
      TabStop = False
      OnClick = bt_ImportarPedidoClick
    end
  end
  object PanelObsNota: TPanel
    Left = 0
    Top = 606
    Width = 817
    Height = 19
    Align = alBottom
    TabOrder = 3
    object DBEdit3: TDBEdit
      Left = 12
      Top = 1
      Width = 734
      Height = 16
      AutoSelect = False
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'OBS'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object PanelObsFornec: TPanel
    Left = 0
    Top = 202
    Width = 817
    Height = 25
    Align = alTop
    TabOrder = 1
    object edObsFornec: TEdit
      Left = 10
      Top = 2
      Width = 794
      Height = 21
      TabStop = False
      Color = 10930928
      TabOrder = 0
      OnEnter = edObsFornecEnter
      OnExit = edObsFornecExit
      OnKeyDown = edObsFornecKeyDown
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 376
    Top = 8
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = DtM.IBNFItems
    Left = 24
    Top = 336
  end
  object SPAlteraEstoque: TIB_StoredProc
    DatabaseName = 'C:\Delphi\Fontes\Focus\FOCUS.FOC'
    Left = 113
    Top = 331
  end
end
