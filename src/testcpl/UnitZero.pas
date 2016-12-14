unit UnitZero;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, lmdclass, lmdnwgui, lmdnonvS, StdCtrls;

type
  TFormZero = class(TForm)
    LMDOneInstance1: TLMDOneInstance;
    SysTray: TLMDTrayIcon;
    PopupMenu1: TPopupMenu;
    Aratafereastra1: TMenuItem;
    N1: TMenuItem;
    TestSystem1: TMenuItem;
    ProblemEditor1: TMenuItem;
    TestComposer1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    procedure Aratafereastra1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SysTrayDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TestSystem1Click(Sender: TObject);
    procedure ProblemEditor1Click(Sender: TObject);
    procedure TestComposer1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fontloaded:boolean;
  public
    { Public declarations }
    EsteAfisata:boolean;
    AppSysTray:boolean;
  end;

var
  FormZero: TFormZero;

implementation
uses lmdutils, unit1, win95, ShellApi;

{$R *.DFM}

procedure TFormZero.Aratafereastra1Click(Sender: TObject);
begin
 if not EsteAfisata
   then LMDShowModal(TMainForm, Application)
   else Beep;
end;

procedure TFormZero.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TFormZero.SysTrayDblClick(Sender: TObject);
begin
 Aratafereastra1Click(Sender);
end;

procedure TFormZero.FormCreate(Sender: TObject);
begin
 Application.Helpfile:=ExtractFilePath(ParamStr(0))+'powtests.hlp';

 fontloaded:=false;
 if not LoadFont(extractfilepath(Application.ExeName)+'times.ttf',true)
   then MessageDlg('Nu se poate incarca fontul Times New Roman.'#13#10+
              'Programul va functiona dar s-ar putea ca unele texte sa arate urat.',
              mtWarning,[mbOK],0)
   else fontloaded:=true;

 if ParamStr(1)='/s'
   then begin
          SysTray.Active:=true;
          AppSysTray:=true;
          EsteAfisata:=false;
        end
   else begin
          SysTray.Active:=false;
          AppSysTray:=false;
          LMDShowModal(TMainForm, Application);
        end;
end;
          
procedure TFormZero.TestSystem1Click(Sender: TObject);
begin
 shellexecute(FormZero.handle,nil,PChar(ExtractFilePath(ParamStr(0))+'teste.exe'),'','',sw_show);
end;

procedure TFormZero.ProblemEditor1Click(Sender: TObject);
begin
 shellexecute(FormZero.handle,nil,PChar(ExtractFilePath(ParamStr(0))+'pbeditor.exe'),'','',sw_show);
end;

procedure TFormZero.TestComposer1Click(Sender: TObject);
begin
 shellexecute(FormZero.handle,nil,PChar(ExtractFilePath(ParamStr(0))+'testmake.exe'),'','',sw_show);
end;

procedure TFormZero.FormDestroy(Sender: TObject);
begin
 if fontloaded
   then LoadFont(extractfilepath(Application.ExeName)+'times.ttf',false);
end;

end.
