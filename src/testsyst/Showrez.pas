unit showrez;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ImgList, Menus;

procedure showrezultate;

type
  TOKBottomDlg1 = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListView1: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Viewaslist1: TMenuItem;
    Viewwithdetails1: TMenuItem;
    N1: TMenuItem;
    Gotoproblem1: TMenuItem;
    procedure ListView1DblClick(Sender: TObject);
    procedure Viewaslist1Click(Sender: TObject);
    procedure Viewwithdetails1Click(Sender: TObject);
    procedure Gotoproblem1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  OKBottomDlg1: TOKBottomDlg1;


implementation

uses unit1;

{$R *.DFM}

procedure ShowRezultate;
var i:integer;
    puncteobtinute:extended;
    problemerezolvate:extended;
begin
 puncteobtinute:=0;problemerezolvate:=0;
 for i:=1 to form1.test1.nrproblems do
   if form1.ispbcorect(i)>0 then
     begin
       problemerezolvate:=problemerezolvate+form1.ispbcorect(i)/form1.test1.problems[i].puncte;
       puncteobtinute:=puncteobtinute+form1.ispbcorect(i);
     end;
 form1.puncteobtinute:=puncteobtinute;
 form1.notaobtinuta:=form1.notadinoficiu+(puncteobtinute*(10-form1.notadinoficiu))/form1.test1.puncte;

  with TOKBottomDlg1.Create(Application) do
    try
      Label3.caption:='Probleme rezolvate: '+floattostrf(problemerezolvate,ffGeneral,3,0)+' din '+inttostr(form1.test1.nrproblems);
      Label1.caption:='Puncte obtinute: '+floattostrf(puncteobtinute,ffGeneral,3,0)+' din '+inttostr(form1.test1.puncte)+' posibile';
      Label2.caption:='Nota finala: '+floattostrf(form1.notaobtinuta,ffGeneral,3,0)+' (nota '+inttostr(form1.notadinoficiu)+' din oficiu)';
      for i:=1 to form1.test1.nrproblems do
        begin
         ListView1.Items.Add;
         ListView1.Items[i-1].Caption:=IntToStr(i)+'. '+form1.test1.problems[i].PBFilename;
         if form1.ispbcorect(i)=form1.test1.problems[i].Puncte
            then ListView1.Items[i-1].ImageIndex:=1
         else if form1.ispbcorect(i)>0 then ListView1.Items[i-1].ImageIndex:=2
         else ListView1.Items[i-1].ImageIndex:=3;
         ListView1.Items[i-1].SubItems.Add(IntToStr(form1.test1.problems[i].Puncte));
         ListView1.Items[i-1].SubItems.Add(FloatToStrF(form1.ispbcorect(i),ffGeneral,3,0));
        end;
      ListView1.Selected:=ListView1.Items[Form1.curentpb-1];

      ShowModal;
    finally
      Free;
    end;
end;


procedure TOKBottomDlg1.ListView1DblClick(Sender: TObject);
begin
 if ListView1.SelCount=0 then exit;
 Form1.GotoProblem(ListView1.Items.IndexOf(ListView1.Selected)+1);
end;

procedure TOKBottomDlg1.Viewaslist1Click(Sender: TObject);
begin
 ListView1.ViewStyle:=vsList;
 ViewasList1.Checked:=true;
 Viewwithdetails1.Checked:=false;
end;

procedure TOKBottomDlg1.Viewwithdetails1Click(Sender: TObject);
begin
 ListView1.ViewStyle:=vsReport;
 ViewasList1.Checked:=false;
 Viewwithdetails1.Checked:=true;
end;

procedure TOKBottomDlg1.Gotoproblem1Click(Sender: TObject);
begin
 ListView1DblClick(Sender);
end;

end.

