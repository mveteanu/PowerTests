unit setform;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit;

Procedure ShowOptionsDialog;


type
  TSettingForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    Bevel1: TBevel;
    Image2: TImage;
    CheckBox1: TCheckBox;
    Bevel2: TBevel;
    Image3: TImage;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingForm: TSettingForm;

implementation
uses mmsystem, fileutil, main;
{$R *.DFM}


Procedure ShowOptionsDialog;
begin
  with TSettingForm.Create(Application) do
    try
        DirectoryEdit1.Text:=MainForm.TestsFolder;
        CheckBox1.Checked:=Settings.Sounds;
        CheckBox2.Checked:=Settings.ShowTipOfDay;
      if ShowModal=mrOK then
        begin
          Settings.BrowserDir:=DirectoryEdit1.Text;
          MainForm.TestsFolder:=RemoveBackSlash(Settings.BrowserDir);

          if not DirExists(MainForm.TestsFolder) then
            begin
             if Settings.Sounds then PlaySound('ERROR', hInstance, snd_ASync or snd_Resource);
             MessageDlg(Format('Tests folder %s is invalid.'#13#10'Using default folder: %s',[MainForm.TestsFolder,ExtractFilePath(ParamStr(0))+'Tests']),mtError,[mbOK],0);
             MainForm.TestsFolder:=ExtractFilePath(ParamStr(0))+'Tests';
           end;

          Settings.Sounds:=CheckBox1.Checked;
          Settings.ShowTipOfDay:=CheckBox2.Checked;
        end;
    finally
      Free;
    end;
end;

end.
