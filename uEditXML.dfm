object frm_Edit_XML: Tfrm_Edit_XML
  Left = 0
  Top = 0
  Caption = 'Editar XML'
  ClientHeight = 623
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1126
    Height = 623
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1124
      Height = 621
      ActivePage = tsXML
      Align = alClient
      TabOrder = 0
      object tsXML: TTabSheet
        Caption = 'Visualizar XML'
        object WebBrowser1: TWebBrowser
          Left = 0
          Top = 0
          Width = 1116
          Height = 531
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 344
          ExplicitTop = 96
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C00000058730000E13600000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
        object Panel2: TPanel
          Left = 0
          Top = 531
          Width = 1116
          Height = 62
          Align = alBottom
          TabOrder = 1
          DesignSize = (
            1116
            62)
          object btnEnviar: TButton
            Left = 834
            Top = 5
            Width = 265
            Height = 43
            Anchors = [akRight, akBottom]
            Caption = 'Disponibilizar para Transmiss'#227'o'
            Enabled = False
            Style = bsCommandLink
            TabOrder = 0
            OnClick = btnEnviarClick
          end
        end
      end
      object tsAlterar: TTabSheet
        Caption = 'Alterar XML'
        ImageIndex = 3
        object Panel3: TPanel
          Left = 0
          Top = 531
          Width = 1116
          Height = 62
          Align = alBottom
          TabOrder = 0
          DesignSize = (
            1116
            62)
          object btnGravar: TButton
            Left = 1002
            Top = 5
            Width = 97
            Height = 43
            Anchors = [akRight, akBottom]
            Caption = 'Gravar'
            Style = bsCommandLink
            TabOrder = 0
            OnClick = btnGravarClick
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1116
          Height = 113
          Align = alTop
          TabOrder = 1
          object Panel9: TPanel
            Left = 1
            Top = 1
            Width = 1114
            Height = 24
            Align = alTop
            Caption = 'Destinat'#225'rio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid3: TDBGrid
            Left = 1
            Top = 25
            Width = 1114
            Height = 87
            Align = alClient
            DataSource = dsDest
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DestDocumento'
                ReadOnly = True
                Title.Caption = 'CNPJ/CPF'
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxNome'
                Title.Caption = 'Raz'#227'o Social / Nome'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxLgr'
                Title.Caption = 'Logradouro'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestNro'
                Title.Caption = 'Numero'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxCpl'
                Title.Caption = 'Complemento'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxBairro'
                Title.Caption = 'Bairro'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestcMun'
                Title.Caption = 'C'#243'd. Munic'#237'pio'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxMun'
                Title.Caption = 'Municipio'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestcPais'
                Title.Caption = 'Cod. Pais'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestxPais'
                Title.Caption = 'Pais'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestindIEDest'
                Title.Caption = 'Ind. IE'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestIE'
                Title.Caption = 'I.E.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DestIM'
                Title.Caption = 'Insc. Municipal'
                Width = 80
                Visible = True
              end>
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 224
          Width = 1116
          Height = 195
          Align = alCustom
          TabOrder = 2
          object Panel8: TPanel
            Left = 1
            Top = 1
            Width = 1114
            Height = 24
            Align = alTop
            Caption = 'Itens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object DBGrid2: TDBGrid
            Left = 1
            Top = 25
            Width = 1114
            Height = 169
            Align = alClient
            DataSource = dsItens
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cProd'
                Title.Caption = 'C'#243'digo'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'xProd'
                Title.Caption = 'Descri'#231#227'o Produto'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cEAN'
                Title.Caption = 'GTIN / EAN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NCM'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CFOP'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'uCom'
                Title.Caption = 'Un. Com.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'uTrib'
                Title.Caption = 'Un. Trib.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cEANTrib'
                Title.Caption = 'GTIN Trib.'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ICMSOrig'
                Title.Caption = 'ICMS Origem'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ICMSCST'
                Title.Caption = 'CST/CSOSN'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PISCST'
                Title.Caption = 'CST PIS '
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COFINSCST'
                Title.Caption = 'CST COFINS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cListServ'
                Title.Caption = 'Item Serv. ISSQN'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cServico'
                Title.Caption = 'C'#243'd. Servi'#231'o ISSQN'
                Width = 90
                Visible = True
              end>
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 416
          Width = 1116
          Height = 115
          Align = alBottom
          TabOrder = 3
          object DBGrid1: TDBGrid
            Left = 1
            Top = 25
            Width = 1114
            Height = 89
            Align = alClient
            DataSource = dsPagto
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'tPag'
                Title.Caption = 'Tipo Pagamento'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vPag'
                Title.Caption = 'Valor'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tpIntegra'
                Title.Caption = 'Tipo Integra'#231#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNPJ'
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'tBand'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cAut'
                Title.Caption = 'Autoriza'#231#227'o'
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 1114
            Height = 24
            Align = alTop
            Caption = 'Pagamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 113
          Width = 1116
          Height = 96
          Align = alTop
          TabOrder = 4
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 1114
            Height = 24
            Align = alTop
            Caption = 'Entrega'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ExplicitLeft = 2
            ExplicitTop = 9
          end
          object DBGrid4: TDBGrid
            Left = 1
            Top = 25
            Width = 1114
            Height = 70
            Align = alClient
            DataSource = dsDest
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'EntDocumento'
                Title.Caption = 'Documento'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntxLgr'
                Title.Caption = 'Logradouro'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Entnro'
                Title.Caption = 'Numero'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntxCpl'
                Title.Caption = 'Complemento'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntxBairro'
                Title.Caption = 'Bairro'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntcMun'
                Title.Caption = 'Codigo Munic'#237'pio'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntxMun'
                Title.Caption = 'Nome Munic'#237'pio'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EntUF'
                Title.Caption = 'UF'
                Width = 30
                Visible = True
              end>
          end
        end
      end
    end
  end
  object cdsPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 13
    Top = 441
    object cdsPgtotPag: TStringField
      Alignment = taRightJustify
      FieldName = 'tPag'
      Size = 10
    end
    object cdsPgtovPag: TCurrencyField
      FieldName = 'vPag'
    end
    object cdsPgtotpIntegra: TStringField
      Alignment = taRightJustify
      FieldName = 'tpIntegra'
      Size = 2
    end
    object cdsPgtoCNPJ: TStringField
      Alignment = taRightJustify
      FieldName = 'CNPJ'
      Size = 14
    end
    object cdsPgtotBand: TStringField
      DisplayLabel = 'Bandeira'
      FieldName = 'tBand'
      Size = 3
    end
    object cdsPgtocAut: TStringField
      Alignment = taRightJustify
      FieldName = 'cAut'
    end
  end
  object dsPagto: TDataSource
    DataSet = cdsPgto
    Left = 48
    Top = 442
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 133
    Top = 441
    object cdsItenscProd: TStringField
      FieldName = 'cProd'
      Size = 40
    end
    object cdsItensxProd: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'xProd'
      Size = 120
    end
    object cdsItensGTIN: TStringField
      FieldName = 'cEAN'
      Size = 30
    end
    object cdsItensNCM: TStringField
      FieldName = 'NCM'
      Size = 40
    end
    object cdsItensCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object cdsItensuCom: TStringField
      FieldName = 'uCom'
    end
    object cdsItensuTrib: TStringField
      FieldName = 'uTrib'
      Size = 30
    end
    object cdsItensGTINTrib: TStringField
      FieldName = 'cEANTrib'
      Size = 30
    end
    object cdsItensICMSOrigem: TStringField
      FieldName = 'ICMSOrig'
      Size = 3
    end
    object cdsItensCST: TStringField
      FieldName = 'ICMSCST'
      Size = 3
    end
    object cdsItensCSTPIS: TStringField
      FieldName = 'PISCST'
      Size = 3
    end
    object cdsItensCSTCOFINS: TStringField
      FieldName = 'COFINSCST'
      Size = 4
    end
    object cdsItensitemISS: TStringField
      FieldName = 'cListServ'
      Size = 40
    end
    object cdsItenscodISSQN: TStringField
      FieldName = 'cServico'
      Size = 40
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 173
    Top = 441
  end
  object cdsDest: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 440
    object cdsDestDestDocumento: TStringField
      FieldName = 'DestDocumento'
      Size = 15
    end
    object cdsDestDestxNome: TStringField
      FieldName = 'DestxNome'
      Size = 150
    end
    object cdsDestDestxLgr: TStringField
      FieldName = 'DestxLgr'
      Size = 150
    end
    object cdsDestDestxCpl: TStringField
      FieldName = 'DestxCpl'
      Size = 100
    end
    object cdsDestDestNro: TStringField
      FieldName = 'DestNro'
      Size = 10
    end
    object cdsDestDestxBairro: TStringField
      FieldName = 'DestxBairro'
      Size = 150
    end
    object cdsDestDestcMun: TStringField
      FieldName = 'DestcMun'
      Size = 8
    end
    object cdsDestDestxMun: TStringField
      FieldName = 'DestxMun'
      Size = 120
    end
    object cdsDestDestUF: TStringField
      FieldName = 'DestUF'
      Size = 2
    end
    object cdsDestDestCEP: TStringField
      FieldName = 'DestCEP'
      Size = 8
    end
    object cdsDestDestcPais: TStringField
      FieldName = 'DestcPais'
      Size = 10
    end
    object cdsDestDestxPais: TStringField
      FieldName = 'DestxPais'
      Size = 150
    end
    object cdsDestDestindIEDest: TStringField
      FieldName = 'DestindIEDest'
      Size = 50
    end
    object cdsDestDestIE: TStringField
      FieldName = 'DestIE'
      Size = 12
    end
    object cdsDestDestIM: TStringField
      FieldName = 'DestIM'
    end
    object cdsDestEntDocumento: TStringField
      FieldName = 'EntDocumento'
      Size = 30
    end
    object cdsDestEntxLgr: TStringField
      FieldName = 'EntxLgr'
      Size = 150
    end
    object cdsDestEntnro: TStringField
      FieldName = 'Entnro'
      Size = 10
    end
    object cdsDestEntxCpl: TStringField
      FieldName = 'EntxCpl'
      Size = 150
    end
    object cdsDestEntxBairro: TStringField
      FieldName = 'EntxBairro'
      Size = 150
    end
    object cdsDestEntcMun: TStringField
      FieldName = 'EntcMun'
      Size = 8
    end
    object cdsDestEntxMun: TStringField
      FieldName = 'EntxMun'
      Size = 150
    end
    object cdsDestEntUF: TStringField
      FieldName = 'EntUF'
      Size = 2
    end
  end
  object dsDest: TDataSource
    DataSet = cdsDest
    Left = 286
    Top = 442
  end
end
