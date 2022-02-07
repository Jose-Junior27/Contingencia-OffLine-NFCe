unit uEditXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, ExtCtrls, StdCtrls,
  SHDocVw, DB, DBClient, Grids, DBGrids, OleCtrls;

ResourceString
  SErroCampoInvalido = 'Valor inválido para o campo: %s';

type
  Tfrm_Edit_XML = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tsXML: TTabSheet;
    tsAlterar: TTabSheet;
    cdsPgto: TClientDataSet;
    dsPagto: TDataSource;
    cdsPgtotPag: TStringField;
    cdsPgtovPag: TCurrencyField;
    cdsPgtotpIntegra: TStringField;
    cdsPgtoCNPJ: TStringField;
    cdsPgtocAut: TStringField;
    WebBrowser1: TWebBrowser;
    cdsPgtotBand: TStringField;
    Panel2: TPanel;
    btnEnviar: TButton;
    Panel3: TPanel;
    btnGravar: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    DBGrid4: TDBGrid;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItenscProd: TStringField;
    cdsItensxProd: TStringField;
    cdsItensGTIN: TStringField;
    cdsItensNCM: TStringField;
    cdsItensCFOP: TStringField;
    cdsItensGTINTrib: TStringField;
    cdsItensICMSOrigem: TStringField;
    cdsItensCST: TStringField;
    cdsItensCSTPIS: TStringField;
    cdsItensCSTCOFINS: TStringField;
    cdsItensitemISS: TStringField;
    cdsItenscodISSQN: TStringField;
    cdsDest: TClientDataSet;
    dsDest: TDataSource;
    cdsDestDestDocumento: TStringField;
    cdsDestDestxNome: TStringField;
    cdsDestDestxLgr: TStringField;
    cdsDestDestxCpl: TStringField;
    cdsDestDestxBairro: TStringField;
    cdsDestDestcMun: TStringField;
    cdsDestDestxMun: TStringField;
    cdsDestDestUF: TStringField;
    cdsDestDestCEP: TStringField;
    cdsDestDestcPais: TStringField;
    cdsDestDestxPais: TStringField;
    cdsDestDestindIEDest: TStringField;
    cdsDestDestIE: TStringField;
    cdsDestDestIM: TStringField;
    cdsDestEntDocumento: TStringField;
    cdsDestEntxLgr: TStringField;
    cdsDestEntnro: TStringField;
    cdsDestEntxCpl: TStringField;
    cdsDestEntxBairro: TStringField;
    cdsDestEntcMun: TStringField;
    cdsDestEntxMun: TStringField;
    cdsDestEntUF: TStringField;
    cdsDestDestNro: TStringField;
    cdsItensuCom: TStringField;
    cdsItensuTrib: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    FXML: String;
    FXMLCorrigido: String;

    procedure MostrarXML;
    procedure LerXMLAlterado;
    procedure CarregarXML(WS: String; MyWebBrowser: TWebBrowser);

  public
    { Public declarations }
    property XML : String read FXML write FXML;
    property XMLCorrigido : String read FXMLCorrigido;

  end;

var
  frm_Edit_XML: Tfrm_Edit_XML;

implementation

uses
  UDM, ACBrUtil, pcnConversao;

{$R *.dfm}

{ Tfrm_Edit_XML }

procedure Tfrm_Edit_XML.btnEnviarClick(Sender: TObject);
var
  AArqXMLERRO, AArqXMLOFF: String;
begin
  try
    AArqXMLOFF := PathWithDelim( DM.ContingenciaNFCe.ConfigContigencia.PathOffLine );
    DM.ACBrNFe1.NotasFiscais.Items[0].Assinar;
    DM.ACBrNFe1.NotasFiscais.Items[0].Validar;
    DM.ACBrNFe1.NotasFiscais.Items[0].GravarXML('',AArqXMLOFF);

  Except
    on E: exception do
    begin
       raise Exception.Create('ERRO AO GRAVAR XML NO DIRETORIO: '
                              + AArqXMLOFF
                              + sLineBreak + E.Message);

      exit;
    end;

  end;

  AArqXMLERRO := PathWithDelim( DM.ContingenciaNFCe.ConfigContigencia.PathOffLineErro )
                + OnlyNumber(DM.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) + '-nfe.xml';
  if (FileExists( AArqXMLERRO )) then
  begin
    try
      TryDeleteFile(AArqXMLERRO, 1000);
    except
      on E: exception do
      begin
        raise Exception.Create('ERRO AO EXCLUIR XML DO DIRETORIO: '
                            + AArqXMLERRO
                            + sLineBreak + E.Message);
      end;
    end;
  end;

  DM.ACBrNFe1.NotasFiscais.Clear;
  Close;

