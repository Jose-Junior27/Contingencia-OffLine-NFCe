object frmDocumentos: TfrmDocumentos
  Left = 0
  Top = 0
  Width = 1155
  Height = 710
  Caption = 'Demo Conting'#234'ncia NFCe ( Documentos OFF-Line )'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1147
    Height = 616
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object PgDocumentos: TPageControl
      Left = 1
      Top = 1
      Width = 1145
      Height = 614
      ActivePage = tsEmidasOff
      Align = alClient
      TabOrder = 0
      object tsEmidasOff: TTabSheet
        Caption = 'Emitidas OFF-LINE'
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 1137
          Height = 48
          Align = alTop
          Caption = 
            'Emitidas Off-Line (Ser'#227'o Transmitidas quando a conex'#227'o estiver O' +
            'n-Line)'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbGridOffLine: TDBGrid
          Left = 0
          Top = 48
          Width = 1137
          Height = 297
          Align = alClient
          DataSource = DM.dsOffLine
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object Panel5: TPanel
          Left = 0
          Top = 345
          Width = 1137
          Height = 41
          Align = alBottom
          Caption = 
            'Emitidas Off-Line com Rejei'#231#227'o de Envio (Precisam ser Corrigidas' +
            ' Manualmente)'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
        object DBGridOffLineErro: TDBGrid
          Left = 0
          Top = 386
          Width = 1137
          Height = 200
          Align = alBottom
          DataSource = DM.dsOffLineErro
          PopupMenu = PopupMenu1
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object tsDocumentos: TTabSheet
        Caption = ' Aguardando Consulta na SEFAZ'
        ImageIndex = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 1137
          Height = 49
          Align = alTop
          Caption = 
            'Estes documentos ficaram pendentes de consulta na SEFAZ ap'#243's ent' +
            'rar em Conting'#234'ncia. (Ser'#227'o Cancelados ou Inutilizados quando a ' +
            'conex'#227'o estiver On-Line).'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbGridPendentes: TDBGrid
          Left = 0
          Top = 49
          Width = 1137
          Height = 537
          Align = alClient
          DataSource = DM.dsPendentes
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 616
    Width = 1147
    Height = 63
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1147
      63)
    object Button1: TButton
      Left = 992
      Top = 9
      Width = 137
      Height = 41
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 1053
    Top = 33
    object maMenu: TMenuItem
      Bitmap.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE3E8E1758D6C2D5320234A15254C17254C17264D18264D18254C17
        254C17254C17264D18254C17264D18254C17284F1B537248BBC7B7FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFE6EAE44364370F3A00284F1B34582733572633572632
        57253257253357263357263357263257253357263257253357262F5422123C03
        18420AABBAA6FFFFFFFFFFFFFFFFFFFFFFFF77906F0F3A005D7A53D0D8CDECF0
        EBE9EDE8E8ECE7E8ECE7E8ECE7E8ECE7F2F4F1F4F6F3E9EDE8E8ECE7E8ECE7EA
        EEE9E1E6DF94A78D163F07335726E6EAE4FFFFFFFFFFFFFFFFFF284F1B2A501D
        DCE2DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6EAE4D9E0D7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D7A53133D04ABBAA6FFFFFFFFFFFFFF
        FFFF1741093D6031F4F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D9CE
        446538335726B5C2B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF899E820F3A009DAF
        97FFFFFFFFFFFFFFFFFF1B440D3A5E2EF0F3EFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD6DDD33C5F300F3A000F3A00254C17B7C4B2FFFFFFFFFFFFFFFFFFFFFFFF
        869B7E0F3A00A0B19AFFFFFFFFFFFFFFFFFF1B440D3A5E2EEFF2EEFFFFFFFFFF
        FFFFFFFFFFFFFFDBE2D94264360F3A000F3A000F3A000F3A00274E1ABBC7B7FF
        FFFFFFFFFFFFFFFF849A7C0F3A00A0B19AFFFFFFFFFFFFFFFFFF1B440D3A5E2E
        EFF2EEFFFFFFFFFFFFFFFFFFDFE5DD47683B0F3A000F3A000F3A000F3A000F3A
        000F3A002B511EC3CEBFFFFFFFFFFFFF8097780F3A009EAF98FFFFFFFFFFFFFF
        FFFF1B440D3A5E2EEFF2EEFFFFFFFFFFFFE4E9E2496A3E0F3A000F3A000F3A00
        0F3A000F3A000F3A000F3A000F3A002F5422C8D2C5FFFFFFB6C3B120481297AA
        91FFFFFFFFFFFFFFFFFF1B440D3A5E2EEEF1EDFFFFFFE3E8E14C6C410F3A000F
        3A000F3A000F3A00103B010F3A000F3A000F3A000F3A000F3A00325725CDD6CA
        FFFFFFB7C4B3CED7CBFFFFFFFFFFFFFFFFFF1B440D3A5E2EF6F7F5E6EAE45372
        480F3A000F3A000F3A000F3A000F3A007B937393A68C133D040F3A000F3A000F
        3A000F3A00335726D0D8CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B440D3A5E2E
        FEFEFEBAC7B6113C020F3A000F3A000F3A000F3A006F8966F7F9F7FFFFFF92A5
        8B103B010F3A000F3A000F3A000F3A00375B2BD0D8CDFFFFFFFFFFFFFFFFFFFF
        FFFF1B440D3A5E2EF4F6F3F0F3EF66815C0F3A000F3A000F3A00698460F5F7F4
        FFFFFFFFFFFFFDFDFD8FA3880F3A000F3A000F3A000F3A000F3A003A5E2ED2DA
        CFFFFFFFFFFFFFFFFFFF1B440D3A5E2EEFF2EEFFFFFFF1F3F0617D57133D0466
        815CF5F7F4FFFFFFFFFFFFFFFFFFFFFFFFFCFDFC899E820F3A000F3A000F3A00
        0F3A000F3A003F6133D7DFD5FFFFFFFFFFFF1B440D3A5E2EEFF2EEFFFFFFFFFF
        FFF2F4F1C3CEBFF2F4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE81
        9779123C030F3A000F3A000F3A000F3A00456639DCE2DAFFFFFF1A430C3A5E2E
        F0F3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDFDFD7B9373103B010F3A000F3A000F3A000F3A00496A3EE0
        E6DE1741093D6031F4F6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFC7891700F3A000F3A000F3A
        000F3A000F3A004B6B402A501D284F1BD9E0D7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        758D6C0F3A000F3A000F3A000F3A002C521F7B93730F3A0058764EC9D3C6E5E9
        E3E1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1E6DFE1
        E6DFD8DFD6FEFEFEF8FAF8718A680F3A000F3A0029501CC0CBBCE7ECE647683C
        0F3A00254C173156242F54222F54222F54222F54222F54222F54222F54222F54
        222F54222F54222F54222B511E5C7952F6F7F5F6F7F5768E6D3C5F30BCC8B8FF
        FFFFFFFFFFE5E9E37D9475345827274D1929501C29501C29501C29501C29501C
        29501C29501C29501C29501C29501C284F1B2E53215C7952ECF0EBFFFFFFF8FA
        F8EEF1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'Editar XML'
      OnClick = maMenuClick
    end
  end
end
