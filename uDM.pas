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
