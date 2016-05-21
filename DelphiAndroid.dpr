program DelphiAndroid;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnPrincipal in 'UnPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
