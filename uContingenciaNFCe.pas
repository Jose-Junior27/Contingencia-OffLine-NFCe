{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:  José M S Junior                                }
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

{$I ACBr.inc}

unit uContingenciaNFCe;

interface

uses
  Classes, SysUtils, Contnrs, ACBrUtil, ACBrDFeUtil, ACBrBase, ACBrNFeConfiguracoes,
  pcnConversao, ACBrNFe, DateUtils, TypInfo, IniFiles, ExtCtrls, StrUtils,
  syncobjs;

const
  CINTERVALPROCESS = 10000;
  CCONFCONTINGENCIA = 'ConfigContingencia';
  COFFLINE = 'OffLine';
  COFFLINEERRO = 'OffLineErro';
  CPENDENTES = 'Pendentes';
  COBJOFFLINE = 'ObjOffLine';
  CSECONDS = 180;
  CSECONDSOFF = 600;
  CALERTSECONDS = 600;
  CALERTHOURS = 12;
  CBLOCKHOURS = 48;
  CCONTINGENCIA = 'Contingencia';
  CLOGCONTINGENCIA = 'LogContingencia';
  CJUSTIFICATIVAOFFLINE = 'Emissão em Contingencia Off-Line';
  CVERSAOAPLIC = '1.1';
  CErrArqConfNaoEncontrado = 'Arquivo de configuração não encontrado';
  CErrArqConfigNaoDefinido = 'Arquivo de configuração não definido';
  CErrDiretorioInvalido = 'Diretório Invalido: %s';
  CCHAVEONOFF = '<< CHAVE ON / OFF >>';
  CPROCESSAMENTONFCEPENDENTE = '<< PROCESSAMENTO NFCe PENDENTE >>';
  CPROCESSAMENTOTRANSMISSAOOFFLINE = '<< PROCESSAMENTO TRANSMISSAO OFF-LINE >>';
  CBLOQUEIOPRAZOENVIO = '<< BLOQUEIO PRAZO ENVIO >> ';
  CALERTAPRAZOENVIO = '<< ALERTA PRAZO ENVIO >> ';
  CERROAOVALIDARALERTAS = '<< ERRO AO VALIDAR ALERTAS >> ';

