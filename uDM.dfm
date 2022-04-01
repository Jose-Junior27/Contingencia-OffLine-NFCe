object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 219
  Width = 484
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libWinCrypt
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsLibXml2
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.IdCSC = '000001'
    Configuracoes.Arquivos.PathSalvar = 'C:\ACBr\Projetos\Demo NFCe Contingencia\Logs\'
    Configuracoes.Arquivos.PathSchemas = 'C:\ACBr\Exemplos\ACBrDFe\Schemas\NFe\'
    Configuracoes.Arquivos.AdicionarLiteral = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SepararPorAno = True
    Configuracoes.Arquivos.SepararPorMes = True
    Configuracoes.Arquivos.EmissaoPathNFe = True
    Configuracoes.Arquivos.SalvarEvento = True
    Configuracoes.Arquivos.SalvarApenasNFeProcessadas = True
    Configuracoes.Arquivos.PathNFe = 'C:\ACBr\Projetos\Demo NFCe Contingencia\XMLs'
    Configuracoes.Arquivos.PathInu = 'C:\ACBr\Projetos\Demo NFCe Contingencia\Inutilizados\'
    Configuracoes.Arquivos.PathEvento = 'C:\ACBr\Projetos\Demo NFCe Contingencia\Eventos\'
    Configuracoes.WebServices.UF = 'AM'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.Tentativas = 2
    Configuracoes.WebServices.Salvar = True
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.WebServices.SSLType = LT_TLSv1_2
    Configuracoes.Certificados.ArquivoPFX = 'D:\cert\PROJETO_ACBR_CONSULTORIA_LTDA_12021.pfx'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 49
    Top = 25
  end
  object ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 8.000000000000000000
    MargemSuperior = 8.000000000000000000
    MargemEsquerda = 6.000000000000000000
    MargemDireita = 5.100000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    FonteLinhaItem.Charset = DEFAULT_CHARSET
    FonteLinhaItem.Color = clWindowText
    FonteLinhaItem.Height = -9
    FonteLinhaItem.Name = 'Lucida Console'
    FonteLinhaItem.Style = []
    Left = 145
    Top = 25
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 193
    Top = 25
  end
  object cdsOffLineErro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 97
    object cdsOffLineErroChave: TStringField
      FieldName = 'Chave'
      Size = 44
    end
    object cdsOffLineErrosStat: TStringField
      FieldName = 'cStat'
      Size = 5
    end
    object cdsOffLineErroStatus: TStringField
      FieldName = 'Status'
      Size = 65
    end
    object cdsOffLineErroData_HoraTransmissao: TDateTimeField
      DisplayLabel = 'Data/Hora'
      FieldName = 'Data_HoraTransmissao'
    end
    object cdsOffLineErroMsg: TStringField
      FieldName = 'Msg'
      Size = 250
    end
  end
  object dsOffLineErro: TDataSource
    DataSet = cdsOffLineErro
    Left = 84
    Top = 96
  end
  object cdsPendentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 140
    Top = 97
    object cdsPendentesChave: TStringField
      FieldName = 'Chave'
      Size = 44
    end
    object cdsPendentescStat: TStringField
      FieldName = 'cStat'
      Size = 4
    end
    object cdsPendentesStatus: TStringField
      FieldName = 'Status'
      Size = 65
    end
    object cdsPendentesCancelada: TBooleanField
      FieldName = 'Canc'
    end
    object cdsPendentesInut: TBooleanField
      FieldName = 'Inut'
    end
    object cdsPendentesData_Hora_Transmissao: TDateTimeField
      DisplayLabel = 'Data Hora'
      FieldName = 'Data_Hora_Transmissao'
    end
    object cdsPendentesMsg: TStringField
      FieldName = 'Msg'
      Size = 255
    end
    object cdsPendentesChave_Subs: TStringField
      DisplayLabel = 'Chave Subs'
      FieldName = 'Chave_Subs'
      Size = 44
    end
  end
  object dsPendentes: TDataSource
    AutoEdit = False
    DataSet = cdsPendentes
    Left = 180
    Top = 97
  end
  object cdsOffLine: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 236
    Top = 97
    object cdsOffLineChave: TStringField
      FieldName = 'Chave'
      Size = 44
    end
    object cdsOffLinecStat: TStringField
      FieldName = 'cStat'
      Size = 5
    end
    object cdsOffLineStatus: TStringField
      FieldName = 'Status'
      Size = 65
    end
    object cdsOffLineData_HoraTransmissao: TDateTimeField
      DisplayLabel = 'Data/Hora'
      FieldName = 'Data_HoraTransmissao'
    end
    object cdsOffLineMsg: TStringField
      FieldName = 'Msg'
      Size = 250
    end
  end
  object dsOffLine: TDataSource
    AutoEdit = False
    DataSet = cdsOffLine
    Left = 276
    Top = 97
  end
end
