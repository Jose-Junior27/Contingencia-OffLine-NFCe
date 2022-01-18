unit UDocumentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Menus;

type
  TfrmDocumentos = class(TForm)
    pnlPrincipal: TPanel;
    pnlRodape: TPanel;
    PgDocumentos: TPageControl;
    tsEmidasOff: TTabSheet;
    tsDocumentos: TTabSheet;
    Panel1: TPanel;
    Panel4: TPanel;
    dbGridOffLine: TDBGrid;
    Panel5: TPanel;
    DBGridOffLineErro: TDBGrid;
    dbGridPendentes: TDBGrid;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    maMenu: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure maMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDocumentos: TfrmDocumentos;

implementation

uses
  uDM, uEditXML, ACBrUtil;

{$R *.dfm}

procedure TfrmDocumentos.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmDocumentos.maMenuClick(Sender: TObject);
var
  frm_Edit_XML : Tfrm_Edit_XML;
  SL: TStringList;
  xml: String;
begin
  frm_Edit_XML := Tfrm_Edit_XML.Create(self);
  try
    SL := TStringList.Create;
    try
      SL.LoadFromFile((PathWithDelim( DM.ContingenciaNFCe.ConfigContigencia.PathOffLineErro )
                      + Dm.dsOffLineErro.DataSet.Fields[0].Text + '-nfe.xml' ));
      xml := SL.Text;
      frm_Edit_XML.XML := xml;

    finally
      SL.Free;
    end;

    frm_Edit_XML.ShowModal;

  finally
     FreeAndNil( frm_Edit_XML ) ;
  end ;

end;

end.
