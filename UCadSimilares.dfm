inherited fCadSimilares: TfCadSimilares
  Left = 20
  Top = 78
  Caption = 'Cadastro de Similares'
  ClientHeight = 326
  ClientWidth = 743
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Top = 285
    Width = 743
    ExplicitTop = 285
    ExplicitWidth = 743
  end
  inherited PanelDireita: TPanel
    Left = 435
    Width = 257
    Height = 285
    ExplicitLeft = 435
    ExplicitWidth = 257
    ExplicitHeight = 285
    inherited PanelPesquisa: TPanel
      Width = 255
      Height = 242
      ExplicitWidth = 255
      ExplicitHeight = 242
      inherited DBGrid1: TDBGrid
        Width = 251
        Height = 181
      end
      inherited DBNavigator1: TDBNavigator
        Top = 222
        Width = 251
        Hints.Strings = ()
        ExplicitTop = 222
        ExplicitWidth = 251
      end
      inherited Panel3: TPanel
        Width = 251
        ExplicitWidth = 251
        inherited SpeedButton1: TJvSpeedButton
          Left = 227
          ExplicitLeft = 227
        end
        inherited Edit1: TJvEdit
          Width = 226
          ExplicitWidth = 226
        end
      end
      inherited PanelQuantidade: TPanel
        Width = 251
        ExplicitWidth = 251
        inherited Label43: TLabel
          Width = 193
          ExplicitWidth = 193
        end
        inherited Panel2: TPanel
          Left = 194
          ExplicitLeft = 194
        end
      end
    end
    inherited PanelDatas: TPanel
      Top = 243
      Width = 255
      ExplicitTop = 243
      ExplicitWidth = 255
    end
  end
  inherited PanelCampos: TPanel
    Width = 435
    Height = 285
    ExplicitWidth = 435
    ExplicitHeight = 285
    object Label1: TLabel
      Left = 16
      Top = 37
      Width = 33
      Height = 14
      Caption = 'C'#243'digo'
    end
    object DBText1: TDBText
      Left = 16
      Top = 53
      Width = 65
      Height = 17
      DataField = 'CD_SIMILAR'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 85
      Width = 49
      Height = 14
      Caption = 'Descri'#231#227'o'
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 101
      Width = 305
      Height = 22
      CharCase = ecUpperCase
      DataField = 'NM_SIMILAR'
      DataSource = DataSource1
      TabOrder = 0
    end
    object chInativo: TDBCheckBox
      Left = 267
      Top = 53
      Width = 53
      Height = 17
      TabStop = False
      Caption = 'Inativo'
      DataField = 'INATIVO'
      DataSource = DataSource1
      TabOrder = 1
      ValueChecked = 'V'
      ValueUnchecked = 'F'
    end
  end
  inherited Panel4: TGradPan
    Left = 692
    Height = 285
    ExplicitLeft = 692
    ExplicitHeight = 285
    inherited JvLabel1: TJvLabel
      Top = 84
      Height = 128
      Caption = 'Similares'
      ExplicitTop = 84
      ExplicitHeight = 128
    end
  end
end
