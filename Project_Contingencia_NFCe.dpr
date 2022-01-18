program Project_Contingencia_NFCe;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form_Demo_Contingencia},
  uContingenciaNFCe in 'uContingenciaNFCe.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  UDocumentos in 'UDocumentos.pas' {frmDocumentos},
  uEditXML in 'uEditXML.pas' {frm_Edit_XML};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Demo_Contingencia, Form_Demo_Contingencia);
  Application.CreateForm(TfrmDocumentos, frmDocumentos);
  Application.CreateForm(Tfrm_Edit_XML, frm_Edit_XML);
  Application.Run;
end.
