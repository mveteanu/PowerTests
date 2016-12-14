program pbeditor;

uses
  Forms,
  pb_edit in 'pb_edit.pas' {Form1},
  MyCombo in 'Mycombo.pas',
  anstype in 'anstype.pas' {AnswerTypeDlg},
  about in 'about.pas' {AboutBox},
  splash in 'Splash.pas' {SplashForm},
  settings in 'settings.pas' {SettingsForm},
  clpdview in 'clpdview.pas' {ClipViewForm},
  win95 in 'Win95.pas';

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Initialize;
  Application.Title := 'PowerTests Problem Editor';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAnswerTypeDlg, AnswerTypeDlg);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
