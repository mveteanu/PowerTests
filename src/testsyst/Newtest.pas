unit newtest;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Dialogs,
  problems, ImgList;


type TestDescription= record
                       FileName:string;
                       Name:string;
                       Author:string;
                       Time:integer;
                       Dificulty:integer;
                       NrPbRandom:integer;
                       NrProblems:integer;
                       Domain:string;
                      end;


type
  TSelectTestDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    TabControl1: TTabControl;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    LargeImages: TImageList;
    SmallImages: TImageList;
    Memo1: TMemo;
    LargeBtn: TSpeedButton;
    SmallBtn: TSpeedButton;
    ListBtn: TSpeedButton;
    butNeimportant: TBitBtn;
    butImportant: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Memo1Enter(Sender: TObject);
    procedure LargeBtnClick(Sender: TObject);
    procedure SmallBtnClick(Sender: TObject);
    procedure ListBtnClick(Sender: TObject);
    procedure butNeImportantClick(Sender: TObject);
    procedure butImportantClick(Sender: TObject);
  private
    { Private declarations }
    Pages: array[0..50] of record
                              nrtst:integer;
                              longdescription:string;
                              tst:array[1..200] of TestDescription;
                            end;
    li:array[1..50] of TListItem;
    important:string;
    ImportantTabName:string;
    Procedure ShowPage(pag:integer);
  public
    { Public declarations }
    Procedure MakeImportantTab;
    Procedure LoadImportantFromRegistry;
    Procedure SaveImportantToRegistry;
  end;

var
  SelectTestDlg: TSelectTestDlg;
  TSTFileName:string;

Function GetTSTFileName:string;

implementation

uses unit1, registry, mmsystem;

{$R *.DFM}


Procedure TSelectTestDlg.MakeImportantTab;
var curtst,i:integer;
    ts,ts2:TStringList;tst:TTest;
begin
 if Important<>'' then
 begin
  ts := TStringList.Create;ts2 := TStringList.Create;
  BreakString(Important,ts);
  for i:=0 to ts.count-1 do if fileexists(ts[i]) then ts2.add(ts[i]);
  ts.Free;
  if ts2.count>0 then
    begin
      if TabControl1.Tabs.IndexOf(ImportantTabName)=-1 then
          TabControl1.Tabs.Insert(0,ImportantTabName);
      pages[0].LongDescription:='Teste importante - folosite uzual';
      pages[0].nrtst:=0;

      for i:=0 to ts2.count-1 do
        begin
         tst:=TTest.Create;
         tst.LoadDescription(ts2[i]);
         inc(pages[0].nrtst);curtst:=pages[0].nrtst;
         pages[0].tst[curtst].filename:=tst.TSTFilename;
         pages[0].tst[curtst].name:=tst.TestName;
         pages[0].tst[curtst].author:=tst.Author;
         pages[0].tst[curtst].dificulty:=tst.Dificulty;
         pages[0].tst[curtst].time:=tst.Time;
         pages[0].tst[curtst].nrpbrandom:=tst.NrPbRandom;
         pages[0].tst[curtst].nrproblems:=tst.NrProblems;
         pages[0].tst[curtst].domain:=tst.Domain.shortname;
        end;
    Important:='';
    if ts2.count=1 then Important:='"'+ts2[0]+'"'
    else begin
           for i:=0 to ts2.count-2 do Important:=Important+'"'+ts2[i]+'" ';
           Important:=Important+'"'+ts2[ts2.count-1]+'"';
         end;
    end;
  SaveImportantToRegistry;
  ts2.Free;
 end
 else  // Daca Important=''
 begin
  SaveImportantToRegistry;
  i:=TabControl1.Tabs.IndexOf(ImportantTabName);
  if i<>-1 then TabControl1.Tabs.Delete(i);
  if TabControl1.Tabs.Count>=1 then TabControl1.TabIndex:=0;
 end;
end;

procedure TSelectTestDlg.FormCreate(Sender: TObject);
var found:integer;sr:tsearchrec;tst:TTest;
    curpage,curtst,i:integer;
begin
 LoadImportantFromRegistry;
 ImportantTabName:='Important';
 TSTFileName:='';
 for i:=0 to High(Pages) do begin
                              Pages[i].NrTst:=0;
                              Pages[i].LongDescription:='';
                            end;
 ChDir(InterfaceColors.browserdir);

 MakeImportantTab;

 Found := FindFirst(InterfaceColors.browserdir+'\*.tst', faReadOnly+faArchive, sr);
 while (Found = 0) do
   begin
      tst:=TTest.Create;
      tst.LoadDescription(sr.name);
      if TabControl1.Tabs.IndexOf(tst.Domain.ShortName)=-1 then
          TabControl1.Tabs.Add(tst.Domain.ShortName);
      curpage:=TabControl1.Tabs.IndexOf(tst.Domain.ShortName);
      if TabControl1.Tabs.IndexOf(ImportantTabName)=-1 then inc(curpage);
      pages[curpage].LongDescription:=tst.Domain.LongName;

      inc(pages[curpage].nrtst);curtst:=pages[curpage].nrtst;

      pages[curpage].tst[curtst].filename:=tst.TSTFilename;
      pages[curpage].tst[curtst].name:=tst.TestName;
      pages[curpage].tst[curtst].author:=tst.Author;
      pages[curpage].tst[curtst].dificulty:=tst.Dificulty;
      pages[curpage].tst[curtst].time:=tst.Time;
      pages[curpage].tst[curtst].nrpbrandom:=tst.NrPbRandom;
      pages[curpage].tst[curtst].nrproblems:=tst.NrProblems;
      pages[curpage].tst[curtst].domain:=tst.Domain.shortname;
      Found := FindNext(SR);
   end;
 FindClose(SR);
 ShowPage(0);
