inherited fCadFornecedores: TfCadFornecedores
  Left = 25
  Top = 9
  Caption = 'Cadastro de Fornecedores'
  ClientHeight = 512
  ClientWidth = 771
  OldCreateOrder = True
  ExplicitWidth = 777
  ExplicitHeight = 540
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel1: TPanel
    Top = 471
    Width = 771
    ExplicitTop = 471
    ExplicitWidth = 771
    inherited Bt_Sair: TBitBtn
      Left = 668
      ExplicitLeft = 668
    end
  end
  inherited PanelDireita: TPanel
    Left = 411
    Width = 275
    Height = 471
    ExplicitLeft = 411
    ExplicitWidth = 275
    ExplicitHeight = 471
    inherited PanelPesquisa: TPanel
      Width = 273
      Height = 428
      ExplicitWidth = 273
      ExplicitHeight = 428
      inherited DBGrid1: TDBGrid
        Width = 269
        Height = 367
      end
      inherited DBNavigator1: TDBNavigator
        Top = 408
        Width = 269
        Hints.Strings = ()
        ExplicitTop = 408
        ExplicitWidth = 269
      end
      inherited Panel3: TPanel
        Width = 269
        ExplicitWidth = 269
        inherited SpeedButton1: TJvSpeedButton
          Left = 245
          ExplicitLeft = 245
        end
        inherited Edit1: TJvEdit
          Width = 244
          ExplicitWidth = 244
        end
      end
      inherited PanelQuantidade: TPanel
        Width = 269
        ExplicitWidth = 269
        inherited Label43: TLabel
          Width = 211
          Caption = 'Quantidade de Fornecedores Cadastrados:'
          ExplicitWidth = 211
        end
        inherited Panel2: TPanel
          Left = 212
          ExplicitLeft = 212
        end
      end
    end
    inherited PanelDatas: TPanel
      Top = 429
      Width = 273
      ExplicitTop = 429
      ExplicitWidth = 273
      inherited DBEdit24: TDBEdit
        Width = 147
        ExplicitWidth = 147
      end
      inherited DBEdit32: TDBEdit
        Width = 147
        ExplicitWidth = 147
      end
    end
  end
  inherited PanelCampos: TPanel
    Width = 411
    Height = 471
    ExplicitWidth = 411
    ExplicitHeight = 471
    object PageControl1: TPageControl
      Left = 3
      Top = 8
      Width = 410
      Height = 457
      ActivePage = TabSheet1
      Style = tsFlatButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = '&B'#225'sicos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object Label1: TLabel
          Left = 8
          Top = -3
          Width = 33
          Height = 14
          Caption = 'C'#243'digo'
        end
        object Label2: TLabel
          Left = 8
          Top = 37
          Width = 63
          Height = 14
          Caption = 'Raz'#227'o Social'
        end
        object Label3: TLabel
          Left = 8
          Top = 72
          Width = 71
          Height = 14
          Caption = 'Nome Fantasia'
        end
        object Label9: TLabel
          Left = 8
          Top = 107
          Width = 46
          Height = 14
          Caption = 'Endere'#231'o'
        end
        object Label10: TLabel
          Left = 8
          Top = 141
          Width = 29
          Height = 14
          Caption = 'Bairro'
        end
        object Label11: TLabel
          Left = 52
          Top = 175
          Width = 44
          Height = 14
          Caption = 'Munic'#237'pio'
        end
        object Label12: TLabel
          Left = 333
          Top = 175
          Width = 19
          Height = 14
          Caption = 'Cep'
        end
        object Label13: TLabel
          Left = 8
          Top = 175
          Width = 33
          Height = 14
          Caption = 'Estado'
        end
        object Label14: TLabel
          Left = 8
          Top = 210
          Width = 41
          Height = 14
          Caption = 'Telefone'
        end
        object Label15: TLabel
          Left = 208
          Top = 210
          Width = 70
          Height = 14
          Caption = 'Telefone / FAX'
        end
        object Label17: TLabel
          Left = 8
          Top = 245
          Width = 25
          Height = 14
          Caption = 'CNPJ'
        end
        object Label26: TLabel
          Left = 8
          Top = 281
          Width = 28
          Height = 14
          Caption = 'E-mail'
        end
        object Label42: TLabel
          Left = 208
          Top = 281
          Width = 39
          Height = 14
          Caption = 'Website'
        end
        object Label4: TLabel
          Left = 304
          Top = 248
          Width = 88
          Height = 14
          Caption = 'Data de Funda'#231#227'o'
        end
        object Label16: TLabel
          Left = 168
          Top = 245
          Width = 67
          Height = 14
          Caption = 'Insc. Estadual'
        end
        object Label8: TLabel
          Left = 312
          Top = 107
          Width = 37
          Height = 14
          Caption = 'N'#250'mero'
        end
        object Label18: TLabel
          Left = 208
          Top = 141
          Width = 64
          Height = 14
          Caption = 'Complemento'
        end
        object btPesquisaMunicipio: TSpeedButton
          Left = 108
          Top = 188
          Width = 14
          Height = 20
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          OnClick = btPesquisaMunicipioClick
        end
        object DBEdit2: TDBEdit
          Left = 8
          Top = 50
          Width = 385
          Height = 22
          CharCase = ecUpperCase
          DataField = 'NM_FORNECEDOR'
          DataSource = DataSource1
          TabOrder = 3
          OnExit = DBEdit2Exit
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 85
          Width = 385
          Height = 22
          CharCase = ecUpperCase
          DataField = 'NOMEFANTASIA'
          DataSource = DataSource1
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 120
          Width = 297
          Height = 22
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = DataSource1
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 8
          Top = 154
          Width = 193
          Height = 22
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = DataSource1
          TabOrder = 7
        end
        object edNmMunicipio: TDBEdit
          Left = 123
          Top = 188
          Width = 207
          Height = 22
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = DataSource1
          TabOrder = 11
          OnExit = edNmMunicipioExit
        end
        object edEstado: TDBComboBox
          Left = 8
          Top = 188
          Width = 41
          Height = 22
          Style = csDropDownList
          CharCase = ecUpperCase
          DataField = 'ESTADO'
          DataSource = DataSource1
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 8
          Top = 223
          Width = 193
          Height = 22
          CharCase = ecUpperCase
          DataField = 'TELEFONE'
          DataSource = DataSource1
          TabOrder = 13
        end
        object DBEdit10: TDBEdit
          Left = 208
          Top = 223
          Width = 185
          Height = 22
          CharCase = ecUpperCase
          DataField = 'FAX'
          DataSource = DataSource1
          TabOrder = 14
        end
        object DBEdit20: TDBEdit
          Left = 8
          Top = 294
          Width = 193
          Height = 22
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = DataSource1
          TabOrder = 18
        end
        object DBEdit33: TDBEdit
          Left = 208
          Top = 294
          Width = 193
          Height = 22
          CharCase = ecLowerCase
          DataField = 'WEBSITE'
          DataSource = DataSource1
          TabOrder = 19
        end
        object DBEdit11: TDBEdit
          Left = 168
          Top = 258
          Width = 97
          Height = 22
          CharCase = ecUpperCase
          DataField = 'INSCESTADUAL'
          DataSource = DataSource1
          TabOrder = 16
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 318
          Width = 401
          Height = 99
          Caption = 'Contato'
          TabOrder = 20
          object Label35: TLabel
            Left = 8
            Top = 16
            Width = 93
            Height = 14
            Caption = 'Contato / Vendedor'
          end
          object Label5: TLabel
            Left = 8
            Top = 51
            Width = 41
            Height = 14
            Caption = 'Telefone'
          end
          object Label6: TLabel
            Left = 152
            Top = 51
            Width = 28
            Height = 14
            Caption = 'E-mail'
          end
          object DBEdit25: TDBEdit
            Left = 8
            Top = 29
            Width = 385
            Height = 22
            CharCase = ecUpperCase
            DataField = 'CONTATO'
            DataSource = DataSource1
            TabOrder = 0
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 63
            Width = 137
            Height = 22
            CharCase = ecUpperCase
            DataField = 'CONT_TELEFONE'
            DataSource = DataSource1
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 152
            Top = 63
            Width = 241
            Height = 22
            CharCase = ecLowerCase
            DataField = 'CONT_EMAIL'
            DataSource = DataSource1
            TabOrder = 2
          end
        end
        object edCep: TwwDBEdit
          Left = 333
          Top = 188
          Width = 60
          Height = 22
          DataField = 'CEP'
          DataSource = DataSource1
          Picture.PictureMask = '#####-###'
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object DBDateEdit1: TJvDBDateEdit
          Left = 312
          Top = 261
          Width = 83
          Height = 22
          DataField = 'DT_FUNDACAO'
          DataSource = DataSource1
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
          TabOrder = 17
        end
        object chInativo: TDBCheckBox
          Left = 344
          Top = 17
          Width = 53
          Height = 17
          TabStop = False
          Caption = 'Inativo'
          DataField = 'INATIVO'
          DataSource = DataSource1
          TabOrder = 2
          ValueChecked = 'V'
          ValueUnchecked = 'F'
        end
        object edCNPJ: TDBEdit
          Left = 8
          Top = 258
          Width = 137
          Height = 22
          DataField = 'CGC'
          DataSource = DataSource1
          TabOrder = 15
        end
        object DBEdit21: TDBEdit
          Left = 8
          Top = 11
          Width = 113
          Height = 24
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          DataField = 'CD_FORNECEDOR'
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
        object DBEdit8: TDBEdit
          Left = 312
          Top = 120
          Width = 81
          Height = 22
          CharCase = ecUpperCase
          DataField = 'ENDERECO_NUMERO'
          DataSource = DataSource1
          TabOrder = 6
        end
        object DBEdit12: TDBEdit
          Left = 208
          Top = 154
          Width = 185
          Height = 22
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = DataSource1
          TabOrder = 8
        end
        object edCdMunicipio: TDBEdit
          Left = 51
          Top = 188
          Width = 57
          Height = 22
          CharCase = ecUpperCase
          DataField = 'CD_MUNICIPIO'
          DataSource = DataSource1
          TabOrder = 10
          OnChange = edCdMunicipioChange
          OnExit = edCdMunicipioExit
          OnKeyDown = edCdMunicipioKeyDown
          OnKeyPress = edCdMunicipioKeyPress
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 163
          Top = 4
          Width = 142
          Height = 33
          Caption = 'Pessoa'
          Columns = 2
          DataField = 'PESSOA'
          DataSource = DataSource1
          Items.Strings = (
            'F'#237'sica'
            'Jur'#237'dica')
          ParentBackground = True
          TabOrder = 0
          Values.Strings = (
            'F'
            'J')
          OnChange = DBRadioGroup1Change
        end
      end
      object TabSheet4: TTabSheet
        Caption = '&Obs'
        ImageIndex = 3
        object DBMemo1: TDBMemo
          Left = 8
          Top = 8
          Width = 385
          Height = 353
          DataField = 'OBS'
          DataSource = DataSource1
          TabOrder = 0
        end
      end
      object TabDiversos: TTabSheet
        Caption = 'Contas Banc'#225'rias e Representantes'
        ImageIndex = 2
        object Label7: TLabel
          Left = 8
          Top = 168
          Width = 125
          Height = 18
          Caption = 'Representantes:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object GroupBox8: TGroupBox
          Left = 8
          Top = 8
          Width = 385
          Height = 153
          Caption = 'Refer'#234'ncias Banc'#225'rias'
          TabOrder = 0
          object DBMemo2: TDBMemo
            Left = 8
            Top = 16
            Width = 369
            Height = 129
            DataField = 'REFBANCO'
            DataSource = DataSource1
            TabOrder = 0
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 8
          Top = 192
          Width = 385
          Height = 201
          Selected.Strings = (
            'CD_REPRESENTANTE'#9'10'#9'C'#243'digo'#9#9
            'NM_REPRESENTANTE'#9'47'#9'Representante'#9#9)
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = DataSource2
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          TitleLines = 1
          TitleButtons = False
        end
        object btAdicionarRepresentante: TBitBtn
          Left = 176
          Top = 165
          Width = 105
          Height = 25
          Hint = 'Vincula um Representante a este Fornecedor'
          Caption = '&Adic. Repres.'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TabStop = False
          OnClick = btAdicionarRepresentanteClick
        end
        object BitBtn1: TBitBtn
          Left = 288
          Top = 165
          Width = 105
          Height = 25
          Hint = 'Remove um v'#237'nculo de um Representante com este Fornecedor'
          Caption = '&Remov. Repres.'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = False
          OnClick = BitBtn1Click
        end
      end
    end
  end
  inherited Panel4: TGradPan
    Left = 686
    Width = 85
    Height = 471
    ExplicitLeft = 686
    ExplicitWidth = 85
    ExplicitHeight = 471
    inherited JvLabel1: TJvLabel
      Left = 22
      Top = 168
      Height = 192
      Caption = 'Fornecedores'
      ExplicitLeft = 22
      ExplicitTop = 168
      ExplicitHeight = 192
    end
    object btProdutos: TBitBtn
      Left = 5
      Top = 8
      Width = 72
      Height = 25
      Hint = 'Mostra os Produtos vinculados a este Fornecedor'
      Caption = '&1 - Produtos'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = btProdutosClick
    end
  end
  inherited TrCadastro: TIBOTransaction
    IB_Connection = DtM.IBDatabaseServer
  end
  inherited IBCadastro: TIBOQuery
    Active = True
    SQL.Strings = (
      'select * from FORNECEDORES')
  end
  object IBRepresentantes: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CD_FORNECEDOR'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'CD_REPRESENTANTE=REQUIRED'
      'CD_FORNECEDOR=REQUIRED')
    DatabaseName = 'C:\Delphi\Fontes\Focus\FOCUS.FOC'
    IB_Transaction = TrRepresentantes
    RecordCountAccurate = True
    SQL.Strings = (
      'Select R.CD_REPRESENTANTE, R.NM_REPRESENTANTE, RF.CD_FORNECEDOR'
      'from REPRESENT_FORNEC RF'
      
        'join REPRESENTANTES R on R.CD_REPRESENTANTE = RF.CD_REPRESENTANT' +
        'E'
      'where RF.CD_FORNECEDOR = :CD_FORNECEDOR'
      'order by 2')
    FieldOptions = []
    Left = 456
    Top = 240
    object IBRepresentantesCD_REPRESENTANTE: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'CD_REPRESENTANTE'
      Origin = 'REPRESENTANTES.CD_REPRESENTANTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBRepresentantesNM_REPRESENTANTE: TStringField
      DisplayLabel = 'Representante'
      DisplayWidth = 47
      FieldName = 'NM_REPRESENTANTE'
      Origin = 'REPRESENTANTES.NM_REPRESENTANTE'
      Size = 80
    end
    object IBRepresentantesCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'REPRESENT_FORNEC.CD_FORNECEDOR'
      Required = True
      Visible = False
    end
  end
  object TrRepresentantes: TIBOTransaction
    Isolation = tiCommitted
    Left = 497
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = IBRepresentantes
    Left = 535
    Top = 244
  end
end
