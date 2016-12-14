unit ordlg_CopyFile;

{ This form shows the progress of the files being copied }

interface

uses
  SysUtils, Windows, Classes, Graphics, Controls, Forms, ExtCtrls, StdCtrls, Buttons,
  dlgcmp_TBaseDlg, cmp_TInstallContainer, ComCtrls, cmp_TTranslateControls;

type
  TCopyFileForm = class(TBaseDuringCopyForm)
    Panel1: TPanel;
    Panel2: TPanel;
    UnZipImage: TImage;
    Panel3: TPanel;
    CancelBtn: TTranslateBitBtn;
    Panel4: TPanel;
    lblCopyFileHeader: TTranslateLabel;
    Panel5: TPanel;
    lblCopyingFile: TTranslateLabel;
    Label3: TTranslateLabel;
    Panel6: TPanel;
    ProgressBar1: TProgressBar;
    Label1: TTranslateLabel;
    Label5: TTranslateLabel;
    Panel7: TPanel;
    ProgressBar2: TProgressBar;
    Label2: TTranslateLabel;
    Label6: TTranslateLabel;
    Label7: TTranslateLabel;
    Label8: TTranslateLabel;
    Label4: TTranslateLabel;
    TransferBitmap: TImage;
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure RefreshStatistics(FileStatus: TFileStatusParameter;DownloadStatus: TDownloadStatusParameter); override;
  end;

var
  CopyFileForm: TCopyFileForm; { This value should never be used for anything because it will not point to the dialog }

implementation

{$R *.DFM}

uses
  cmp_TTranslator,
  constants_Youseful,
  exceptions_Youseful;

constructor TCopyFileForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { Specify the dialog manager for this form below. The LinkToManager function will try to find a dialog manager of the specified type }
  DM := LinkToManager(dmDuringCopyFiles);

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


procedure TCopyFileForm.RefreshStatistics(FileStatus: TFileStatusParameter;DownloadStatus: TDownloadStatusParameter);
begin
  { This method is called each time a specified number of bytes have been copied to the
  user's computer. Either FileStatus or DownloadStatus will be Nil depending on whether
  the file is being processed locally or being downloaded from a remote site. An internet
  file, is processed locally after being downloaded from the internet.

  FileStatus is of type TFileStatusParameter. TFileStatusParameter is defined in the
  cmp_TInstallContainer unit as follows:

  property FileBytesProcessed: LongInt
  property FileComplete: Integer
  property FileName: String
  property FileStats: TlzhFileStats *** Defined in the cmp_TYsflCompress unit. For extra info such as date,version, etc...
  property TotalBytesProcessed: LongInt
  property TotalComplete: Integer

  DownloadStatus is of type TDownloadStatusParameter. TDownloadStatusParameter is defined
  in the cmp_TInstallContainer unit as follows:

  property Bytes: LongInt
  property FileName: String
  property FileSize: LongInt
  property TotalBytesReceived: LongInt
  property TotalComplete: Integer
  }

  if Assigned(FileStatus) then
    begin
      TransferBitmap.Visible := False;
      ProgressBar2.Position := FileStatus.TotalComplete;
      ProgressBar1.Position := FileStatus.FileComplete;
      lblCopyingFile.Caption := FileStatus.FileName;
    end
  else if Assigned(DownloadStatus) then
    begin
      TransferBitmap.Visible := True;
      ProgressBar1.Position := DownloadStatus.TotalComplete;
      lblCopyingFile.Caption := DownloadStatus.FileName;
    end;
  Refresh;
end;

procedure TCopyFileForm.CancelBtnClick(Sender: TObject);
begin
  TryCancel; { Note: The TryCancel method triggers the UserAbort event of the TInstall component }
end;

initialization
  { DO NOT BE ALARMED if you get an error when you try to compile this form. If you get the error...

  1. < WARNING. Duplicate resource(s)   Type 10 (RCDATA), ID Txxx; File C:\xxx\xxx.DFM >
  DO THE FOLLOWING: Rename your form.

  2. The "undeclared identifier" is reported and the cursor is put on the function below.
  DO THE FOLLOWING: You have renamed your form. Change the first parameter of the function below to match the new name of your form. }

  CopyFileFormDCF := AddToDCFList(TCopyFileForm,Nil,Nil);

end.
 