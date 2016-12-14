unit jmptopb;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ImgList;

function SariLaOProblema(cp:integer):integer;

type
  TOKBottomDlg4 = class(TForm)
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    ScrollBar1: TScrollBar;
    Button1: TButton;
    Button2: TButton;
    ListView1: TListView;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OKBottomDlg4: TOKBottomDlg4;

implementation

{$R *.DFM}

uses unit1;

function SariLaOProblema(cp:integer):integer;
var i:integer;
begin
  with TOKBottomDlg4.Create(Application) do
    try
     scrollbar1.min:=1;
     scrollbar1.max:=form1.test1.NrProblems;
     scrollbar1.position:=form1.curentpb;

     if ListView1.Items.Count<>0 then ListView1.Items.Clear;
     for i:=1 to Form1.Test1.NrProblems do
       begin
         ListView1.Items.Add;
         ListView1.Items[i-1].Caption:=InttoStr(i)+'. '+Form1.Test1.Problems[i].PBFilename;
         ListView1.Items[i-1].ImageIndex:=0;
       end;

     if ShowModal=mrCancel then result:=cp
     else begin
           if PageControl1.ActivePage.PageIndex=0
               then result:=scrollbar1.position
               else result:=ListView1.Items.IndexOf(ListView1.Selected)+1;
          end;
     if result=0 then begin beep;result:=cp;end;
    finally
      Free;
    end;
end;


procedure TOKBottomDlg4.Button1Click(Sender: TObject);
begin
 scrollbar1.position:=1;
end;

procedure TOKBottomDlg4.Button2Click(Sender: TObject);
begin
 scrollbar1.position:=form1.test1.NrProblems;
end;

procedure TOKBottomDlg4.ScrollBar1Change(Sender: TObject);
begin
 Label1.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TOKBottomDlg4.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePage.TabIndex=1 then
   begin
     ListView1.Selected:=ListView1.Items[form1.curentpb-1];
     ActiveControl:=ListView1;
   end;
end;

procedure TOKBottomDlg4.ListView1DblClick(Sender: TObject);
begin
 if ListView1.SelCount=0 then exit;
 Form1.GotoProblem(ListView1.Items.IndexOf(ListView1.Selected)+1);
end;

end.