end;



procedure TSelectTestDlg.ShowPage(pag:integer);
var i:integer;
begin
 if TabControl1.Tabs.IndexOf(ImportantTabName)=-1 then inc(pag);
 Caption:='Select a test ('+pages[pag].LongDescription+')';

 if TabControl1.Tabs.IndexOf(ImportantTabName)<>pag
     then butNeImportant.Enabled:=false else butNeImportant.Enabled:=true;
 butImportant.Enabled:=not butNeImportant.Enabled;

 if ListView1.Items.Count<> 0 then ListView1.Items.Clear;
 for i:=1 to pages[pag].nrtst do begin
   li[i]:=ListView1.Items.Add;
   li[i].caption:=pages[pag].tst[i].name;
   li[i].Data:=@pages[pag].Tst[i];
   li[i].imageindex:=0;
 end;
 ActiveControl:=ListView1;
 if ListView1.Items.Count>0 then
   begin
      ListView1.ItemFocused:=ListView1.Items[0];;
      ListView1.Selected:=ListView1.Items[0];
   end;
end;

procedure TSelectTestDlg.TabControl1Change(Sender: TObject);
var Selectat:Integer;
begin
 Selectat:=TabControl1.TabIndex;
 if Selectat>=0 then
   begin
     if InterfaceColors.Sounds then PlaySound('PAGE2', hInstance, snd_ASync or snd_Resource);
     ShowPage(Selectat);
   end;  
end;

procedure TSelectTestDlg.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
 if Change=ctState then
    if ListView1.SelCount>0 then
       begin
         TSTFileName:=TestDescription(ListView1.Selected.Data^).FileName;
         memo1.Clear;
         memo1.Lines.Add(#13#10);
         memo1.Lines.Add(' Nume: '+ListView1.Selected.Caption);
         memo1.Lines.Add(' Autor: '+TestDescription(ListView1.Selected.Data^).Author);
         if TestDescription(ListView1.Selected.Data^).Time=0
           then memo1.Lines.Add(' Timp: Nelimitat')
           else memo1.Lines.Add(' Timp: '+InttoStr(TestDescription(ListView1.Selected.Data^).Time));
         memo1.Lines.Add(' Dificultate: '+InttoStr(TestDescription(ListView1.Selected.Data^).Dificulty));
         memo1.Lines.Add(' Pb. fixe: '+InttoStr(TestDescription(ListView1.Selected.Data^).NrProblems));
         memo1.Lines.Add(' Pb. aleatoare: '+InttoStr(TestDescription(ListView1.Selected.Data^).NrPbRandom));
         memo1.Lines.Add(' Fisier: '+TestDescription(ListView1.Selected.Data^).FileName);
         memo1.Lines.Add(' Domeniu: '+TestDescription(ListView1.Selected.Data^).Domain);
       end;
end;



procedure TSelectTestDlg.Memo1Enter(Sender: TObject);
begin
 ActiveControl:=ListView1;
end;


procedure TSelectTestDlg.LargeBtnClick(Sender: TObject);
begin
 ListView1.ViewStyle := vsIcon;
end;

procedure TSelectTestDlg.SmallBtnClick(Sender: TObject);
begin
 ListView1.ViewStyle := vsSmallIcon;
end;

procedure TSelectTestDlg.ListBtnClick(Sender: TObject);
begin
 ListView1.ViewStyle := vsList;
end;


Function GetTSTFileName:string;
begin
 result:='';
 with TSelectTestDlg.Create(Application) do
    try
     if ShowModal=MrOK then result:=TSTFileName;
    finally
     Free;
    end;
end;


procedure TSelectTestDlg.butNeImportantClick(Sender: TObject);
var ts2:TStringList;i:integer;
begin
 ts2 := TStringList.Create;
 if Important<>'' then BreakString(Important,ts2);
 i:=ts2.IndexOf(TSTFileName);
 if i>=0 then ts2.Delete(i);
 Important:='';
 if ts2.count=1 then Important:='"'+ts2[0]+'"'
 else if ts2.count>1 then
     begin
       for i:=0 to ts2.count-2 do Important:=Important+'"'+ts2[i]+'" ';
       Important:=Important+'"'+ts2[ts2.count-1]+'"';
     end;
 ts2.Free;

 MakeImportantTab;
 ShowPage(0);
end;

procedure TSelectTestDlg.butImportantClick(Sender: TObject);
var ts2:TStringList;i:integer;
begin
  ts2 := TStringList.Create;
  if Important<>'' then BreakString(Important,ts2);
  if ts2.IndexOf(TSTFileName)=-1 then ts2.Add(TSTFileName);
  Important:='';
  if ts2.count=1 then Important:='"'+ts2[0]+'"'
    else if ts2.count>1 then
       begin
         for i:=0 to ts2.count-2 do Important:=Important+'"'+ts2[i]+'" ';
         Important:=Important+'"'+ts2[ts2.count-1]+'"';
       end;
  ts2.Free;
 MakeImportantTab;
 TabControl1.TabIndex:=0;ShowPage(0);
end;


Procedure TSelectTestDlg.SaveImportantToRegistry;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);
   Reg.WriteString('importanttests', Important);
 finally
   Reg.Free;
 end;
end;


Procedure TSelectTestDlg.LoadImportantFromRegistry;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\VMA soft\PowerTests\Teste',True);
   if not Reg.ValueExists('importanttests') then Reg.WriteString('importanttests', '');
   Important:=Reg.ReadString('importanttests');
 finally
   Reg.Free;
 end;
end;


end.