end;

procedure Tfrm_Edit_XML.btnGravarClick(Sender: TObject);
begin
  try
    LerXMLAlterado;
    PageControl1.ActivePageIndex:= 0;
    btnEnviar.Enabled:= True;
  except
    On E: Exception do
    begin
      raise Exception.Create( E.Message );
      Exit;
    end;
  end;

end;

procedure Tfrm_Edit_XML.CarregarXML(WS: String; MyWebBrowser: TWebBrowser);
begin
  ACBrUtil.WriteToTXT(PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml',
                      ACBrUtil.ConverteXMLtoUTF8(WS), False, False);

  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName)) + 'temp.xml');

end;

procedure Tfrm_Edit_XML.FormCreate(Sender: TObject);
begin
  FXML := '';
  FXMLCorrigido:= '';

  PageControl1.ActivePageIndex := 0;

end;

procedure Tfrm_Edit_XML.FormShow(Sender: TObject);
begin
  MostrarXML;
end;

procedure Tfrm_Edit_XML.LerXMLAlterado;
var
  OK: boolean;
  I: Integer;
begin
  if (cdsDest.State in dsEditModes) then
    cdsDest.Post;
  if (cdsItens.State in dsEditModes) then
    cdsItens.Post;
  if (cdsPgto.State in dsEditModes) then
    cdsPgto.Post;

  with Dm.ACBrNFe1.NotasFiscais.Items[0] do
  begin
    NFe.Dest.xNome := cdsDest.FieldByName('DestxNome').AsString;

    with NFe.Dest.EnderDest do
    begin
      xLgr := cdsDest.FieldByName('DestxLgr').AsString;
      nro := cdsDest.FieldByName('Destnro').AsString;
      xCpl := cdsDest.FieldByName('DestxCpl').AsString;
      xBairro := cdsDest.FieldByName('DestxBairro').AsString;
      cMun := cdsDest.FieldByName('DestcMun').AsInteger;
      xMun := cdsDest.FieldByName('DestxMun').AsString;
      UF := cdsDest.FieldByName('DestUF').AsString;
      CEP := cdsDest.FieldByName('DestCEP').AsInteger;
      cPais := cdsDest.FieldByName('DestcPais').AsInteger;
      xPais := cdsDest.FieldByName('DestxPais').AsString;
    end;

    NFe.Dest.indIEDest := StrToindIEDest(OK, cdsDest.FieldByName('DestindIEDest').AsString);
    if not OK then
      raise Exception.CreateFmt(SErroCampoInvalido,['Indicador da IE']);

    NFe.Dest.IE := cdsDest.FieldByName('DestIE').AsString;
    NFe.Dest.IM := cdsDest.FieldByName('DestIM').AsString;

    with NFe.Entrega do
    begin
      CNPJCPF := cdsDest.FieldByName('EntDocumento').AsString;
      xLgr := cdsDest.FieldByName('EntxLgr').AsString;
      nro := cdsDest.FieldByName('Entnro').AsString;
      xCpl := cdsDest.FieldByName('EntxCpl').AsString;
      xBairro := cdsDest.FieldByName('EntxBairro').AsString;
      cMun := cdsDest.FieldByName('EntcMun').AsInteger;
      xMun := cdsDest.FieldByName('EntxMun').AsString;
      UF := cdsDest.FieldByName('EntUF').AsString;
    end;

    cdsItens.First;
    I := 0;
    while not cdsItens.EOF do
    begin
      NFe.Det.Items[I].Prod.cProd := cdsItens.FieldByName('cProd').AsString;
      NFe.Det.Items[I].Prod.xProd := cdsItens.FieldByName('xProd').AsString;
      NFe.Det.Items[I].Prod.cEAN := cdsItens.FieldByName('cEAN').AsString;
      NFe.Det.Items[I].Prod.NCM := cdsItens.FieldByName('NCM').AsString;
      NFe.Det.Items[I].Prod.CFOP := cdsItens.FieldByName('CFOP').AsString;
      NFe.Det.Items[I].Prod.uCom := cdsItens.FieldByName('uCom').AsString;
      NFe.Det.Items[I].Prod.uTrib := cdsItens.FieldByName('uTrib').AsString;
      NFe.Det.Items[I].Prod.cEANTrib := cdsItens.FieldByName('cEANTrib').AsString;

      NFe.Det.Items[I].Imposto.ICMS.orig := StrToOrig(OK, cdsItens.FieldByName('ICMSOrig').AsString);
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['Origem ICMS '+IntToStrZero(I+1,3)]);

      if NFe.Emit.CRT = crtSimplesNacional then
      begin
        NFe.Det.Items[I].Imposto.ICMS.CSOSN := StrToCSOSNIcms(OK, cdsItens.FieldByName('ICMSCST').AsString);
        if not OK then
          raise Exception.CreateFmt(SErroCampoInvalido,['CSOSN ICMS '+IntToStrZero(I+1,3)]);
      end
      else
      begin
        NFe.Det.Items[I].Imposto.ICMS.CST := StrToCSTICMS(OK, cdsItens.FieldByName('ICMSCST').AsString);
        if not OK then
          raise Exception.CreateFmt(SErroCampoInvalido,['CSOSN ICMS '+IntToStrZero(I+1,3)]);
      end;

      NFe.Det.Items[I].Imposto.PIS.CST := StrToCSTPIS(OK, cdsItens.FieldByName('PISCST').AsString);
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['CST PIS '+IntToStrZero(I+1,3)]);

      NFe.Det.Items[I].Imposto.COFINS.CST := StrToCSTCOFINS(OK, cdsItens.FieldByName('COFINSCST').AsString);
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['CST COFINS '+IntToStrZero(I+1,3)]);

      NFe.Det.Items[I].Imposto.ISSQN.cListServ := cdsItens.FieldByName('cListServ').AsString;
      NFe.Det.Items[I].Imposto.ISSQN.cServico := cdsItens.FieldByName('cServico').AsString;

      Inc(I);
      cdsItens.Next;
    end;

    cdsPgto.First;
    I := 0;
    while not cdsPgto.EOF do
    begin
      NFe.pag.Items[I].tPag := StrToFormaPagamento(OK, IntToStrZero(cdsPgto.FieldByName('tPag').AsInteger, 2));
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['Tipo de Pagamento '+IntToStrZero(I+1,3)]);
      NFe.pag.Items[I].vPag := cdsPgto.FieldByName('vPag').AsFloat;
      NFe.pag.Items[I].tpIntegra := StrTotpIntegra(OK, cdsPgto.FieldByName('tpIntegra').AsString);
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['Tipo Integração '+IntToStrZero(I+1,3)]);
      NFe.pag.Items[I].CNPJ := cdsPgto.FieldByName('CNPJ').AsString;
      NFe.pag.Items[I].tBand := StrToBandeiraCartao(OK, cdsPgto.FieldByName('tBand').AsString);
      if not OK then
        raise Exception.CreateFmt(SErroCampoInvalido,['Bandeira '+IntToStrZero(I+1,3)]);
      NFe.pag.Items[I].cAut := cdsPgto.FieldByName('cAut').AsString;

      Inc(I);
      cdsPgto.Next;

    end;

    XML:= GerarXML;
    FXMLCorrigido := XML;

    CarregarXML(FXMLCorrigido, WebBrowser1);

  end;

