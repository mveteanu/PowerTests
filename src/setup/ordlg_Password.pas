unit ordlg_Password;

{ The password dialog }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dlgcmp_TBaseDlg, cmp_TInstallContainer, cmp_TInstall, StdCtrls, Buttons,
  ExtCtrls, cmp_TTranslateControls, Mask;

type
  TPasswordForm = class(TBaseInstallForm)
    Panel1: TPanel;
    Panel4: TPanel;
    ThemeBitmap: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    BackBtn: TTranslateBitBtn;
    ProceedBtn: TTranslateBitBtn;
    CancelBtn: TTranslateBitBtn;
    PasswordEditPanel: TPanel;
    PasswordEdit: TMaskEdit;
    TranslateLabel1: TTranslateLabel;
    InfoLabel: TTranslateLabel;
    procedure FormCreate(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure ProceedBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
  private
    InstallFullVersion:boolean;
    procedure InstallRegKey;
    procedure DeleteOldVersionKey;
  public
    constructor Create(AOwner: TComponent); override;
    { procedure Leave; override; } { This method is called when the user leaves this form. To use, uncomment this line and code in the implementation section }
    procedure RefreshInformation; override;
    function Skip: Boolean; override;
  end;

var
  PasswordForm: TPasswordForm; { This value should never be used for anything because it will not point to the dialog }
  PasswordFormBIFEntry: TBIFEntry;

implementation

{$R *.DFM}

uses
  constants_Youseful,
  Registry;

constructor TPasswordForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmBeforeInstall);

  { The order that this dialog will appear }
  Order := 5;

  { Your form will, by default, try to be translated into the language specified
  by the TranslateIntoProperty of the main TTranslator component in your project. You can use
  the properties below to control how your form is processed when run under different languages:

  AutoSetFont         OverrideMainTranslator
  True                True
                                               The TTranslator component picks a font for the
                                               language specified in this component's TranslateIntoLanguage property.
                                               I.e. if the TTranslator's TranslateIntoLanguage property is ylJapanese,
                                               but this component's TranslateIntoLanguage is ylKorean, then a Korean
                                               font will be chosen for the dialog.
  True                False
                                               The TTranslator component picks a font for the language specified in its
                                               TranslateIntoLanguage property. I.e. if the TTranslator's TranslateIntoLanguage
                                               property is ylJapanese, then the form's font is set to a Japanese font.
  False               True or False
                                               The original font of the dialog will be used.

  AutoTranslate       OverrideMainTranslator
  True                True
                                               The TTranslator component translates the dialog into the language specified
                                               by this component's TranslateIntoLanguage property. I.e. if the TTranslator's
                                               TranslateIntoLanguage property is ylJapanese, but this component's
                                               TranslateIntoLanguage is ylKorean, then the dialog will be translated into
                                               Korean.
  True                False
                                               The TTranslator component translates the dialog into the language specified
                                               by its TranslateIntoLanguage property. I.e. if the TTranslator's TranslateIntoLanguage
                                               property is ylJapanese, then the form will be translated into Japanese.
  False               True or False
                                               The text of the dialog will not be changed }
  InstallFullVersion:=false;
end;

procedure TPasswordForm.FormCreate(Sender: TObject);
begin
  { Since the theme bitmap for dialogs will usually be the same and to conserve
  EXE space, the TInstall component has a property called DialogThemeBitmap that
  contains a theme bitmap. The following code loads that bitmap into ThemeBitmap.
  If you delete the ThemeBitmap control, you will also need to delete this code }
  if ThemeBitmap.Picture.Bitmap.Empty then SetThemePicture(ThemeBitmap.Picture);
end;

{ This method gets called when the user enters this dialog. IsFirst and IsLast are methods from TBaseInstallForm }
procedure TPasswordForm.RefreshInformation;
begin
  inherited RefreshInformation;
  BackBtn.Visible := not IsFirst;
  if ProceedBtn.Visible and Self.Visible then ProceedBtn.SetFocus;
end;

procedure TPasswordForm.BackBtnClick(Sender: TObject);
begin
  Previous; { Previous is a method of the TBaseInstallForm component }
end;

procedure TPasswordForm.DeleteOldVersionKey;
var Reg:TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.DeleteKey('\SOFTWARE\VMA soft\PowerTests');
 finally
   Reg.Free;
 end;
end;

procedure TPasswordForm.InstallRegKey;
var Reg:TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\Classes\CLSID\{27021978-0911-1999-ABCD-274554646927}',True);
   Reg.WriteString('vbrun400', '(40)-048-27.45.54');
 finally
   Reg.Free;
 end;

end;


procedure TPasswordForm.ProceedBtnClick(Sender: TObject);
begin
  DeleteOldVersionKey;
  if Assigned(MainInstall) then
    if InstallFullVersion then
      begin
        InstallRegKey;
        Next { Next is a method of the TBaseInstallForm component }
      end
    else
      begin
        Next { Next is a method of the TBaseInstallForm component }
      end;
end;

procedure TPasswordForm.CancelBtnClick(Sender: TObject);
begin
  TryCancel; { Note: The TryCancel method triggers the UserAbort event of the TInstall component }
end;

function TPasswordForm.Skip: Boolean;
begin
  { Return true here if you want this dialog to be skipped over }
  Result := True;
  if Assigned(MainInstall) then
    if Length(Trim(MainInstall.Password)) > 0 then
      Result := False;
end;

procedure TPasswordForm.FormResize(Sender: TObject);
begin
  PasswordEdit.Width := PasswordEditPanel.Width;
end;

procedure TPasswordForm.PasswordEditChange(Sender: TObject);
begin
  if Assigned(MainInstall) then
    if CompareText(MainInstall.Password,PasswordEdit.Text) = 0 then
      begin
        InfoLabel.Font.Color:=clRed;
        InfoLabel.Caption:='Numar serial corect. Se va instala versiunea completa a programului.';
        InstallFullVersion:=true;
      end
    else
      begin
        InfoLabel.Font.Color:=clBlue;
        InfoLabel.Caption:='Numarul serial introdus este incorect sau inexistent. Se va instala versiunea demo a programului.';
        InstallFullVersion:=false;
      end;
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the function below.
  DO THE FOLLOWING: You have renamed your form. Change the first parameter of the function below to match the new name of your form. }

  PasswordFormBIFEntry := AddToBIFList(TPasswordForm,Nil,Nil);

end.
 