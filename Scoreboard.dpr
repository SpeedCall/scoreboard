program Scoreboard;

uses
  Forms,
  MainU in 'MainU.pas' {frmScoreboard},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Scoreboard';
  TStyleManager.TrySetStyle('Windows10 Dark');
  Application.CreateForm(TfrmScoreboard, frmScoreboard);
  Application.Run;
end.
