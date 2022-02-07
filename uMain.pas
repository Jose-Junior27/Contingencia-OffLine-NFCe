{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{ Colaboradores nesse arquivo: José M S Junior                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatuí - SP - 18270-170         }
{******************************************************************************}

unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, StrUtils, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, Buttons, StdCtrls,
  ComCtrls, DB, Grids, DBGrids, DBClient, Provider,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrDANFCeFortesFr,
  ACBrBase, ACBrDFe, ACBrNFe, pcnConversao, ACBrDFeUtil, pcnConversaoNFe,
  uContingenciaNFCe, ACBrUtil, Spin, ACBrPosPrinter,
  uDM, ACBrEnterTab, ImgList, System.ImageList;

const
  //CErrorContingencia: array[0..6] of String = ( '10060', '12002', '12006', '12007', '12029', '12030', '16006' );
  SELDIRHELP = 1000;
  CJustificaOffLine = 'Emitido em Contingência por falha na comunicação';

type

  TForm_Demo_Contingencia = class(TForm)
    pnlPrincipal: TPanel;
    pnlCabecalho: TPanel;
    pnlRodape: TPanel;
    pnlTelaLog: TPanel;
    pnlTelaConfiguracoes: TPanel;
    pnlTelaPDV: TPanel;
    lblTitulo: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label1: TLabel;
    memoLog: TMemo;
    PageControlPDV: TPageControl;
    tsPagamento: TTabSheet;
    tsVenda: TTabSheet;
    tsFinaliza: TTabSheet;
    pnlPagamento: TPanel;
    pnlFinaliza: TPanel;
    Label15: TLabel;
    edtTotalVenda3: TEdit;
    Label21: TLabel;
    edtTotalPago: TEdit;
    Label22: TLabel;
    edtTroco: TEdit;
    btnEmitir: TBitBtn;
    Label14: TLabel;
    edtTotalVenda2: TEdit;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    edtPagamento: TEdit;
    edtValor: TEdit;
    edtAPagarTroco: TEdit;
    btnPagar: TBitBtn;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    SpeedButton2: TSpeedButton;
    spbProximo: TSpeedButton;
    spbVoltar: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SpeedButton3: TSpeedButton;
    Splitter3: TSplitter;
    pnlVenda: TPanel;
    Label9: TLabel;
    edtTotalVenda1: TEdit;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtTotalItem: TEdit;
    edtPrecoUnitario: TEdit;
    edtQtde: TEdit;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    btnCancelaRegistro: TBitBtn;
    btnRegistraVenda: TBitBtn;
    cdsProdutosCodigo: TStringField;
    cdsProdutosQtde: TFloatField;
    cdsProdutosPreco: TCurrencyField;
    cdsProdutosDescricao: TStringField;
    cdsProdutosTotal: TCurrencyField;
    Label2: TLabel;
    cdsProdutosItem: TIntegerField;
    pnlMenuInferior: TPanel;
    PageControl4: TPageControl;
    TabSheet3: TTabSheet;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    gbCertificado: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    sbtnCaminhoCert: TSpeedButton;
    Label5: TLabel;
    sbtnGetCert: TSpeedButton;
    Label51: TLabel;
    edtCaminho: TEdit;
    edtSenha: TEdit;
    edtNumSerie: TEdit;
    edtURLPFX: TEdit;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    sbtnPathSalvar: TSpeedButton;
    Label29: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label42: TLabel;
    spPathSchemas: TSpeedButton;
    edtPathLogs: TEdit;
    ckSalvar: TCheckBox;
    cbFormaEmissao: TComboBox;
    cbxAtualizarXML: TCheckBox;
    cbxExibirErroSchema: TCheckBox;
    edtFormatoAlerta: TEdit;
    cbModeloDF: TComboBox;
    cbxRetirarAcentos: TCheckBox;
    cbVersaoDF: TComboBox;
    edtIdToken: TEdit;
    edtToken: TEdit;
    edtPathSchemas: TEdit;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    lTimeOut: TLabel;
    lSSLLib1: TLabel;
    cbxVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    cbxSalvarSOAP: TCheckBox;
    seTimeOut: TSpinEdit;
    cbSSLType: TComboBox;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    gbxRetornoEnvio: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbxAjustarAut: TCheckBox;
    edtTentativas: TEdit;
    edtIntervalo: TEdit;
    edtAguardar: TEdit;
    TabSheet12: TTabSheet;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label52: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitRazao: TEdit;
    edtEmitFantasia: TEdit;
    edtEmitFone: TEdit;
    edtEmitCEP: TEdit;
    edtEmitLogradouro: TEdit;
    edtEmitNumero: TEdit;
    edtEmitComp: TEdit;
    edtEmitBairro: TEdit;
    edtEmitCodCidade: TEdit;
    edtEmitCidade: TEdit;
    edtEmitUF: TEdit;
    cbTipoEmpresa: TComboBox;
    TabSheet13: TTabSheet;
    sbPathNFe: TSpeedButton;
    Label48: TLabel;
    Label49: TLabel;
    sbPathCan: TSpeedButton;
    Label50: TLabel;
    sbPathCCe: TSpeedButton;
    Label53: TLabel;
    sbPathInu: TSpeedButton;
    Label54: TLabel;
    sbPathDPEC: TSpeedButton;
    Label55: TLabel;
    sbPathEvento: TSpeedButton;
    cbxSalvarArqs: TCheckBox;
    cbxPastaMensal: TCheckBox;
    cbxAdicionaLiteral: TCheckBox;
    cbxEmissaoPathNFe: TCheckBox;
    cbxSalvaPathEvento: TCheckBox;
    cbxSepararPorCNPJ: TCheckBox;
    edtPathCCe: TEdit;
    edtPathNFe: TEdit;
    edtPathCan: TEdit;
    edtPathInu: TEdit;
    edtPathDPEC: TEdit;
    edtPathEvento: TEdit;
    cbxSepararPorModelo: TCheckBox;
    Panel2: TPanel;
    spbDocs: TSpeedButton;
    Impressao: TTabSheet;
    Label56: TLabel;
    edtLogoMarca: TEdit;
    sbtnLogoMarca: TSpeedButton;
    rgTipoDanfe: TRadioGroup;
    rgDANFCE: TRadioGroup;
    gbEscPos: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    btSerial: TBitBtn;
    cbxModeloPosPrinter: TComboBox;
    cbxPorta: TComboBox;
    cbxPagCodigo: TComboBox;
    seColunas: TSpinEdit;
    seEspLinhas: TSpinEdit;
    seLinhasPular: TSpinEdit;
    cbCortarPapel: TCheckBox;
    OpenDialog1: TOpenDialog;
    OFFLINE: TTabSheet;
    SpnTempoTransmiteOff: TSpinEdit;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    SpnTempoVoltarOnLine: TSpinEdit;
    Label66: TLabel;
    Label67: TLabel;
    edtPathOffLine: TEdit;
    edtPathPendentes: TEdit;
    Label68: TLabel;
    spbPathOff: TSpeedButton;
    spbPathPendente: TSpeedButton;
    ckbContingenciaAutomatica: TCheckBox;
    Panel3: TPanel;
    SpinAvisos: TSpinEdit;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    SpinBloqueios: TSpinEdit;
    Label72: TLabel;
    Label73: TLabel;
    ImageList1: TImageList;
    btnChaveOnLine: TSpeedButton;
    lblLigar: TLabel;
    Label75: TLabel;
    edtPathOffLineErro: TEdit;
    spbPathOffErro: TSpeedButton;
    edtNumNFCe: TEdit;
    Label76: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    ckOffLineComErro: TCheckBox;
    ckGravarLog: TCheckBox;
    spbConfig: TSpeedButton;
    MenInfOffLine: TMemo;
    pnlAvisos: TPanel;
    lblOn: TLabel;
    Label74: TLabel;
    BtnGravarConfig: TBitBtn;
    cbxSalvarApenasDocumentosProcessados: TCheckBox;
    Label77: TLabel;
    edtPathServicos: TEdit;
    spPathServicos: TSpeedButton;
    procedure PathClick(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
    procedure spbProximoClick(Sender: TObject);
    procedure PageControlPDVChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmitirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tsPagamentoShow(Sender: TObject);
    procedure tsFinalizaShow(Sender: TObject);
    procedure btnCancelaRegistroClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnRegistraVendaClick(Sender: TObject);
    procedure edtAPagarTrocoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure pnlVendaEnter(Sender: TObject);
    procedure edtQtdeEnter(Sender: TObject);
    procedure edtQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorEnter(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeExit(Sender: TObject);
    procedure sbPathNFeClick(Sender: TObject);
    procedure sbPathCanClick(Sender: TObject);
    procedure sbPathCCeClick(Sender: TObject);
    procedure sbPathDPECClick(Sender: TObject);
    procedure sbPathEventoClick(Sender: TObject);
    procedure sbPathInuClick(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnCaminhoCertClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure spPathSchemasClick(Sender: TObject);
    procedure spbPathOffClick(Sender: TObject);
    procedure spbPathPendenteClick(Sender: TObject);
    procedure btnChaveOnLineClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure spbConfigClick(Sender: TObject);
    procedure spbPathOffErroClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarConfigClick(Sender: TObject);
    procedure spbDocsClick(Sender: TObject);
    procedure spPathServicosClick(Sender: TObject);

  private

    procedure SetPage(Sender: TPageControl);
    procedure SetNextPage(Sender: TPageControl);
    procedure SetBackPage(Sender: TPageControl);
    procedure IniciaRegistro;
    procedure IniciaVenda;
    procedure AddProduto(cod: String; qtde: Double; Preco: Currency; Descricao: String; Total: Currency);
    procedure CalcItem(qtde: Double; Preco: Double);
    procedure CalcPagamento(vlrTotal, vlrPago: Double);
    procedure ExpandeTelaConfig;
    procedure ColapsaTelaConfig;
    procedure ConfigPainel(PanelMenu: TPanel; PosicaoMin, PosicaoMax: integer; Edicao: Boolean);
    //function UltimaLeitura():String;
    //function LerPeso():Double;
    procedure EscreverDisplay(linha: Integer= 1; Msg: String= '');
    procedure AlimentarNFCe(NumDFe: Integer);
    procedure EventNFeTransmitError(const HttpError, InternalError: Integer;
      const URL, DadosEnviados, SoapAction: string; var Retentar, Tratado: Boolean);
    procedure Log(const Header: String; const Msg: String);

    function EnviarNFCe: Boolean;
    function EmitirOffLine(NumNF: Integer = 0): Boolean;
    function GravarNFCePendente: Boolean;
    function EntrarEmContingencia: Boolean;
    function IncrementarNFCe: Integer;

    procedure GravarConfiguracao;
    procedure LerConfiguracao;
    procedure ConfigurarComponente(ACBrNFe: TACBrNFe);
    procedure BotaoLigaOffLine;

    procedure AtualizarSSLLibsCombo;

    //procedure PrepararImpressao;

  protected
    procedure AtualizarCamposConfig(AConfigContingencia: TConfigContigencia);
    procedure EventNFCeEmitidasOffLine(AListaOffLine: TListaNFCeEmitidaOffLine);
    procedure EventNFCePendentes(AListaNFCePendentes: TListaNFCePendentes);
    procedure EventNFCeOffLineErro(AListaOffLineErro: TListaNFCeOffLineErro);
    procedure EventLogOffLine(ALogOff: String);
    procedure EventAlertaOffLine(AAlerta: Integer);
    procedure EventBloqueioOffLine(ABloq: Integer);
    procedure EventAtualizaTransmissaoOffLine(AChave, AXML: String);
    procedure EventAtualizaTransmissaoPendente(ATipoDoc: Char; AChave, AXML: String);

  public
    { Public declarations }
    procedure AtualizarTelaConfiguracaoContingencia;
    procedure GravarConfiguracaoContingencia;

  end;

var
  Form_Demo_Contingencia: TForm_Demo_Contingencia;
  Item: Integer;
  TotalVenda: Double;
  TotalPago: Double;
  Troco: Double;

implementation

uses
  IniFiles, blcksock, TypInfo, math, FileCtrl, ACBrDFeConfiguracoes, ACBrDFeSSL, ACBrDFeOpenSSL,
  ACBrNFeNotasFiscais, ACBrNFeConfiguracoes, UDocumentos;

{$R *.dfm}

{ TForm_Demo_Contingencia }

procedure TForm_Demo_Contingencia.AddProduto(cod: String; qtde: Double;
  Preco: Currency; Descricao: String; Total: Currency);
var
  lItem: Integer;
begin
  with cdsProdutos do
  begin
    if not Active then
    begin
      CreateDataSet;
      Open;
    end;
    lItem:= RecordCount + 1;

    Insert;
    FieldByName('Item').AsInteger:= lItem;
    FieldByName('Codigo').AsString:= cod;
    FieldByName('qtde').AsFloat:= qtde;
    FieldByName('Preco').AsCurrency:= Preco;
    FieldByName('Descricao').AsString:= Descricao;
    FieldByName('Total').AsCurrency:= Total;
    Post;
  end;
end;

procedure TForm_Demo_Contingencia.AlimentarNFCe(NumDFe: Integer);
var
  vInc: Integer;
  BaseCalculo,
  ValorICMS: Double;
  ok: Boolean;
begin
  vInc:= 0;
  BaseCalculo:= 0;
  ValorICMS:= 0;

  with DM.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    Ide.natOp     := 'VENDA';
    Ide.indPag    := ipVista;
    Ide.modelo    := 65;
    Ide.serie     := 2;
    Ide.nNF       := NumDFe;
    Ide.cNF       := GerarCodigoDFe(Ide.nNF);
    Ide.dEmi      := now;
    Ide.dSaiEnt   := now;
    Ide.hSaiEnt   := now;
    Ide.tpNF      := tnSaida;
    Ide.tpEmis    := teNormal;
    Ide.tpAmb     := taHomologacao;  //Lembre-se de trocar esta variavel quando for para ambiente de producao
    Ide.cUF       := UFtoCUF(edtEmitUF.Text);
    Ide.cMunFG    := StrToInt(edtEmitCodCidade.Text);
    Ide.finNFe    := fnNormal;
    Ide.tpImp     := tiNFCe;
    Ide.indFinal  := cfConsumidorFinal;
    Ide.indPres   := pcPresencial;

    // Valores aceitos:
    // iiSemOperacao, iiOperacaoSemIntermediador, iiOperacaoComIntermediador
//    Ide.indIntermed := iiSemOperacao;

//*****Tags para Contingencia*****
//     Ide.dhCont := date;
//     Ide.xJust  := 'Justificativa Contingencia';

    Emit.CNPJCPF           := edtEmitCNPJ.Text;
    Emit.IE                := edtEmitIE.Text;
    Emit.xNome             := edtEmitRazao.Text;
    Emit.xFant             := edtEmitFantasia.Text;

    Emit.EnderEmit.fone    := edtEmitFone.Text;
    Emit.EnderEmit.CEP     := StrToInt(edtEmitCEP.Text);
    Emit.EnderEmit.xLgr    := edtEmitLogradouro.Text;
    Emit.EnderEmit.nro     := edtEmitNumero.Text;
    Emit.EnderEmit.xCpl    := edtEmitComp.Text;
    Emit.EnderEmit.xBairro := edtEmitBairro.Text;
    Emit.EnderEmit.cMun    := StrToInt(edtEmitCodCidade.Text);
    Emit.EnderEmit.xMun    := edtEmitCidade.Text;
    Emit.EnderEmit.UF      := edtEmitUF.Text;
    Emit.enderEmit.cPais   := 1058;
    Emit.enderEmit.xPais   := 'BRASIL';

    Emit.IEST := '';

    // esta sendo somando 1 uma vez que o ItemIndex inicia do zero e devemos
    // passar os valores 1, 2 ou 3
    // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
    Emit.CRT  := StrToCRT(Ok, IntToStr(cbTipoEmpresa.ItemIndex + 1));

    // Na NFC-e o Destinatário é opcional
    {
    Dest.CNPJCPF           := 'informar o CPF do destinatário';
    Dest.ISUF              := '';
    Dest.xNome             := 'nome do destinatário';

    Dest.indIEDest         := inNaoContribuinte;

    Dest.EnderDest.Fone    := '1533243333';
    Dest.EnderDest.CEP     := 18270170;
    Dest.EnderDest.xLgr    := 'Rua Coronel Aureliano de Camargo';
    Dest.EnderDest.nro     := '973';
    Dest.EnderDest.xCpl    := '';
    Dest.EnderDest.xBairro := 'Centro';
    Dest.EnderDest.cMun    := 3554003;
    Dest.EnderDest.xMun    := 'Tatuí';
    Dest.EnderDest.UF      := 'SP';
    Dest.EnderDest.cPais   := 1058;
    Dest.EnderDest.xPais   := 'BRASIL';
    }

//Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário
    Retirada.CNPJCPF := '';
    Retirada.xLgr    := '';
    Retirada.nro     := '';
    Retirada.xCpl    := '';
    Retirada.xBairro := '';
    Retirada.cMun    := 0;
    Retirada.xMun    := '';
    Retirada.UF      := '';

//Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário
    Entrega.CNPJCPF := '';
    Entrega.xLgr    := '';
    Entrega.nro     := '';
    Entrega.xCpl    := '';
    Entrega.xBairro := '';
    Entrega.cMun    := 0;
    Entrega.xMun    := '';
    Entrega.UF      := '';

//Adicionando Produtos simulados no PDV
//************************************//
    cdsProdutos.DisableControls;
    cdsProdutos.last;
    while not cdsProdutos.Bof do
    begin
      inc(vInc);
      with Det.New do
      begin
        Prod.nItem    := vInc; // Número sequencial, para cada item deve ser incrementado
        Prod.cProd    := cdsProdutos.FieldByName('codigo').AsString;
        Prod.cEAN     := '7896523206646';
        Prod.xProd    := cdsProdutos.FieldByName('Descricao').AsString;
        Prod.NCM      := '94051010'; // Tabela NCM disponível em  http://www.receita.fazenda.gov.br/Aliquotas/DownloadArqTIPI.htm
        Prod.EXTIPI   := '';
        Prod.CFOP     := '5402';
        Prod.uCom     := 'UN';
        Prod.qCom     := cdsProdutos.FieldByName('Qtde').AsFloat;
        Prod.vUnCom   := cdsProdutos.FieldByName('Preco').AsFloat;
        Prod.vProd    := cdsProdutos.FieldByName('Total').AsFloat;

        Prod.cEANTrib  := '7896523206646';
        Prod.uTrib     := 'UN';
        Prod.qTrib     := cdsProdutos.FieldByName('Qtde').AsFloat;
        Prod.vUnTrib   := cdsProdutos.FieldByName('Preco').AsFloat;

        Prod.vOutro    := 0;
        Prod.vFrete    := 0;
        Prod.vSeg      := 0;
        Prod.vDesc     := 0;

        Prod.CEST := '1111111';

//           infAdProd      := 'Informação Adicional do Produto';

        with Imposto do
        begin
          // lei da transparencia nos impostos
          vTotTrib := 0;

          with ICMS do
          begin
            // caso o CRT seja:
            // 1=Simples Nacional
            // Os valores aceitos para CSOSN são:
            // csosn101, csosn102, csosn103, csosn201, csosn202, csosn203,
            // csosn300, csosn400, csosn500,csosn900

            // 2=Simples Nacional, excesso sublimite de receita bruta;
            // ou 3=Regime Normal.
            // Os valores aceitos para CST são:
            // cst00, cst10, cst20, cst30, cst40, cst41, cst45, cst50, cst51,
            // cst60, cst70, cst80, cst81, cst90, cstPart10, cstPart90,
            // cstRep41, cstVazio, cstICMSOutraUF, cstICMSSN, cstRep60

            // (consulte o contador do seu cliente para saber qual deve ser utilizado)
            // Pode variar de um produto para outro.

            if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
              CST := cst00
            else
              CSOSN := csosn102;

            orig    := oeNacional;
            modBC   := dbiValorOperacao;

            if Emit.CRT in [crtSimplesExcessoReceita, crtRegimeNormal] then
              BaseCalculo := cdsProdutos.FieldByName('Total').AsFloat
            else
              BaseCalculo := 0;

            vBC     := BaseCalculo;
            pICMS   := 18;

            ValorICMS := (vBC * pICMS)/100;

            vICMS   := ValorICMS;
            modBCST := dbisMargemValorAgregado;
            pMVAST  := 0;
            pRedBCST:= 0;
            vBCST   := 0;
            pICMSST := 0;
            vICMSST := 0;
            pRedBC  := 0;

            pCredSN := 0;
            vCredICMSSN := 0;
            vBCFCPST := 0;
            pFCPST := 0;
            vFCPST := 0;
            vBCSTRet := 0;
            pST := 0;
            vICMSSubstituto := 0;
            vICMSSTRet := 0;
            vBCFCPSTRet := 0;
            pFCPSTRet := 0;
            vFCPSTRet := 0;
            pRedBCEfet := 0;
            vBCEfet := 0;
            pICMSEfet := 0;
            vICMSEfet := 0;

            // partilha do ICMS e fundo de probreza
            with ICMSUFDest do
            begin
              vBCUFDest      := 0.00;
              pFCPUFDest     := 0.00;
              pICMSUFDest    := 0.00;
              pICMSInter     := 0.00;
              pICMSInterPart := 0.00;
              vFCPUFDest     := 0.00;
              vICMSUFDest    := 0.00;
              vICMSUFRemet   := 0.00;
            end;
          end;

          with PIS do
          begin
            CST      := pis99;
            PIS.vBC  := 0;
            PIS.pPIS := 0;
            PIS.vPIS := 0;

            PIS.qBCProd   := 0;
            PIS.vAliqProd := 0;
            PIS.vPIS      := 0;
          end;

          with PISST do
          begin
            vBc       := 0;
            pPis      := 0;
            qBCProd   := 0;
            vAliqProd := 0;
            vPIS      := 0;
          end;

          with COFINS do
          begin
            CST            := cof99;
            COFINS.vBC     := 0;
            COFINS.pCOFINS := 0;
            COFINS.vCOFINS := 0;

            COFINS.qBCProd   := 0;
            COFINS.vAliqProd := 0;
          end;

          with COFINSST do
          begin
            vBC       := 0;
            pCOFINS   := 0;
            qBCProd   := 0;
            vAliqProd := 0;
            vCOFINS   := 0;
          end;
        end;
      end;
      cdsProdutos.Prior;

    end;
    cdsProdutos.EnableControls;

    //************************************//

    Total.ICMSTot.vBC     := BaseCalculo;
    Total.ICMSTot.vICMS   := ValorICMS;
    Total.ICMSTot.vBCST   := 0;
    Total.ICMSTot.vST     := 0;
    Total.ICMSTot.vProd   := TotalVenda;
    Total.ICMSTot.vFrete  := 0;
    Total.ICMSTot.vSeg    := 0;
    Total.ICMSTot.vDesc   := 0;
    Total.ICMSTot.vII     := 0;
    Total.ICMSTot.vIPI    := 0;
    Total.ICMSTot.vPIS    := 0;
    Total.ICMSTot.vCOFINS := 0;
    Total.ICMSTot.vOutro  := 0;
    Total.ICMSTot.vNF     := TotalVenda;

    // partilha do icms e fundo de probreza
    Total.ICMSTot.vFCPUFDest   := 0.00;
    Total.ICMSTot.vICMSUFDest  := 0.00;
    Total.ICMSTot.vICMSUFRemet := 0.00;

    Total.ISSQNtot.vServ   := 0;
    Total.ISSQNTot.vBC     := 0;
    Total.ISSQNTot.vISS    := 0;
    Total.ISSQNTot.vPIS    := 0;
    Total.ISSQNTot.vCOFINS := 0;

    Total.retTrib.vRetPIS    := 0;
    Total.retTrib.vRetCOFINS := 0;
    Total.retTrib.vRetCSLL   := 0;
    Total.retTrib.vBCIRRF    := 0;
    Total.retTrib.vIRRF      := 0;
    Total.retTrib.vBCRetPrev := 0;
    Total.retTrib.vRetPrev   := 0;

    Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

    with pag.New do
    begin
      tPag := fpDinheiro;
      vPag := TotalPago;
    end;
    pag.vTroco:= Troco;


    // O grupo infIntermed só deve ser gerado nos casos de operação não presencial
    // pela internet em site de terceiros (Intermediadores).
//    infIntermed.CNPJ := '';
//    infIntermed.idCadIntTran := '';

    InfAdic.infCpl     :=  '';
    InfAdic.infAdFisco :=  '';

    with InfAdic.obsCont.New do
    begin
      xCampo := 'ObsCont';
      xTexto := 'Texto';
    end;

    with InfAdic.obsFisco.New do
    begin
      xCampo := 'ObsFisco';
      xTexto := 'Texto';
    end;
  end;

  DM.ACBrNFe1.NotasFiscais.GerarNFe;

end;

procedure TForm_Demo_Contingencia.AtualizarCamposConfig(
  AConfigContingencia: TConfigContigencia);
begin
  if AConfigContingencia = DM.ContingenciaNFCe.ConfigContigencia then
    AtualizarTelaConfiguracaoContingencia;
end;

procedure TForm_Demo_Contingencia.AtualizarSSLLibsCombo;
begin
  cbSSLLib.ItemIndex     := Integer(DM.ACBrNFe1.Configuracoes.Geral.SSLLib);
  cbCryptLib.ItemIndex   := Integer(DM.ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
  cbHttpLib.ItemIndex    := Integer(DM.ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
  cbXmlSignLib.ItemIndex := Integer(DM.ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);

  cbSSLType.Enabled := (DM.ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);

end;

procedure TForm_Demo_Contingencia.BotaoLigaOffLine;
begin
  if DM.ContingenciaNFCe.EOffLine then
  begin
    lblLigar.Caption:= 'NFCe OFF';
    btnChaveOnLine.Glyph.Assign(nil);
    ImageList1.GetBitmap(1, btnChaveOnLine.Glyph);
    lblOn.Caption := 'NFCe OFF';
    lblOn.Font.Color := clRed;

  end
  else
  begin
    lblLigar.Caption:= 'NFCe ON';
    btnChaveOnLine.Glyph.Assign(nil);
    ImageList1.GetBitmap(0, btnChaveOnLine.Glyph);
    lblOn.Caption := 'NFCe ON';
    lblOn.Font.Color := clGreen;

  end;

end;

procedure TForm_Demo_Contingencia.btnCancelaRegistroClick(Sender: TObject);
begin
  IniciaRegistro;
  calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
  edtCodigo.SetFocus;
end;

procedure TForm_Demo_Contingencia.btnChaveOnLineClick(Sender: TObject);
begin
  DM.ContingenciaNFCe.ChaveOnOff;
  AtualizarTelaConfiguracaoContingencia;

end;

procedure TForm_Demo_Contingencia.btnEmitirClick(Sender: TObject);
begin
  if EnviarNFCe then //CriarEnviarCFe then
  begin
    IniciaVenda;
    pageControlPDV.ActivePageIndex:= 0;
    setPage(pageControlPDV);
  end;

end;

procedure TForm_Demo_Contingencia.btnPagarClick(Sender: TObject);
begin
  if (Troco >= 0) and (TotalPago > 0) then
  begin
    spbProximo.Click;
    //ESCAbrirGaveta();
  end
  else
    ShowMessage('Pagamento Incompleto');
end;

procedure TForm_Demo_Contingencia.btnRegistraVendaClick(Sender: TObject);
begin
  if (Trim(edtCodigo.Text) <> '') and (StrToFloatDef(edtQtde.Text,0) > 0) then
  begin
    AddProduto(edtCodigo.Text, StrToFloat(edtQtde.Text), StrToFloat(edtPrecoUnitario.Text)
      , edtDescricao.Text, StrToFloat(edtTotalItem.Text));
    Inc(Item);
    TotalVenda:= TotalVenda + StrToFloatDef(edtTotalItem.text,0);
    IniciaRegistro;
    edtCodigo.SetFocus;
  end
  else
    ShowMessage('Produto Inválido');

end;

procedure TForm_Demo_Contingencia.BtnGravarConfigClick(Sender: TObject);
begin
  GravarConfiguracao;
  ColapsaTelaConfig;

  pageControlPDV.ActivePageIndex:= 0;
  setPage(pageControlPDV);
  if edtcodigo.CanFocus then
    edtCodigo.SetFocus;

end;

procedure TForm_Demo_Contingencia.Button3Click(Sender: TObject);
begin
  ExpandeTelaConfig;
end;

procedure TForm_Demo_Contingencia.calcItem(qtde, Preco: Double);
var
  TotVenda: String;
  TotItem: String;
begin
  TotItem:= FormatFloat('#,##0.00', (qtde * Preco) );
  TotVenda:= FormatFloat('#,##0.00', (TotalVenda + (qtde * Preco)) );
  edtTotalItem.Text:= TotItem;
  edtTotalVenda1.Text:= TotVenda;
  edtTotalVenda2.Text:= TotVenda;
  edtTotalVenda3.Text:= TotVenda;

end;

procedure TForm_Demo_Contingencia.CalcPagamento(vlrTotal, vlrPago: Double);
begin
  if vlrPago > 0 then
  begin
    TotalPago := vlrPago;
    Troco := vlrPago - vlrTotal;
    edtAPagarTroco.Text:= FormatFloat('#,##0.00', Troco );
    edtTotalPago.Text:= FormatFloat('#,##0.00', TotalPago );
    edtTroco.Text:= FormatFloat('#,##0.00', Troco );

    if (Troco > 0 ) then
      EscreverDisplay(1,'Troco: '+ FormatFloat('#,##0.00', Troco ))
    else
      EscreverDisplay(1,'Valor Recebido: '+ FormatFloat('#,##0.00', TotalPago ));
  end;

end;

procedure TForm_Demo_Contingencia.ColapsaTelaConfig;
begin
  PageControl4.ActivePageIndex := 0;
  EscreverDisplay(1,'Caixa Livre');
  ConfigPainel(pnlTelaConfiguracoes, Panel2.Width, pnlTelaLog.left, false);
  SetPage(PageControlPDV);
  spbConfig.Visible:= True;
  BtnGravarConfig.Left := 200;
  pnlRodape.Visible := True;

end;

procedure TForm_Demo_Contingencia.ConfigPainel(PanelMenu: TPanel; PosicaoMin, PosicaoMax: integer; Edicao: Boolean);
var
  i, posMin, posMax: integer;
begin
  i:= 0;
  posMin:= PosicaoMin;
  posMax:= PosicaoMax;

  if Edicao then
  begin

    //Gerar Efeito Deslizar para o Painel
    repeat
      i:= i + Trunc(posMin);
      if i >= posMax then
        PanelMenu.Width:= posMax
      else
        PanelMenu.Width:= i;
      PanelMenu.Repaint;

    until (i > posMax);

  end
  else
  begin

    //Gerar Efeito Recolher para o Painel
    i:= posMax;
    repeat
      i:= i - Trunc(posMin);
      if i <= posMin then
        PanelMenu.Width:= posMin
      else
        PanelMenu.Width:= i;
      PanelMenu.Repaint;

    until (i < posMin);

  end;

end;

procedure TForm_Demo_Contingencia.ConfigurarComponente(ACBrNFe: TACBrNFe);
var
  Ok: Boolean;
begin
  ACBrNFe.Configuracoes.Certificados.URLPFX      := edtURLPFX.Text;
  ACBrNFe.Configuracoes.Certificados.ArquivoPFX  := edtCaminho.Text;
  ACBrNFe.Configuracoes.Certificados.Senha       := edtSenha.Text;
  ACBrNFe.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;

  ACBrNFe.DANFE := DM.ACBrNFeDANFCeFortes1;

  ACBrNFe.SSL.DescarregarCertificado;

  with ACBrNFe.Configuracoes.Geral do
  begin
    SSLLib        := TSSLLib(cbSSLLib.ItemIndex);
    SSLCryptLib   := TSSLCryptLib(cbCryptLib.ItemIndex);
    SSLHttpLib    := TSSLHttpLib(cbHttpLib.ItemIndex);
    SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);

    AtualizarSSLLibsCombo;

    AtualizarXMLCancelado := cbxAtualizarXML.Checked;

    Salvar           := ckSalvar.Checked;
    ExibirErroSchema := cbxExibirErroSchema.Checked;
    RetirarAcentos   := cbxRetirarAcentos.Checked;
    FormatoAlerta    := edtFormatoAlerta.Text;
    FormaEmissao     := TpcnTipoEmissao(cbFormaEmissao.ItemIndex);
    ModeloDF         := TpcnModeloDF(cbModeloDF.ItemIndex);
    VersaoDF         := TpcnVersaoDF(cbVersaoDF.ItemIndex);

    IdCSC            := edtIdToken.Text;
    CSC              := edtToken.Text;
    VersaoQRCode     := veqr200;
  end;

  with ACBrNFe.Configuracoes.WebServices do
  begin
    UF         := cbUF.Text;
    Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
    Visualizar := cbxVisualizar.Checked;
    Salvar     := cbxSalvarSOAP.Checked;

    AjustaAguardaConsultaRet := cbxAjustarAut.Checked;

    if NaoEstaVazio(edtAguardar.Text)then
      AguardarConsultaRet := ifThen(StrToInt(edtAguardar.Text) < 1000, StrToInt(edtAguardar.Text) * 1000, StrToInt(edtAguardar.Text))
    else
      edtAguardar.Text := IntToStr(AguardarConsultaRet);

    if NaoEstaVazio(edtTentativas.Text) then
      Tentativas := StrToInt(edtTentativas.Text)
    else
      edtTentativas.Text := IntToStr(Tentativas);

    if NaoEstaVazio(edtIntervalo.Text) then
      IntervaloTentativas := ifThen(StrToInt(edtIntervalo.Text) < 1000, StrToInt(edtIntervalo.Text) * 1000, StrToInt(edtIntervalo.Text))
    else
      edtIntervalo.Text := IntToStr(ACBrNFe.Configuracoes.WebServices.IntervaloTentativas);

    TimeOut   := seTimeOut.Value;
    ProxyHost := edtProxyHost.Text;
    ProxyPort := edtProxyPorta.Text;
    ProxyUser := edtProxyUser.Text;
    ProxyPass := edtProxySenha.Text;

  end;

  ACBrNFe.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);

  with ACBrNFe.Configuracoes.Arquivos do
  begin
    Salvar           := cbxSalvarArqs.Checked;
    SepararPorMes    := cbxPastaMensal.Checked;
    AdicionarLiteral := cbxAdicionaLiteral.Checked;
    EmissaoPathNFe   := cbxEmissaoPathNFe.Checked;
    SalvarEvento     := cbxSalvaPathEvento.Checked;
    SepararPorCNPJ   := cbxSepararPorCNPJ.Checked;
    SepararPorModelo := cbxSepararPorModelo.Checked;
    PathSchemas      := edtPathSchemas.Text;
    PathNFe          := edtPathNFe.Text;
    PathInu          := edtPathInu.Text;
    PathEvento       := edtPathEvento.Text;
    PathSalvar       := edtPathLogs.Text;
    SalvarApenasNFeProcessadas := cbxSalvarApenasDocumentosProcessados.Checked;
    IniServicos      := edtPathServicos.Text;
  end;

  if ACBrNFe.DANFE <> nil then
  begin
    ACBrNFe.DANFE.TipoDANFE := StrToTpImp(OK, IntToStr(rgTipoDanfe.ItemIndex + 1));
    ACBrNFe.DANFE.Logo      := edtLogoMarca.Text;
    ACBrNFe.DANFE.PathPDF   := ACBrNFe.Configuracoes.Arquivos.GetPathNFe(0);

    ACBrNFe.DANFE.MargemDireita  := 7;
    ACBrNFe.DANFE.MargemEsquerda := 7;
    ACBrNFe.DANFE.MargemSuperior := 5;
    ACBrNFe.DANFE.MargemInferior := 5;
  end;

  //Atualiza as Configurações do componente ACBrNFe também na classe ContingênciaNFCe
  Dm.ContingenciaNFCe.ACBrNFe.Configuracoes.Assign(ACBrNFe.Configuracoes);
end;

procedure TForm_Demo_Contingencia.edtAPagarTrocoChange(Sender: TObject);
begin
  if (Troco < 0) then
    edtAPagarTroco.Font.Color:= clRed
  else
    edtAPagarTroco.Font.Color:= clBlack;

end;

procedure TForm_Demo_Contingencia.edtCodigoEnter(Sender: TObject);
begin
  if (Trim(edtCodigo.Text) <> '') then
  begin
    edtPrecoUnitario.Text := FloatToStr((Item + 1) * 1.25);  //Simula valor Unitário
    edtDescricao.Text := 'Produto ACBr Teste ' + IntToStr(Item + 1);  //Simula Descricao Produto
    calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
    EscreverDisplay(1, edtCodigo.Text + ' - ' + edtDescricao.Text);
  end;

end;

procedure TForm_Demo_Contingencia.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //if Key = VK_RETURN then
    //edtQtde.SetFocus;
end;

procedure TForm_Demo_Contingencia.edtQtdeEnter(Sender: TObject);
begin
  calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));

end;

procedure TForm_Demo_Contingencia.edtQtdeExit(Sender: TObject);
begin
  if (StrToFloatDef(edtQtde.Text,0) <= 0) then
  begin
    //Implementar Leitura Balança
  end
  else
    calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
end;

procedure TForm_Demo_Contingencia.edtQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if Key = VK_F9 then
    //LerPeso;
end;

procedure TForm_Demo_Contingencia.edtQtdeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #44]) then
    Key := #0;
end;

procedure TForm_Demo_Contingencia.edtValorEnter(Sender: TObject);
begin
  calcPagamento(TotalVenda, StrToFloatDef(edtValor.Text,0));
  edtValor.text := FormatFloat('#,##0.00', StrToFloatDef(edtValor.text,0) );
end;

procedure TForm_Demo_Contingencia.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #13, #8, #44]) then
    Key := #0;
end;

function TForm_Demo_Contingencia.EmitirOffLine(NumNF: Integer = 0): Boolean;
var
  ANF: integer;

begin
  result:= False;
  try
    if (DM.ACBrNFe1.NotasFiscais.Count > 0) and
      (DM.ContingenciaNFCe.EContingenciaAutomatica) then
    begin
      if NumNF = 0 then
        ANF := DM.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF + 1
      else
        ANF := NumNF;

      DM.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF:= ANF ;
      DM.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpEmis:= teOffLine;
      DM.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dhCont:= now;
      DM.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.xJust:= CJustificaOffLine;

      { Grava o XML Gerado como OffLine para posterior envio
        Deve gravar também no Banco de Dados}
      DM.ACBrNFe1.NotasFiscais.Items[0].NomeArq := ''; //Isso limpa o path para gravar o XML assinado, utilizando o path das configurações
      DM.ACBrNFe1.NotasFiscais.Assinar;
      Result:= DM.ACBrNFe1.NotasFiscais.Items[0].GravarXML('',DM.ContingenciaNFCe.ConfigContigencia.PathOffLine);   //Grava o XML na pasta de OffLine

      //Emite OffLine em 2 vias
      DM.ACBrNFeDANFCeFortes1.ViaConsumidor:= True;
      DM.ACBrNFe1.NotasFiscais.Items[0].Imprimir;

      DM.ACBrNFeDANFCeFortes1.ViaConsumidor:= False;
      DM.ACBrNFe1.NotasFiscais.Items[0].Imprimir;

      Log('NFCe EMITIDA OFF-LINE', 'arquivo: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NomeArq +#13#10
                                  +'chave: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NumID);

    end;

  Except
    on E: exception do
    begin
      Log('ERRO EMISSAO OFF-LINE', E.Message);

    end;

  end;

end;

function TForm_Demo_Contingencia.EntrarEmContingencia: Boolean;
begin
  Result:= True;

  DM.ContingenciaNFCe.ChaveOnOff;
  AtualizarTelaConfiguracaoContingencia;

  if not GravarNFCePendente then
    Result:= False;

  if not EmitirOffLine(IncrementarNFCe) then
    Result := False;

end;

function TForm_Demo_Contingencia.EnviarNFCe: Boolean;
var
 vNFe: Integer;
 vArqNFe: String;
begin
  vNFe := IncrementarNFCe;

  DM.ACBrNFe1.NotasFiscais.Clear;
  DM.ACBrNFe1.Tag:= 0;
  AlimentarNFCe(vNFe);
  vArqNFe := PathWithDelim(Dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar) +
              OnlyNumber(Dm.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) + '-nfe.xml';

  if not(DM.ContingenciaNFCe.EOffLine) then
  begin

    { Grava o XML Gerado antes do envio
      Deve gravar também no Banco de Dados}
    DM.ACBrNFe1.NotasFiscais.Items[0].NomeArq := ''; //Isso limpa o path para gravar o XML assinado utilizando o path das configurações
    DM.ACBrNFe1.NotasFiscais.Items[0].Assinar;
    DM.ACBrNFe1.NotasFiscais.Items[0].GravarXML(vArqNFe);

    Log('NFCe GERADA', 'arquivo: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NomeArq +#13#10
                      +'chave: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NumID);

    try
      Result:= DM.ACBrNFe1.Enviar(1,True,True); //Parametros: (Lote 1, Imprime após o Envio, Envio Síncrono para NFCe)

      Log('ENVIO NFCe', 'XML: ' + DM.ACBrNFe1.WebServices.Enviar.RetornoWS +#13#10
                      +'tpAmb: ' + TpAmbToStr(DM.ACBrNFe1.WebServices.Enviar.TpAmb) +#13#10
                      +'verAplic: ' + DM.ACBrNFe1.WebServices.Enviar.verAplic +#13#10
                      +'cStat: ' + IntToStr(DM.ACBrNFe1.WebServices.Enviar.cStat) +#13#10
                      +'cUF: ' + IntToStr(DM.ACBrNFe1.WebServices.Enviar.cUF) +#13#10
                      +'xMotivo: ' + DM.ACBrNFe1.WebServices.Enviar.xMotivo +#13#10
                      +'Protocolo: '+ DM.ACBrNFe1.WebServices.Enviar.Protocolo);

      if not (DM.ACBrNFe1.CstatConfirmada( DM.ACBrNFe1.WebServices.Enviar.cStat )) then
        Result:= False;
    except
      Result:= False;
    end;

    if DM.ACBrNFe1.Tag <> 0 then  //Ocorreu erro interno de transmissão (OnTransmitError) e trata emissão em Contingencia
      Result:= EntrarEmContingencia

  end
  else
    Result:= EmitirOffLine(vNFe);

end;

procedure TForm_Demo_Contingencia.EscreverDisplay(linha: Integer; Msg: String);
begin
  lblTitulo.Caption:= Msg;
  lblTitulo.Refresh;

end;

procedure TForm_Demo_Contingencia.EventAlertaOffLine(AAlerta: Integer);
begin
  if (AAlerta > 0) then
    MenInfOffLine.Lines.Strings[4]:= '<< ALERTA >> NFCe(s) fora do prazo de envio:  ' + IntToStr(AAlerta)
  else
    MenInfOffLine.Lines.Strings[4]:= ' ';

end;

procedure TForm_Demo_Contingencia.EventAtualizaTransmissaoOffLine(AChave, AXML: String);
begin
  { Utilize esse evento para Atualizar o Banco de Dados com
    Protocolo de Autorizaçao do XML OffLine transmitido}

  Log('Update XML OffLine Transmitido','Chave: '+ AChave + #13#10 + 'XML: '+ AXML);

end;

procedure TForm_Demo_Contingencia.EventAtualizaTransmissaoPendente(
  ATipoDoc: Char; AChave, AXML: String);
begin
 { Utilize esse evento para Atualizar o Banco de Dados com
    XML de Cancelamento por Subst. ou Inutilização da Chave Pendente.}

 //ATipoDoc  I- Inutilizado   C- Cancelado

  Log('Update XML Cancelamento por Subst. ou Inutilização  Transmitido','Tipo Doc: '+ ATipoDoc + #13#10
      +'Chave: '+ AChave + #13#10 + 'XML: '+ AXML);
end;

procedure TForm_Demo_Contingencia.EventBloqueioOffLine(ABloq: Integer);
begin
  if (ABloq > 0) then
    MenInfOffLine.Lines.Strings[5]:= '<< BLOQUEIO >> NFCe(s) excedeu prazo de envio:  ' + IntToStr(ABloq)
  else
    MenInfOffLine.Lines.Strings[5]:= ' ';

end;

procedure TForm_Demo_Contingencia.EventLogOffLine(ALogOff: String);
begin
  if not(EstaVazio( ALogOff ) ) then
    memoLog.Lines.Add(ALogOff);

end;

procedure TForm_Demo_Contingencia.ExpandeTelaConfig;
begin
  pnlRodape.Visible := False;
  ConfigPainel(pnlTelaConfiguracoes, Panel2.Width, pnlTelaLog.left, true);
  spbVoltar.Visible := False;
  spbProximo.Visible:= False;
  spbConfig.Visible:= False;
  BtnGravarConfig.Left := pnlTelaLog.Left - (BtnGravarConfig.Width + 10) ;
  EscreverDisplay(1,'Configurações');
end;

procedure TForm_Demo_Contingencia.FormCreate(Sender: TObject);
var
  T: TSSLLib;
  I: TpcnTipoEmissao;
  J: TpcnModeloDF;
  K: TpcnVersaoDF;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
  N: TACBrPosPrinterModelo;
  O: TACBrPosPaginaCodigo;
begin

  // Atualiza evento On TransmitError, para sinalizar quando houver falha de Comunicação
  DM.ACBrNFe1.OnTransmitError:= EventNFeTransmitError;

  { Aqui dever ser referenciado os eventos da classe ContingênciaNFCe com as procedures
    responsáveis por atualizar o processamento da Contingência na aplicação. }
  if Assigned(DM.ContingenciaNFCe) then
  begin
    DM.ContingenciaNFCe.OnLogOffLine := EventLogOffLine;
    DM.ContingenciaNFCe.OnNFCePendentes := EventNFCePendentes;
    DM.ContingenciaNFCe.OnEmitidasOffLine := EventNFCeEmitidasOffLine;
    DM.ContingenciaNFCe.OnNFCeOffLineErro := EventNFCeOffLineErro;
    DM.ContingenciaNFCe.OnAlertaOffLine := EventAlertaOffLine;
    DM.ContingenciaNFCe.OnBloqueioOffLine := EventBloqueioOffLine;
    DM.ContingenciaNFCe.OnAtualizaTransmissaoOffLine := EventAtualizaTransmissaoOffLine;
    DM.ContingenciaNFCe.OnAtualizaTansmissaoPendente := EventAtualizaTransmissaoPendente;
  end;

  { Verifica se a classe está com OFFLine, se sim muda a chave para
    sempre iniciar aplicação como ONLine }
  if DM.ContingenciaNFCe.EOffLine then
    DM.ContingenciaNFCe.ChaveOnOff;

  //Atualiza as Configurações da Contingência em tela
  AtualizarTelaConfiguracaoContingencia;

  pageControlPDV.ActivePageIndex:= 0;
  setPage(pageControlPDV);

  Item:= 0;
  TotalVenda:= 0;
  TotalPago:= 0;
  Troco:= 0;

  EscreverDisplay(1,'Caixa Livre');

  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := 0;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), integer(U) ) );
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), integer(V) ) );
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(X) ) );
  cbXmlSignLib.ItemIndex := 0;

  cbSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbSSLType.ItemIndex := 0;

  cbFormaEmissao.Items.Clear;
  for I := Low(TpcnTipoEmissao) to High(TpcnTipoEmissao) do
     cbFormaEmissao.Items.Add( GetEnumName(TypeInfo(TpcnTipoEmissao), integer(I) ) );
  cbFormaEmissao.ItemIndex := 0;

  cbModeloDF.Items.Clear;
  for J := Low(TpcnModeloDF) to High(TpcnModeloDF) do
     cbModeloDF.Items.Add( GetEnumName(TypeInfo(TpcnModeloDF), integer(J) ) );
  cbModeloDF.ItemIndex := 0;

  cbVersaoDF.Items.Clear;
  for K := Low(TpcnVersaoDF) to High(TpcnVersaoDF) do
     cbVersaoDF.Items.Add( GetEnumName(TypeInfo(TpcnVersaoDF), integer(K) ) );
  cbVersaoDF.ItemIndex := 0;

  cbxModeloPosPrinter.Items.Clear ;
  for N := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
    cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(N) ) ) ;

  cbxPagCodigo.Items.Clear ;
  for O := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
     cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(O) ) ) ;

  cbxPorta.Items.Clear;
  DM.ACBrPosPrinter1.Device.AcharPortasSeriais( cbxPorta.Items );
  DM.ACBrPosPrinter1.Device.AcharPortasRAW( cbxPorta.Items );

  {$IfDef MSWINDOWS}
  cbxPorta.Items.Add('LPT1') ;
  cbxPorta.Items.Add('\\localhost\Epson') ;
  cbxPorta.Items.Add('c:\temp\ecf.txt') ;
  {$EndIf}

  cbxPorta.Items.Add('TCP:192.168.0.31:9100') ;
  {$IfDef LINUX}
  cbxPorta.Items.Add('/dev/ttyS0') ;
  cbxPorta.Items.Add('/dev/ttyUSB0') ;
  cbxPorta.Items.Add('/tmp/ecf.txt') ;
  {$EndIf}

  //Lê as configurações para o componente ACBrNFe e atualiza também na classe ContingenciaNFCe
  LerConfiguracao;

  PageControl4.ActivePageIndex := 0;
  ExpandeTelaConfig;

