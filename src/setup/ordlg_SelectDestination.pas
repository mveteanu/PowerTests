unit ordlg_SelectDestination;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, ExtCtrls, StdCtrls, Buttons, ComCtrls, dlgcmp_TBaseDlg,
  cmp_TInstallContainer, Dialogs, cmp_TTranslateControls;

type
  TSelectDestinationForm = class(TBaseInstallForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    CancelBtn: TTranslateBitBtn;
    ProceedBtn: TTranslateBitBtn;
    BackBtn: TTranslateBitBtn;
    Panel2: TPanel;
    ThemeBitmap: TImage;
    pnlText: TPanel;
    gbDirectory: TGroupBox;
    BrowseBtn: TTranslateBitBtn;
    Label2: TTranslateLabel;
    edDestDir: TEdit;
    lblText1: TTranslateLabel;
    pnlSpacer1: TPanel;
    lblText2: TTranslateLabel;
    pnlSpacer2: TPanel;
    lblText3: TTranslateLabel;
    procedure BrowseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProceedBtnClick(Sender: TObject);
    procedure edDestDirChange(Sender: TObject);
  private
    { Private declarations }
    NoUpdate: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    { This method is called when the user leaves this form. To use, uncomment
    this line and code in the implementation section

    procedure Leave; override; }
    procedure RefreshInformation; override;
    function Skip: Boolean; override;
  end;

var
  { This value should never be used for anything because it will not point to
  the dialog }
  SelectDestinationForm: TSelectDestinationForm;

implementation

{$R *.DFM}

uses
  cmp_TInstall,
  constants_Youseful,
  exceptions_Youseful,
  FileCtrl,
  routines_FileSystem,
  routines_Strings;

constructor TSelectDestinationForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function
  will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmBeforeInstall);

  { This next command tells the routines in this unit which file group will be
  the top file group. I.e. normally you will have the TInstall component as the
  top file group, but you don't have to do that. You can set it to any
  TFileContainer component. E.g.

  Container := Form1.Install1

  However, the default is the TInstall component, so we will assign it the value
  of MainInstall. MainInstall is a global variable in the cmp_TInstall unit that
  points to the TInstall in your project. }
  Container := MainInstall;

  { The order that this dialog will appear }
  Order := 45;

  { Your form will, by default, try to be translated into the language specified
  by the TranslateIntoProperty of the main TTranslator component in your project.
  You can use the properties below to control how you your form is processed when
  run under different languages:

  AutoSetFont         OverrideMainTranslator
  True                True
                                               The TTranslator component picks a
                                               font for the language specified in
                                               this component's TranslateIntoLanguage
                                               property. I.e. if the TTranslator's
                                               TranslateIntoLanguage property is
                                               ylJapanese, but this component's
                                               TranslateIntoLanguage is ylKorean,
                                               then a Korean font will be chosen
                                               for the dialog.
  True                False
                                               The TTranslator component picks a
                                               font for the language specified in
                                               its TranslateIntoLanguage property.
                                               I.e. if the TTranslator's
                                               TranslateIntoLanguage property is
                                               ylJapanese, then the form's font
                                               is set to a Japanese font.
  False               True or False
                                               The original font of the dialog
                                               will be used.

  AutoTranslate       OverrideMainTranslator
  True                True
                                               The TTranslator component translates
                                               the dialog into the language specified
                                               by this component's TranslateIntoLanguage
                                               property. I.e. if the TTranslator's
                                               TranslateIntoLanguage property is
                                               ylJapanese, but this component's
                                               TranslateIntoLanguage is ylKorean,
                                               then the dialog will be translated
                                               into Korean.
  True                False
                                               The TTranslator component translates
                                               the dialog into the language specified
                                               by its TranslateIntoLanguage property.
                                               I.e. if the TTranslator's TranslateIntoLanguage
                                               property is ylJapanese, then the
                                               form will be translated into Japanese.
  False               True or False
                                               The text of the dialog will not
                                               be changed }
end;


procedure TSelectDestinationForm.FormCreate(Sender: TObject);
begin
  { Since the theme bitmap for dialogs will usually be the same and to conserve
  EXE space, the TInstall component has a property called DialogThemeBitmap that
  contains a theme bitmap. The following code loads that bitmap into ThemeBitmap.
  If you delete the ThemeBitmap control, you will also need to delete this code }
  if ThemeBitmap.Picture.Bitmap.Empty then SetThemePicture(ThemeBitmap.Picture);
end;

{ This method gets called when the user enters this dialog. IsFirst and IsLast
are methods from TBaseInstallForm }
procedure TSelectDestinationForm.RefreshInformation;
begin
  inherited RefreshInformation;
  NoUpdate := True;
  BackBtn.Visible := not IsFirst;
  gbDirectory.Visible := Container.GetDestDir <> '';
  edDestDir.Text := Container.GetDestDir;
  NoUpdate := False;
  if ProceedBtn.Visible and Self.Visible then ProceedBtn.SetFocus;
end;

procedure TSelectDestinationForm.BackBtnClick(Sender: TObject);
begin
  Previous; { Previous is a method of the TBaseInstallForm component }
end;

procedure TSelectDestinationForm.ProceedBtnClick(Sender: TObject);
begin
  Next; { Next is a method of the TBaseInstallForm component }
end;

procedure TSelectDestinationForm.CancelBtnClick(Sender: TObject);
begin
  { Note: The TryCancel method triggers the UserAbort event of the TInstall
  component }
  TryCancel;
end;

function TSelectDestinationForm.Skip: Boolean;
begin
  { Return true here if you want this dialog to be skipped over }
  Skip := False;
end;

procedure TSelectDestinationForm.BrowseBtnClick(Sender: TObject);
var
  Dialog: TOpenFolderDialog;
  PathExisted: Boolean;
  CreatedPath: String;
begin
  Dialog := TOpenFolderDialog.Create(Nil);
  try
    { If the path does not exist we should create it otherwise we cannot
    display it as the initial path in the folder dialog. We should delete the
    path we created regardless of whether it is the one the user ends up creating
    in the folder dialog }
    PathExisted := False;
    CreatedPath := Container.GetDestDir;
    if Trim(Container.GetDestDir) <> '' then
      if DirectoryExists(Container.GetDestDir) then
        PathExisted := True;
    if not PathExisted then ForceDirectories(Container.GetDestDir);
    { Now show the select folder dialog opened to the default path }
    Dialog.Path := Container.GetDestDir;
    if Dialog.Execute then
      begin
        Container.DestDirType := Nil;
        Container.DestDir := DirectoryWOBS(Dialog.Path);
        NoUpdate := True;
        edDestDir.Text := Container.DestDir;
        NoUpdate := False;
      end;
    if not PathExisted then Windows.RemoveDirectory(PChar(CreatedPath));
  finally
    Dialog.Free;
  end;
end;

procedure TSelectDestinationForm.edDestDirChange(Sender: TObject);
begin
  if NoUpdate or not Assigned(Container) then Exit;
  Container.DestDirType := Nil;
  Container.DestDir := TEdit(Sender).Text;
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If
  you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the
  function below. DO THE FOLLOWING: You have renamed your form. Change the first
  parameter of the function below to match the new name of your form. }

  SelectDestinationFormBIFEntry := AddToBIFList(TSelectDestinationForm,Nil,Nil);

end.
 