unit viewfull;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;


procedure ViewFullScreenImage(pict:TPicture);


type
  TViewForm = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    mousedownx,mousedowny:integer;
    horzs,verts:integer;
    curstemp:TCursor;
    canmove:boolean;
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;
  pictureglobal:TPicture;

implementation

{$R *.DFM}
{$R cursors.res}

const hand1 = 1;
      hand2 = 2;

procedure TViewForm.FormCreate(Sender: TObject);
begin
  curstemp:=Screen.Cursor;

  Screen.Cursors[hand1] := LoadCursor(HInstance, 'HAND1');
  Screen.Cursors[hand2] := LoadCursor(HInstance, 'HAND2');

  SetBounds(0,0,Screen.Width,Screen.Height);
  Image1.Picture:=pictureglobal;
  Image1.Left:=ScrollBox1.Width div 2-Image1.Width div 2;
  Image1.Top :=ScrollBox1.Height div 2-Image1.Height div 2;

  ScrollBox1.HorzScrollBar.Visible:=false;
  ScrollBox1.VertScrollBar.Visible:=false;
  canmove:=false;
  if Image1.Width>Screen.Width then
     begin
       ScrollBox1.HorzScrollBar.Visible:=true;
       Image1.Left:=0;
       canmove:=true;
     end;
  if Image1.Height>Screen.Height then
     begin
       ScrollBox1.VertScrollBar.Visible:=true;
       Image1.Top :=0;
       canmove:=true;
     end;
end;

procedure TViewForm.FormKeyDown( Sender: TObject;
                              var Key: Word;
                              Shift: TShiftState);
const
  PageDelta = 40;
begin
  case Key of
    VK_Down   : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + PageDelta;
    VK_Up     : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - PageDelta;
    VK_Next   : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + Screen.Height;
    VK_Prior  : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - Screen.Height;
    VK_Right  : ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.Position + PageDelta;
    VK_Left   : ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.Position - PageDelta;
    else        Close;
  end;
end;

procedure TViewForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if not canmove then exit;
 Screen.Cursor:=hand2;
 mousedownx:=x;
 mousedowny:=y;
 horzs:=ScrollBox1.HorzScrollBar.Position;
 verts:=ScrollBox1.VertScrollBar.Position;
end;

procedure TViewForm.Image1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TViewForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if not canmove then exit;
  if Shift<>[ssLeft] then exit;
  ScrollBox1.VertScrollBar.Position:=verts-(y-mousedowny) div 2;
  ScrollBox1.HorzScrollBar.Position:=horzs-(x-mousedownx) div 2;
end;

procedure TViewForm.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if not canmove then exit;
 Screen.Cursor:=hand1;
end;

procedure TViewForm.FormDestroy(Sender: TObject);
begin
 Screen.Cursor:=curstemp;
end;


procedure ViewFullScreenImage(pict:TPicture);
begin
 pictureglobal:=pict;
 with TViewForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;


procedure TViewForm.FormShow(Sender: TObject);
begin
 if canmove then Screen.Cursor:=hand1;
end;

end.