end;

procedure TForm_Demo_Contingencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3  ) and (spbVoltar.Enabled) then
    spbVoltar.Click;

  if (Key = VK_F4) and (spbProximo.Enabled) then
    spbProximo.Click;

  if (Key = VK_F5) and (btnCancelaRegistro.Enabled) then
    btnCancelaRegistro.Click;

  if (Key = VK_F6) and (btnRegistraVenda.Enabled) then
    btnRegistraVenda.Click;

  if (Key = VK_F7) and (btnPagar.Enabled) then
    btnPagar.Click;

  if (Key = VK_F8) and (btnEmitir.Enabled) then
    btnEmitir.Click;
end;

procedure TForm_Demo_Contingencia.FormShow(Sender: TObject);
begin
  if edtCodigo.CanFocus then
    edtCodigo.SetFocus;
end;

procedure TForm_Demo_Contingencia.GravarConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(ParamStr(0), '.ini');

  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteInteger('Certificado', 'SSLLib',     cbSSLLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'CryptLib',   cbCryptLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'HttpLib',    cbHttpLib.ItemIndex);
    Ini.WriteInteger('Certificado', 'XmlSignLib', cbXmlSignLib.ItemIndex);
    Ini.WriteString( 'Certificado', 'URL',        edtURLPFX.Text);
    Ini.WriteString( 'Certificado', 'Caminho',    edtCaminho.Text);
    Ini.WriteString( 'Certificado', 'Senha',      edtSenha.Text);
    Ini.WriteString( 'Certificado', 'NumSerie',   edtNumSerie.Text);

    Ini.WriteBool(   'Geral', 'AtualizarXML',     cbxAtualizarXML.Checked);
    Ini.WriteBool(   'Geral', 'ExibirErroSchema', cbxExibirErroSchema.Checked);
    Ini.WriteString( 'Geral', 'FormatoAlerta',    edtFormatoAlerta.Text);
    Ini.WriteInteger('Geral', 'FormaEmissao',     cbFormaEmissao.ItemIndex);
    Ini.WriteInteger('Geral', 'ModeloDF',         cbModeloDF.ItemIndex);
    Ini.WriteInteger('Geral', 'VersaoDF',         cbVersaoDF.ItemIndex);
    Ini.WriteString( 'Geral', 'IdToken',          edtIdToken.Text);
    Ini.WriteString( 'Geral', 'Token',            edtToken.Text);
    Ini.WriteBool(   'Geral', 'RetirarAcentos',   cbxRetirarAcentos.Checked);
    Ini.WriteBool(   'Geral', 'Salvar',           ckSalvar.Checked);
    Ini.WriteString( 'Geral', 'PathSalvar',       edtPathLogs.Text);
    Ini.WriteString( 'Geral', 'PathSchemas',      edtPathSchemas.Text);
    Ini.WriteString( 'Geral', 'NumeroNFCe',       edtNumNFCe.Text);
    Ini.WriteString( 'Geral', 'IniServicos',      edtPathServicos.Text);

    Ini.WriteString( 'WebService', 'UF',         cbUF.Text);
    Ini.WriteInteger('WebService', 'Ambiente',   rgTipoAmb.ItemIndex);
    Ini.WriteBool(   'WebService', 'Visualizar', cbxVisualizar.Checked);
    Ini.WriteBool(   'WebService', 'SalvarSOAP', cbxSalvarSOAP.Checked);
    Ini.WriteBool(   'WebService', 'AjustarAut', cbxAjustarAut.Checked);
    Ini.WriteString( 'WebService', 'Aguardar',   edtAguardar.Text);
    Ini.WriteString( 'WebService', 'Tentativas', edtTentativas.Text);
    Ini.WriteString( 'WebService', 'Intervalo',  edtIntervalo.Text);
    Ini.WriteInteger('WebService', 'TimeOut',    seTimeOut.Value);
    Ini.WriteInteger('WebService', 'SSLType',    cbSSLType.ItemIndex);

    Ini.WriteString('Proxy', 'Host',  edtProxyHost.Text);
    Ini.WriteString('Proxy', 'Porta', edtProxyPorta.Text);
    Ini.WriteString('Proxy', 'User',  edtProxyUser.Text);
    Ini.WriteString('Proxy', 'Pass',  edtProxySenha.Text);

    Ini.WriteBool(  'Arquivos', 'Salvar',           cbxSalvarArqs.Checked);
    Ini.WriteBool(  'Arquivos', 'PastaMensal',      cbxPastaMensal.Checked);
    Ini.WriteBool(  'Arquivos', 'AddLiteral',       cbxAdicionaLiteral.Checked);
    Ini.WriteBool(  'Arquivos', 'EmissaoPathNFe',   cbxEmissaoPathNFe.Checked);
    Ini.WriteBool(  'Arquivos', 'SalvarPathEvento', cbxSalvaPathEvento.Checked);
    Ini.WriteBool(  'Arquivos', 'SepararPorCNPJ',   cbxSepararPorCNPJ.Checked);
    Ini.WriteBool(  'Arquivos', 'SepararPorModelo', cbxSepararPorModelo.Checked);
    Ini.WriteBool(  'Arquivos', 'SalvarApenasNFeProcessadas', cbxSalvarApenasDocumentosProcessados.Checked);
    Ini.WriteString('Arquivos', 'PathNFe',          edtPathNFe.Text);
    Ini.WriteString('Arquivos', 'PathCan',          edtPathCan.Text);
    Ini.WriteString('Arquivos', 'PathInu',          edtPathInu.Text);
    Ini.WriteString('Arquivos', 'PathDPEC',         edtPathDPEC.Text);
    Ini.WriteString('Arquivos', 'PathCCe',          edtPathCCe.Text);
    Ini.WriteString('Arquivos', 'PathEvento',       edtPathEvento.Text);

    Ini.WriteString('Emitente', 'CNPJ',        edtEmitCNPJ.Text);
    Ini.WriteString('Emitente', 'IE',          edtEmitIE.Text);
    Ini.WriteString('Emitente', 'RazaoSocial', edtEmitRazao.Text);
    Ini.WriteString('Emitente', 'Fantasia',    edtEmitFantasia.Text);
    Ini.WriteString('Emitente', 'Fone',        edtEmitFone.Text);
    Ini.WriteString('Emitente', 'CEP',         edtEmitCEP.Text);
    Ini.WriteString('Emitente', 'Logradouro',  edtEmitLogradouro.Text);
    Ini.WriteString('Emitente', 'Numero',      edtEmitNumero.Text);
    Ini.WriteString('Emitente', 'Complemento', edtEmitComp.Text);
    Ini.WriteString('Emitente', 'Bairro',      edtEmitBairro.Text);
    Ini.WriteString('Emitente', 'CodCidade',   edtEmitCodCidade.Text);
    Ini.WriteString('Emitente', 'Cidade',      edtEmitCidade.Text);
    Ini.WriteString('Emitente', 'UF',          edtEmitUF.Text);
    Ini.WriteInteger('Emitente', 'CRT',        cbTipoEmpresa.ItemIndex);

    Ini.WriteInteger('DANFE', 'Tipo',       rgTipoDanfe.ItemIndex);
    Ini.WriteString( 'DANFE', 'LogoMarca',  edtLogoMarca.Text);
    Ini.WriteInteger('DANFE', 'TipoDANFCE', rgDANFCE.ItemIndex);

    INI.WriteInteger('PosPrinter', 'Modelo',            cbxModeloPosPrinter.ItemIndex);
    INI.WriteString( 'PosPrinter', 'Porta',             cbxPorta.Text);
    INI.WriteInteger('PosPrinter', 'PaginaDeCodigo',    cbxPagCodigo.ItemIndex);
    INI.WriteString( 'PosPrinter', 'ParamsString',      DM.ACBrPosPrinter1.Device.ParamsString);
    INI.WriteInteger('PosPrinter', 'Colunas',           seColunas.Value);
    INI.WriteInteger('PosPrinter', 'EspacoLinhas',      seEspLinhas.Value);
    INI.WriteInteger('PosPrinter', 'LinhasEntreCupons', seLinhasPular.Value);
    Ini.WriteBool(   'PosPrinter', 'CortarPapel',       cbCortarPapel.Checked );

    ConfigurarComponente(DM.ACBrNFe1);

    GravarConfiguracaoContingencia;

  finally
    Ini.Free;
  end;