type

  TStatusNFCe = (stPendente, stTransmitido, stNaoTransmitido, stErroRejeicao);

  EDFeException = class(Exception);
  EDFeConfigException = class(EDFeException);

  TConfigContigencia = class;
  TListaNFCePendentes = class;
  TListaNFCeEmitidaOffLine = class;
  TListaNFCeOffLineErro = class;
  TOnGravarConfigContingencia = procedure(AConfigContingencia: TConfigContigencia) of object;
  TOnEmitidasOffLine = procedure(AEmitidasOffLine: TListaNFCeEmitidaOffLine) of object;
  TOnNFCePendentes = procedure(ANFCePendentes: TListaNFCePendentes) of object;
  TOnNFCeOffLineErro = procedure(ANFCeOffLineErro: TListaNFCeOffLineErro) of object;
  TOnLogOffLine = procedure(ALogOffLine: String) of object;
  TOnAlertaOffLine = procedure(AAlerta: Integer) of object;
  TOnBloqueioOffLine = procedure(ABloqueio: Integer) of object;
  TOnAtualizaTransmissaoOffLine = procedure(AChave, AXML: String) of object;
  TOnAtualizaTransmissaoPendente = procedure(ATipoDoc: Char; AChave, AXML: String) of object;

 {TConfigContigencia}
  TConfigContigencia = class
    private
      FOnGravarConfig: TOnGravarConfigContingencia;
      FNomeArquivo: String;
      FTempoTransmissaoOffLine: Integer;
      FPathOffLine: String;
      FPathOffLineErro: String;
      FPathNFCePendentes: String;
      FOffLine: Boolean;
      FContingenciaAutomatica: Boolean;
      FTentatativaReenvio: Integer;
      FTempoAtivarOnLine: Integer;
      FHorasAviso: Integer;
      FHorasBloqueio: Integer;
      FAvisoNFCeComErro: Boolean;
      FGravarLog: Boolean;

      procedure ValidarNomeCaminho(Salvar: Boolean);
      procedure SalvarArquivoMemoria(AStream: TStream);
      procedure CarregarArquivoMemoria(AStream: TStream);
      procedure DoGravarConfig;
      procedure Assign(DeConfigContigencia: TConfigContigencia);

    public
      constructor Create(ANomeArquivo: String);

      procedure SalvarArquivo;
      procedure CarregarArquivo;
      procedure CriarArquivo;

      property TempoTransmissaoOffLine: Integer read FTempoTransmissaoOffLine write FTempoTransmissaoOffLine;
      property PathOffLine: String read FPathOffLine write FPathOffLine;
      property PathOffLineErro: String read FPathOffLineErro write FPathOffLineErro;
      property PathNFCePendentes: String read FPathNFCePendentes write FPathNFCePendentes;
      property OffLine: Boolean read FOffLine write FOffLine;
      property ContingenciaAutomatica: Boolean read FContingenciaAutomatica write FContingenciaAutomatica;
      property TentatativaReenvio: Integer read FTentatativaReenvio write FTentatativaReenvio;
      property TempoAtivarOnLine: Integer read FTempoAtivarOnLine write FTempoAtivarOnLine;
      property HorasAviso: Integer read FHorasAviso write FHorasAviso;
      property HorasBloqueio: Integer read FHorasBloqueio write FHorasBloqueio;
      property AvisoNFCeComErro: Boolean read FAvisoNFCeComErro write FAvisoNFCeComErro;
      property GravarLog: Boolean read FGravarLog write FGravarLog;

      property OnGravarConfig: TOnGravarConfigContingencia read FOnGravarConfig write FOnGravarConfig;

  end;

  {TNFCeEmitidaOffLine}
  TNFCeEmitidaOffLine = class
    private
      FChave: String;
      FStatus: TStatusNFCe;
      FCStat: Integer;
      FMsg: String;
      FDataHoraTransmissao: TDateTime;
    public
      constructor Create();

      procedure Assign(DeNFCeEmitidaOffLine: TNFCeEmitidaOffLine);
      property Chave: String read FChave write FChave;
      property Status: TStatusNFCe read FStatus write FStatus;
      property CStat: Integer read FCStat write FCStat;
      property Msg: String read FMsg write FMsg;
      property DataHoraTransmissao: TDateTime read FDataHoraTransmissao write FDataHoraTransmissao;

  end;

  { TListaNFCeEmitidaOffLine }
  TListaNFCeEmitidaOffLine = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TNFCeEmitidaOffLine);
    function  GetObject (Index: Integer): TNFCeEmitidaOffLine;
    procedure Insert (Index: Integer; Obj: TNFCeEmitidaOffLine);
  public
    function Add (Obj: TNFCeEmitidaOffLine): Integer;
    property Objects [Index: Integer]: TNFCeEmitidaOffLine read GetObject write SetObject; default;
  end;

  {TNFCePendentes}
  TNFCePendentes = class
    private
      FChave: String;
      FChaveSubst: String;
      FStatus: TStatusNFCe;
      FCStat: Integer;
      FMsg: String;
      FDataHoraConsulta: TDateTime;
      FCancelada: Boolean;
      FInutilizada: Boolean;
    public
      constructor Create();

      procedure Assign(DeNFCePendentes: TNFCePendentes);
      property Chave: String read FChave write FChave;
      property ChaveSubst: String read FChaveSubst write FChaveSubst;
      property Status: TStatusNFCe read FStatus write FStatus;
      property CStat: Integer read FCStat write FCStat;
      property Msg: String read FMsg write FMsg;
      property DataHoraConsulta: TDateTime read FDataHoraConsulta write FDataHoraConsulta;
      property Cancelada: Boolean read FCancelada write FCancelada;
      property Inutilizada: Boolean read FInutilizada write FInutilizada;

  end;

  { TListaNFCePendentes }
  TListaNFCePendentes = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TNFCePendentes);
    function  GetObject (Index: Integer): TNFCePendentes;
    procedure Insert (Index: Integer; Obj: TNFCePendentes);
  public
    function Add (Obj: TNFCePendentes): Integer;
    property Objects [Index: Integer]: TNFCePendentes read GetObject write SetObject; default;
  end;

  {TNFCeOffLineErro}
  TNFCeOffLineErro = class
    private
      FChave: String;
      FStatus: TStatusNFCe;
      FCStat: Integer;
      FMsg: String;
      FDataHoraTransmissao: TDateTime;
    public
      constructor Create();

      procedure Assign(DeNFCeOffLineErro: TNFCeOffLineErro);
      property Chave: String read FChave write FChave;
      property Status: TStatusNFCe read FStatus write FStatus;
      property CStat: Integer read FCStat write FCStat;
      property Msg: String read FMsg write FMsg;
      property DataHoraTransmissao: TDateTime read FDataHoraTransmissao write FDataHoraTransmissao;

  end;

  { TListaNFCeOffLineErro }
  TListaNFCeOffLineErro = class(TObjectList)
  protected
    procedure SetObject (Index: Integer; Item: TNFCeOffLineErro);
    function  GetObject (Index: Integer): TNFCeOffLineErro;
    procedure Insert (Index: Integer; Obj: TNFCeOffLineErro);
  public
    function Add (Obj: TNFCeOffLineErro): Integer;
    property Objects [Index: Integer]: TNFCeOffLineErro read GetObject write SetObject; default;
  end;

  { TContingenciaNFCe }
  TContingenciaNFCe = class(TThread)
  private
    FConfigContigencia: TConfigContigencia;
    FACBrNFe: TACBrNFe;
    FListaNFCeEmitidaOffLine: TListaNFCeEmitidaOffLine;
    FListaNFCePendentes: TListaNFCePendentes;
    FListaNFCeOffLineErro: TListaNFCeOffLineErro;
    FSIntervalo: Integer;
    FSEvento: TSimpleEvent;

    FOnNFCePendentes : TOnNFCePendentes;
    FOnEmitidasOffLine : TOnEmitidasOffLine;
    FOnNFCeOffLineErro : TOnNFCeOffLineErro;
    FOnLogOffLine : TOnLogOffLine;
    FOnAlertaOffLine : TOnAlertaOffLine;
    FOnBloqueioOffLine : TOnBloqueioOffLine;
    FOnAtualizaTransmissaoOffLine : TOnAtualizaTransmissaoOffLine;
    FOnAtualizaTransmissaoPendente : TOnAtualizaTransmissaoPendente;

    FAlarme: Integer;
    FBloqueio: Integer;
    FAlarmeNFCeErro: Integer;
    FBloqueioNFCeErro: Integer;

    FMsgsLog: String;

    FEOffLine: Boolean;
    FEContingenciaAutomatica: Boolean;

    procedure AlertaOffLine(Sender: TObject);
    procedure LigarOnLine(Sender: TObject);
    procedure ProcessarContingencia(Sender: TObject);

    procedure AtualizarListaNFCeOffLine;
    procedure Transmitir;
    procedure RemoverXML(const Index: Integer);
    procedure TransferirXMLcomRejeicao(const Index: Integer);
    procedure LimparListaNFCeEmitidaOffLine;
    procedure LogIntegracaoOFFLine(const Index: Integer);

    procedure AtualizarListaNFCePendentes;
    procedure ResolverNFCePendentes;
    procedure RemoverXMLPendentes(const Index: Integer);
    procedure LimparListaNFCePendentes;
    procedure LogIntegracaoNFCePendentes(const Index: Integer);

    procedure AtualizarListaNFCeOffLineErro(const AInicializacao: Boolean = False);
    procedure LimparListaNFCeOffLineErro;

    procedure ValidarAlertaBloqueioOffLine(const AIndice: Integer);
    procedure ValidarAlertaBloqueioOffLineErro(const AIndice: Integer);
    procedure LogAlertaBloqueioOffLine;
    procedure AtualizarEventosOffLine(const AInicializacao: Boolean = False);

    procedure SetMsgLog(const AValue: String);

    function GetConfigContigencia: TConfigContigencia;
    function GetOffLine: Boolean;
    function GetContingenciaAutomatica: Boolean;
    function GetPathLog: String;

    function CheckTimer(const StartDateTime: TDateTime; const SecondsTime: Integer): Boolean;
    function Cancelamento(const AProtocolo: String; ANFCePendente: TNFCePendentes ): Boolean;
    function Inutilizacao(ANFCePendente: TNFCePendentes ): Boolean;
    function AdicionaNFCeEmitidaOffLine: TNFCeEmitidaOffLine;
    function AdicionaNFCePendentes: TNFCePendentes;
    function AdicionaNFCeOffLineErro: TNFCeOffLineErro;
    function ValidaChaveSubstituta(const AChave: String): String;
    function TempoOffLineVencido(const ATempoEmHoras: Integer; const ADataHora: TDateTime ):Boolean;

    property MsgLog : String read FMsgsLog write SetMsgLog;

  public
    constructor Create(AConfigNFe: TConfiguracoesNFe); reintroduce;
    destructor Destroy; override;

    procedure Execute; override;

    procedure DoEmitidasOffLine;
    procedure DoNFCePendentes;
    procedure DoNFCeOffLineErro;
    procedure DoLogOffLine;
    procedure DoAlarmeOffLine;
    procedure DoBloqueioOffLine;
    procedure DoAtualizaTransmissaoOffLine;
    procedure DoAtualizaTransmissaoPendente;
    procedure ChaveOnOff;
    procedure SetConfigContingencia(const AValue: TConfigContigencia);

    property ACBrNFe: TACBrNFe read FACBrNFe;
    property Intervalo : Integer read FSIntervalo;
    property EOffLine: Boolean read GetOffLine;
    property EContingenciaAutomatica: Boolean read GetContingenciaAutomatica;

    property ListaNFCeEmitidaOffLine : TListaNFCeEmitidaOffLine read FListaNFCeEmitidaOffLine;
    property ListaNFCePendentes : TListaNFCePendentes read FListaNFCePendentes;
    property ListaNFCeOffLineErro: TListaNFCeOffLineErro read FListaNFCeOffLineErro;

    property ConfigContigencia : TConfigContigencia read GetConfigContigencia write SetConfigContingencia;
    property OnEmitidasOffLine: TOnEmitidasOffLine read FOnEmitidasOffLine write FOnEmitidasOffLine;
    property OnNFCePendentes: TOnNFCePendentes read FOnNFCePendentes write FOnNFCePendentes;
    property OnNFCeOffLineErro: TOnNFCeOffLineErro read FOnNFCeOffLineErro write FOnNFCeOffLineErro;
    property OnLogOffLine: TOnLogOffLine read FOnLogOffLine write FOnLogOffLine;
    property OnAlertaOffLine : TOnAlertaOffLine read FOnAlertaOffLine write FOnAlertaOffLine;
    property OnBloqueioOffLine : TOnBloqueioOffLine read FOnBloqueioOffLine write FOnBloqueioOffLine;
    property OnAtualizaTransmissaoOffLine : TOnAtualizaTransmissaoOffLine read FOnAtualizaTransmissaoOffLine write FOnAtualizaTransmissaoOffLine;
    property OnAtualizaTansmissaoPendente : TOnAtualizaTransmissaoPendente read FOnAtualizaTransmissaoPendente write FOnAtualizaTransmissaoPendente;

  end;

  //Funções de Conversão
  function StatusToStr(const t: TStatusNFCe): String;
  function StatusToDescricao(const Status: TStatusNFCe): String;

implementation

function StatusToStr(const t: TStatusNFCe): String;
begin
  Result := EnumeradoToStr(t, ['P', 'T', 'N', 'E'],
         [stPendente, stTransmitido, stNaoTransmitido, stErroRejeicao]);
end;

function StatusToDescricao(const Status: TStatusNFCe): String;
begin
  case Status of
    stPendente: Result:= 'Pendente de Transmissão';
    stTransmitido: Result:= 'Transmitido com Sucesso';
    stNaoTransmitido: Result:= 'Não Transmitido';
    stErroRejeicao: Result:= 'Rejeição SEFAZ';
  end;

end;

{ TListaNFCeEmitidaOffLine }

function TListaNFCeEmitidaOffLine.Add(Obj: TNFCeEmitidaOffLine): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TListaNFCeEmitidaOffLine.GetObject(Index: Integer): TNFCeEmitidaOffLine;
begin
  Result := inherited GetItem(Index) as TNFCeEmitidaOffLine ;
end;

procedure TListaNFCeEmitidaOffLine.Insert(Index: Integer; Obj: TNFCeEmitidaOffLine);
begin
  inherited Insert(Index, Obj);
end;

procedure TListaNFCeEmitidaOffLine.SetObject(Index: Integer; Item: TNFCeEmitidaOffLine);
begin
  inherited SetItem (Index, Item) ;
end;

{ TContingenciaNFCe }

function TContingenciaNFCe.AdicionaNFCeEmitidaOffLine: TNFCeEmitidaOffLine;
var
  i: Integer;
begin
  i := FListaNFCeEmitidaOffLine.Add(TNFCeEmitidaOffLine.Create);
  Result:= FListaNFCeEmitidaOffLine[i];
end;

function TContingenciaNFCe.AdicionaNFCeOffLineErro: TNFCeOffLineErro;
var
  i: Integer;
begin
  i := FListaNFCeOffLineErro.Add(TNFCeOffLineErro.Create);
  Result:= FListaNFCeOffLineErro[i];
end;

function TContingenciaNFCe.AdicionaNFCePendentes: TNFCePendentes;
var
  i: Integer;
