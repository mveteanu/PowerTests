unit settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  lmdctrl, lmdshapA, StdCtrls, ExtCtrls, Buttons, StBase, StShBase,
  StShrtCt, RXSwitch;

type
  TTSettings = class(TForm)
    LMDShapeControl1: TLMDShapeControl;
    StShortcut: TStShortcut;
    LMDShapeControl2: TLMDShapeControl;
    RxSwitch1: TRxSwitch;
    RxSwitch2: TRxSwitch;
    RxSwitch3: TRxSwitch;
    RxSwitch4: TRxSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure RxSwitch1Click(Sender: TObject);
    procedure RxSwitch2Click(Sender: TObject);
    procedure RxSwitch3Click(Sender: TObject);
    procedure RxSwitch4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TSettings: TTSettings;

implementation
uses unit1, win95, mmsystem;
{$R *.DFM}


procedure TTSettings.RxSwitch1Click(Sender: TObject);
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 sound:=RxSwitch1.StateON;
end;

procedure TTSettings.RxSwitch2Click(Sender: TObject);
var fis:string;
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 fis:=ExtractFilePath(GetFolderPath(fpDeskTop)+'\')+_ShortCutFileName+'.lnk';
 if FileExists(fis) then begin
                          RxSwitch2.StateOn:=false;
                          DeleteFile(fis);
                          exit;
                         end;
 RxSwitch2.StateOn:=True;

 StShortCut.FileName:=ParamStr(0);
 StShortCut.Parameters:='';
 StShortCut.SpecialFolder:=sfDeskTop;
 StShortCut.Description:=_ShortCutFileName;
 StShortCut.CreateShortcut;
end;

procedure TTSettings.RxSwitch3Click(Sender: TObject);
var fis:string;
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 fis:=ExtractFilePath(GetFolderPath(fpStartMenu)+'\')+_ShortCutFileName+'.lnk';
 if FileExists(fis) then begin
                          RxSwitch3.StateOn:=false;
                          DeleteFile(fis);
                          exit;
                         end;
 RxSwitch3.StateOn:=True;

 StShortCut.FileName:=ParamStr(0);
 StShortCut.Parameters:='';
 StShortCut.SpecialFolder:=sfStartMenu;
 StShortCut.Description:=_ShortCutFileName;
 StShortCut.CreateShortcut;
end;

procedure TTSettings.RxSwitch4Click(Sender: TObject);
var fis:string;
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 fis:=ExtractFilePath(GetFolderPath(fpStartUp)+'\')+_ShortCutFileName+'.lnk';
 if FileExists(fis) then begin
                          RxSwitch4.StateOn:=false;
                          DeleteFile(fis);
                          exit;
                         end;
 RxSwitch4.StateOn:=True;

 StShortCut.FileName:=ParamStr(0);
 StShortCut.Parameters:='/s';
 StShortCut.SpecialFolder:=sfStartUp;
 StShortCut.Description:=_ShortCutFileName;
 StShortCut.CreateShortcut;
end;

end.