end;

function TForm_Demo_Contingencia.GravarNFCePendente: Boolean;
begin
  result:= False;
  try
    if (DM.ACBrNFe1.NotasFiscais.Count > 0) and
      (DM.ContingenciaNFCe.EContingenciaAutomatica) then
    begin
      //Grava o XML sem retorno na pasta Pendentes
      Result:= DM.ACBrNFe1.NotasFiscais.Items[0].GravarXML('',DM.ContingenciaNFCe.ConfigContigencia.PathNFCePendentes);

      Log('NFCe COM RETORNO PENDENTE', 'arquivo: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NomeArq +#13#10
                                      +'chave: ' + DM.ACBrNFe1.NotasFiscais.Items[0].NumID);

    end;

  Except
    on E: exception do
    begin
       Log('ERRO AO GRAVAR RETORNO PENDENTE', E.Message);

    end;

  end;
end;

function TForm_Demo_Contingencia.IncrementarNFCe: Integer;
var
  lAux: Integer;
  IniFile: String;
  Ini: TIniFile;
begin
  lAux := StrToIntDef(edtNumNFCe.Text,0);
  edtNumNFCe.Text := IntToStr( lAux + 1 );

  IniFile := ChangeFileExt(ParamStr(0), '.ini');
  Ini := TIniFile.Create(IniFile);
  try
    Ini.WriteString('Geral', 'NumeroNFCe', edtNumNFCe.Text);
  finally
    Result:= StrToIntDef(edtNumNFCe.Text,0);
    Ini.Free
  end;

