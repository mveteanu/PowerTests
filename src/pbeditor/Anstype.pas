unit anstype;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

function AskForAnswerType:integer;

type
  TAnswerTypeDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AnswerTypeDlg: TAnswerTypeDlg;

implementation

{$R *.DFM}

function AskForAnswerType:integer;
begin
  if AnswerTypeDlg.ShowModal=mrOK
      then result:=AnswerTypeDlg.RadioGroup1.ItemIndex
      else result:=-1;
end;

end.

