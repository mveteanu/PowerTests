unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, OvcBase, OvcLkOut, ExtCtrls, StdCtrls, lmdctrl, lmdextcS,
  lmdextcA, lmdstdcS, OvcLabel, Buttons, lmdclass, lmdnonvS, lmdnwgui,
  Menus, Wordcap;

type
  TMainForm = class(TForm)
    OvcController1: TOvcController;
    Panel1: TPanel;
    Panel2: TPanel;
    OutLookBar: TOvcLookOutBar;
    ImageList1: TImageList;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLMDGraphicLabel;
    FormDisplay: TLMDFormDisplay;
    MSOfficeCaption1: TMSOfficeCaption;
    procedure OutLookBarItemClick(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; Index: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OutLookBarFolderChange(Sender: TObject; Index: Integer;
      var AllowChange: Boolean; Dragging: Boolean);
  private
    { Private declarations }
    function  UpdatePage(folder,item:integer):boolean;
    procedure LoadSettings;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  sound:boolean;

const
  _ShortCutFileName='PowerTests Control Center';


implementation
uses testsyst,pbeditor,testcomp,
     contact,cumpar,unitzero, settings,
     registry, mmsystem, about, win95;

{$R *.DFM}
{$R SOUNDS.RES}


procedure TMainForm.LoadSettings;
var Reg:TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Control Center',True);

   if not Reg.ValueExists('sound') then Reg.WriteBool('sound', true);
   sound:=Reg.ReadBool('sound');
 finally
   Reg.Free;
 end;
end;

function TMainForm.UpdatePage(folder,item:integer):boolean;
var i:integer;
begin
 if (folder=-1)or(item=-1) then
   begin
     result:=false;
     exit;
   end;
 if Sound then PlaySound('PAGE', hInstance, snd_ASync or snd_Resource);
 result:=true;
 Label1.Caption:=OutLookBar.Folders[Folder].Items[Item].Caption;
 I := OutLookBar.Folders[Folder].Items[Item].IconIndex;
 Image1.Picture:=nil;
 ImageList1.Draw(Image1.Canvas, 0, 0, I);

 if folder=0 then FormDisplay.ActiveFormIndex:=Item;
 if folder=1 then FormDisplay.ActiveFormIndex:=Item+3;
 if folder=2 then begin
                    FormDisplay.ActiveFormIndex:=Item+6;
                    TTSettings(FormDisplay.ActiveForm).RxSwitch1.StateOn:=sound;
                    if FileExists(ExtractFilePath(GetFolderPath(fpDeskTop)+'\')+_ShortCutFileName+'.lnk')
                      then TTSettings(FormDisplay.ActiveForm).RxSwitch2.StateOn:=true;
                    if FileExists(ExtractFilePath(GetFolderPath(fpStartMenu)+'\')+_ShortCutFileName+'.lnk')
                      then TTSettings(FormDisplay.ActiveForm).RxSwitch3.StateOn:=true;
                    if FileExists(ExtractFilePath(GetFolderPath(fpStartUp)+'\')+_ShortCutFileName+'.lnk')
                      then TTSettings(FormDisplay.ActiveForm).RxSwitch4.StateOn:=true;
                  end;
end;


procedure TMainForm.OutLookBarItemClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; Index: Integer);
begin
 if not UpdatePage(OutlookBar.ActiveFolder,OutlookBar.ActiveItem)
  then beep;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
 FormDisplay.AddFormClass(TForm1,false);
 FormDisplay.AddFormClass(TForm2,false);
 FormDisplay.AddFormClass(TForm3,false);
 FormDisplay.AddFormClass(TTAbout,false);
 FormDisplay.AddFormClass(TForm4,false);
 FormDisplay.AddFormClass(TForm5,false);
 FormDisplay.AddFormClass(TTSettings,false);

 UpdatePage(0,0);
 FormZero.EsteAfisata:=true;
 LoadSettings;
 KeyPreview:=True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var Reg:TRegistry;
begin
 Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Control Center',True);
   Reg.WriteBool('sound', sound);
 finally
   Reg.Free;
 end;

 if FormZero.AppSysTray
     then FormZero.EsteAfisata:=false
     else Application.Terminate;
end;

procedure TMainForm.OutLookBarFolderChange(Sender: TObject; Index: Integer;
  var AllowChange: Boolean; Dragging: Boolean);
begin
 if Sound then PlaySound('PAGE2', hInstance, snd_ASync or snd_Resource);
end;

end.