begin
  i := FListaNFCePendentes.Add(TNFCePendentes.Create);
  Result:= FListaNFCePendentes[i];
end;

procedure TContingenciaNFCe.AlertaOffLine(Sender: TObject);
begin

  if (not Terminated) then
    LogAlertaBloqueioOffLine;

end;

procedure TContingenciaNFCe.AtualizarEventosOffLine(const AInicializacao: Boolean);
begin
  if EOffLine then
  begin
    //Popula a classe TNFCeEmitidaOffLine com as NFes Emitidas OffLine
    AtualizarListaNFCeOffLine;
    Synchronize(DoEmitidasOffLine);

    //Popula a classe TNFCePendentes com as NFes que ficaram pendentes de consulta
    AtualizarListaNFCePendentes;
    Synchronize(DoNFCePendentes);

  end;

  //Popula a classe TNFCeOffLineErros com as NFCes para correcao
  if AInicializacao or (FListaNFCeOffLineErro.Count > 0) then
    AtualizarListaNFCeOffLineErro(AInicializacao);

end;

function TContingenciaNFCe.Cancelamento(const AProtocolo: String; ANFCePendente: TNFCePendentes): Boolean;
var
  Lote: integer;
begin
  Lote:= 1;
  Result:= False;
  ACBrNFe.EventoNFe.Evento.Clear;

  with ACBrNFe.EventoNFe.Evento.New do
  begin
    infEvento.chNFe := ANFCePendente.Chave;
    infEvento.CNPJ := Copy(ANFCePendente.Chave,7,14) ;
    infEvento.dhEvento := now;
    infEvento.tpEvento := teCancSubst;
    infEvento.detEvento.xJust := CJUSTIFICATIVAOFFLINE;
    infEvento.detEvento.nProt := AProtocolo;
    InfEvento.detEvento.chNFeRef := ANFCePendente.ChaveSubst;
    InfEvento.detEvento.verAplic := CVERSAOAPLIC;
    InfEvento.detEvento.versao := CVERSAOAPLIC;
    InfEvento.detEvento.cOrgaoAutor:= StrToIntDef(Copy(ANFCePendente.Chave,1,2),2);

  end;

  try
    Result := ACBrNFe.EnviarEvento(Lote);

    if ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Count > 0 then
    begin
      ANFCePendente.FCStat := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
      ANFCePendente.FMsg := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo;
      ANFCePendente.FDataHoraConsulta := Now;

      if ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat in [135, 136, 155]  then //cStat NFCe evento registrado
      begin
        ANFCePendente.Status := stTransmitido;
        ANFCePendente.Cancelada := True;
        Synchronize(DoAtualizaTransmissaoPendente);
      end
      else if (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 0) then
        ANFCePendente.Status := stNaoTransmitido
      else
        ANFCePendente.Status := stErroRejeicao;

    end;

  except
    on E: Exception do
    begin
      ANFCePendente.FDataHoraConsulta := Now;
      ANFCePendente.FCStat := ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat;
      if (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 0) then
        ANFCePendente.Status := stNaoTransmitido
      else
        ANFCePendente.Status := stErroRejeicao;
      ANFCePendente.Msg:= E.Message;
    end;
  end;

end;

procedure TContingenciaNFCe.ChaveOnOff;
var
  SL: TStringList;
begin
  ConfigContigencia.OffLine := not(ConfigContigencia.OffLine);
  ConfigContigencia.SalvarArquivo;

  SL:= TStringList.Create;
  try
    SL.Add(DateTimeToStr(Now) + CCHAVEONOFF);
    if ConfigContigencia.OffLine then
      SL.Add('-------------------- ATIVADO MODO OFFLINE --------------------')
    else
      SL.Add('-------------------- ATIVADO MODO ONLINE ---------------------');

  finally
    MsgLog := SL.Text;
    Synchronize(DoLogOffLine);
    SL.Free;

  end;

end;

procedure TContingenciaNFCe.ResolverNFCePendentes;
var
  J: integer;
  msgFalha: String;
begin
  for J := 0 to Pred(FListaNFCePendentes.Count) do
  begin
    if Terminated or EOffLine then
      Break;

    msgFalha:= '';
    if (FListaNFCePendentes[J].Status in [stNaoTransmitido, stPendente]) then
    begin
      ACBrNFe.NotasFiscais.Clear;
      try
        ACBrNFe.Consultar(FListaNFCePendentes[J].FChave);
        FListaNFCePendentes[J].FCStat := ACBrNFe.WebServices.Consulta.cStat;
        FListaNFCePendentes[J].FMsg := ACBrNFe.WebServices.Consulta.Msg;
        FListaNFCePendentes[J].FDataHoraConsulta := Now;

        if ACBrNFe.CstatConfirmada( ACBrNFe.WebServices.Consulta.cStat ) then //cStat Autorizadas
          Cancelamento(ACBrNFe.WebServices.Consulta.Protocolo , FListaNFCePendentes[J]);

        if ACBrNFe.WebServices.Consulta.cStat = 217 then  //cStat Não encontrada na SEFAZ
          Inutilizacao(FListaNFCePendentes[J]);

        RemoverXMLPendentes(J); //Remove o XML do diretório de Pendentes, apenas se foi transmitido

        LogIntegracaoNFCePendentes(J); //Atualiza Log com Status de Integração de Pendentes
        Synchronize(DoNFCePendentes);

      except
        on E: Exception do
        begin
          msgFalha := 'Falha ao resolver NFCe Pendente: ' + FListaNFCePendentes[J].FChave + sLineBreak + E.Message;

          FListaNFCePendentes[J].FDataHoraConsulta := Now;
          FListaNFCePendentes[J].FCStat := ACBrNFe.WebServices.Consulta.cStat;
          if ACBrNFe.WebServices.Consulta.cStat = 0 then
            FListaNFCePendentes[J].Status := stNaoTransmitido
          else
            FListaNFCePendentes[J].Status := stErroRejeicao;
          FListaNFCePendentes[J].Msg:= msgFalha;

          LogIntegracaoNFCePendentes(J); //Atualiza Log com Status de Integração de Pendentes
          Synchronize(DoNFCePendentes);

        end;
      end;

    end;
  end;

  if (FListaNFCePendentes.Count > 0) then
  begin
    //Atualiza a Lista Pendentes
    AtualizarListaNFCePendentes;
    Synchronize(DoNFCePendentes);
  end;

end;

procedure TContingenciaNFCe.SetConfigContingencia(
  const AValue: TConfigContigencia);
begin
  if Assigned(AValue) and (ConfigContigencia <> AValue) then
  begin
    ConfigContigencia.Assign(AValue);
    FEOffLine := ConfigContigencia.FOffLine;
    FEContingenciaAutomatica := ConfigContigencia.FContingenciaAutomatica;

  end;

end;

procedure TContingenciaNFCe.SetMsgLog(const AValue: String);
begin
  if FMsgsLog <> AValue then
  begin
    FMsgsLog := AValue;

    //Gera os Logs toda vez que atualizado a Msg
    if ConfigContigencia.GravarLog and NaoEstaVazio(FMsgsLog) then
      WriteToTXT(GetPathLog
        , NativeStringToAnsi(FMsgsLog)
        , True
        , True
        , True);

  end;
  
end;

constructor TContingenciaNFCe.Create(AConfigNFe: TConfiguracoesNFe);
begin
  inherited Create( True );
  Self.FreeOnTerminate:= True;

  FSIntervalo := CINTERVALPROCESS;
  FSEvento := TSimpleEvent.Create;
  FAlarme := 0;
  FBloqueio := 0;
  FAlarmeNFCeErro := 0;
  FBloqueioNFCeErro := 0;
  FMsgsLog := '';
  FListaNFCeEmitidaOffLine := TListaNFCeEmitidaOffLine.Create(true);
  FListaNFCePendentes := TListaNFCePendentes.Create(true);
  FListaNFCeOffLineErro := TListaNFCeOffLineErro.Create(true);
  FConfigContigencia := TConfigContigencia.Create(CCONFCONTINGENCIA + '.ini');
  FOnNFCePendentes := nil;
  FOnEmitidasOffLine := nil;
  FOnNFCeOffLineErro := nil;
  FOnLogOffLine := nil;
  FOnAlertaOffLine := nil;
  FOnBloqueioOffLine := nil;
  FOnAtualizaTransmissaoOffLine := nil;
  FOnAtualizaTransmissaoPendente := nil;

  FConfigContigencia.CarregarArquivo;
  FEOffLine := FConfigContigencia.FOffLine;
  FEContingenciaAutomatica := FConfigContigencia.FContingenciaAutomatica;

  FACBrNFe := TACBrNFe.Create(nil);
  FACBrNFe.Configuracoes.Assign(AConfigNFe);

end;

