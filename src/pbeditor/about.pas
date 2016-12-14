unit about;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RXCtrls;

procedure ShowAboutBox;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation
uses mmsystem,shellapi, pb_edit;

{$R *.DFM}

procedure TAboutBox.Label1Click(Sender: TObject);
var TempString : array[0..79] of char;
begin
 StrPCopy(TempString,(Sender as TLabel).Caption);
 ShellExecute(0, Nil, TempString, Nil, Nil, SW_NORMAL);
end;

procedure TAboutBox.Label2Click(Sender: TObject);
var TempString : array[0..79] of char;
begin
 StrPCopy(TempString,'mailto:vma@electra.upit.ro');
 ShellExecute(0, Nil, TempString, Nil, Nil, SW_NORMAL);
end;


procedure ShowAboutBox;
begin
  with TAboutBox.Create(Application) do
    try
      if InterfaceLook.Sounds then PlaySound('ABOUT', hInstance, snd_ASync or snd_Resource);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TAboutBox.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 (Sender as TLabel).Font.Color:=clRed;
end;

procedure TAboutBox.Label1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TLabel).Font.Color:=clBlue;
end;

end.

