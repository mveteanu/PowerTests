unit ordlg_Reboot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, dlgcmp_TBaseDlg, cmp_TInstallContainer, cmp_TInstall,
  Buttons, cmp_TTranslateControls;

type
  TRebootForm = class(TBaseInstallForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    ThemeBitmap: TImage;
    Panel4: TPanel;
    Label1: TTranslateLabel;
    RG: TRadioGroup;
    Label2: TTranslateLabel;
    ProceedBtn: TTranslateBitBtn;
    FinishBtn: TTranslateBitBtn;
    BackBtn: TTranslateBitBtn;
    procedure RGClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure ProceedBtnClick(Sender: TObject);
  private
    { Private declarations }
    DontTrigger: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Leave; override;
    procedure RefreshInformation; override;
    function Skip: Boolean; override;
  end;

var
  RebootForm: TRebootForm; { This value should never be used for anything because it will not point to the dialog }

implementation

{$R *.DFM}

uses
  constants_Youseful;

constructor TRebootForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmReboot);

  { The order that this dialog will appear }
  Order := 10;

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
end;


procedure TRebootForm.FormCreate(Sender: TObject);
begin
  { Since the theme bitmap for dialogs will usually be the same and to conserve
  EXE space, the TInstall component has a property called DialogThemeBitmap that
  contains a theme bitmap. The following code loads that bitmap into ThemeBitmap.
  If you delete the ThemeBitmap control, you will also need to delete this code }
  if ThemeBitmap.Picture.Bitmap.Empty then SetThemePicture(ThemeBitmap.Picture);
end;

procedure TRebootForm.RefreshInformation;
begin
  inherited RefreshInformation;
  { This gets called when the user enters this dialog. IsFirst is a method of the
  TBaseInstallForm, from which this form is derived }
  BackBtn.Visible := not IsFirst;
  ProceedBtn.Visible := not IsLast;
  FinishBtn.Visible := not ProceedBtn.Visible;
  if ProceedBtn.Visible and Self.Visible then ProceedBtn.SetFocus;
  DontTrigger := True;

  RG.ItemIndex := 1;
  if Assigned(MainInstall) then
    if MainInstall.Reboot then
     RG.ItemIndex := 0;

  DontTrigger := False;
end;

procedure TRebootForm.Leave;
begin
  { This gets called when the user leaves this dialog }
end;

procedure TRebootForm.BackBtnClick(Sender: TObject);
begin
  Previous; { Previous is a method of the TBaseInstallForm component }
end;

procedure TRebootForm.ProceedBtnClick(Sender: TObject);
begin
  Next; { Next is a method of the TBaseInstallForm component }
end;

function TRebootForm.Skip: Boolean;
begin
  Skip := False; { Return true here if you want this dialog to be skipped over }
end;

procedure TRebootForm.RGClick(Sender: TObject);
begin
  if Assigned(MainInstall) then
    MainInstall.Reboot := RG.ItemIndex = 0;
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the function below.
  DO THE FOLLOWING: You have renamed your form. Change the first parameter of the function below to match the new name of your form. }

  RebootFormBIFEntry := AddToBIFList(TRebootForm,Nil,Nil);

end.
 