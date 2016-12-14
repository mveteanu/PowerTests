unit clpdview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ClipView, ExtCtrls, StdCtrls;


Procedure ShowClipboard;


type
  TClipViewForm = class(TForm)
    Panel1: TPanel;
    ClipboardViewer1: TClipboardViewer;
    OKBtn: TButton;
    ClearClbd: TButton;
    procedure FormResize(Sender: TObject);
    procedure ClearClbdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClipViewForm: TClipViewForm;

implementation

uses Clipbrd;

{$R *.DFM}


procedure ShowClipboard;
begin
  with TClipViewForm.Create(Application) do
    try
      ClipboardViewer1.Enabled:=false;
      ShowModal;
    finally
      Free;
    end;
end;


procedure TClipViewForm.FormResize(Sender: TObject);
begin
 OkBtn.Left:=(Panel1.Width div 2) + 10;
 ClearClbd.Left:=(Panel1.Width div 2) - 10 - ClearClbd.Width;
end;

procedure TClipViewForm.ClearClbdClick(Sender: TObject);
begin
  ClipBoard.Clear;
end;

end.

