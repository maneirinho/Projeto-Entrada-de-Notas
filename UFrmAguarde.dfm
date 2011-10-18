object FrmAguarde: TFrmAguarde
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmAguarde'
  ClientHeight = 278
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvGradient1: TJvGradient
    Left = 0
    Top = 121
    Width = 431
    Height = 0
    Enabled = False
    StartColor = clSkyBlue
    EndColor = clWhite
    ExplicitTop = 32
    ExplicitHeight = 309
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object JvGradient2: TJvGradient
      Left = 0
      Top = 0
      Width = 431
      Height = 121
      StartColor = clSkyBlue
      EndColor = clWhite
      ExplicitLeft = 2
      ExplicitTop = 6
      ExplicitWidth = 429
      ExplicitHeight = 119
    end
    object Label1: TLabel
      Left = 136
      Top = 0
      Width = 180
      Height = 42
      Alignment = taCenter
      Caption = 'Aguarde...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMensagem: TLabel
      Left = 8
      Top = 55
      Width = 413
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 84
      Width = 413
      Height = 25
      TabOrder = 0
      Visible = False
    end
  end
  object pnlDuplicidades: TPanel
    Left = 0
    Top = 121
    Width = 431
    Height = 0
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object pnlTotais: TPanel
      Left = 24
      Top = 10
      Width = 377
      Height = 198
      TabOrder = 0
      object Bevel1: TBevel
        Left = 9
        Top = 8
        Width = 360
        Height = 153
      end
      object lblTotalRegistros: TLabel
        Left = 348
        Top = 16
        Width = 8
        Height = 18
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblRegAtual: TLabel
        Left = 348
        Top = 38
        Width = 8
        Height = 18
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 17
        Top = 16
        Width = 123
        Height = 16
        Caption = 'Total de Registros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 17
        Top = 38
        Width = 99
        Height = 16
        Caption = 'Registro Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 60
        Width = 205
        Height = 16
        Caption = 'Velocidade (Reg. por segundo):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbvelocidade: TLabel
        Left = 348
        Top = 60
        Width = 8
        Height = 18
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 82
        Width = 126
        Height = 16
        Caption = 'Tempo de Execu'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbTempoExecucao: TLabel
        Left = 298
        Top = 82
        Width = 58
        Height = 18
        Alignment = taRightJustify
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 17
        Top = 104
        Width = 198
        Height = 16
        Caption = 'Tempo de Conclus'#227'o Estimado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbTempoEstimado: TLabel
        Left = 298
        Top = 104
        Width = 58
        Height = 18
        Alignment = taRightJustify
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LbDuplicidades: TLabel
        Left = 348
        Top = 126
        Width = 8
        Height = 18
        Alignment = taRightJustify
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 17
        Top = 126
        Width = 170
        Height = 16
        Caption = 'Duplicidades Encontradas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 294
        Top = 167
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BitBtn1Click
      end
    end
  end
  object pnlUnificacao: TPanel
    Left = 0
    Top = 48
    Width = 431
    Height = 230
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object JvGradient3: TJvGradient
      Left = 0
      Top = 0
      Width = 431
      Height = 230
      StartColor = clSkyBlue
      EndColor = clWhite
      ExplicitLeft = 2
      ExplicitWidth = 429
      ExplicitHeight = 228
    end
    object Label8: TLabel
      Left = 8
      Top = 13
      Width = 164
      Height = 13
      Caption = 'Ocorr'#234'ncias do registro local:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 224
      Top = 13
      Width = 199
      Height = 13
      Caption = 'Ocorr'#234'ncias do registro Importado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ListBox1: TListBox
      Left = 8
      Top = 32
      Width = 201
      Height = 185
      ItemHeight = 13
      TabOrder = 0
    end
    object ListBox2: TListBox
      Left = 224
      Top = 32
      Width = 201
      Height = 185
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 376
    Top = 8
  end
end
