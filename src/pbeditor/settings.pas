unit settings;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, DFSClrBn, Mask, ToolEdit;


Function ShowSettingsForm:boolean;


type
  TSettingsForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    DFSColorButton1: TDFSColorButton;
    DFSColorButton2: TDFSColorButton;
    Bevel1: TBevel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DirectoryEdit1: TDirectoryEdit;
    Image2: TImage;
    Bevel2: TBevel;
    Image3: TImage;
    CheckBox1: TCheckBox;
    Image8: TImage;
    ImgCompress1: TRadioButton;
    ImgCompress2: TRadioButton;
    ImgCompress3: TRadioButton;
    Label7: TLabel;
    Bevel6: TBevel;
    Image9: TImage;
    SoundsCheckBox: TCheckBox;
    Bevel7: TBevel;
    Image10: TImage;
    TipOfDayCheckBox: TCheckBox;
    TabSheet4: TTabSheet;
    Image11: TImage;
    Label8: TLabel;
    progr1: TFilenameEdit;
    Bevel8: TBevel;
    progr2: TFilenameEdit;
    Label9: TLabel;
    Image12: TImage;
    Bevel9: TBevel;
    Image13: TImage;
    Label10: TLabel;
    progr3: TFilenameEdit;
    Bevel10: TBevel;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    progr4: TFilenameEdit;
    Label11: TLabel;
    Image14: TImage;
    Image4: TImage;
    editchk1: TCheckBox;
    editchk3: TCheckBox;
    editchk2: TCheckBox;
    Bevel3: TBevel;
    Image5: TImage;
    CheckBox2: TCheckBox;
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses dialogs, mmsystem, fileutil, pb_edit;

{$R *.DFM}


Function ShowSettingsForm:boolean;
begin
result:=false;
with TSettingsForm.Create(Application) do
  try
     case InterfaceLook.ImgCompress of
      0 : ImgCompress1.Checked := True;
      1 : ImgCompress2.Checked := True;
      2 : ImgCompress3.Checked := True;
     end;
     SoundsCheckBox.Checked      := InterfaceLook.Sounds;
     TipOfDayCheckBox.Checked    := InterfaceLook.ShowTipOfDay;
     DFSColorButton1.Color       := InterfaceLook.BrowserBackColor;
     DFSColorButton2.Color       := InterfaceLook.BrowserTextColor;
     if InterfaceLook.UseLastDir
          then begin
                 RadioButton1.Checked:=true;
                 DirectoryEdit1.Text:=InterfaceLook.BrowserFixDir;
                 DirectoryEdit1.Enabled:=false;
               end
          else begin
                 RadioButton2.Checked:=true;
                 DirectoryEdit1.Text:=InterfaceLook.BrowserFixDir;
                 DirectoryEdit1.Enabled:=true;
               end;
     CheckBox1.Checked:=InterfaceLook.BrowserShow;
     CheckBox2.Checked:=InterfaceLook.UseRecycleBin;

     Progr1.Text:=InterfaceLook.ImageProgram;
     Progr2.Text:=InterfaceLook.TextProgram;
     Progr3.Text:=InterfaceLook.CharMapProgram;
     Progr4.Text:=InterfaceLook.CalcProgram;
     if InterfaceLook.CalcIntern
          then begin
                 RadioButton3.Checked:=true;
                 Progr4.Enabled:=false;
               end
          else begin
                 RadioButton4.Checked:=true;
                 Progr4.Enabled:=true;
               end;

    editchk1.checked:=InterfaceLook.editincludeole;
    editchk2.checked:=InterfaceLook.editurldetect;
    editchk3.checked:=InterfaceLook.editwordwrap;

     if ShowModal=mrOK then
       begin
         if ImgCompress1.Checked then InterfaceLook.ImgCompress:=0;
         if ImgCompress2.Checked then InterfaceLook.ImgCompress:=1;
         if ImgCompress3.Checked then InterfaceLook.ImgCompress:=2;
         InterfaceLook.Sounds := SoundsCheckBox.Checked;
         InterfaceLook.ShowTipOfDay := TipOfDayCheckBox.Checked;
         InterfaceLook.BrowserBackColor:=DFSColorButton1.Color;
         InterfaceLook.BrowserTextColor:=DFSColorButton2.Color;
         If RadioButton1.Checked then InterfaceLook.UseLastDir:=true;
         If RadioButton2.Checked then InterfaceLook.UseLastDir:=false;
         InterfaceLook.BrowserFixDir:=RemoveBackSlash(DirectoryEdit1.Text);
         if not DirExists(InterfaceLook.BrowserFixDir) then
             begin
               if InterfaceLook.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
               MessageDlg(Format('Folder %s is invalid.'#13#10'Using default folder: %s',[InterfaceLook.BrowserFixDir,ExtractFilePath(ParamStr(0))+'Tests']),mtError,[mbOK],0);
               InterfaceLook.BrowserFixDir:=ExtractFilePath(ParamStr(0))+'Tests';
             end;
         InterfaceLook.BrowserShow:=CheckBox1.Checked;
         InterfaceLook.UseRecycleBin:=CheckBox2.Checked;
         InterfaceLook.ImageProgram:=progr1.Text;
         InterfaceLook.TextProgram:=progr2.Text;
         InterfaceLook.CharMapProgram:=progr3.Text;
         InterfaceLook.CalcProgram:=progr4.Text;
         InterfaceLook.CalcIntern:=RadioButton3.Checked;
         InterfaceLook.editincludeole:=editchk1.checked;
         InterfaceLook.editurldetect:=editchk2.checked;
         InterfaceLook.editwordwrap:=editchk3.checked;

         InterfaceLook.ApplyColors;
         InterfaceLook.ApplyEditorSettings;

         result:=true;
       end;
  finally
     Free;
  end;
end;

procedure TSettingsForm.RadioButton2Click(Sender: TObject);
begin
 if RadioButton2.Checked then DirectoryEdit1.Enabled:=true
                         else DirectoryEdit1.Enabled:=false;
end;

procedure TSettingsForm.RadioButton3Click(Sender: TObject);
begin
 if RadioButton4.Checked then Progr4.Enabled:=true
                         else Progr4.Enabled:=false;
end;





end.