destructor TContingenciaNFCe.Destroy;
begin
  Terminate;
  FSEvento.SetEvent;  // libera Event.WaitFor()
  WaitFor;

  FListaNFCeOffLineErro.Free;
  FListaNFCePendentes.Free;
  FListaNFCeEmitidaOffLine.Free;

  FACBrNFe.Free;
  FConfigContigencia.Free;

  inherited;
  // Eventos de espera devem ser liberados no final porque o destructor da trhead pode
  //  reiniciar a trhead caso ela esteja suspensa e o acesso ao evento geraria um AV
  FSEvento.Free;
end;

procedure TContingenciaNFCe.DoLogOffLine;
begin
  if Assigned(FOnLogOffLine) then
    FOnLogOffLine(FMsgsLog);
end;

procedure TContingenciaNFCe.DoAlarmeOffLine;
begin
  if Assigned(FOnAlertaOffLine) then
    FOnAlertaOffLine(FAlarme + FAlarmeNFCeErro);
end;

procedure TContingenciaNFCe.DoAtualizaTransmissaoOffLine;
begin
  if Assigned(FOnAtualizaTransmissaoOffLine) then
    if (ACBrNFe.NotasFiscais.Count > 0)
      and ACBrNFe.CstatConfirmada( ACBrNFe.WebServices.Enviar.cStat ) then //cStat Autorizada
        FOnAtualizaTransmissaoOffLine(OnlyNumber(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID)
                                      , ACBrNFe.NotasFiscais.Items[0].XMLOriginal);

end;

procedure TContingenciaNFCe.DoAtualizaTransmissaoPendente;
begin
 if Assigned(FOnAtualizaTransmissaoPendente) then
    if (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Count > 0)
      and ( ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat in [135, 136, 155] ) then //cStat Autorizada
    begin
      FOnAtualizaTransmissaoPendente( 'C' //C - Cancelamento por Subst.
                                      , ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.chNFe
                                      , ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);
    end
    else if ACBrNFe.WebServices.Inutilizacao.cStat in [102] then
    begin
      FOnAtualizaTransmissaoPendente( 'I' //I - Inutilizado.
                                      , OnlyNumber(ACBrNFe.WebServices.Inutilizacao.ID)
                                      , ACBrNFe.WebServices.Inutilizacao.XML_ProcInutNFe);
    end;

end;

procedure TContingenciaNFCe.DoBloqueioOffLine;
begin
  if Assigned(FOnBloqueioOffLine) then
    FOnBloqueioOffLine(FBloqueio + FBloqueioNFCeErro);
end;

procedure TContingenciaNFCe.DoEmitidasOffLine;
begin
  if Assigned(FOnEmitidasOffLine) then
    FOnEmitidasOffLine(FListaNFCeEmitidaOffLine);
    // Verificar se seria melhor gerar uma cópia da lista para retornar ao usuário
end;

procedure TContingenciaNFCe.DoNFCeOffLineErro;
begin
  if Assigned(FOnNFCeOffLineErro) then
    FOnNFCeOffLineErro(FListaNFCeOffLineErro);
end;

procedure TContingenciaNFCe.DoNFCePendentes;
begin
  if Assigned(FOnNFCePendentes) then
    FOnNFCePendentes(FListaNFCePendentes);
end;

procedure TContingenciaNFCe.Execute;
var
  LStartTimerOffLine: TDateTime;
  LStartTimerAtivarOnLine: TDateTime;
  LStartTimerAlertas: TDateTime;
begin
  inherited;

  LStartTimerOffLine := Now;
  LStartTimerAtivarOnLine := Now;
  LStartTimerAlertas := Now;

  AtualizarEventosOffLine(True);
  while not(Self.Terminated) do
  begin
    FSEvento.ResetEvent;

    //Verifica tempo de espera para processar Envio de NFCes emitidas OffLine
    if CheckTimer(LStartTimerOffLine, FConfigContigencia.TempoTransmissaoOffLine) then
    begin
      ProcessarContingencia(Self);
      LStartTimerOffLine:= Now;
    end;

    //Verifica tempo de espera para voltar Emitir On-Line
    if CheckTimer(LStartTimerAtivarOnLine, FConfigContigencia.TempoAtivarOnLine) then
    begin
      LigarOnLine(Self);
      LStartTimerAtivarOnLine:= Now;
    end;

    //Verifica tempo de espera para Gerar Logs de Alertas e Bloqueios Off-Line
    if CheckTimer(LStartTimerAlertas, CALERTSECONDS) then
    begin
      AlertaOffLine(Self);
      LStartTimerAlertas:= Now;
    end;

    //Atualiza os Eventos
    AtualizarEventosOffLine;

    //aguarda o tempo de "Intervalo" (padrão 10 segundos)
    FSEvento.WaitFor( FSIntervalo );

  end;

end;

function TContingenciaNFCe.GetConfigContigencia: TConfigContigencia;
begin
  Result := FConfigContigencia;
end;

function TContingenciaNFCe.GetContingenciaAutomatica: Boolean;
begin
  FEContingenciaAutomatica := FConfigContigencia.FContingenciaAutomatica;
  Result := FEContingenciaAutomatica;
end;

function TContingenciaNFCe.GetOffLine: Boolean;
begin
  FEOffLine := FConfigContigencia.FOffLine;
  Result := FEOffLine;
end;

function TContingenciaNFCe.GetPathLog: String;
begin
  Result:= PathWithDelim( ExtractFilePath(ParamStr(0)) )
          + PathWithDelim(CLOGCONTINGENCIA)
          + DtoS(Date) + '.txt';
end;

function TContingenciaNFCe.CheckTimer(const StartDateTime: TDateTime;
  const SecondsTime: Integer): Boolean;
begin
  Result := CompareDateTime(IncSecond(StartDateTime, SecondsTime ), Now) = -1;
end;

function TContingenciaNFCe.Inutilizacao(ANFCePendente: TNFCePendentes): Boolean;
begin
  Result:= True;
  try
    ACBrNFe.WebServices.Inutiliza(Copy(ANFCePendente.Chave,7,14)
                                , CJUSTIFICATIVAOFFLINE
                                , StrToIntDef(Copy(ANFCePendente.Chave,3,2),2)
                                , StrToIntDef(Copy(ANFCePendente.Chave,21,2),2)
                                , StrToIntDef(Copy(ANFCePendente.Chave,23,3),3)
                                , StrToIntDef(Copy(ANFCePendente.Chave,26,9),9)
                                , StrToIntDef(Copy(ANFCePendente.Chave,26,9),9) );

    ANFCePendente.FCStat := ACBrNFe.WebServices.Inutilizacao.cStat;
    ANFCePendente.FMsg := ACBrNFe.WebServices.Inutilizacao.Msg;
    ANFCePendente.FDataHoraConsulta := Now;

    if ACBrNFe.WebServices.Inutilizacao.cStat in [102]  then //cStat NFCe Inutilizada
    begin
      ANFCePendente.Status := stTransmitido;
      ANFCePendente.Inutilizada := True;
      Synchronize(DoAtualizaTransmissaoPendente);
    end
    else if ACBrNFe.WebServices.Inutilizacao.cStat = 0 then
      ANFCePendente.Status := stNaoTransmitido
    else
      ANFCePendente.Status := stErroRejeicao;

  except
    on E: Exception do
    begin
      ANFCePendente.FDataHoraConsulta := Now;
      ANFCePendente.FCStat := ACBrNFe.WebServices.Inutilizacao.cStat;
      if ACBrNFe.WebServices.Inutilizacao.cStat = 0 then
        ANFCePendente.Status := stNaoTransmitido
      else
        ANFCePendente.Status := stErroRejeicao;
      ANFCePendente.Msg:= E.Message;
      Result:= False
    end;
  end;

end;

procedure TContingenciaNFCe.AtualizarListaNFCeOffLine;
var
  AEmitidasOffLine, AEmitidasOffLineClone: TNFCeEmitidaOffLine;
  SL: TStringList;
  I, J: Integer;

  AChave: String;
  ListaNFCeEmitidaOffLineClone: TListaNFCeEmitidaOffLine;
