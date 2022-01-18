{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:  Jos� M S Junior                                }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

unit uDM;

interface

uses
  System.SysUtils, System.Classes, ACBrPosPrinter, ACBrDFeReport,
  ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrBase, ACBrDFe,
  ACBrNFe, uContingenciaNFCe, Data.DB, Datasnap.DBClient;

type

  TDM = class(TDataModule)
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrPosPrinter1: TACBrPosPrinter;
    cdsOffLineErro: TClientDataSet;
    cdsOffLineErroChave: TStringField;
    cdsOffLineErrosStat: TStringField;
    cdsOffLineErroStatus: TStringField;
    cdsOffLineErroData_HoraTransmissao: TDateTimeField;
    cdsOffLineErroMsg: TStringField;
    dsOffLineErro: TDataSource;
    cdsPendentes: TClientDataSet;
    cdsPendentesChave: TStringField;
    cdsPendentescStat: TStringField;
    cdsPendentesStatus: TStringField;
    cdsPendentesCancelada: TBooleanField;
    cdsPendentesInut: TBooleanField;
    cdsPendentesData_Hora_Transmissao: TDateTimeField;
    cdsPendentesMsg: TStringField;
    cdsPendentesChave_Subs: TStringField;
    dsPendentes: TDataSource;
    cdsOffLine: TClientDataSet;
    cdsOffLineChave: TStringField;
    cdsOffLinecStat: TStringField;
    cdsOffLineStatus: TStringField;
    cdsOffLineData_HoraTransmissao: TDateTimeField;
    cdsOffLineMsg: TStringField;
    dsOffLine: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FContingenciaNFCe: TContingenciaNFCe;
  public
    { Public declarations }
    property ContingenciaNFCe: TContingenciaNFCe read FContingenciaNFCe;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FContingenciaNFCe := TContingenciaNFCe.Create(ACBrNFe1.Configuracoes);
  FContingenciaNFCe.Start;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FContingenciaNFCe.Terminate;

end;

end.
