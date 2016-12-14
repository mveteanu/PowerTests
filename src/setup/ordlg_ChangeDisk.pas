unit ordlg_ChangeDisk;

{ This form prompts the user for a new disk. }

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,Forms, Dialogs, ExtCtrls,
  StdCtrls, Buttons, cmp_TInstallContainer, dlgcmp_TBaseDlg, cmp_TTranslateControls;

type
  TChangeDiskForm = class(TBaseChangeDiskForm)
    Panel1: TPanel;
    InstallBtn: TTranslateBitBtn;
    CancelBtn: TTranslateBitBtn;
    PromptDiskLabel: TTranslateLabel;
    Label2: TTranslateLabel;
    Label4: TTranslateLabel;
    PathEdit: TEdit;
    Bevel1: TBevel;
    ThemeBitmap: TImage;
    BrowseBtn: TTranslateBitBtn;
    procedure BrowseBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PathEditChange(Sender: TObject);
  private
    { Private declarations }
    NoUpdate: Boolean;
  public
    { Public declarations }
    property DiskParameter;
    { DiskParameter has two properties:

    property Disk: Integer
    property SourceDir: String

    If you want to change the directory in which the file is being looked for,
    change the SourceDir property }
    constructor Create(AOwner: TComponent); override;
  end;

var
  { This value should never be used for anything because it will not point to
  the dialog }
  ChangeDiskForm: TChangeDiskForm;

implementation

{$R *.DFM}

uses
  cmp_TTranslator,
  constants_Youseful,
  FileCtrl,
  routines_FileSystem,
  routines_Strings;

constructor TChangeDiskForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function
  will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmChangeDisk);

  { Your form will, by default, try to be translated into the language specified
  by the TranslateIntoProperty of the main TTranslator component in your project.
  You can use the properties below to control how your form is processed when run
  under different languages:

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
                                               The text of the dialog will not be
                                               changed }
end;

procedure TChangeDiskForm.BrowseBtnClick(Sender: TObject);
var
  D: TOpenFolderDialog;
begin
  D := TOpenFolderDialog.Create(Nil);
  try
    D.UseCreateButton := False;
    D.UseEditBox := False;
    if D.Execute then DiskParameter.SourceDir := D.Path;
    NoUpdate := True;
    PathEdit.Text := DiskParameter.SourceDir;
    NoUpdate := False;
  finally
    D.Free;
  end;
end;

procedure TChangeDiskForm.CancelBtnClick(Sender: TObject);
begin
  { Note: The TryCancel method triggers the UserAbort event of the TInstall
  component. }
  TryCancel;
end;

procedure TChangeDiskForm.FormShow(Sender: TObject);
begin
  NoUpdate := True;
  if Assigned(DiskParameter) then begin
    PromptDiskLabel.Caption := Format(TSE('Please insert disk number %d'),[DiskParameter.Disk]);
    PathEdit.Text := DiskParameter.SourceDir;
  end;
  InstallBtn.SetFocus;
  NoUpdate := False;
end;

procedure TChangeDiskForm.PathEditChange(Sender: TObject);
begin
  if NoUpdate or not Assigned(DiskParameter) then Exit;
  DiskParameter.SourceDir := PathEdit.Text;
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If
  you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the function
  below. DO THE FOLLOWING: You have renamed your form. Change the first parameter
  of the function below to match the new name of your form. }
  ChangeDiskFormBCDFEntry := AddToBCDFList(TChangeDiskForm,Nil,Nil);

end.
 