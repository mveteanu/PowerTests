program setup;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ordlg_WelcomeDlg in 'ordlg_WelcomeDlg.pas' {WelcomeForm},
  ordlg_CopyFile in 'ordlg_CopyFile.pas' {CopyFileForm},
  ordlg_BadInstallForm in 'ordlg_BadInstallForm.pas' {BadInstallForm},
  ordlg_GoodInstallForm in 'ordlg_GoodInstallForm.pas' {GoodInstallForm},
  ordlg_SelectFolder in 'ordlg_SelectFolder.pas' {SelectFolderForm},
  ordlg_ChangeDisk in 'ordlg_ChangeDisk.pas' {ChangeDiskForm},
  ordlg_Reboot in 'ordlg_Reboot.pas' {RebootForm},
  ordlg_Password in 'ordlg_Password.pas' {PasswordForm},
  ordlg_SelectDestination in 'ordlg_SelectDestination.pas' {SelectDestinationForm},
  ordlg_License in 'ordlg_License.pas' {LicenseForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'PowerTests setup program';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TWelcomeForm, WelcomeForm);
  Application.CreateForm(TCopyFileForm, CopyFileForm);
  Application.CreateForm(TBadInstallForm, BadInstallForm);
  Application.CreateForm(TGoodInstallForm, GoodInstallForm);
  Application.CreateForm(TSelectFolderForm, SelectFolderForm);
  Application.CreateForm(TChangeDiskForm, ChangeDiskForm);
  Application.CreateForm(TRebootForm, RebootForm);
  Application.CreateForm(TPasswordForm, PasswordForm);
  Application.CreateForm(TSelectDestinationForm, SelectDestinationForm);
  Application.CreateForm(TLicenseForm, LicenseForm);
  Application.Run;
end.
