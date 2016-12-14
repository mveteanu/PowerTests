unit about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  lmdctrl, lmdshapA, StdCtrls, ExtCtrls, Buttons, StBase, StShBase,
  StShrtCt, lmdextcA;

type
  TTAbout = class(TForm)
    LMDShapeControl1: TLMDShapeControl;
    LMDShapeControl2: TLMDShapeControl;
    LMDGraphicLabel1: TLMDGraphicLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TAbout: TTAbout;

implementation
uses unit1;
{$R *.DFM}

end.
