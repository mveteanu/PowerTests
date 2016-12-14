unit TestSyst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, lmdbtn, lmdshapA, lmdctrl;

type
  TForm1 = class(TForm)
    LMDShapeControl1: TLMDShapeControl;
    LMDShapeButton2: TLMDShapeButton;
    LMDShapeButton1: TLMDShapeButton;
    procedure LMDShapeButton1Click(Sender: TObject);
    procedure LMDShapeButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses UnitZero, Unit1, ShellApi, MMSystem;
{$R *.DFM}

procedure TForm1.LMDShapeButton1Click(Sender: TObject);          
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 shellexecute(FormZero.handle,nil,PChar(ExtractFilePath(ParamStr(0))+'teste.exe'),'','',sw_show);
end;

procedure TForm1.LMDShapeButton2Click(Sender: TObject);
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 Application.HelpContext(100);
end;

end.