begin
  FAlarme:= 0;
  FBloqueio:= 0;
  //Clona a Lista original compara Chaves que já houve tentativa de Transmissao
  //para Atualizar Chaves com o seu Status atual p/ não haver tentativa de Transmissão quando houve rejeicao
  ListaNFCeEmitidaOffLineClone:= TListaNFCeEmitidaOffLine.Create(true);
  try
    for J := 0 to Pred(FListaNFCeEmitidaOffLine.Count) do
    begin
      I := ListaNFCeEmitidaOffLineClone.Add(TNFCeEmitidaOffLine.Create);
      AEmitidasOffLineClone:= ListaNFCeEmitidaOffLineClone[I];
      AEmitidasOffLineClone.Assign(FListaNFCeEmitidaOffLine[J]);
    end;

    if Terminated then
      Exit;

    //Limpa Lista TNFCeEmitidaOffLine
    LimparListaNFCeEmitidaOffLine;

    //Atualiza as chaves lendo os XML a partir do diretório
    SL := TStringList.Create;
    try
      FindFiles( PathWithDelim(ConfigContigencia.PathOffLine) +'*.xml', SL );

      for J := 0 to Pred(SL.Count) do
      begin
        if Terminated then
          Break;

        AChave := OnlyNumber( ExtractFileName(SL[J]) );

        if (Length(AChave) = 44) then
        begin
          AEmitidasOffLine:= AdicionaNFCeEmitidaOffLine;

          //Verifica se a chave já e existe e atualiza os dados na lista
          for I := 0 to Pred(ListaNFCeEmitidaOffLineClone.Count) do
          begin
            if (ListaNFCeEmitidaOffLineClone[I].FChave = AChave) then
            begin
              AEmitidasOffLine.Assign(ListaNFCeEmitidaOffLineClone[I]);
              Break;
            end;
          end;
          //Adiciona quando for uma nova chave (XML)
          if EstaVazio(AEmitidasOffLine.FChave) then
          begin
            AEmitidasOffLine.FChave:= AChave;
            AEmitidasOffLine.FStatus:= stPendente;
            AEmitidasOffLine.DataHoraTransmissao:= now;
          end;

          ValidarAlertaBloqueioOffLine(J);

        end;

      end;
    finally
      SL.Free;
      Synchronize(DoAlarmeOffLine);
      Synchronize(DoBloqueioOffLine);
    end;

  finally
    ListaNFCeEmitidaOffLineClone.Free;

  end;

end;

procedure TContingenciaNFCe.AtualizarListaNFCeOffLineErro(const AInicializacao: Boolean);
var
  ANFCeOffLineErro, ANFCeOffLineErroClone: TNFCeOffLineErro;
  SL: TStringList;
  I, J: Integer;
  AChave: String;
  ListaNFCeOffLineErroClone: TListaNFCeOffLineErro;
begin
  //Atualiza as chaves lendo os XML a partir do diretório
  SL := TStringList.Create;
  try
    FindFiles( PathWithDelim(ConfigContigencia.PathOffLineErro) +'*.xml', SL );
    if (SL.Count <> FListaNFCeOffLineErro.Count) then
    begin
      FAlarmeNFCeErro:= 0;
      FBloqueioNFCeErro:= 0;

      //Clona a Lista original compara Chaves que já houve tentativa de Transmissao
      //Para Atualizar Chaves com o seu Status atual p/ não haver tentativa de Transmissão quando houve rejeicao
      ListaNFCeOffLineErroClone:= TListaNFCeOffLineErro.Create(true);
      try
        for J := 0 to Pred(FListaNFCeOffLineErro.Count) do
        begin
          if Terminated then
            Break;
          I := ListaNFCeOffLineErroClone.Add(TNFCeOffLineErro.Create);
          ANFCeOffLineErroClone:= ListaNFCeOffLineErroClone[I];
          ANFCeOffLineErroClone.Assign(FListaNFCeOffLineErro[J]);
        end;

        LimparListaNFCeOffLineErro;

        for J := 0 to Pred(SL.Count) do
        begin
          if Terminated then
            Break;

          AChave := OnlyNumber( ExtractFileName(SL[J]) );
          if (Length(AChave) = 44) then
          begin
            ANFCeOffLineErro:= AdicionaNFCeOffLineErro;
            //Verifica se a chave já e existe e atualiza os dados na lista
            for I := 0 to Pred(ListaNFCeOffLineErroClone.Count) do
            begin
              if (ListaNFCeOffLineErroClone[I].FChave = AChave) then
              begin
                ANFCeOffLineErro.Assign(ListaNFCeOffLineErroClone[I]);
                Break;
              end;

            end;

            //Adiciona quando for uma nova chave (XML)
            if EstaVazio(ANFCeOffLineErro.FChave) then
            begin
              ANFCeOffLineErro.FChave:= AChave;
              ANFCeOffLineErro.FStatus:= stErroRejeicao;
              ANFCeOffLineErro.FDataHoraTransmissao:= now;
            end;

          end;
          ValidarAlertaBloqueioOffLineErro(J);

        end;

      finally
        ListaNFCeOffLineErroClone.Free;
        Synchronize(DoNFCeOffLineErro);

      end;
    end;

  finally
    SL.Free;
    Synchronize(DoAlarmeOffLine);
    Synchronize(DoBloqueioOffLine);

  end;

end;

procedure TContingenciaNFCe.AtualizarListaNFCePendentes;
var
  ANFCesPendentes, ANFCesPendentesClone: TNFCePendentes;
  SL: TStringList;
  I,J: Integer;
  AChave: String;
  ListaNFCePendentesClone: TListaNFCePendentes;
begin
  //Clona a Lista original compara Chaves que já houve tentativa de Transmissao
  //Para Atualizar Chaves com o seu Status atual p/ não haver tentativa de Transmissão quando houve rejeicao
  ListaNFCePendentesClone:= TListaNFCePendentes.Create(true);
  try
    for J := 0 to Pred(FListaNFCePendentes.Count) do
    begin
      I := ListaNFCePendentesClone.Add(TNFCePendentes.Create);
      ANFCesPendentesClone:= ListaNFCePendentesClone[I];
      ANFCesPendentesClone.Assign(FListaNFCePendentes[J]);
    end;

    if Terminated then
      Exit;

    LimparListaNFCePendentes;

    //Atualiza as chaves lendo os XML a partir do diretório
    SL := TStringList.Create;
    try
      FindFiles( PathWithDelim(ConfigContigencia.PathNFCePendentes) +'*.xml', SL );

      for J := 0 to Pred(SL.Count) do
      begin
        if Terminated then
          Break;

        AChave := OnlyNumber( ExtractFileName(SL[J]) );
        if (Length(AChave) = 44) then
        begin
          ANFCesPendentes:= AdicionaNFCePendentes;
          //Verifica se a chave já e existe e atualiza os dados na lista
          for I := 0 to Pred(ListaNFCePendentesClone.Count) do
          begin
            if (ListaNFCePendentesClone[I].FChave = AChave) then
            begin
              ANFCesPendentes.Assign(ListaNFCePendentesClone[I]);
              Break;
            end;
          end;

          //Adiciona quando for uma nova chave (XML)
          if EstaVazio(ANFCesPendentes.FChave) then
          begin
            ANFCesPendentes.FChave:= AChave;
            ANFCesPendentes.FChaveSubst:= ValidaChaveSubstituta(AChave);
            ANFCesPendentes.FStatus:= stPendente;
            ANFCesPendentes.FDataHoraConsulta:= now;

          end;
        end;
      end;
    finally
      SL.Free;
    end;

  finally
    ListaNFCePendentesClone.Free;
  end;

end;

procedure TContingenciaNFCe.LigarOnLine;
begin
  if (FConfigContigencia.FOffLine) then
  begin
     FConfigContigencia.FOffLine := False;
     FConfigContigencia.SalvarArquivo;
  end;

end;

procedure TContingenciaNFCe.LimparListaNFCeEmitidaOffLine;
begin
  FListaNFCeEmitidaOffLine.Clear;
end;

procedure TContingenciaNFCe.LimparListaNFCeOffLineErro;
begin
  if Assigned(FListaNFCeOffLineErro) then
    FListaNFCeOffLineErro.Clear;
end;

procedure TContingenciaNFCe.LimparListaNFCePendentes;
begin
  if Assigned(FListaNFCePendentes) then
    FListaNFCePendentes.Clear;

end;

procedure TContingenciaNFCe.LogAlertaBloqueioOffLine;
var
  SL: TStringList;
begin
  if (FAlarme > 0) or (FBloqueio > 0) or (FAlarmeNFCeErro > 0) or (FBloqueioNFCeErro > 0) then
  begin
    SL := TStringList.Create;
    try
      if (FAlarme > 0) or (FAlarmeNFCeErro > 0) then
      begin
        SL.Add(DateTimeToStr(now) + CALERTAPRAZOENVIO);
        SL.Add(IntToStr(FAlarme + FAlarmeNFCeErro)
                + ' DOCUMENTO(S) OFF-LINE COM TEMPO SUPERIOR À '
                +IntToStr(ConfigContigencia.FHorasAviso)+' HORAS.');
        SL.Add('----------------------------------------');
      end;
      if (FBloqueio > 0) or (FBloqueioNFCeErro > 0) then
      begin
        SL.Add(DateTimeToStr(now) + CBLOQUEIOPRAZOENVIO);
        SL.Add(IntToStr(FBloqueio + FBloqueioNFCeErro)
                +' DOCUMENTO(S) OFF-LINE COM TEMPO SUPERIOR À '
                +IntToStr(ConfigContigencia.FHorasBloqueio)+' HORAS.');
        SL.Add('----------------------------------------');
      end;

    finally
      MsgLog := SL.Text;
      Synchronize(DoLogOffLine);

      SL.Free;
    end;

  end;