end;

procedure TForm_Demo_Contingencia.IniciaRegistro;
begin
  edtCodigo.Clear;
  edtDescricao.clear;
  edtQtde.Text:= '0';
  edtPrecoUnitario.Text:= '0,00';
  edtTotalItem.Text:= '0,00';
  EscreverDisplay(1,'Venda Iniciada');

end;

procedure TForm_Demo_Contingencia.IniciaVenda;
begin
  Item:= 0;
  TotalVenda:= 0;
  TotalPago:= 0;
  Troco:= 0;
  IniciaRegistro;
  edtAPagarTroco.Text:= FormatFloat('#,##0.00', 0 );
  edtValor.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalPago.Text:= FormatFloat('#,##0.00', 0 );
  edtTroco.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda1.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda2.Text:= FormatFloat('#,##0.00', 0 );
  edtTotalVenda3.Text:= FormatFloat('#,##0.00', 0 );
  cdsProdutos.EmptyDataSet;
  cdsProdutos.close;
  EscreverDisplay(1,'Caixa Livre');
  if edtcodigo.CanFocus then
    edtCodigo.SetFocus;
end;

procedure TForm_Demo_Contingencia.LerConfiguracao;
var
  IniFile: String;
  Ini: TIniFile;
begin
  IniFile := ChangeFileExt(ParamStr(0), '.ini');

  Ini := TIniFile.Create(IniFile);
  try
    cbSSLLib.ItemIndex     := Ini.ReadInteger('Certificado', 'SSLLib',     0);
    cbCryptLib.ItemIndex   := Ini.ReadInteger('Certificado', 'CryptLib',   0);
    cbHttpLib.ItemIndex    := Ini.ReadInteger('Certificado', 'HttpLib',    0);
    cbXmlSignLib.ItemIndex := Ini.ReadInteger('Certificado', 'XmlSignLib', 0);
    edtURLPFX.Text         := Ini.ReadString( 'Certificado', 'URL',        '');
    edtCaminho.Text        := Ini.ReadString( 'Certificado', 'Caminho',    '');
    edtSenha.Text          := Ini.ReadString( 'Certificado', 'Senha',      '');
    edtNumSerie.Text       := Ini.ReadString( 'Certificado', 'NumSerie',   '');

    cbxAtualizarXML.Checked     := Ini.ReadBool(   'Geral', 'AtualizarXML',     True);
    cbxExibirErroSchema.Checked := Ini.ReadBool(   'Geral', 'ExibirErroSchema', True);
    edtFormatoAlerta.Text       := Ini.ReadString( 'Geral', 'FormatoAlerta',    'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.');
    cbFormaEmissao.ItemIndex    := Ini.ReadInteger('Geral', 'FormaEmissao',     0);
    cbModeloDF.ItemIndex        := Ini.ReadInteger('Geral', 'ModeloDF',         0);

    cbVersaoDF.ItemIndex      := Ini.ReadInteger('Geral', 'VersaoDF',       0);
    edtIdToken.Text           := Ini.ReadString( 'Geral', 'IdToken',        '');
    edtToken.Text             := Ini.ReadString( 'Geral', 'Token',          '');
    ckSalvar.Checked          := Ini.ReadBool(   'Geral', 'Salvar',         True);
    cbxRetirarAcentos.Checked := Ini.ReadBool(   'Geral', 'RetirarAcentos', True);
    edtPathLogs.Text          := Ini.ReadString( 'Geral', 'PathSalvar',     PathWithDelim(ExtractFilePath(Application.ExeName))+'Logs');
    edtPathSchemas.Text       := Ini.ReadString( 'Geral', 'PathSchemas',    PathWithDelim(ExtractFilePath(Application.ExeName))+'Schemas\'+GetEnumName(TypeInfo(TpcnVersaoDF), integer(cbVersaoDF.ItemIndex) ));
    edtNumNFCe.Text           := Ini.ReadString( 'Geral', 'NumeroNFCe', '0');
    edtPathServicos.Text      := Ini.ReadString( 'Geral', 'IniServicos', '');

    cbUF.ItemIndex := cbUF.Items.IndexOf(Ini.ReadString('WebService', 'UF', 'SP'));

    rgTipoAmb.ItemIndex   := Ini.ReadInteger('WebService', 'Ambiente',   0);
    cbxVisualizar.Checked := Ini.ReadBool(   'WebService', 'Visualizar', False);
    cbxSalvarSOAP.Checked := Ini.ReadBool(   'WebService', 'SalvarSOAP', False);
    cbxAjustarAut.Checked := Ini.ReadBool(   'WebService', 'AjustarAut', False);
    edtAguardar.Text      := Ini.ReadString( 'WebService', 'Aguardar',   '0');
    edtTentativas.Text    := Ini.ReadString( 'WebService', 'Tentativas', '5');
    edtIntervalo.Text     := Ini.ReadString( 'WebService', 'Intervalo',  '0');
    seTimeOut.Value       := Ini.ReadInteger('WebService', 'TimeOut',    5000);
    cbSSLType.ItemIndex   := Ini.ReadInteger('WebService', 'SSLType',    0);

    edtProxyHost.Text  := Ini.ReadString('Proxy', 'Host',  '');
    edtProxyPorta.Text := Ini.ReadString('Proxy', 'Porta', '');
    edtProxyUser.Text  := Ini.ReadString('Proxy', 'User',  '');
    edtProxySenha.Text := Ini.ReadString('Proxy', 'Pass',  '');

    cbxSalvarArqs.Checked       := Ini.ReadBool(  'Arquivos', 'Salvar',           false);
    cbxPastaMensal.Checked      := Ini.ReadBool(  'Arquivos', 'PastaMensal',      false);
    cbxAdicionaLiteral.Checked  := Ini.ReadBool(  'Arquivos', 'AddLiteral',       false);
    cbxEmissaoPathNFe.Checked   := Ini.ReadBool(  'Arquivos', 'EmissaoPathNFe',   false);
    cbxSalvaPathEvento.Checked  := Ini.ReadBool(  'Arquivos', 'SalvarPathEvento', false);
    cbxSepararPorCNPJ.Checked   := Ini.ReadBool(  'Arquivos', 'SepararPorCNPJ',   false);
    cbxSepararPorModelo.Checked := Ini.ReadBool(  'Arquivos', 'SepararPorModelo', false);
    edtPathNFe.Text             := Ini.ReadString('Arquivos', 'PathNFe',          '');
    edtPathCan.Text             := Ini.ReadString('Arquivos', 'PathCan',          '');
    edtPathInu.Text             := Ini.ReadString('Arquivos', 'PathInu',          '');
    edtPathDPEC.Text            := Ini.ReadString('Arquivos', 'PathDPEC',         '');
    edtPathCCe.Text             := Ini.ReadString('Arquivos', 'PathCCe',          '');
    edtPathEvento.Text          := Ini.ReadString('Arquivos', 'PathEvento',       '');
    cbxSalvarApenasDocumentosProcessados.Checked := Ini.ReadBool(  'Arquivos', 'SalvarApenasNFeProcessadas', false);

    edtEmitCNPJ.Text       := Ini.ReadString('Emitente', 'CNPJ',        '');
    edtEmitIE.Text         := Ini.ReadString('Emitente', 'IE',          '');
    edtEmitRazao.Text      := Ini.ReadString('Emitente', 'RazaoSocial', '');
    edtEmitFantasia.Text   := Ini.ReadString('Emitente', 'Fantasia',    '');
    edtEmitFone.Text       := Ini.ReadString('Emitente', 'Fone',        '');
    edtEmitCEP.Text        := Ini.ReadString('Emitente', 'CEP',         '');
    edtEmitLogradouro.Text := Ini.ReadString('Emitente', 'Logradouro',  '');
    edtEmitNumero.Text     := Ini.ReadString('Emitente', 'Numero',      '');
    edtEmitComp.Text       := Ini.ReadString('Emitente', 'Complemento', '');
    edtEmitBairro.Text     := Ini.ReadString('Emitente', 'Bairro',      '');
    edtEmitCodCidade.Text  := Ini.ReadString('Emitente', 'CodCidade',   '');
    edtEmitCidade.Text     := Ini.ReadString('Emitente', 'Cidade',      '');
    edtEmitUF.Text         := Ini.ReadString('Emitente', 'UF',          '');

    cbTipoEmpresa.ItemIndex := Ini.ReadInteger('Emitente', 'CRT', 2);

    rgTipoDanfe.ItemIndex := Ini.ReadInteger('DANFE', 'Tipo',       0);
    edtLogoMarca.Text     := Ini.ReadString( 'DANFE', 'LogoMarca',  '');
    rgDANFCE.ItemIndex    := Ini.ReadInteger('DANFE', 'TipoDANFCE', 0);

    cbxModeloPosPrinter.ItemIndex := INI.ReadInteger('PosPrinter', 'Modelo',            Integer(DM.ACBrPosPrinter1.Modelo));
    cbxPorta.Text                 := INI.ReadString( 'PosPrinter', 'Porta',             DM.ACBrPosPrinter1.Porta);
    cbxPagCodigo.ItemIndex        := INI.ReadInteger('PosPrinter', 'PaginaDeCodigo',    Integer(DM.ACBrPosPrinter1.PaginaDeCodigo));
    seColunas.Value               := INI.ReadInteger('PosPrinter', 'Colunas',           DM.ACBrPosPrinter1.ColunasFonteNormal);
    seEspLinhas.Value             := INI.ReadInteger('PosPrinter', 'EspacoLinhas',      DM.ACBrPosPrinter1.EspacoEntreLinhas);
    seLinhasPular.Value           := INI.ReadInteger('PosPrinter', 'LinhasEntreCupons', DM.ACBrPosPrinter1.LinhasEntreCupons);
    cbCortarPapel.Checked         := Ini.ReadBool(   'PosPrinter', 'CortarPapel',       True);

    DM.ACBrPosPrinter1.Device.ParamsString := INI.ReadString('PosPrinter', 'ParamsString', '');

    ConfigurarComponente(DM.ACBrNFe1);

  finally
    Ini.Free;

  end;

end;

procedure TForm_Demo_Contingencia.AtualizarTelaConfiguracaoContingencia;
begin
  with DM.ContingenciaNFCe.ConfigContigencia do
  begin
    SpnTempoTransmiteOff.Value := TempoTransmissaoOffLine;
    edtPathOffLine.Text := PathOffLine;
    edtPathOffLineErro.Text := PathOffLineErro;
    edtPathPendentes.Text := PathNFCePendentes;
    ckbContingenciaAutomatica.Checked := ContingenciaAutomatica;
    SpnTempoVoltarOnLine.Value := TempoAtivarOnLine;
    SpinAvisos.Value := HorasAviso;
    SpinBloqueios.Value := HorasBloqueio;
    ckOffLineComErro.Checked := AvisoNFCeComErro;
    ckGravarLog.Checked := GravarLog;

    BotaoLigaOffLine;  //Atualiza botão liga e desliga Off-Line
  end;

end;

procedure TForm_Demo_Contingencia.Log(const Header: String; const Msg: String);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.Add('');
    SL.Add('...............................................');
    SL.Add(DateTimeToStr(now)+'<<< '+Header+' >>>');
    SL.Add(Msg);
  finally
    memoLog.Lines.Add(SL.Text);
    WriteToTXT(PathWithDelim( ExtractFilePath(ParamStr(0)) ) +'log' +'.txt'
          , NativeStringToAnsi(SL.Text)
          , True
          , True
          , True);
  end;

end;

procedure TForm_Demo_Contingencia.EventNFCeEmitidasOffLine(
  AListaOffLine: TListaNFCeEmitidaOffLine);
var
  J, Cont: Integer;
begin
  Cont := 0;
  if not DM.cdsOffLine.Active then
    DM.cdsOffLine.CreateDataSet
  else
    DM.cdsOffLine.EmptyDataSet;

  DM.cdsOffLine.DisableControls;
  DM.cdsOffLine.close;
  DM.cdsOffLine.Open;

  for J := 0 to Pred(AListaOffLine.Count) do
  begin
    with DM.cdsOffLine do
    begin
      Insert;
      FieldByName('Chave').AsString := AListaOffLine[J].Chave;
      FieldByName('cStat').AsString := intToStr(AListaOffLine[J].CStat);
      FieldByName('Msg').AsString := AListaOffLine[J].Msg;
      FieldByName('Data_HoraTransmissao').AsDateTime := AListaOffLine[J].DataHoraTransmissao;
      FieldByName('Status').AsString := StatusToDescricao( AListaOffLine[J].Status );
      Post;
      inc(Cont);
    end;

  end;
  DM.cdsOffLine.EnableControls;
  if Cont > 0 then
    MenInfOffLine.Lines.Strings[0]:= ' NFCe(s) OFF-LINE NÃO TRANSMITIDAS:  '+IntToStr(Cont)
  else
    MenInfOffLine.Lines.Strings[0]:= ' ';
  BotaoLigaOffLine;  //Atualiza botão liga e desliga Off-Line

end;

procedure TForm_Demo_Contingencia.EventNFCeOffLineErro(
  AListaOffLineErro: TListaNFCeOffLineErro);
var
  J, Cont: Integer;

begin
  Cont:= 0;
  if not DM.cdsOffLineErro.Active then
    DM.cdsOffLineErro.CreateDataSet
  else
    DM.cdsOffLineErro.EmptyDataSet;

  DM.cdsOffLineErro.DisableControls;
  DM.cdsOffLineErro.close;
  DM.cdsOffLineErro.Open;

  for J := 0 to Pred(AListaOffLineErro.Count) do
  begin
    with DM.cdsOffLineErro do
    begin
      Insert;
      FieldByName('Chave').AsString := AListaOffLineErro[J].Chave;
      FieldByName('cStat').AsString := intToStr(AListaOffLineErro[J].CStat);
      FieldByName('Msg').AsString := AListaOffLineErro[J].Msg;
      FieldByName('Data_HoraTransmissao').AsDateTime := AListaOffLineErro[J].DataHoraTransmissao;
      FieldByName('Status').AsString := StatusToDescricao( AListaOffLineErro[J].Status );
      Post;
      inc(Cont);
    end;

  end;
  DM.cdsOffLineErro.EnableControls;

  if Cont > 0 then
    MenInfOffLine.Lines.Strings[1]:= ' NFCe(s) OFF-LINE COM REJEIÇÃO:  '+IntToStr(Cont)
  else
    MenInfOffLine.Lines.Strings[1]:= ' ';
  BotaoLigaOffLine;  //Atualiza botão liga e desliga Off-Line

end;

procedure TForm_Demo_Contingencia.EventNFCePendentes(
  AListaNFCePendentes: TListaNFCePendentes);
var
  J, Cont: Integer;
begin
  Cont:= 0;
  if not Dm.cdsPendentes.Active then
    Dm.cdsPendentes.CreateDataSet
  else
    Dm.cdsPendentes.EmptyDataSet;

  Dm.cdsPendentes.DisableControls;
  Dm.cdsPendentes.Close;
  Dm.cdsPendentes.Open;

  for J := 0 to Pred(AListaNFCePendentes.Count) do
  begin
    with Dm.cdsPendentes do
    begin
      Insert;
      FieldByName('Chave').AsString := AListaNFCePendentes[J].Chave;
      FieldByName('cStat').AsString := intToStr(AListaNFCePendentes[J].CStat);
      FieldByName('Msg').AsString := AListaNFCePendentes[J].Msg;
      FieldByName('Data_Hora_Transmissao').AsDateTime := AListaNFCePendentes[J].DataHoraConsulta;
      FieldByName('Status').AsString := StatusToDescricao( AListaNFCePendentes[J].Status );
      FieldByName('Canc').AsBoolean := AListaNFCePendentes[J].Cancelada;
      FieldByName('Inut').AsBoolean := AListaNFCePendentes[J].Inutilizada;
      FieldByName('Chave_Subs').AsString := AListaNFCePendentes[J].ChaveSubst;
      Post;
      inc(Cont);
    end;

  end;
  Dm.cdsPendentes.EnableControls;
  if Cont > 0 then
    MenInfOffLine.Lines.Strings[2]:= ' NFCe(s) AGUARDANDO CONSULTA NA SEFAZ:  '+IntToStr(Cont)
  else
    MenInfOffLine.Lines.Strings[2]:= ' ';
  BotaoLigaOffLine;  //Atualiza botão liga e desliga Off-Line

end;

procedure TForm_Demo_Contingencia.EventNFeTransmitError(const HttpError,
  InternalError: Integer; const URL, DadosEnviados, SoapAction: string;
  var Retentar, Tratado: Boolean);
begin
  DM.ACBrNFe1.Tag := 0;
  if InternalError <> 0 then
    dm.ACBrNFe1.Tag := InternalError;

  Log('ERRO TRANSMISSAO NFCE', 'HttpError:'+inttostr(httperror) +#13#10
                              +'InternalError:'+inttostr(InternalError)+#13#10
                              +'URL:'+URL );

  Retentar:= False;

end;

{function TForm_Demo_Contingencia.LerPeso: Double;
begin
  //Implementar ACBrBal para leitura de peso da balança
  result:= 0;
end; }

procedure TForm_Demo_Contingencia.PageControlPDVChange(Sender: TObject);
begin
  setPage(pageControlPDV);
end;

procedure TForm_Demo_Contingencia.PathClick(Sender: TObject);
var
  Dir: string;
begin

  if Length(TEdit(Sender).Text) <= 0 then
    Dir := ExtractFileDir(application.ExeName)
  else
  begin
    Dir := TEdit(Sender).Text;
    if Dir = '' then
      Dir := ExtractFileDir(application.ExeName)
    else if not DirectoryExists(Dir) then
      Dir := ExtractFileDir(Dir);
  end;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
  if NaoEstaVazio(Dir) then
    TEdit(Sender).Text := Dir;

end;

procedure TForm_Demo_Contingencia.pnlVendaEnter(Sender: TObject);
begin
  calcItem( StrToFloatDef(edtQtde.Text,1), StrToFloatDef(edtPrecoUnitario.Text,1));
end;

{procedure TForm_Demo_Contingencia.PrepararImpressao;
begin
  ACBrPosPrinter1.Desativar;

  ACBrPosPrinter1.Modelo         := TACBrPosPrinterModelo(cbxModeloPosPrinter.ItemIndex);
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo(cbxPagCodigo.ItemIndex);
  ACBrPosPrinter1.Porta          := cbxPorta.Text;

  ACBrPosPrinter1.ColunasFonteNormal := seColunas.Value;
  ACBrPosPrinter1.LinhasEntreCupons  := seLinhasPular.Value;
  ACBrPosPrinter1.EspacoEntreLinhas  := seEspLinhas.Value;
  ACBrPosPrinter1.CortaPapel         := cbCortarPapel.Checked;

  ACBrPosPrinter1.Ativar;

end;  }

procedure TForm_Demo_Contingencia.GravarConfiguracaoContingencia;
var
  Config: TConfigContigencia;
begin
  Config := TConfigContigencia.Create('');
  try
    Config.TempoTransmissaoOffLine := SpnTempoTransmiteOff.Value;
    Config.PathOffLine := edtPathOffLine.Text;
    Config.PathOffLineErro := edtPathOffLineErro.Text;
    Config.PathNFCePendentes:= edtPathPendentes.Text;
    Config.ContingenciaAutomatica:= ckbContingenciaAutomatica.Checked;
    Config.TempoAtivarOnLine:= SpnTempoVoltarOnLine.Value;
    Config.HorasAviso:= SpinAvisos.Value;
    Config.HorasBloqueio:= SpinBloqueios.Value;
    Config.OffLine := DM.ContingenciaNFCe.EOffLine;
    Config.AvisoNFCeComErro := ckOffLineComErro.Checked;
    Config.GravarLog := ckGravarLog.Checked;

    DM.ContingenciaNFCe.SetConfigContingencia(Config);

  finally
    Config.Free;

  end;

end;

procedure TForm_Demo_Contingencia.sbPathCanClick(Sender: TObject);
begin
  PathClick(edtPathCan);
end;

procedure TForm_Demo_Contingencia.sbPathCCeClick(Sender: TObject);
begin
  PathClick(edtPathCCe);
end;

procedure TForm_Demo_Contingencia.sbPathDPECClick(Sender: TObject);
begin
  PathClick(edtPathDPEC);
end;

procedure TForm_Demo_Contingencia.sbPathEventoClick(Sender: TObject);
begin
  PathClick(edtPathEvento);
end;

procedure TForm_Demo_Contingencia.sbPathInuClick(Sender: TObject);
begin
  PathClick(edtPathInu);
end;

procedure TForm_Demo_Contingencia.sbPathNFeClick(Sender: TObject);
begin
  PathClick(edtPathNFe);
end;

procedure TForm_Demo_Contingencia.sbtnCaminhoCertClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Certificado';
  OpenDialog1.DefaultExt := '*.pfx';
  OpenDialog1.Filter := 'Arquivos PFX (*.pfx)|*.pfx|Todos os Arquivos (*.*)|*.*';

  OpenDialog1.InitialDir := ApplicationPath;

  if OpenDialog1.Execute then
    edtCaminho.Text := OpenDialog1.FileName;
end;

procedure TForm_Demo_Contingencia.sbtnGetCertClick(Sender: TObject);
begin
  edtNumSerie.Text := DM.ACBrNFe1.SSL.SelecionarCertificado;
end;

procedure TForm_Demo_Contingencia.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';

  OpenDialog1.InitialDir := ApplicationPath;

  if OpenDialog1.Execute then
    edtLogoMarca.Text := OpenDialog1.FileName;
end;

procedure TForm_Demo_Contingencia.sbtnPathSalvarClick(Sender: TObject);
begin
  PathClick(edtPathLogs);
end;

procedure TForm_Demo_Contingencia.setBackPage(Sender: TPageControl);
begin
  Sender.ActivePageIndex:= (Sender.TabIndex) - 1;
  setPage(Sender)
end;

procedure TForm_Demo_Contingencia.setNextPage(Sender: TPageControl);
begin
  Sender.ActivePageIndex:= (Sender.TabIndex) + 1;
  setPage(Sender);
end;

procedure TForm_Demo_Contingencia.setPage(Sender: TPageControl);
begin
  spbVoltar.Visible := True;
  spbProximo.Visible:= True;

  case Sender.TabIndex of
    0: spbVoltar.Visible := False;
    2: spbProximo.Visible:= False;
  end;

end;

procedure TForm_Demo_Contingencia.spbConfigClick(Sender: TObject);
begin
  ExpandeTelaConfig;
end;

procedure TForm_Demo_Contingencia.spbDocsClick(Sender: TObject);
begin
  frmDocumentos:=  TfrmDocumentos.Create(Self);
  frmDocumentos.Show;
end;

procedure TForm_Demo_Contingencia.spbPathOffClick(Sender: TObject);
begin
  PathClick(edtPathOffLine);
end;

procedure TForm_Demo_Contingencia.spbPathOffErroClick(Sender: TObject);
begin
  PathClick(edtPathOffLineErro);
end;

procedure TForm_Demo_Contingencia.spbPathPendenteClick(Sender: TObject);
begin
  PathClick(edtPathPendentes);
end;

procedure TForm_Demo_Contingencia.spbProximoClick(Sender: TObject);
begin
  setNextPage(pageControlPDV);
end;

procedure TForm_Demo_Contingencia.spbVoltarClick(Sender: TObject);
begin
  setBackPage(pageControlPDV);
end;

procedure TForm_Demo_Contingencia.spPathSchemasClick(Sender: TObject);
begin
  PathClick(edtPathSchemas);
end;

procedure TForm_Demo_Contingencia.spPathServicosClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o arquivo';
  OpenDialog1.DefaultExt := '*.ini';
  OpenDialog1.Filter :=
    'Arquivos INI (*.ini)|*.ini|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtPathServicos.Text := OpenDialog1.FileName;
  end;

end;

procedure TForm_Demo_Contingencia.tsFinalizaShow(Sender: TObject);
begin
  EscreverDisplay(1,'Finalizar Venda');
end;

procedure TForm_Demo_Contingencia.tsPagamentoShow(Sender: TObject);
begin
  edtValor.SetFocus;
  EscreverDisplay(1,'Aguardando Pagamento');
end;


{function TForm_Demo_Contingencia.UltimaLeitura: String;
begin
  //Implementar componente ACBrLCB para leitura de Codigo de Barras

end; }

end.
