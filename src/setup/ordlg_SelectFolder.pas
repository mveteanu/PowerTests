unit ordlg_SelectFolder;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons,
  cmp_TScalingForm, dlgcmp_TBaseDlg, cmp_TInstallContainer,cmp_TInstallShellLink,
  cmp_TTranslateControls;

type
  TSelectFolderForm = class(TBaseInstallForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Panel2: TPanel;
    ThemeBitmap: TImage;
    Panel4: TPanel;
    TopDescriptionLabel: TTranslateLabel;
    ProgramFolders: TTranslateLabel;
    ExistingFolders: TTranslateLabel;
    FolderListBox: TListBox;
    Label1: TTranslateLabel;
    Label2: TTranslateLabel;
    Panel5: TPanel;
    FolderEdit: TEdit;
    Label3: TTranslateLabel;
    Label4: TTranslateLabel;
    BackBtn: TTranslateBitBtn;
    ProceedBtn: TTranslateBitBtn;
    CancelBtn: TTranslateBitBtn;
    procedure CancelBtnClick(Sender: TObject);
    procedure FolderListBoxClick(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure FolderEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ProceedBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    function GetInstallToFolder: String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Leave; override;
    procedure RefreshInformation; override;
    function Skip: Boolean; override;
  end;

var
  SelectFolderForm: TSelectFolderForm; { This value should never be used for anything because it will not point to the dialog }

implementation

{$R *.DFM}

uses
  constants_Youseful,
  exceptions_Youseful,
  routines_ExpandPaths,
  routines_Strings,
  routines_API,
  cmp_TPathSpecifier,
  cmp_TProgramManager;

constructor TSelectFolderForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmBeforeInstall);

  { The container if any that you want to hook this up to. For example,
  Container := Form1.Install1
  If you do this, then you can access and/or change the properties of the component at run-time. }
  Container := MainFolder;

  { The order that this dialog will appear }
  Order := 60;

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

procedure TSelectFolderForm.FormCreate(Sender: TObject);
begin
  { Since the theme bitmap for dialogs will usually be the same and to conserve
  EXE space, the TInstall component has a property called DialogThemeBitmap that
  contains a theme bitmap. The following code loads that bitmap into ThemeBitmap.
  If you delete the ThemeBitmap control, you will also need to delete this code }
  if ThemeBitmap.Picture.Bitmap.Empty then SetThemePicture(ThemeBitmap.Picture);
end;

procedure FolderList(List: TStrings);
var
  ProgramDir: String;
  SearchResult: Integer;
  SearchRec: TSearchRec;
begin
  List.Clear;
  case GetWindowsVerType of
    wvWinNT,wvWin95: begin
      ProgramDir := ExpandProgramMenuDir;
      SearchResult := FindFirst(DirectoryWBS(ProgramDir)+'*.*',faAnyFile,SearchRec);
      while SearchResult = 0 do begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          if (SearchRec.Attr and faDirectory) > 0 then
            List.Add(SearchRec.Name);
        SearchResult := FindNext(SearchRec);
      end;
{      FindClose(SearchRec); For some reason this will not compile }
    end
  else
    begin
      ProgramManager.GetWindowGroups(List);
    end;
  end;
end;


procedure TSelectFolderForm.RefreshInformation;
begin
  inherited RefreshInformation;
  { This gets called when the user enters this dialog. IsFirst is a method of the
  TBaseInstallForm, from which this form is derived }
  BackBtn.Visible := not IsFirst;

  { Populate the list box and also choose a folder if one is not already chosen }
  FolderList(FolderListBox.Items);
  FolderEdit.Text := GetInstallToFolder;
  if FolderEdit.Text = '' then
    if FolderListBox.Items.Count > 0 then
      FolderEdit.Text := FolderListBox.Items[0];
  if ProceedBtn.Visible and Self.Visible then ProceedBtn.SetFocus;
end;

procedure TSelectFolderForm.Leave;
begin
  { This gets called when the user leaves this dialog }
end;

procedure TSelectFolderForm.BackBtnClick(Sender: TObject);
begin
  { Previous is a method of the TBaseInstallForm component }
  Previous;
end;

procedure TSelectFolderForm.ProceedBtnClick(Sender: TObject);
begin
  { Next is a method of the TBaseInstallForm component }
  Next;
end;

procedure TSelectFolderForm.CancelBtnClick(Sender: TObject);
begin
  TryCancel; { Note: The TryCancel method triggers the UserAbort event of the TInstall component }
end;

function TSelectFolderForm.Skip: Boolean;
begin
  { Return true here if you want this dialog to be skipped over }
  Skip := False;
  if not Assigned(Container) then Skip := True;
end;

{ Dialog stuff }

function TSelectFolderForm.GetInstallToFolder: String;
begin
  Result := '';
  if Container = Nil then Exit;
  if not (Container.DestDirType is TpsProgramMenu) then Exit;
  Result := ExtractFileName(Container.DestDir);
end;

procedure TSelectFolderForm.FolderListBoxClick(Sender: TObject);
var
  NewFolder: String;
begin
  if FolderListBox.ItemIndex = -1 then Exit;
  NewFolder := FolderListBox.Items[FolderListBox.ItemIndex];
  FolderEdit.Text := NewFolder;
end;

procedure TSelectFolderForm.FolderEditChange(Sender: TObject);
begin
  if Container <> Nil then begin
    Container.DestDirType := StandardPathSpecifiers.GetPS(TpsProgramMenu,True);
    Container.DestDir := '\'+FolderEdit.Text;
  end;
end;

procedure TSelectFolderForm.FormResize(Sender: TObject);
begin
  Label1.Height := 18;
  Label3.Height := 8;
  Label4.Height := 8;
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the function below.
  DO THE FOLLOWING: You have renamed your form. Change the first parameter of the function below to match the new name of your form. }

  SelectFolderFormBIFEntry := AddToBIFList(TSelectFolderForm,Nil,Nil);

end.
 