end;

procedure TContingenciaNFCe.LogIntegracaoNFCePendentes(const Index: Integer);
var
  SL: TStringList;
begin
    SL:= TStringList.Create;
    try
      SL.Add(DateTimeToStr(Now) + CPROCESSAMENTONFCEPENDENTE );
      SL.Add('CHAVE='+FListaNFCePendentes[Index].Chave);
      SL.Add('STATUS='+ StatusToStr(FListaNFCePendentes[Index].Status));
      SL.Add('CSTAT='+IntToStr(FListaNFCePendentes[Index].CStat));
      SL.Add('MSG='+FListaNFCePendentes[Index].Msg);
      SL.Add('DHTRANSMISSAO='+DateTimeToStr(FListaNFCePendentes[Index].DataHoraConsulta));
      if FListaNFCePendentes[Index].FCancelada then
      begin
        SL.Add('CANCELAMENTO_SUBST= OK');
        SL.Add('CHAVE_SUBS=' + FListaNFCePendentes[Index].ChaveSubst );
      end;
      if FListaNFCePendentes[Index].FInutilizada then
        SL.Add('INUTILIZADA= OK');

      SL.Add('SITUACAO='+StatusToDescricao(FListaNFCePendentes[Index].Status));
      SL.Add('----------------------------------------');

    finally
      MsgLog := SL.Text;
      Synchronize(DoLogOffLine);
      SL.Free;

    end;

end;

procedure TContingenciaNFCe.LogIntegracaoOFFLine(const Index: Integer);
var
  SL: TStringList;
begin
  SL:= TStringList.Create;
  try
    SL.Add(DateTimeToStr(Now) + CPROCESSAMENTOTRANSMISSAOOFFLINE);

    SL.Add('CHAVE='+FListaNFCeEmitidaOffLine[Index].Chave);
    SL.Add('STATUS='+StatusToStr(FListaNFCeEmitidaOffLine[Index].Status));
    SL.Add('CSTAT='+IntToStr(FListaNFCeEmitidaOffLine[Index].CStat));
    SL.Add('MSG='+FListaNFCeEmitidaOffLine[Index].Msg);
    SL.Add('DHTRANSMISSAO='+DateTimeToStr(FListaNFCeEmitidaOffLine[Index].FDataHoraTransmissao));
    SL.Add('SITUACAO='+StatusToDescricao(FListaNFCeEmitidaOffLine[Index].Status));
    SL.Add('----------------------------------------');

  finally
    MsgLog := SL.Text;
    Synchronize(DoLogOffLine);
    SL.Free;

  end;

end;

procedure TContingenciaNFCe.RemoverXMLPendentes(const Index: Integer);
var
  AArqXML: String;
begin
  AArqXML := PathWithDelim( ConfigContigencia.PathNFCePendentes ) + FListaNFCePendentes[Index].Chave + '-nfe.xml';
  if (FileExists( AArqXML )) and (FListaNFCePendentes[Index].Status = stTransmitido) then
  begin
    try
      TryDeleteFile(AArqXML, 1000);
    except
      on E: exception do
      begin
        MsgLog := E.Message;
        Synchronize(DoLogOffLine);
      end;
    end;
  end;

end;

procedure TContingenciaNFCe.RemoverXML(const Index: Integer);
var
  AArqXML: String;
begin
  AArqXML := PathWithDelim( ConfigContigencia.PathOffLine ) + FListaNFCeEmitidaOffLine[Index].Chave + '-nfe.xml';
  if (FileExists( AArqXML )) and (FListaNFCeEmitidaOffLine[Index].Status = stTransmitido) then
  begin
    try
      TryDeleteFile(AArqXML, 1000);
    except
      on E: exception do
      begin
        MsgLog := E.Message;
        Synchronize(DoLogOffLine);
      end;
    end;
  end;

end;

procedure TContingenciaNFCe.ProcessarContingencia;
begin

    if ( not(Terminated) and not(EOffLine) ) then
    begin
      //Popula a classe TNFCeEmitidaOffLine com as NFes Emitidas OffLine
      AtualizarListaNFCeOffLine;

      //Tenta transmitir documentos OffLine e Atualiza Status na classe TNFCeEmitidaOffLine
      Transmitir;

    end;

    if ( not(Terminated) and not(EOffLine) ) then
    begin
      //Popula a classe TNFCePendentes com as NFes que ficaram pendentes de consulta
      AtualizarListaNFCePendentes;

      //Tenta Consultar a chave Pendente e realizar o Cancelamento por Substituição
      //ou Inutilização da mesma. Atualiza o status em TNFCePendentes
      ResolverNFCePendentes;

    end;

end;

procedure TContingenciaNFCe.TransferirXMLcomRejeicao(const Index: Integer);
var
  AArqXML: String;
  ANFCeOffLineErro: TNFCeOffLineErro;
  AMsg: String;
begin
  AArqXML := PathWithDelim( ConfigContigencia.PathOffLine ) + FListaNFCeEmitidaOffLine[Index].Chave + '-nfe.xml';
  try
    if not DirectoryExists(PathWithDelim(ConfigContigencia.PathOffLineErro))then
      ForceDirectories(PathWithDelim(ConfigContigencia.PathOffLineErro));
    if (FileExists( AArqXML )) and (FListaNFCeEmitidaOffLine[Index].Status = stErroRejeicao) then
      if CopyFileTo(AArqXML,PathWithDelim(ConfigContigencia.PathOffLineErro)+FListaNFCeEmitidaOffLine[Index].Chave + '-nfe.xml', False) then
      begin
        TryDeleteFile(AArqXML, 1000); // Tenta apagar por até 1 segundo
        ANFCeOffLineErro:= AdicionaNFCeOffLineErro;
        ANFCeOffLineErro.FChave:= FListaNFCeEmitidaOffLine[Index].Chave;
        ANFCeOffLineErro.FStatus:= FListaNFCeEmitidaOffLine[Index].FStatus;
        ANFCeOffLineErro.FCStat:= FListaNFCeEmitidaOffLine[Index].CStat;
        ANFCeOffLineErro.FMsg:= FListaNFCeEmitidaOffLine[Index].FMsg;
        ANFCeOffLineErro.FDataHoraTransmissao:= FListaNFCeEmitidaOffLine[Index].DataHoraTransmissao;

        Synchronize(DoNFCeOffLineErro);

      end;

  except
    on E: Exception do
    begin
      AMsg:= 'Falha ao Transferir NFCe com rejeição de: '+ AArqXML +
          ' para: ' + PathWithDelim(ConfigContigencia.PathOffLineErro)+
      sLineBreak + E.Message;

      MsgLog := AMsg;
      Synchronize(DoLogOffLine);
    end;
  end;

end;

procedure TContingenciaNFCe.Transmitir;
var
  J: integer;
  msgFalha: String;
begin
  for J := 0 to Pred(FListaNFCeEmitidaOffLine.Count) do
  begin
    if Terminated or EOffLine then
      Break;

    msgFalha := '';
    ACBrNFe.NotasFiscais.Clear;
    ACBrNFe.NotasFiscais.LoadFromFile(PathWithDelim( ConfigContigencia.PathOffLine ) + FListaNFCeEmitidaOffLine[J].FChave + '-nfe.xml' );
    try
      ACBrNFe.Enviar(1,False,True);

      FListaNFCeEmitidaOffLine[J].FCStat := ACBrNFe.WebServices.Enviar.cStat;
      FListaNFCeEmitidaOffLine[J].FMsg := ACBrNFe.WebServices.Enviar.Msg;
      FListaNFCeEmitidaOffLine[J].FDataHoraTransmissao := Now;

      if ACBrNFe.CstatConfirmada( ACBrNFe.WebServices.Enviar.cStat ) then //cStat Autorizada
      begin
        FListaNFCeEmitidaOffLine[J].Status := stTransmitido;
        RemoverXML(J); //Remove do diretório XML já transmitido
        Synchronize(DoAtualizaTransmissaoOffLine);
      end
      else if ACBrNFe.WebServices.Enviar.cStat = 0 then
      begin
        FListaNFCeEmitidaOffLine[J].Status := stNaoTransmitido;
        if not(EOffLine) then
          ChaveOnOff;
      end
      else
      begin
        FListaNFCeEmitidaOffLine[J].Status := stErroRejeicao;
        TransferirXMLcomRejeicao(J);
      end;

      LogIntegracaoOFFLine(J); //Gera log para cada processamento de envio
      Synchronize(DoEmitidasOffLine);

    Except
      on E: Exception do
      begin
        msgFalha := 'Falha na transmissao NFCe: ' + FListaNFCeEmitidaOffLine[J].FChave + sLineBreak + E.Message;
        FListaNFCeEmitidaOffLine[J].Msg:= msgFalha;
        FListaNFCeEmitidaOffLine[J].FDataHoraTransmissao := Now;
        FListaNFCeEmitidaOffLine[J].FCStat := ACBrNFe.WebServices.Enviar.cStat;
        if ACBrNFe.WebServices.Enviar.cStat = 0 then
        begin
          FListaNFCeEmitidaOffLine[J].Status := stNaoTransmitido;
          if not(EOffLine) then
            ChaveOnOff;
        end
        else
        begin
          FListaNFCeEmitidaOffLine[J].Status := stErroRejeicao;
          TransferirXMLcomRejeicao(J);  //Copia XML para OffLine com erro (precisam ser corrigidos)
        end;

        LogIntegracaoOFFLine(J); //Gera log para cada processamento de envio
        Synchronize(DoEmitidasOffLine);

      end;

    end;

  end;

  if (FListaNFCeEmitidaOffLine.Count > 0) then
  begin
    //Atualiza a lista NFes Emitidas OffLine
    AtualizarListaNFCeOffLine;
    Synchronize(DoEmitidasOffLine);

  end;

