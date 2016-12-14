program testmake;

uses
  Forms,
  main in 'main.pas' {MainForm},
  inppb in 'inppb.pas' {inputpb},
  about in 'About.pas' {AboutBox},
  splash in 'Splash.pas' {SplashForm},
  setform in 'setform.pas' {SettingForm};

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;
  Application.Initialize;
  Application.Title := 'Test composer';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(Tinputpb, inputpb);
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