end;

procedure Tfrm_Edit_XML.MostrarXML;
var
  I: Integer;
begin
  if EstaVazio(FXML) then
    raise Exception.Create('XML não encontrado');

  DM.ACBrNFe1.NotasFiscais.Clear;
  DM.ACBrNFe1.NotasFiscais.LoadFromString(FXML);
  if DM.ACBrNFe1.NotasFiscais.Count = 0 then
    raise Exception.Create('XML Inválido');

  cdsDest.Close;
  cdsItens.Close;
  cdsPgto.Close;

  cdsDest.CreateDataSet;
  cdsItens.CreateDataSet;
  cdsPgto.CreateDataset;

  with DM.ACBrNFe1.NotasFiscais.Items[0] do
  begin
    cdsDest.Open;
    cdsDest.Insert;

    if NaoEstaVazio(NFe.Dest.idEstrangeiro) then
      cdsDest.FieldByName('DestDocumento').AsString := NFe.Dest.idEstrangeiro
    else
      cdsDest.FieldByName('DestDocumento').AsString := NFe.Dest.CNPJCPF;

    cdsDest.FieldByName('DestxNome').AsString := NFe.Dest.xNome;

    with NFe.Dest.EnderDest do
    begin
      cdsDest.FieldByName('DestxLgr').AsString := xLgr;
      cdsDest.FieldByName('Destnro').AsString := nro;
      cdsDest.FieldByName('DestxCpl').AsString := xCpl;
      cdsDest.FieldByName('DestxBairro').AsString := xBairro;
      cdsDest.FieldByName('DestcMun').AsInteger := cMun;
      cdsDest.FieldByName('DestxMun').AsString := xMun;
      cdsDest.FieldByName('DestUF').AsString := UF;
      cdsDest.FieldByName('DestCEP').AsInteger := CEP;
      cdsDest.FieldByName('DestcPais').AsInteger := cPais;
      cdsDest.FieldByName('DestxPais').AsString := xPais;
    end;

    cdsDest.FieldByName('DestindIEDest').AsString := indIEDestToStr(NFe.Dest.indIEDest);
    cdsDest.FieldByName('DestIE').AsString := NFe.Dest.IE;
    cdsDest.FieldByName('DestIM').AsString := NFe.Dest.IM;

    with NFe.Entrega do
    begin
      cdsDest.FieldByName('EntDocumento').AsString := CNPJCPF;
      cdsDest.FieldByName('EntxLgr').AsString := xLgr;
      cdsDest.FieldByName('Entnro').AsString := nro;
      cdsDest.FieldByName('EntxCpl').AsString := xCpl;
      cdsDest.FieldByName('EntxBairro').AsString := xBairro;
      cdsDest.FieldByName('EntcMun').AsInteger := cMun;
      cdsDest.FieldByName('EntxMun').AsString := xMun;
      cdsDest.FieldByName('EntUF').AsString := UF;
    end;
    cdsDest.Post;

    cdsItens.Open;
    for I:=0 to NFe.Det.Count-1 do
    begin
      cdsItens.Append;
      cdsItens.FieldByName('cProd').AsString := NFe.Det.Items[I].Prod.cProd;
      cdsItens.FieldByName('xProd').AsString := NFe.Det.Items[I].Prod.xProd;
      cdsItens.FieldByName('cEAN').AsString := NFe.Det.Items[I].Prod.cEAN;
      cdsItens.FieldByName('NCM').AsString := NFe.Det.Items[I].Prod.NCM;
      cdsItens.FieldByName('CFOP').AsString := NFe.Det.Items[I].Prod.CFOP;
      cdsItens.FieldByName('uCom').AsString := NFe.Det.Items[I].Prod.uCom;
      cdsItens.FieldByName('uTrib').AsString := NFe.Det.Items[I].Prod.uTrib;
      cdsItens.FieldByName('cEANTrib').AsString := NFe.Det.Items[I].Prod.cEANTrib;

      cdsItens.FieldByName('ICMSOrig').AsString := OrigToStr(NFe.Det.Items[I].Imposto.ICMS.orig);
      if NFe.Emit.CRT = crtSimplesNacional then
        cdsItens.FieldByName('ICMSCST').AsString := CSOSNIcmsToStr(NFe.Det.Items[I].Imposto.ICMS.CSOSN)
      else
        cdsItens.FieldByName('ICMSCST').AsString := CSTICMSToStr(NFe.Det.Items[I].Imposto.ICMS.CST);

      cdsItens.FieldByName('PISCST').AsString := CSTPISToStr(NFe.Det.Items[I].Imposto.PIS.CST);
      cdsItens.FieldByName('COFINSCST').AsString := CSTCOFINSToStr(NFe.Det.Items[I].Imposto.COFINS.CST);

      cdsItens.FieldByName('cListServ').AsString := NFe.Det.Items[I].Imposto.ISSQN.cListServ;
      cdsItens.FieldByName('cServico').AsString := NFe.Det.Items[I].Imposto.ISSQN.cServico;

      cdsItens.Post;
    end;

    cdsPgto.Open;
    for I:=0 to NFe.pag.Count-1 do
    begin
      cdsPgto.Append;
      cdsPgto.FieldByName('tPag').AsString := FormaPagamentoToStr(NFe.pag.Items[I].tPag);
      cdsPgto.FieldByName('vPag').AsFloat :=  NFe.pag.Items[I].vPag;
      cdsPgto.FieldByName('tpIntegra').AsString := tpIntegraToStr(NFe.pag.Items[I].tpIntegra);
      cdsPgto.FieldByName('CNPJ').AsString := NFe.pag.Items[I].CNPJ;
      cdsPgto.FieldByName('tBand').AsString := BandeiraCartaoToStr(NFe.pag.Items[I].tBand);
      cdsPgto.FieldByName('cAut').AsString := NFe.pag.Items[I].cAut;
      cdsPgto.Post;
    end;
  end;

  CarregarXML(FXML, WebBrowser1);

end;

end.
