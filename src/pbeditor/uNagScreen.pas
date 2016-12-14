unit uNagScreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

procedure ShowNagScreen;
function  IsRegistred:boolean;

type
  TNagScreen = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure Label4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NagScreen: TNagScreen;
  count: Integer;

implementation
uses Registry,ShellApi;
{$R *.DFM}


Procedure ShowNagScreen;
begin
  with TNagScreen.Create(Application) do
    try
      Count:=10;
      ShowModal;
    finally
      Free;
    end;
end;

procedure TNagScreen.Timer1Timer(Sender: TObject);
begin
 Dec(count);
 if count=0 then begin
                   timer1.enabled:=false;
                   button1.enabled:=true;
                   Label1.Caption:='Apasati butonul Continua !';
                 end
             else Label1.Caption:=Format('Va rog asteptati %d secunde',[count]);
end;

procedure TNagScreen.Label4MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Label4.Font.Color:=clred;
end;

procedure TNagScreen.Label4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Label4.Font.Color:=clblue;
end;

procedure TNagScreen.Label4Click(Sender: TObject);
var TempString : array[0..79] of char;
begin
 StrPCopy(TempString,'mailto:vma@electra.upit.ro');
 ShellExecute(0, Nil, TempString, Nil, Nil, SW_NORMAL);
end;

procedure TNagScreen.Button2Click(Sender: TObject);
begin
 Application.HelpCommand(HELP_CONTEXT,402);
end;


function IsRegistred:boolean;
var Reg : TRegistry;
    serialnr:string;
begin
 Reg:=TRegistry.Create;
try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\Classes\CLSID\{27021978-0911-1999-ABCD-274554646927}',True);
   if not Reg.ValueExists('vbrun400') then begin
                                             result:=false;
                                             exit;
                                           end;
   serialnr:=Reg.ReadString('vbrun400');
finally
   Reg.Free;
end;
   if serialnr='(40)-048-27.45.54' then result:=true
                                   else result:=false;
end;


end.


