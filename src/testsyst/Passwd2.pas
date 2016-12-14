unit passwd2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Mask, Dialogs;


Procedure ChangePasswd;

type
  TOKBottomDlg3 = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    oldpasswd: TMaskEdit;
    newpasswd: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OKBottomDlg3: TOKBottomDlg3;

implementation

uses unit1;

{$R *.DFM}

Procedure ChangePasswd;
begin
  with TOKBottomDlg3.Create(Application) do
    try
      activecontrol:=OldPasswd;
      if ShowModal<>idCancel then
           if OldPasswd.text=Form1.ProfPasswd then begin Form1.ProfPasswd:=NewPasswd.Text;MessageDlg('Noua parola acceptata.',mtInformation,[mbOK],0);end
           else MessageDlg('Vechea parola incorecta. Nu se accepta noua parola !',mtWarning,[mbOK],0);
    finally
      Free;
    end;
end;

end.