end;

function TContingenciaNFCe.TempoOffLineVencido(const ATempoEmHoras: Integer;
 const ADataHora: TDateTime): Boolean;
begin
  Result:= (ATempoEmHoras <= (HoursBetween(ADataHora, now)));

end;

function TContingenciaNFCe.ValidaChaveSubstituta(const AChave: String): String;
var
  vNF, vUF, vSerie, vCodigo, vModelo, vCNPJ, vtpEmi: String;
  vDataEmissao: TDateTime;
begin

  vUF:=  Copy(Achave,1,2);
  vDataEmissao:= StringToDateTime('01' + '-'
                                  + Copy(Achave,5,2) + '-'
                                  + Copy(Achave,3,2), 'dd-mm-yy');
  vCNPJ:= Copy(Achave,7,14);
  vModelo:= '65';
  vSerie:= Copy(Achave,23,3);
  vNF:=  IntToStrZero(strtoint(Copy(Achave,26,9)) + 1, 9) ;
  vtpEmi:= '9';
  vCodigo:= Copy(Achave,36,08);

  Result:= GerarChaveAcesso( StrToIntDef(vuf, 2),
                             vDataEmissao,
                             vCNPJ,
                             StrToIntDef(vSerie, 3),
                             StrToIntDef(vNF, 9),
                             StrToIntDef(vtpEmi, 1),
                             StrToIntDef(vCodigo, 8),
                             StrToIntDef(vModelo, 2));

end;

procedure TContingenciaNFCe.ValidarAlertaBloqueioOffLine(const AIndice: Integer);
var
  lDataContingencia: TDateTime;
  lMsg: String;
begin
  ACBrNFe.NotasFiscais.Clear;
  try
    ACBrNFe.NotasFiscais.LoadFromFile(PathWithDelim( ConfigContigencia.PathOffLine ) + FListaNFCeEmitidaOffLine[AIndice].FChave + '-nfe.xml' );
    lDataContingencia:= ACBrNFe.NotasFiscais.Items[0].NFe.Ide.dhCont;

    if TempoOffLineVencido(ConfigContigencia.HorasBloqueio, lDataContingencia ) then
    begin
      inc( FBloqueio );
      lMsg := FListaNFCeEmitidaOffLine[AIndice].FMsg;
      if Pos( CBLOQUEIOPRAZOENVIO, lMsg ) = 0 then
        FListaNFCeEmitidaOffLine[AIndice].FMsg:= CBLOQUEIOPRAZOENVIO + lMsg;
    end
    else if TempoOffLineVencido(ConfigContigencia.HorasAviso, lDataContingencia ) then
    begin
      inc( FAlarme );
      lMsg := FListaNFCeEmitidaOffLine[AIndice].FMsg;
      if Pos( CALERTAPRAZOENVIO, lMsg ) = 0 then
        FListaNFCeEmitidaOffLine[AIndice].FMsg:= CALERTAPRAZOENVIO + lMsg;
    end;

  except
    MsgLog := CERROAOVALIDARALERTAS + sLineBreak
              +'Falha ao carregar NFCe ' + FListaNFCeEmitidaOffLine[AIndice].FChave;
    Synchronize(DoLogOffLine);
  end;

end;

procedure TContingenciaNFCe.ValidarAlertaBloqueioOffLineErro(
  const AIndice: Integer);
var
  lDataContingencia: TDateTime;
  lMsg: String;
begin
  if ConfigContigencia.AvisoNFCeComErro then
  begin
    ACBrNFe.NotasFiscais.Clear;
    try
      ACBrNFe.NotasFiscais.LoadFromFile(PathWithDelim( ConfigContigencia.PathOffLineErro ) + FListaNFCeOffLineErro[AIndice].FChave + '-nfe.xml' );
      lDataContingencia:= ACBrNFe.NotasFiscais.Items[0].NFe.Ide.dhCont;

      if TempoOffLineVencido(ConfigContigencia.HorasBloqueio, lDataContingencia ) then
      begin
        inc( FBloqueioNFCeErro );
        lMsg := FListaNFCeOffLineErro[AIndice].FMsg;
        if Pos( CBLOQUEIOPRAZOENVIO, lMsg ) = 0 then
          FListaNFCeOffLineErro[AIndice].FMsg:= CBLOQUEIOPRAZOENVIO + lMsg;
      end
      else if TempoOffLineVencido(ConfigContigencia.HorasAviso,  lDataContingencia ) then
      begin
        inc( FAlarmeNFCeErro );
        lMsg := FListaNFCeOffLineErro[AIndice].FMsg;
        if Pos( CALERTAPRAZOENVIO, lMsg ) = 0 then
          FListaNFCeOffLineErro[AIndice].FMsg:= CALERTAPRAZOENVIO + lMsg;
      end;

    except
      MsgLog := CERROAOVALIDARALERTAS + sLineBreak
                +'Falha ao carregar NFCe ' + ListaNFCeOffLineErro[AIndice].FChave;
      Synchronize(DoLogOffLine);
    end;

  end;

end;

{ TNFCeEmitidaOffLine }

procedure TNFCeEmitidaOffLine.Assign(DeNFCeEmitidaOffLine: TNFCeEmitidaOffLine);
begin
  FChave:= DeNFCeEmitidaOffLine.FChave;
  FStatus:= DeNFCeEmitidaOffLine.FStatus;
  FCStat:= DeNFCeEmitidaOffLine.CStat;
  FMsg:= DeNFCeEmitidaOffLine.FMsg;
  FDataHoraTransmissao:= DeNFCeEmitidaOffLine.FDataHoraTransmissao;

end;

constructor TNFCeEmitidaOffLine.Create;
begin
  inherited;
  FChave:= '';
  FStatus:= stPendente;
  FCStat:= 0;
  FMsg:= '';
  FDataHoraTransmissao:= 0;
end;

{ TConfigContigencia }

procedure TConfigContigencia.Assign(DeConfigContigencia: TConfigContigencia);
begin
  TempoTransmissaoOffLine:= DeConfigContigencia.TempoTransmissaoOffLine;
  PathOffLine:= DeConfigContigencia.PathOffLine;
  PathOffLineErro:= DeConfigContigencia.FPathOffLineErro;
  PathNFCePendentes:= DeConfigContigencia.PathNFCePendentes;
  OffLine:= DeConfigContigencia.OffLine;
  ContingenciaAutomatica:= DeConfigContigencia.ContingenciaAutomatica;
  TentatativaReenvio:= DeConfigContigencia.TentatativaReenvio;
  TempoAtivarOnLine:= DeConfigContigencia.TempoAtivarOnLine;
  HorasAviso:= DeConfigContigencia.HorasAviso;
  HorasBloqueio:= DeConfigContigencia.HorasBloqueio;
  AvisoNFCeComErro:= DeConfigContigencia.AvisoNFCeComErro;
  GravarLog:= DeConfigContigencia.GravarLog;

  SalvarArquivo;

end;

procedure TConfigContigencia.CarregarArquivo;
var
  FS: TFileStream;
begin
  ValidarNomeCaminho(False);

  FS := TFileStream.Create(PathWithDelim( ExtractFilePath(ParamStr(0))) + FNomeArquivo, fmOpenRead);
  try
    CarregarArquivoMemoria(FS);
  finally
    FS.Free;
  end;

end;

procedure TConfigContigencia.CarregarArquivoMemoria(AStream: TStream);
var
  Ini: TMemIniFile;
  SL: TStringList;
