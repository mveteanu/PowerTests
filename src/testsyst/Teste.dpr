program Teste;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  about in 'about.pas' {AboutBox},
  infotest in 'infotest.pas' {OKBottomDlg},
  showrez in 'showrez.pas' {OKBottomDlg1},
  passwd2 in 'passwd2.pas' {OKBottomDlg3},
  crypt in 'crypt.pas',
  jmptopb in 'jmptopb.pas' {OKBottomDlg4},
  Splash in 'Splash.pas' {SplashForm},
  newtest in 'Newtest.pas' {SelectTestDlg},
  setings in 'setings.pas' {SetWnd};

{$R *.RES}


begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Initialize;
  Application.Title := 'PowerTests';
  Application.HelpFile := '';
  Application.CreateForm(TForm1, Form1);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
