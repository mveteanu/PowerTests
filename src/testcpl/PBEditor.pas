unit PBEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, OvcLabel, lmdctrl, lmdshapA, lmdbtn;

type
  TForm2 = class(TForm)
    LMDShapeControl1: TLMDShapeControl;
    LMDShapeButton1: TLMDShapeButton;
    LMDShapeButton2: TLMDShapeButton;
    procedure LMDShapeButton1Click(Sender: TObject);
    procedure LMDShapeButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UnitZero, ShellApi, MMSystem, Unit1;

{$R *.DFM}

procedure TForm2.LMDShapeButton1Click(Sender: TObject);
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 shellexecute(FormZero.handle,nil,PChar(ExtractFilePath(ParamStr(0))+'pbeditor.exe'),'','',sw_show);
end;

procedure TForm2.LMDShapeButton2Click(Sender: TObject);
begin
 if Sound then PlaySound('BUTON', hInstance, snd_ASync or snd_Resource);
 Application.HelpContext(200);
end;

end.
