unit cumpar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, OvcLabel, lmdstdcS, lmdctrl, lmdextcS, lmdeditb,
  lmdmemoc, LMDMemo, lmdshapA, Htmlview;

type
  TForm5 = class(TForm)
    HTMLViewer1: THTMLViewer;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.DFM}

procedure TForm5.FormCreate(Sender: TObject);
begin
 try
  HTMLViewer1.LoadFromFile(ExtractFilePath(paramstr(0))+'buy.htm');
 except
  Beep;
 end;
end;

end.