begin
  Ini := TMemIniFile.Create('');
  try
    SL := TStringList.Create;
    try
      AStream.Position := 0;
      SL.LoadFromStream(AStream);
      Ini.SetStrings(SL);
    finally
      SL.Free;
    end;

    FTempoTransmissaoOffLine:= Ini.ReadInteger( CCONTINGENCIA, 'TempoTransmissaoOffLine', FTempoTransmissaoOffLine);
    FPathOffLine:= Ini.ReadString( CCONTINGENCIA, 'PathOffLine', FPathOffLine );
    FPathOffLineErro:= Ini.ReadString( CCONTINGENCIA, 'PathOffLineErro', FPathOffLineErro );
    FPathNFCePendentes:= Ini.ReadString( CCONTINGENCIA, 'PathNFCePendentes', FPathNFCePendentes );
    FOffLine:= Ini.ReadBool( CCONTINGENCIA, 'OffLine', FOffLine);
    FContingenciaAutomatica:= Ini.ReadBool( CCONTINGENCIA, 'ContingenciaAutomatica', FContingenciaAutomatica);
    FTentatativaReenvio:= Ini.ReadInteger( CCONTINGENCIA, 'TentatativaReenvio', FTentatativaReenvio);
    FTempoAtivarOnLine:= Ini.ReadInteger( CCONTINGENCIA, 'TempoAtivarOnLine', FTempoAtivarOnLine);
    FHorasAviso:= Ini.ReadInteger( CCONTINGENCIA, 'HorasAviso', FHorasAviso);
    FHorasBloqueio:= Ini.ReadInteger( CCONTINGENCIA, 'HorasBloqueio', FHorasBloqueio);
    FAvisoNFCeComErro:= Ini.ReadBool( CCONTINGENCIA, 'BloqueioNFCeComErro', FAvisoNFCeComErro );
    FGravarLog:= Ini.ReadBool( CCONTINGENCIA, 'GravarLog', FGravarLog );

  finally
    Ini.Free;
  end;

end;

constructor TConfigContigencia.Create(ANomeArquivo: String);
begin
  FOnGravarConfig := Nil;
  FNomeArquivo:= ANomeArquivo;
  FTempoTransmissaoOffLine:= CSECONDS;
  FPathOffLine:= PathWithDelim( ExtractFilePath(ParamStr(0)) ) + COFFLINE;
  FPathOffLineErro:= PathWithDelim( ExtractFilePath(ParamStr(0)) ) + COFFLINEERRO;
  FPathNFCePendentes:= PathWithDelim( ExtractFilePath(ParamStr(0)) ) + CPENDENTES;
  FOffLine:= False;
  FContingenciaAutomatica:= True;
  FTentatativaReenvio:= 0;
  FTempoAtivarOnLine:= CSECONDSOFF;
  FHorasAviso:= CALERTHOURS;
  FHorasBloqueio:= CBLOCKHOURS;
  FAvisoNFCeComErro:= False;
  FGravarLog:= True;

end;

procedure TConfigContigencia.CriarArquivo;
begin
  SalvarArquivo;
end;

procedure TConfigContigencia.DoGravarConfig;
begin
  if Assigned(FOnGravarConfig) then
    FOnGravarConfig( Self );
end;

procedure TConfigContigencia.SalvarArquivo;
var
  FS: TFileStream;
begin
  ValidarNomeCaminho(True);

  FS := TFileStream.Create(PathWithDelim( ExtractFilePath(ParamStr(0))) + FNomeArquivo, fmCreate or fmOpenReadWrite);
  try
    SalvarArquivoMemoria(FS);
  finally
    FS.Free;
    DoGravarConfig;
  end;
end;

procedure TConfigContigencia.SalvarArquivoMemoria(AStream: TStream);
var
  Ini: TMemIniFile;
  SL: TStringList;
begin
  Ini := TMemIniFile.Create('');
  try
    Ini.WriteInteger( CCONTINGENCIA, 'TempoTransmissaoOffLine', FTempoTransmissaoOffLine);
    Ini.WriteString( CCONTINGENCIA, 'PathOffLine', FPathOffLine );
    Ini.WriteString( CCONTINGENCIA, 'PathOffLineErro', FPathOffLineErro );
    Ini.WriteString( CCONTINGENCIA, 'PathNFCePendentes', FPathNFCePendentes );
    Ini.WriteBool( CCONTINGENCIA, 'OffLine', FOffLine);
    Ini.WriteBool( CCONTINGENCIA, 'ContingenciaAutomatica', FContingenciaAutomatica);
    Ini.WriteInteger( CCONTINGENCIA, 'TentatativaReenvio', FTentatativaReenvio);
    Ini.WriteInteger( CCONTINGENCIA, 'TempoAtivarOnLine', FTempoAtivarOnLine);
    Ini.WriteInteger( CCONTINGENCIA, 'HorasAviso', FHorasAviso);
    Ini.WriteInteger( CCONTINGENCIA, 'HorasBloqueio', FHorasBloqueio);
    Ini.WriteBool( CCONTINGENCIA, 'BloqueioNFCeComErro', FAvisoNFCeComErro );
    Ini.WriteBool( CCONTINGENCIA, 'GravarLog', FGravarLog );

    SL := TStringList.Create;
    try
      Ini.GetStrings(SL);
      AStream.Position := 0;
      SL.SaveToStream(AStream);
    finally
      SL.Free;
    end;
  finally
    Ini.Free;
  end;

end;

procedure TConfigContigencia.ValidarNomeCaminho(Salvar: Boolean);
var
  APath: String;
begin
  if FNomeArquivo = '' then
    raise EDFeConfigException.Create(CErrArqConfigNaoDefinido);

  APath := ExtractFilePath(FNomeArquivo);
  if (APath <> '') and (not DirectoryExists(APath)) then
    raise EDFeConfigException.CreateFmt(CErrDiretorioInvalido, [APath]);

  if (not Salvar) and (not FileExists(FNomeArquivo)) then
    CriarArquivo;

end;

{ TNFCePendentes }

procedure TNFCePendentes.Assign(DeNFCePendentes: TNFCePendentes);
begin
  FChave:= DeNFCePendentes.FChave;
  FChaveSubst:= DeNFCePendentes.FChaveSubst;
  FStatus:= DeNFCePendentes.FStatus;
  FCStat:= DeNFCePendentes.FCStat;
  FMsg:= DeNFCePendentes.FMsg;
  FDataHoraConsulta:= DeNFCePendentes.FDataHoraConsulta;
  FCancelada:= DeNFCePendentes.FCancelada;
  FInutilizada:= DeNFCePendentes.FInutilizada;

end;

constructor TNFCePendentes.Create;
begin
  inherited;
  FChave:= '';
  FChaveSubst := '';
  FStatus:= stPendente;
  FCStat:= 0;
  FMsg:= '';
  FDataHoraConsulta:= 0;
  FCancelada:= False;
  FInutilizada:= False;

end;

{ TListaNFCePendentes }

function TListaNFCePendentes.Add(Obj: TNFCePendentes): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TListaNFCePendentes.GetObject(Index: Integer): TNFCePendentes;
begin
  Result := inherited GetItem(Index) as TNFCePendentes;
end;

procedure TListaNFCePendentes.Insert(Index: Integer; Obj: TNFCePendentes);
begin
  inherited Insert(Index, Obj);
end;

procedure TListaNFCePendentes.SetObject(Index: Integer; Item: TNFCePendentes);
begin
  inherited SetItem (Index, Item) ;
end;

{ TNFCeOffLineErro }

procedure TNFCeOffLineErro.Assign(DeNFCeOffLineErro: TNFCeOffLineErro);
begin
  FChave:= DeNFCeOffLineErro.FChave;
  FStatus:= DeNFCeOffLineErro.FStatus;
  FCStat:= DeNFCeOffLineErro.FCStat;
  FMsg:= DeNFCeOffLineErro.FMsg;
  FDataHoraTransmissao:= DeNFCeOffLineErro.FDataHoraTransmissao;

end;

constructor TNFCeOffLineErro.Create;
begin
  inherited;
  FChave:= '';
  FStatus:= stErroRejeicao;
  FCStat:= 0;
  FMsg:= '';
  FDataHoraTransmissao:= 0;
end;

{ TListaNFCeOffLineErro }

function TListaNFCeOffLineErro.Add(Obj: TNFCeOffLineErro): Integer;
begin
  Result := inherited Add(Obj) ;
end;

function TListaNFCeOffLineErro.GetObject(Index: Integer): TNFCeOffLineErro;
begin
  Result := inherited GetItem(Index) as TNFCeOffLineErro;
end;

procedure TListaNFCeOffLineErro.Insert(Index: Integer; Obj: TNFCeOffLineErro);
begin
  inherited Insert(Index, Obj);
end;

procedure TListaNFCeOffLineErro.SetObject(Index: Integer;
  Item: TNFCeOffLineErro);
begin
  inherited SetItem (Index, Item) ;
end;

end.
